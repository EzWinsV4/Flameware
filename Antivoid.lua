local Players = game:GetService("Players")
local player = Players.LocalPlayer
local checkInterval = 0.1
local historyDuration = 4
local positionHistory = {}

local function createPartForPlayer(player)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local position = humanoidRootPart.Position

        local part = Instance.new("Part")
        part.Size = Vector3.new(9999999999, 2, 9999999999)
        part.Position = position - Vector3.new(0, 10, 0)
        part.Anchored = true
        part.CanCollide = true
        part.Parent = workspace

        part.Touched:Connect(function(hit)
            if hit.Parent == character then
                local pastPosition = positionHistory[math.max(1, #positionHistory - math.floor(historyDuration / checkInterval))]
                if pastPosition then
                    humanoidRootPart.CFrame = pastPosition
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Flame", 
                        Text = "Antivoid teleported you back to safe place!",
                        Duration = 3,
                    })
                end
            end
        end)

        while character.Parent do
            local currentPosition = humanoidRootPart.Position
            table.insert(positionHistory, humanoidRootPart.CFrame)
            if #positionHistory > math.floor(historyDuration / checkInterval) then
                table.remove(positionHistory, 1)
            end
            wait(checkInterval)
        end
    end
end

player.CharacterAdded:Connect(function()
    createPartForPlayer(player)
end)

if player.Character then
    createPartForPlayer(player)
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame", 
    Text = "Antivoid Loaded", 
    Duration = 2,
})
