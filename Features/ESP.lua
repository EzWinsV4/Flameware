local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ESP = false

local function createHealthGui(player)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = player.Character.Head
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 4, 0)

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0.8
    textLabel.Text = tostring(player.Character.Humanoid.Health)
    textLabel.Parent = billboardGui
    billboardGui.Parent = player.Character
    return textLabel
end

local function updateHealthGui(player, textLabel)
    textLabel.Text = tostring(player.Character.Humanoid.Health)
end

local function EspActivate(player)
    if player.Character then
        local existingEsp = player.Character:FindFirstChild("Highlight")
        local existingHealthGui = player.Character:FindFirstChild("HealthGui")
        
        if not ESP then
            if existingEsp then existingEsp:Destroy() end
            if existingHealthGui then existingHealthGui:Destroy() end
            return
        end

        if existingEsp then existingEsp:Destroy() end
        if existingHealthGui then existingHealthGui:Destroy() end
        
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        if player.Team and Players.LocalPlayer.Team then
            highlight.FillColor = (player.Team == Players.LocalPlayer.Team) and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
        else
            highlight.FillColor = Color3.new(0, 0, 1)
        end
        highlight.OutlineColor = Color3.new(1, 1, 1)

        local healthGui = createHealthGui(player)
        healthGui.Name = "HealthGui"
        
        player.Character.Humanoid.HealthChanged:Connect(function()
            updateHealthGui(player, healthGui)
        end)
    end
end

local function toggleEsp()
    ESP = not ESP
    for _, player in pairs(Players:GetPlayers()) do
        EspActivate(player)
    end
end

for _, player in pairs(Players:GetPlayers()) do
    EspActivate(player)
    player.CharacterAdded:Connect(function() EspActivate(player) end)
    player:GetPropertyChangedSignal("Team"):Connect(function() EspActivate(player) end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function() EspActivate(player) end)
    player:GetPropertyChangedSignal("Team"):Connect(function() EspActivate(player) end)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.E then
        toggleEsp()
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame",
    Text = "ESP Loaded! Press 'E' to toggle ESP.",
    Duration = 2
})
