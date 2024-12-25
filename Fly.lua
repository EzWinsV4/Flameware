local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local flying = false
local speed = 125
local bodyVelocity
local bodyGyro

local function startFlying()
    flying = true

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
    bodyVelocity.Parent = humanoidRootPart

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyGyro.Parent = humanoidRootPart
end

local function stopFlying()
    flying = false

    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end
end

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.C then
        if flying then
            stopFlying()
        else
            startFlying()
        end
    end
end)

runService.RenderStepped:Connect(function()
    if flying then
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.zero

        if userInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if userInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if userInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if userInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if userInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end

        if moveDirection.Magnitude > 0 then
            bodyVelocity.Velocity = moveDirection.Unit * speed
        else
            bodyVelocity.Velocity = Vector3.zero
        end
    end
end)
