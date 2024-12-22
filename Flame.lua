local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local FlameOwner = {
    7727897981,
}
local FlamePrivateUsers = {
    2758145996,
}

local isOwner = table.find(FlameOwner, LocalPlayer.UserId) ~= nil
local isPrivateUser = table.find(FlamePrivateUsers, LocalPlayer.UserId) ~= nil
local FlameUser = not isOwner and not isPrivateUser

if isOwner then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Flame OWNER 👑", 
        Text = "Hello Flame owner >:) ",
        Duration = 4,
        Button1 = "Wsg",
    })
elseif isPrivateUser then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Flame Private 💎", 
        Text = "Hello Flame Private user!",
        Duration = 4,
        Button1 = "HELLO",
    })
elseif isFlameUser then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Flame User 🔥", 
        Text = "Welcome to Flame!",
        Duration = 4,
        Button1 = "Okay",
    })
end
