local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Selection = game:GetService("Selection")
local toolbar = plugin:CreateToolbar("Line Draw")
local newScriptButton = toolbar:CreateButton("Draw Lines!", "Draw Lines!", "rbxassetid://12737534507")
newScriptButton.ClickableWhenViewportHidden = true
plugin:Activate(false)
local mouse = plugin:GetMouse()
local amt = 0

local active = false

local point1
local point2

if not workspace:FindFirstChild("LineDrawCollection") then
	Instance.new("Folder",workspace).Name = "LineDrawCollection"
end

local function onClick()
	if active then
		if amt <= 2 then
			amt += 1
			if amt == 1 then
				point1 = Instance.new("Part")
				point1.Anchored = true
				point1.CanCollide = false
				point1.Transparency = 0.5
				point1.Size = Vector3.new(0.5,0.5,0.5)
				
				point1.Position = mouse.Hit.Position
				
				local newatt = Instance.new("Attachment")
				newatt.Parent = point1
				point1.Parent = workspace:FindFirstChild("LineDrawCollection")
			elseif amt == 2 then
				point2 = Instance.new("Part")
				point2.Anchored = true
				point2.CanCollide = false
				point2.Transparency = 0.5
				point2.Size = Vector3.new(0.5,0.5,0.5)

				point2.Position = mouse.Hit.Position

				local newatt = Instance.new("Attachment")
				newatt.Parent = point2
				
				local beam = Instance.new("Beam")
				beam.Parent = point1
				beam.Enabled = true
				beam.Width0 = 0.3
				beam.Width1 = 0.3
				beam.Attachment0 = point1:FindFirstChildWhichIsA("Attachment")
				beam.Attachment1 = point2:FindFirstChildWhichIsA("Attachment")	
				
				beam.FaceCamera = true
				
				amt = 0
				point2.Parent = workspace:FindFirstChild("LineDrawCollection")
			end
		end
	end
end

local function activee()
	if active == false then
		active = true
	else
		active = false
	end
end

newScriptButton.Click:Connect(activee)
mouse.Button1Down:Connect(onClick)
