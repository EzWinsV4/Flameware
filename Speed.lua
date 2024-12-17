local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local speed = 3
local tpwalking = true

local player = Players.LocalPlayer
local chr = player.Character or player.CharacterAdded:Wait()
local humanoid = chr:FindFirstChildWhichIsA("Humanoid")

if humanoid then
    task.spawn(function()
        while tpwalking and chr and humanoid and humanoid.Parent do
            local delta = RunService.Heartbeat:Wait()

            if humanoid.MoveDirection.Magnitude > 0 then
                chr:TranslateBy(humanoid.MoveDirection * speed * delta * 10)
            end
        end
    end)
end

print("[]]----[ Loaded! ]----[[]")
