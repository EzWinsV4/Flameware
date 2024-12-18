getgenv().FlameExecuted = getgenv().FlameExecuted or false

local player = game:GetService("Players")

local FlamePrivateUser = {
    7701051029,
}

local isFlamePrivateUser = false

for _, id in ipairs(FlamePrivateUser) do
    if player.UserId == id then
        isFlamePrivateUser = true
        break
    end
end

if isFlamePrivateUser then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Flame Private", 
        Text = "Hello Flame Private user! Good to see you!", 
        Duration = 5
    })
end

if not getgenv().FlameExecuted then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Aimlock.lua", true))()
    wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/ESP.lua", true))()
    wait(0.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Speed.lua", true))()
    wait(0.5)
    
    getgenv().FlameExecuted = true
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Flame 2.0", 
        Text = "Flame for Rivals Script Executed!", 
        Duration = 4, 
        Button1 = "Cool"
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "!Error:", 
        Text = "Script has already been executed!", 
        Duration = 4
    })
end
