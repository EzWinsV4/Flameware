local player = game:GetService("Players").LocalPlayer

FlamePrivateUsers = {
  7701051029,
}

if table.find(FlamePrivateUsers, player.UserId) then
  task.wait(5)
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame Private", 
    Text = "Hello Flame Private user!",
    Duration = 2,
    Button1 = "Wsg",
  })
end
