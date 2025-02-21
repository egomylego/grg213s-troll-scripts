task.wait(1)
if game:IsLoaded() then
	game.StarterGui:SetCore("SendNotification", {
		Title = "TP2PLR SCRIPT LOADED", -- Notification title
		Text = "Use the GUI", -- Notification text
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
local tpbox = Instance.new("TextBox")
local tplab = Instance.new("TextLabel")
local tpbutton = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.175155923, 0, 0.387387395, 0)
Frame.Selectable = true
Frame.Size = UDim2.new(0, 431, 0, 257)
Frame.Style = Enum.FrameStyle.RobloxRound
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.0208816715, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 431, 0, 55)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "TP2PLR GUI"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 37
TextLabel.TextWrapped = true

tpbox.Name = "tpbox"
tpbox.Parent = Frame
tpbox.BackgroundColor3 = Color3.new(1, 1, 1)
tpbox.BorderColor3 = Color3.new(0, 0, 0)
tpbox.BorderSizePixel = 0
tpbox.Position = UDim2.new(0.276471853, 0, 0.399360508, 0)
tpbox.Size = UDim2.new(0, 191, 0, 33)
tpbox.Font = Enum.Font.SourceSans
tpbox.Text = ""
tpbox.TextColor3 = Color3.new(0, 0, 0)
tpbox.TextScaled = true
tpbox.TextSize = 14
tpbox.TextWrapped = true

tplab.Name = "tplab"
tplab.Parent = Frame
tplab.BackgroundColor3 = Color3.new(1, 1, 1)
tplab.BackgroundTransparency = 1
tplab.BorderColor3 = Color3.new(0, 0, 0)
tplab.BorderSizePixel = 0
tplab.Position = UDim2.new(0.0189084373, 0, 0.243708864, 0)
tplab.Size = UDim2.new(0, 401, 0, 35)
tplab.Font = Enum.Font.SourceSansBold
tplab.Text = "PLAYER TO TELEPORT (must NOT be their display name)"
tplab.TextColor3 = Color3.new(1, 1, 1)
tplab.TextScaled = true
tplab.TextSize = 14
tplab.TextWrapped = true

tpbutton.Name = "tpbutton"
tpbutton.Parent = Frame
tpbutton.BackgroundColor3 = Color3.new(0, 0, 0)
tpbutton.BorderColor3 = Color3.new(1, 0, 0)
tpbutton.BorderSizePixel = 0
tpbutton.Position = UDim2.new(0.266110718, 0, 0.666747332, 0)
tpbutton.Size = UDim2.new(0, 200, 0, 50)
tpbutton.Style = Enum.ButtonStyle.RobloxButtonDefault
tpbutton.Font = Enum.Font.SourceSansBold
tpbutton.Text = "TELEPORT"
tpbutton.TextColor3 = Color3.new(1, 1, 1)
tpbutton.TextScaled = true
tpbutton.TextSize = 14
tpbutton.TextWrapped = true

tpbutton.MouseButton1Click:Connect(function()
	local target = game.Players:FindFirstChild(tpbox.Text)
	if target then
		local char = game.Players.LocalPlayer.Character
		local targetchar = target.Character
		char:PivotTo(targetchar:GetPivot())
	else
		tplab.Text = "ERROR: Player does not exist!"
		task.wait(1)
		tplab.Text = "PLAYER TO TELEPORT (must NOT be their display name)"
	end
end)

tpbutton.TouchTap:Connect(function()
	local target = game.Players:FindFirstChild(tpbox.Text)
	if target then
		local char = game.Players.LocalPlayer.Character
		local targetchar = target.Character
		char:PivotTo(targetchar:GetPivot())
	else
		tplab.Text = "ERROR: Player does not exist!"
		task.wait(1)
		tplab.Text = "PLAYER TO TELEPORT (must NOT be their display name)"
	end
end)
