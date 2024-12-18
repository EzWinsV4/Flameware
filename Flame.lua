local player = game:GetService("Players")

FlamePrivateUsers = {
  7701051029,
}
  
if player.UserId == FlamePrivateUsers then
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame Private", 
    Text = "Hello Flame Private user!",
    Duration = 2,
    Button1 = "Wsg",
  })
end
