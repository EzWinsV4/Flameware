-- credits to Vape V4

local lplr = game.Players.LocalPlayer
local gameCamera = game.Workspace.CurrentCamera
local inputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local coreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

local mouse1click = false

local function mouse1press()
    mouse1click = true
    inputService.MouseButton1Down:Fire()
end

local function mouse1release()
    mouse1click = false
    inputService.MouseButton1Up:Fire()
end

local function isrbxactive()
    return inputService:GetFocusedTextBox() == nil
end

local function iswindowactive()
    return true
end

local function canClick()
    local mousepos = (inputService:GetMouseLocation() - guiService:GetGuiInset())
    for _, v in lplr.PlayerGui:GetGuiObjectsAtPosition(mousepos.X, mousepos.Y) do
        local obj = v:FindFirstAncestorOfClass('ScreenGui')
        if v.Active and v.Visible and obj and obj.Enabled then
            return false
        end
    end
    for _, v in coreGui:GetGuiObjectsAtPosition(mousepos.X, mousepos.Y) do
        local obj = v:FindFirstAncestorOfClass('ScreenGui')
        if v.Active and v.Visible and obj and obj.Enabled then
            return false
        end
    end
    return true
end

local isAutoShootEnabled = false
local UIS = game:GetService("UserInputService")

local function toggleAutoShoot()
    isAutoShootEnabled = not isAutoShootEnabled
    StarterGui:SetCore("SendNotification", {
        Title = "Flame",
        Text = isAutoShootEnabled and "AutoShoot Enabled" or "AutoShoot Disabled",
        Duration = 2,
    })
end

UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.T then
        toggleAutoShoot()
    end
end)

local entitylib = {
    List = {},
}

function entitylib.isVulnerable(entity)
    return entity.Health and entity.Health > 0
end

task.spawn(function()
    local rayCheck, delayCheck = RaycastParams.new(), tick()
    local mouseClicked = false

    local function getAutoShootTarget()
        rayCheck.FilterDescendantsInstances = {lplr.Character, gameCamera}
        local ray = workspace:Raycast(gameCamera.CFrame.Position, gameCamera.CFrame.LookVector * 1000, rayCheck)
        if ray and ray.Instance then
            for _, v in ipairs(entitylib.List) do
                if v.Targetable and v.Character and (v.Player or v.NPC) then
                    if ray.Instance:IsDescendantOf(v.Character) then
                        return entitylib.isVulnerable(v) and v
                    end
                end
            end
        end
    end

    while true do
        if isAutoShootEnabled and mouse1click and (isrbxactive() or iswindowactive()) then
            local target = getAutoShootTarget()
            if target and canClick() then
                if delayCheck < tick() then
                    if mouseClicked then
                        mouse1release()
                        delayCheck = tick() + 0.1
                    else
                        mouse1press()
                    end
                    mouseClicked = not mouseClicked
                end
            else
                if mouseClicked then
                    mouse1release()
                end
                mouseClicked = false
            end
        end
        task.wait()
    end
end)

StarterGui:SetCore("SendNotification", {
    Title = "Flame", 
    Text = "Autoshoot Loaded! // T to toggle", 
    Duration = 2,
})
