local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local ESP = false

local function EspActivate(player)
    if player.Character then
        local existingEsp = player.Character:FindFirstChild("Highlight")

        if not ESP then
            if existingEsp then
                existingEsp:Destroy()
            end
            return
        end

        if existingEsp then
            existingEsp:Destroy()
        end

        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.FillColor = Color3.new(251, 71, 0)
        highlight.OutlineColor = Color3.new(0, 0, 0)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

local function toggleEsp()
    ESP = not ESP
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            EspActivate(player)
        end
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        EspActivate(player)
    end

    player.CharacterAdded:Connect(function()
        EspActivate(player)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        EspActivate(player)
    end)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.KeyCode == Enum.KeyCode.E then
        toggleEsp()
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Flame", 
    Text = "ESP Loaded! // E for ESP!", 
    Duration = 2,
})
