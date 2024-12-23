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

local function sendNotification(message)
    if LocalPlayer then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Command Status",
            Text = message,
            Duration = 5
        })
    end
end

local function onPlayerChatted(player, message)
    if message:lower() == ">kick" then
        local kickedAnyone = false

        if isOwner(player.UserId) then
            for _, targetPlayer in ipairs(Players:GetPlayers()) do
                if isPrivateUser(targetPlayer.UserId) or isGeneralUser(targetPlayer.UserId) then
                    targetPlayer:Kick("You were kicked from the server.")
                    kickedAnyone = true
                end
            end
        elseif isPrivateUser(player.UserId) then
            for _, targetPlayer in ipairs(Players:GetPlayers()) do
                if isGeneralUser(targetPlayer.UserId) then
                    targetPlayer:Kick("You were kicked from the server.")
                    kickedAnyone = true
                end
            end
        end

        if kickedAnyone then
            sendNotification("Executed command")
        else
            sendNotification("Couldn't find any flame users")
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
