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

while true do
	wait(0.1)
	if sprinting then
		humanoid.WalkSpeed = 30
	else
		humanoid.WalkSpeed = 16
	end
end
