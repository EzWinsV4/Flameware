local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local highlightingEnabled = false

local function highlightPlayer(player)
    if player.Character then
        local existingHighlight = player.Character:FindFirstChild("Highlight")

        if not highlightingEnabled then
            if existingHighlight then
                existingHighlight:Destroy()
            end
            return
        end

        if existingHighlight then
            existingHighlight:Destroy()
        end

        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.FillColor = Color3.new(1, 1, 0)
        highlight.OutlineColor = Color3.new(1, 0, 0)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

local function toggleHighlighting()
    highlightingEnabled = not highlightingEnabled
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            highlightPlayer(player)
        end
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        highlightPlayer(player)
    end

    player.CharacterAdded:Connect(function()
        highlightPlayer(player)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        highlightPlayer(player)
    end)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.KeyCode == Enum.KeyCode.E then
        toggleHighlighting()
    end
end)


game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Flame", 
    Text = "ESP Loaded // E to toggle ESP", 
    Duration = 2,
})
