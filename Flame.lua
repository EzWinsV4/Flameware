local player = game:GetService("Players").LocalPlayer

FlamePrivateUsers = {
  770105029,
  2758145996,
}

if table.find(FlamePrivateUsers, player.UserId) then
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame Private", 
    Text = "Hello Flame Private user!",
    Duration = 2,
    Button1 = "Wsg",
  })
end
