loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Aimlock.lua", true))()
wait(0.3)
loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/ESP.lua", true))()
wait(0.3)
loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/ProjectileExploit.lua", true))()
wait(0.3)

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Flame 2.0", 
    Text = "Flame for Rivals Script Executed! // Q to lock, E for ESP!", 
    Duration = 4,
    Button1  = "Cool",
})
