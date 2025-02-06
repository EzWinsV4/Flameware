return function()
    local ESP = {}
    ESP.Enabled = false
    ESP.Transparency = 0.5
    ESP.HealthBased = true
    ESP.Color = Color3.fromRGB(255, 0, 0)
    ESP.ShowNames = false

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local ESPParts = {}
    local NameTags = {}

    local function getColorBasedOnHealth(health)
        if health > 75 then
            return Color3.fromRGB(0, 255, 0)
        elseif health > 50 then
            return Color3.fromRGB(255, 255, 0)
        elseif health > 25 then
            return Color3.fromRGB(255, 165, 0)
        elseif health > 0 then
            return Color3.fromRGB(255, 0, 0)
        else
            return Color3.fromRGB(0, 0, 0)
        end
    end

    local function createESP(player)
        if not player.Character then return end

        local box = Instance.new("BoxHandleAdornment")
        box.Size = Vector3.new(4, 6, 4)
        box.Color3 = ESP.Color
        box.AlwaysOnTop = true
        box.ZIndex = 0
        box.Transparency = ESP.Transparency
        box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
        box.Parent = game.Workspace

        ESPParts[player] = box

        if ESP.ShowNames then
            local nameTag = Instance.new("BillboardGui")
            nameTag.Size = UDim2.new(0, 100, 0, 50)
            nameTag.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
            nameTag.AlwaysOnTop = true

            local label = Instance.new("TextLabel", nameTag)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Text = player.Name
            label.TextColor3 = Color3.new(1, 1, 1)
            label.BackgroundTransparency = 1

            nameTag.Parent = game.Workspace
            NameTags[player] = nameTag
        end
    end

    local function updateESP()
        for player, box in pairs(ESPParts) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character.Humanoid
                local health = humanoid.Health / humanoid.MaxHealth * 100

                if ESP.HealthBased then
                    box.Color3 = getColorBasedOnHealth(health)
                else
                    box.Color3 = ESP.Color
                end

                box.Adornee = player.Character.HumanoidRootPart
                box.Visible = ESP.Enabled
            else
                box.Visible = false
            end

            if ESP.ShowNames and NameTags[player] then
                NameTags[player].Enabled = ESP.Enabled
            end
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            createESP(player)
        end)
    end)

    Players.PlayerRemoving:Connect(function(player)
        if ESPParts[player] then
            ESPParts[player]:Destroy()
            ESPParts[player] = nil
        end

        if NameTags[player] then
            NameTags[player]:Destroy()
            NameTags[player] = nil
        end
    end)

    RunService.RenderStepped:Connect(updateESP)

    function ESP.Toggle(state)
        ESP.Enabled = state
    end

    function ESP.SetTransparency(value)
        ESP.Transparency = value
    end

    function ESP.SetHealthBased(state)
        ESP.HealthBased = state
    end

    function ESP.SetColor(r, g, b)
        ESP.Color = Color3.fromRGB(r, g, b)
    end

    function ESP.ShowNameTags(state)
        ESP.ShowNames = state
    end

    return ESP
end
