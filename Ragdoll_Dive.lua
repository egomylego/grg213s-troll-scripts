task.wait(1)
if game:IsLoaded() then
	game.StarterGui:SetCore("SendNotification", {
		Title = "FE DIVE SCRIPT LOADED", -- Notification title
		Text = "dive script loaded, have fun :) Keybind: Press the semicolon (;) to toggle YOINK", -- Notification text
		Duration = math.huge,
		Button1 = "OK", -- button 1 text (optional)
	})
	game.StarterGui:SetCore("SendNotification", {
		Title = "WARNING!", -- Notification title
		Text = "do NOT, set the values as any other characters except for numbers, it will completely break ur character", -- Notification text
		Duration = math.huge,
		Button1 = "OK", -- button 1 text (optional)
	})
end
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local ragdolling = false
local forwardspeed = nil
local upwardspeed = nil
local motors = {}


-- Store original Motor6D states
local function storeMotors()
	for _, motor in pairs(character:GetDescendants()) do
		if motor:IsA("Motor6D") then
			motors[motor] = {C0 = motor.C0, C1 = motor.C1, Part0 = motor.Part0, Part1 = motor.Part1}
		end
	end
end

-- Create BodyVelocity object
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
bodyVelocity.Velocity = Vector3.new(0, 0, 0)

-- Disable ragdoll and restore original Motor6D states
local function disableRagdoll()
	if ragdolling then
		ragdolling = false
		humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

		for motor, state in pairs(motors) do
			if motor.Parent then
				motor.Part0 = state.Part0
				motor.Part1 = state.Part1
				motor.C0 = state.C0
				motor.C1 = state.C1
				motor.Enabled = true
			end
		end

		for _, part in pairs(character:GetDescendants()) do
			if part:IsA("BallSocketConstraint") then
				part:Destroy()
			elseif part:IsA("Attachment") then
				part:Destroy()
			end
		end
	end
end


-- Enable ragdoll by converting Motor6D to BallSocketConstraint
local function enableRagdoll()
	if not ragdolling then
		ragdolling = true
		humanoid:ChangeState(Enum.HumanoidStateType.Physics)

		-- Set the velocity for upward and forward movement
		bodyVelocity.Parent = character.HumanoidRootPart
		bodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * forwardspeed + Vector3.new(0, upwardspeed, 0)  -- Forward + Upward

		for _, motor in pairs(character:GetDescendants()) do
			if motor:IsA("Motor6D") then
				local socket = Instance.new("BallSocketConstraint")
				local a0 = Instance.new("Attachment")
				local a1 = Instance.new("Attachment")
				a0.CFrame = motor.C0
				a1.CFrame = motor.C1
				a0.Parent = motor.Part0
				a1.Parent = motor.Part1
				socket.Attachment0 = a0
				socket.Attachment1 = a1
				socket.Parent = motor.Part1.Parent

				motor.Part1.Velocity = Vector3.new(0, 0, 0)
				motor.Part1.RotVelocity = Vector3.new(0, 0, 0)

				motor.Enabled = false
				motor.Part0 = nil
				motor.Part1 = nil
			end
		end
		wait(0.3)
		bodyVelocity.Parent = nil
	end
end



-- Toggle ragdoll when "R" is pressed, but only if not typing in chat
local function onInputBegan(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.Semicolon then
		if ragdolling then
			disableRagdoll()
		else
			enableRagdoll()
		end
	end
end

-- Store the original motor positions when the script starts
storeMotors()

UserInputService.InputBegan:Connect(onInputBegan)

--[[

		Gui2Lua™
		10zOfficial
		Version 1.0.0

]]


-- Instances

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local forspeedlab = Instance.new("TextLabel")
local upspeedlab = Instance.new("TextLabel")
local speedbox2 = Instance.new("TextBox")
local speedbox1 = Instance.new("TextBox")

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
TextLabel.Size = UDim2.new(0, 431, 0, 55)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "DIVE SPEED CHANGER"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 37
TextLabel.TextWrapped = true

forspeedlab.Name = "forspeedlab"
forspeedlab.Parent = Frame
forspeedlab.BackgroundColor3 = Color3.new(1, 1, 1)
forspeedlab.BackgroundTransparency = 1
forspeedlab.BorderColor3 = Color3.new(0, 0, 0)
forspeedlab.BorderSizePixel = 0
forspeedlab.Position = UDim2.new(0.303944319, 0, 0.249027237, 0)
forspeedlab.Size = UDim2.new(0, 169, 0, 35)
forspeedlab.Font = Enum.Font.SourceSansBold
forspeedlab.Text = "FORWARD SPEED"
forspeedlab.TextColor3 = Color3.new(1, 1, 1)
forspeedlab.TextScaled = true
forspeedlab.TextSize = 14
forspeedlab.TextWrapped = true

upspeedlab.Name = "upspeedlab"
upspeedlab.Parent = Frame
upspeedlab.BackgroundColor3 = Color3.new(1, 1, 1)
upspeedlab.BackgroundTransparency = 1
upspeedlab.BorderColor3 = Color3.new(0, 0, 0)
upspeedlab.BorderSizePixel = 0
upspeedlab.Position = UDim2.new(0.303944319, 0, 0.57198441, 0)
upspeedlab.Size = UDim2.new(0, 169, 0, 35)
upspeedlab.Font = Enum.Font.SourceSansBold
upspeedlab.Text = "UPWARD SPEED"
upspeedlab.TextColor3 = Color3.new(1, 1, 1)
upspeedlab.TextScaled = true
upspeedlab.TextSize = 14
upspeedlab.TextWrapped = true

speedbox2.Name = "speedbox2"
speedbox2.Parent = Frame
speedbox2.BackgroundColor3 = Color3.new(1, 1, 1)
speedbox2.BorderColor3 = Color3.new(0, 0, 0)
speedbox2.BorderSizePixel = 0
speedbox2.Position = UDim2.new(0.275144637, 0, 0.754213572, 0)
speedbox2.Size = UDim2.new(0, 191, 0, 33)
speedbox2.Font = Enum.Font.SourceSans
speedbox2.Text = "35"
speedbox2.TextColor3 = Color3.new(0, 0, 0)
speedbox2.TextScaled = true
speedbox2.TextSize = 14
speedbox2.TextWrapped = true

speedbox1.Name = "speedbox1"
speedbox1.Parent = Frame
speedbox1.BackgroundColor3 = Color3.new(1, 1, 1)
speedbox1.BorderColor3 = Color3.new(0, 0, 0)
speedbox1.BorderSizePixel = 0
speedbox1.Position = UDim2.new(0.276471853, 0, 0.399360508, 0)
speedbox1.Size = UDim2.new(0, 191, 0, 33)
speedbox1.Font = Enum.Font.SourceSans
speedbox1.Text = "75"
speedbox1.TextColor3 = Color3.new(0, 0, 0)
speedbox1.TextScaled = true
speedbox1.TextSize = 14
speedbox1.TextWrapped = true

while true do
	task.wait(0.01)
	forwardspeed = speedbox1.Text
	upwardspeed = speedbox2.Text
end
