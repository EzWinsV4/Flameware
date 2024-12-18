local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local speed = 3
local tpwalking = true

task.spawn(function()
    while true do
        local player = Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildWhichIsA("Humanoid")

        if humanoid then
            while tpwalking and char and humanoid and humanoid.Parent do
                local delta = RunService.Heartbeat:Wait()

                if humanoid.MoveDirection.Magnitude > 0 then
                    char:TranslateBy(humanoid.MoveDirection * speed * delta * 10)
                end
            end
        end
        task.wait(1)
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame", 
    Text = "Speed Loaded",
    Duration = 2,
})
