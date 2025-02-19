task.wait(1)
if game:IsLoaded() then
	game.StarterGui:SetCore("SendNotification", {
		Title = "UNIVERSAL SHIFT2RUN SCRIPT LOADED", -- Notification title
		Text = "----------- Keybind: LeftShift ----------- Please dont use this script in a game with sprinting already, thats stupid.", -- Notification text
		Button1 = "OK", -- button 1 text (optional)
	})
	game.StarterGui:SetCore("SendNotification", {
		Title = "WARNING!", -- Notification title
		Text = "YOU MAY HAVE TO TURN OFF SHIFTLOCK TO USE THIS SCRIPT!!", -- Notification text
		Duration = math.huge,
		Button1 = "OK", -- button 1 text (optional)
	})
end

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:WaitForChild("Humanoid")
local sprintspeed = nil

local sprinting = false

game:GetService("UserInputService").InputBegan:Connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.LeftShift then
		sprinting = true
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.LeftShift then
		sprinting = false
	end
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local speedlab = Instance.new("TextLabel")
local speedbox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local mobilebutton = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true
Frame.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.175155923, 0, 0.387387395, 0)
Frame.Selectable = true
Frame.Size = UDim2.new(0, 431, 0, 257)
Frame.Style = Enum.FrameStyle.RobloxRound

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.0208816715, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 431, 0, 55)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "SHIFT2RUN SPEED CHANGER"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 37
TextLabel.TextWrapped = true

speedlab.Name = "speedlab"
speedlab.Parent = Frame
speedlab.BackgroundColor3 = Color3.new(1, 1, 1)
speedlab.BackgroundTransparency = 1
speedlab.BorderColor3 = Color3.new(0, 0, 0)
speedlab.BorderSizePixel = 0
speedlab.Position = UDim2.new(0.303944319, 0, 0.249027237, 0)
speedlab.Size = UDim2.new(0, 169, 0, 35)
speedlab.Font = Enum.Font.SourceSansBold
speedlab.Text = "SPEED"
speedlab.TextColor3 = Color3.new(1, 1, 1)
speedlab.TextScaled = true
speedlab.TextSize = 14
speedlab.TextWrapped = true

speedbox.Name = "speedbox"
speedbox.Parent = Frame
speedbox.BackgroundColor3 = Color3.new(1, 1, 1)
speedbox.BorderColor3 = Color3.new(0, 0, 0)
speedbox.BorderSizePixel = 0
speedbox.Position = UDim2.new(0.276471853, 0, 0.399360508, 0)
speedbox.Size = UDim2.new(0, 191, 0, 33)
speedbox.Font = Enum.Font.SourceSans
speedbox.Text = "30"
speedbox.TextColor3 = Color3.new(0, 0, 0)
speedbox.TextScaled = true
speedbox.TextSize = 14
speedbox.TextWrapped = true

mobilebutton.Name = "mobilebutton"
mobilebutton.Parent = Frame
mobilebutton.BackgroundColor3 = Color3.new(1, 0.00392157, 0.00392157)
mobilebutton.BorderColor3 = Color3.new(1, 1, 1)
mobilebutton.BorderSizePixel = 0
mobilebutton.Position = UDim2.new(0.333626091, 0, 1.03196132, 0)
mobilebutton.Size = UDim2.new(0, 142, 0, 50)
mobilebutton.Style = Enum.ButtonStyle.RobloxButton
mobilebutton.Font = Enum.Font.SourceSansBold
mobilebutton.Text = "Toggle Sprint"
mobilebutton.TextColor3 = Color3.new(1, 1, 1)
mobilebutton.TextSize = 14

mobilebutton.TouchTap:Connect(function()
	if sprinting then
		sprinting = false
	else
		sprinting = true
	end
end)
mobilebutton.MouseButton1Click:Connect(function()
	if sprinting then
		sprinting = false
	else
		sprinting = true
	end
end)

while true do
	wait(0.1)
	task.wait(0.01)
	sprintspeed = speedbox.Text
	if sprinting then
		humanoid.WalkSpeed = sprintspeed
	else
		humanoid.WalkSpeed = 16
	end
end
