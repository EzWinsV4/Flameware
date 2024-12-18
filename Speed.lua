local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local FlamePrivateUser = {
    7701051029,
}

local tpwalking = true

local function isWhitelisted(userId)
    for _, id in ipairs(FlamePrivateUser) do
        if id == userId then
            return true
        end
    end
    return false
end

local player = Players.LocalPlayer
if not player then
    return
end

local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:FindFirstChildWhichIsA("Humanoid")

if humanoid then
    if isWhitelisted(player.UserId) then
        speed = 4
    else
        speed = 2
    end

    RunService.Heartbeat:Connect(function()
        if tpwalking and char and humanoid and humanoid.Parent then
            if humanoid.MoveDirection.Magnitude > 0 then
                char:TranslateBy(humanoid.MoveDirection * speed * 0.1)
            end
        end
    end)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame", 
    Text = "Speed Loaded",
    Duration = 2,
})
