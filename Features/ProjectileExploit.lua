local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local headSize = 25
local HitboxDisabled = true

local function toggleEffect()
    HitboxDisabled = not HitboxDisabled
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        toggleEffect()
    end
end)

RunService.RenderStepped:Connect(function()
    if not HitboxDisabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = character.HumanoidRootPart
                    pcall(function()
                        rootPart.Size = Vector3.new(headSize, headSize, headSize)
                        rootPart.Transparency = 1
                        rootPart.BrickColor = BrickColor.new("Really black")
                        rootPart.Material = Enum.Material.Neon
                        rootPart.CanCollide = false
                        rootPart.Shape = Enum.PartType.Ball
                    end)
                end
            end
        end
    end
end)

StarterGui:SetCore("SendNotification", {
    Title = "Flame",
    Text = "ProjectileExploit Loaded! Press F to toggle",
    Duration = 2,
})
