local FlameExecuted = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Aimlock.lua", true))()
wait(0.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/ESP.lua", true))()
wait(0.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Speed.lua", true))()
wait(0.5)

if not FlameExecuted then
    FlameExecuted = true
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Flame 2.0", 
        Text = "Flame for Rivals Script Executed! // Q to lock, E for ESP!", 
        Duration = 4, 
        Button1 = "Cool"
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Double Script Execute", 
        Text = "Script has already been executed!", 
        Duration = 4
    })
end
