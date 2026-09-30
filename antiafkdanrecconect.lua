repeat task.wait() until game:IsLoaded()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ANTI AFK",
   LoadingTitle = "ANTI AFK ",
   LoadingSubtitle = "by NOYATZY",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false
})

local MiscTab = Window:CreateTab("MISC", 4483362458)

local AntiAfkEnabled = false
local VirtualUser = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if AntiAfkEnabled then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

MiscTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = false,
   Flag = "AntiAFKFlag",
   Callback = function(Value)
      AntiAfkEnabled = Value
      if Value then
         Rayfield:Notify({
            Title = "Anti AFK Active",
            Content = "Fitur Anti AFK berhasil diaktifkan!",
            Duration = 3,
            Image = 4483362458,
         })
      else
         Rayfield:Notify({
            Title = "Anti AFK Inactive",
            Content = "Fitur Anti AFK dimatikan.",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

local AutoReconnectEnabled = false
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

GuiService.ErrorMessageChanged:Connect(function()
    if AutoReconnectEnabled then
        task.wait(2)
        if #Players:GetPlayers() <= 1 then
            Players.LocalPlayer:Kick("\n[Auto Reconnect] Reconnecting...")
            task.wait(1)
            TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
        else
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
        end
    end
end)

MiscTab:CreateToggle({
   Name = "Auto Reconnect",
   CurrentValue = false,
   Flag = "AutoReconnectFlag",
   Callback = function(Value)
      AutoReconnectEnabled = Value
      if Value then
         Rayfield:Notify({
            Title = "Auto Reconnect Active",
            Content = "Fitur Auto Reconnect berhasil diaktifkan!",
            Duration = 3,
            Image = 4483362458,
         })
      else
         Rayfield:Notify({
            Title = "Auto Reconnect Inactive",
            Content = "Fitur Auto Reconnect dimatikan.",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})