local player = game.Players.LocalPlayer

if player.UserId == 7701051029 then
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Flame Private", 
    Text = "Hello Flame Private user!",
    Duration = 2,
    Button1 = Wsg
  })
end
