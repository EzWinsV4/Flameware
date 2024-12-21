local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local FlameOwner = {
    7727897981,
}
local FlamePrivateUsers = {
    2758145996,
}
local FlameUsers = {}

if table.find(FlameOwner, player.UserId) then
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame OWNER 👑", 
    Text = "Hello Flame owner >:) ",
    Duration = 4,
    Button1 = "Wsg",
  })
end

if table.find(FlamePrivateUsers, player.UserId) then
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame Private 💎", 
    Text = "Hello Flame Private user!",
    Duration = 4,
    Button1 = "HELLO",
  })
end
