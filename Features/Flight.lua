local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local FLYING = false
local flySpeed = 125
local CONTROL = {F = 0, B = 0, L = 0, R = 0, U = 0, D = 0}
local SPEED = 0
local flyKeyDown, flyKeyUp, flyConnection

local function getRoot(character)
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
end

local function startFly()
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local root = getRoot(character)

    if not root then return end

    if flyKeyDown or flyKeyUp then
        flyKeyDown:Disconnect()
        flyKeyUp:Disconnect()
    end

    local bodyGyro = Instance.new("BodyGyro", root)
    local bodyVelocity = Instance.new("BodyVelocity", root)
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.P = 9e4
    bodyGyro.CFrame = root.CFrame
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Velocity = Vector3.zero

    FLYING = true
    SPEED = flySpeed

    flyKeyDown = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.W then
            CONTROL.F = 1
        elseif input.KeyCode == Enum.KeyCode.S then
            CONTROL.B = -1
        elseif input.KeyCode == Enum.KeyCode.A then
            CONTROL.L = -1
        elseif input.KeyCode == Enum.KeyCode.D then
            CONTROL.R = 1
        elseif input.KeyCode == Enum.KeyCode.Space then
            CONTROL.U = 1
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            CONTROL.D = -1
        end
    end)

    flyKeyUp = UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then
            CONTROL.F = 0
        elseif input.KeyCode == Enum.KeyCode.S then
            CONTROL.B = 0
        elseif input.KeyCode == Enum.KeyCode.A then
            CONTROL.L = 0
        elseif input.KeyCode == Enum.KeyCode.D then
            CONTROL.R = 0
        elseif input.KeyCode == Enum.KeyCode.Space then
            CONTROL.U = 0
        elseif input.KeyCode == Enum.KeyCode.LeftShift then
            CONTROL.D = 0
        end
    end)

    flyConnection = RunService.RenderStepped:Connect(function()
        if FLYING and root then
            local moveDirection = Vector3.new(
                (CONTROL.R + CONTROL.L) * SPEED, 
                (CONTROL.U + CONTROL.D) * SPEED, 
                -(CONTROL.F + CONTROL.B) * SPEED 
            )
            bodyVelocity.Velocity = workspace.CurrentCamera.CFrame:VectorToWorldSpace(moveDirection)
            bodyGyro.CFrame = workspace.CurrentCamera.CFrame
        end
    end)
end

local function stopFly()
    FLYING = false
    if flyKeyDown then flyKeyDown:Disconnect() end
    if flyKeyUp then flyKeyUp:Disconnect() end
    if flyConnection then flyConnection:Disconnect() end

    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local root = getRoot(character)

    if root then
        for _, obj in pairs(root:GetChildren()) do
            if obj:IsA("BodyGyro") or obj:IsA("BodyVelocity") then
                obj:Destroy()
            end
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.R then
        if FLYING then
            stopFly()
        else
            startFly()
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame",
    Text = "Flight Loaded! // R to toggle",
    Duration = 2,
})
