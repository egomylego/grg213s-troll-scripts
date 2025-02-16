local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local ragdolling = false
local motors = {}

task.wait(1)
if game:IsLoaded() then
	game.StarterGui:SetCore("SendNotification", {
		Title = "FE DIVE SCRIPT LOADED", -- Notification title
		Text = "dive script loaded, have fun :)", -- Notification text
		Button1 = "OK", -- button 1 text (optional)
	})
end

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
		bodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * 75 + Vector3.new(0, 35, 0)  -- Forward + Upward
		
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
		task.wait(2)
		disableRagdoll()
	end
end



-- Toggle ragdoll when "R" is pressed, but only if not typing in chat
local function onInputBegan(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.R then
		if not ragdolling then
			enableRagdoll()
		end
	end
end

-- Store the original motor positions when the script starts
storeMotors()

UserInputService.InputBegan:Connect(onInputBegan)
