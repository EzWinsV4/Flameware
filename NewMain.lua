if not getgenv().FlamewareExecuted then

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    
    getgenv().FlamewareExecuted = true

    task.wait(0.1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EzWinsV4/FlameForRobloxRivals/refs/heads/main/Flameware/rivals.lua", true))()
  
else
  print(" |❌|: FLAMEWARE IS ALREADY EXECUTED :|❌| ")
end
