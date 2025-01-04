local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local noclipEnabled = false

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    local state = noclipEnabled and "Enabled" or "Disabled"
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Flame", 
        Text = "Noclip " .. state,
        Duration = 2,
    })
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.V then
        toggleNoclip()
    end
end)

RunService.Stepped:Connect(function()
    while true do
        task.wait(5)

        local character = player.Character or player.CharacterAdded:Wait()
        
        if noclipEnabled and character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

task.wait(0.5)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame", 
    Text = "Noclip Loaded // V to toggle", 
    Duration = 2,
})
