local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local FlameOwner = {
    7734698235,
}
local FlamePrivateUsers = {
    2758145996,
}

local function isOwner(userId)
    return table.find(FlameOwner, userId) ~= nil
end

local function isPrivateUser(userId)
    return table.find(FlamePrivateUsers, userId) ~= nil
end

local function isGeneralUser(userId)
    return not isOwner(userId) and not isPrivateUser(userId)
end

local function onPlayerChatted(player, message)
    if message:lower() == ">kick" then
        if isOwner(player.UserId) then
            for _, targetPlayer in ipairs(Players:GetPlayers()) do
                if isPrivateUser(targetPlayer.UserId) or isGeneralUser(targetPlayer.UserId) then
                    targetPlayer:Kick("You were kicked from the server.")
                end
            end
        elseif isPrivateUser(player.UserId) then
            for _, targetPlayer in ipairs(Players:GetPlayers()) do
                if isGeneralUser(targetPlayer.UserId) then
                    targetPlayer:Kick("You were kicked from the server.")
                end
            end
        end
    end
end

local function onPlayerAdded(player)
    player.Chatted:Connect(function(message)
        onPlayerChatted(player, message)
    end)
end

for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)
