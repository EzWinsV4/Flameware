local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer or Players:GetPlayers()[1]
local teleporting = false

local function isOnSameTeam(otherPlayer)
    if player.Team and otherPlayer.Team then
        return player.Team == otherPlayer.Team
    end
    return false
end

local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if not isOnSameTeam(otherPlayer) then
                local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end
    end
    return closestPlayer
end

local function startTeleporting()
    teleporting = true
    RunService.Heartbeat:Connect(function()
        if not teleporting then return end
        local closestPlayer = getClosestPlayer()
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local closestPosition = closestPlayer.Character.HumanoidRootPart.Position
            local direction = (player.Character.HumanoidRootPart.Position - closestPosition).unit
            local behindPosition = closestPosition - direction * 2
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(behindPosition + Vector3.new(0, 5, 0))
            end
        end
    end)
end

local function stopTeleporting()
    teleporting = false
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Z then
        if teleporting then
            stopTeleporting()
        else
            startTeleporting()
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Flame", 
    Text = "TpFollow Loaded! // Z to toggle", 
    Duration = 2,
})
