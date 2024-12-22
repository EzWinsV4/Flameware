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
