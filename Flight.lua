local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local flying = false
local speed = 3
local toggleKey = Enum.KeyCode.C
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local function calculateMoveDirection()
    local moveDirection = Vector3.zero
    local camera = workspace.CurrentCamera

    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveDirection += camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveDirection -= camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveDirection -= camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveDirection += camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        moveDirection += Vector3.new(0, 1, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        moveDirection -= Vector3.new(0, 1, 0)
    end

    return moveDirection
end

RunService.Heartbeat:Connect(function(delta)
    if flying and humanoidRootPart then
        local moveDirection = calculateMoveDirection()
        if moveDirection.Magnitude > 0 then
            humanoidRootPart:TranslateBy(moveDirection.Unit * speed * delta * 10)
        end
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == toggleKey then
        flying = not flying
        local state = flying and "Enabled" or "Disabled"
        StarterGui:SetCore("SendNotification", {
            Title = "Flame", 
            Text = "Fly " .. state,
            Duration = 2,
        })
    end
end)

StarterGui:SetCore("SendNotification", {
    Title = "Flame", 
    Text = "Fly Loaded",
    Duration = 2,
})
