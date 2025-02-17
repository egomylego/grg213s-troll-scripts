task.wait(1)
if game:IsLoaded() then
	game.StarterGui:SetCore("SendNotification", {
		Title = "HEALTH CHANGER SCRIPT LOADED", -- Notification title
		Text = "Use the GUI to change your MaxHealth, which also changes your health to that value.", -- Notification text
		Button1 = "OK", -- button 1 text (optional)
	})
	game.StarterGui:SetCore("SendNotification", {
		Title = "WARNING!", -- Notification title
		Text = "do NOT, change the values to letters, it might kill you.", -- Notification text
		Duration = math.huge,
		Button1 = "OK", -- button 1 text (optional)
	})
end
--[[

		Gui2Lua™
		10zOfficial
		Version 1.0.0

]]


-- Instances

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local healthlab = Instance.new("TextLabel")
local healthbox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.Draggable = true
Frame.Active = true
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
TextLabel.Text = "HEALTH CHANGER UNIVERSAL"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 37
TextLabel.TextWrapped = true

healthlab.Name = "healthlab"
healthlab.Parent = Frame
healthlab.BackgroundColor3 = Color3.new(1, 1, 1)
healthlab.BackgroundTransparency = 1
healthlab.BorderColor3 = Color3.new(0, 0, 0)
healthlab.BorderSizePixel = 0
healthlab.Position = UDim2.new(0.303944319, 0, 0.249027237, 0)
healthlab.Size = UDim2.new(0, 169, 0, 35)
healthlab.Font = Enum.Font.SourceSansBold
healthlab.Text = "HEALTH"
healthlab.TextColor3 = Color3.new(1, 1, 1)
healthlab.TextScaled = true
healthlab.TextSize = 14
healthlab.TextWrapped = true

healthbox.Name = "healthbox"
healthbox.Parent = Frame
healthbox.BackgroundColor3 = Color3.new(1, 1, 1)
healthbox.BorderColor3 = Color3.new(0, 0, 0)
healthbox.BorderSizePixel = 0
healthbox.Position = UDim2.new(0.276471853, 0, 0.399360508, 0)
healthbox.Size = UDim2.new(0, 191, 0, 33)
healthbox.Font = Enum.Font.SourceSans
healthbox.Text = "100"
healthbox.TextColor3 = Color3.new(0, 0, 0)
healthbox.TextScaled = true
healthbox.TextSize = 14
healthbox.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.264999986, 0, 0.677999973, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Change"
TextButton.TextColor3 = Color3.new(0, 1, 0.0823529)
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true
UICorner.Parent = TextButton

-- the literal script lol
TextButton.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer
	local char = player.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.MaxHealth = healthbox.Text
	hum.Health = hum.MaxHealth
	print(hum.MaxHealth)
end)
