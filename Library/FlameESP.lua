local ESP = {}

ESP.Settings = {
    Enabled = true,

    ThreeDimensional = false,
    ThreeDimensionalHealthBased = false,
    ThreeDimensionalTeamBased = false,
    ThreeDimensionalColor = Color3.fromRGB(255, 102, 102),
    ThreeDimensionalTransparency = 0,
    ThreeDimensionalOnMe = false,

    Highlights = false,
    HighlightsHealthBased = false,
    HighlightsTeamBased = false,
    HighlightsColor = Color3.fromRGB(255, 102, 102),
    HighlightsTransparency = 0,
    HighlightsOnMe = false,

    Boxes = false,
    BoxesThickness = 3,
    BoxesHealthBased = false,
    BoxesTeamBased = false,
    BoxesColor = Color3.fromRGB(255, 102, 102),
    BoxesTransparency = 0,
    BoxesOnMe = false,

    Healthbar = false,
    HealthbarThickness = 3,
    HealthbarSide = "right",
    HealthBarTransparency = 0,
    HealthbarOnMe = false,

    Nametags = false,
    NametagsHealthBased = false,
    NametagsTeamBased = false,
    NametagsColor = Color3.fromRGB(225, 102, 102),
    NametagsStroke = false,
    NametagsStrokeThickness = 2,
    NametagsStrokeColor = Color3.fromRGB(225, 102, 102),
    NametagsTransparency = 0,
    NametagsOnMe = false,

    Skeleton = false,
    SkeletonHealthBased = false,
    SkeletonTeamBased = false,
    SkeletonColor = Color3.fromRGB(255, 102, 102),
    SkeletonTransparency = 0,
    SkeletonOnMe = false,
}

local function getHealthBasedColor(healthPercent)
    return Color3.fromRGB(255 * (1 - healthPercent), 255 * healthPercent, 102)
end

local function createHighlight(player)
    local highlight = Instance.new("Highlight")
    highlight.Enabled = false
    highlight.Parent = player.Character or player.CharacterAdded:Wait()
    return highlight
end

local function createBox()
    local box = Drawing.new("Square")
    box.Visible = false
    return box
end

local function createHealthbar()
    local bar = Drawing.new("Line")
    bar.Visible = false
    return bar
end

local function createSkeleton()
    local skeleton = {}
    for _, part in pairs({"Head", "Torso", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}) do
        skeleton[part] = Drawing.new("Line")
        skeleton[part].Visible = false
    end
    return skeleton
end

local function createNametag(player)
    local tag = Drawing.new("Text")
    tag.Visible = false
    tag.Text = player.Name
    tag.Size = 16
    tag.Center = true
    return tag
end

local function updateHighlights(player, highlight)
    if not ESP.Settings.Highlights then return end
    highlight.Enabled = true
    highlight.FillColor = ESP.Settings.HighlightsHealthBased and getHealthBasedColor(1) or ESP.Settings.HighlightsColor
    highlight.FillTransparency = ESP.Settings.HighlightsTransparency
end

local function updateBoxes(player, box)
    if not ESP.Settings.Boxes then return end
    local character = player.Character
    local head = character and character:FindFirstChild("Head")
    if head then
        box.Visible = true
        box.Size = Vector2.new(50, 50)
        box.Color = ESP.Settings.BoxesHealthBased and getHealthBasedColor(1) or ESP.Settings.BoxesColor
        box.Transparency = ESP.Settings.BoxesTransparency
    else
        box.Visible = false
    end
end

local function updateHealthbar(player, bar)
    if not ESP.Settings.Healthbar then return end
    bar.Visible = true
    bar.Thickness = ESP.Settings.HealthbarThickness
    bar.Color = Color3.new(0, 1, 0)
    bar.Transparency = ESP.Settings.HealthBarTransparency
end

local function updateSkeleton(player, skeleton)
    if not ESP.Settings.Skeleton then return end
    local character = player.Character
    if character then
        for _, partName in pairs({"Head", "Torso", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}) do
            local part = character:FindFirstChild(partName)
            if part then
                skeleton[partName].Visible = true
                skeleton[partName].From = part.Position
                skeleton[partName].To = part.Position
                skeleton[partName].Color = ESP.Settings.SkeletonColor
                skeleton[partName].Transparency = ESP.Settings.SkeletonTransparency
            else
                skeleton[partName].Visible = false
            end
        end
    end
end

local function updateNametags(player, tag)
    if not ESP.Settings.Nametags then return end
    tag.Visible = true
    tag.Position = Vector2.new(100, 100)
    tag.Color = ESP.Settings.NametagsColor
    tag.Transparency = ESP.Settings.NametagsTransparency
end

function ESP:Enable()
    for _, player in pairs(game.Players:GetPlayers()) do
        local highlight = createHighlight(player)
        local box = createBox()
        local healthbar = createHealthbar()
        local skeleton = createSkeleton()
        local nametag = createNametag(player)

        game:GetService("RunService").RenderStepped:Connect(function()
            if ESP.Settings.Enabled then
                updateHighlights(player, highlight)
                updateBoxes(player, box)
                updateHealthbar(player, healthbar)
                updateSkeleton(player, skeleton)
                updateNametags(player, nametag)
            else
                highlight.Enabled = false
                box.Visible = false
                healthbar.Visible = false
                for _, line in pairs(skeleton) do
                    line.Visible = false
                end
                nametag.Visible = false
            end
        end)
    end
end

function ESP:Disable()
    ESP.Settings.Enabled = false
end

function ESP:Set(key, value)
    if ESP.Settings[key] ~= nil then
        ESP.Settings[key] = value
    end
end

return ESP
