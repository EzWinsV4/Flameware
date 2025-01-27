local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ESP = false
local drawingObjects = {}

local function createDrawing(player)
    if player.Character then
        local char = player.Character
        local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoidRootPart and humanoid then
            local box = Drawing.new("Quad")
            box.PointA = humanoidRootPart.Position + Vector3.new(-2, 5, -2)
            box.PointB = humanoidRootPart.Position + Vector3.new(2, 5, -2)
            box.PointC = humanoidRootPart.Position + Vector3.new(2, 5, 2)
            box.PointD = humanoidRootPart.Position + Vector3.new(-2, 5, 2)
            box.Color = (player.Team == Players.LocalPlayer.Team) and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
            box.Thickness = 3
            box.Transparency = 1

            local healthText = Drawing.new("Text")
            healthText.Text = tostring(humanoid.Health)
            healthText.Size = 16
            healthText.Color = Color3.new(1, 1, 1)
            healthText.Position = Vector2.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + 3)
            healthText.Center = true
            healthText.Outline = true
            healthText.OutlineColor = Color3.new(0, 0, 0)

            drawingObjects[player] = {Box = box, HealthText = healthText}
        end
    end
end

local function removeDrawing(player)
    if drawingObjects[player] then
        drawingObjects[player].Box:Remove()
        drawingObjects[player].HealthText:Remove()
        drawingObjects[player] = nil
    end
end

local function updateDrawing(player)
    local drawing = drawingObjects[player]
    if player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoidRootPart and humanoid then
            drawing.Box.PointA = humanoidRootPart.Position + Vector3.new(-2, 5, -2)
            drawing.Box.PointB = humanoidRootPart.Position + Vector3.new(2, 5, -2)
            drawing.Box.PointC = humanoidRootPart.Position + Vector3.new(2, 5, 2)
            drawing.Box.PointD = humanoidRootPart.Position + Vector3.new(-2, 5, 2)

            drawing.HealthText.Text = tostring(humanoid.Health)
            drawing.HealthText.Position = Vector2.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + 3)
        end
    end
end

local function EspActivate(player)
    if ESP then
        if not drawingObjects[player] then
            createDrawing(player)
        else
            updateDrawing(player)
        end
    else
        removeDrawing(player)
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
    Text = "ESP Loaded // E to toggle",
    Duration = 2
})
