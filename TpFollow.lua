local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local toggleKey = Enum.KeyCode.X
local followEnabled = false
local targetPlayer = nil
local offset = Vector3.new(0, 8, 0)

local function GetClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Team ~= player.Team and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    return closestPlayer
end

local function followTarget()
    while followEnabled and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") do
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position + offset
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        wait(0.1)
    end
    if followEnabled then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Flame",
            Text = "Lost Target: Stopping Follow",
            Duration = 3,
        })
        followEnabled = false
    end
end

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == toggleKey then
        followEnabled = not followEnabled

        if followEnabled then
            targetPlayer = GetClosestPlayer()
            if targetPlayer then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Flame",
                    Text = "Follow Enabled: Targeting " .. targetPlayer.Name,
                    Duration = 3,
                })
                player.Character:SetPrimaryPartCFrame(CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + offset))
                followTarget()
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Flame",
                    Text = "No Opponents Found",
                    Duration = 3,
                })
                followEnabled = false
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Flame",
                Text = "Follow Disabled",
                Duration = 3,
            })
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame",
    Text = "TpFollow Loaded",
    Duration = 2,
})
