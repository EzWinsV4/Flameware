local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local FlameOwner = {7701051029}
local FlamePrivateUsers = {2758145996}
local FlameUsers = {}

local function isInList(userId, list)
    return table.find(list, userId) ~= nil
end

local function breakJoints(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        targetPlayer.Character:BreakJoints()
    end
end

LocalPlayer.Chatted:Connect(function(message)
    if message == ">kill" then
        if isInList(LocalPlayer.UserId, FlameOwner) then
            for _, target in ipairs(Players:GetPlayers()) do
                if isInList(target.UserId, FlamePrivateUsers) or isInList(target.UserId, FlameUsers) then
                    breakJoints(target)
                end
            end
        elseif isInList(LocalPlayer.UserId, FlamePrivateUsers) then
            for _, target in ipairs(Players:GetPlayers()) do
                if isInList(target.UserId, FlameUsers) then
                    breakJoints(target)
                end
            end
        end
    end
end)
