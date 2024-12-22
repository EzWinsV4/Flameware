local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local FlameOwner = {
    7734698235,
}
local FlamePrivateUsers = {
    2758145996,
}

local isOwner = table.find(FlameOwner, LocalPlayer.UserId) ~= nil
local isPrivateUser = table.find(FlamePrivateUsers, LocalPlayer.UserId) ~= nil
local isFlameUser = not isOwner and not isPrivateUser

local function sendCustomNotification(title, text, buttonText)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 4,
        Button1 = buttonText,
    })
end

if isOwner then
    sendCustomNotification("Flame OWNER 👑", "Hello Flame owner >:)", "Wsg")
elseif isPrivateUser then
    sendCustomNotification("Flame Private 💎", "Hello Flame Private user!", "HELLO")
end

local function findFlameUsers(command)
    if isOwner and command == ">find" then
        local found = false
        for _, player in ipairs(Players:GetPlayers()) do
            if (table.find(FlamePrivateUsers, player.UserId) or table.find(FlameOwner, player.UserId)) and player ~= LocalPlayer then
                sendCustomNotification(player.UserId == LocalPlayer.UserId and "Flame Owner 👑" or "Flame Private 💎", player.Name, "Found")
                found = true
            end
        end
        
        if not found then
            sendCustomNotification(">find", "We couldn't find any flame users", "Okay")
        end
    elseif isPrivateUser and command == ">find" then
        local found = false
        for _, player in ipairs(Players:GetPlayers()) do
            if table.find(FlamePrivateUsers, player.UserId) and player ~= LocalPlayer then
                sendCustomNotification("Flame Private 💎", player.Name, "Found")
                found = true
            end
        end

        if not found then
            sendCustomNotification(">find", "We couldn't find any flame users", "Okay")
        end
    end
end

Players.LocalPlayer.Chatted:Connect(function(message)
    if message:lower() == ">find" then
        findFlameUsers(message)
    end
end)
