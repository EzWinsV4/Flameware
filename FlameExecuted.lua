local HttpsService = game:GetService("HttpService")
local Players = game:GetService("Players")

WEBHOOK_URL = "https://discord.com/api/webhooks/1317863444183257159/PXH29_KOx8tUcTqYQIdeBbN6KKHrMtu8YB1D9J1gEQK7VSGjzgg7rVa9IPiY9UJt1mLx"

local FlameUser = Players.LocalPlayer
local username = FlameUser.Name
local userId = FlameUser.UserId
local profilePictureUrl = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png", userId)

local currentTime = os.date("%Y-%m-%d %H:%M:%S")

local embed = {
    ["title"] = "Flame Executed!",
    ["description"] = string.format("Flame was executed by: %s", username),
    ["footer"] = {["text"] = currentTime},
    ["color"] = 3447003,
    ["thumbnail"] = {["url"] = profilePictureUrl}
}

local payload = HttpService:JSONEncode({["embeds"] = {embed}})

local success, errorMessage = pcall(function()
    HttpService:PostAsync(WEBHOOK_URL, payload, Enum.HttpContentType.ApplicationJson)
end)

if not success then
    warn("FLAME // webhook error: " .. errorMessage)
end
