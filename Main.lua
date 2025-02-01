if not getgenv().FlameExecuted then

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    
    getgenv().FlameExecuted = true

    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/Aimlock.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/ESP.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/Speed.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/Noclip.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/Teleport.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/TpFollow.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/Flight.lua", true))()
    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Features/HitboxExpander.lua", true))()
    task.wait(0.2)

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = " 🔥 Flame 🔥", 
        Text = "Flame for Rivals Script Executed!", 
        Duration = 4, 
        Button1 = "Cool"
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "❌ Error ❌", 
        Text = "Script has already been executed!", 
        Duration = 4
    })
end
