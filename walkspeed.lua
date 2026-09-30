repeat task.wait() until game:IsLoaded()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "WALKSPEED",
   LoadingTitle = "WALKSPEED",
   LoadingSubtitle = "by NOYATZY",
   ConfigurationSaving = {
      Enabled = false,
   },
   Discord = {
      Enabled = false,
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Walkspeed", 4483362458)

local TargetSpeed = 16
local Players = game:GetService("Players")

MainTab:CreateInput({
   Name = "Input Speed",
   PlaceholderText = "Masukkan speed contoh (50)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      TargetSpeed = tonumber(Text) or 16
   end,
})

MainTab:CreateButton({
   Name = "TERAPKAN SPEED",
   Callback = function()
      local char = Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         char.Humanoid.WalkSpeed = TargetSpeed
      end
   end,
})

MainTab:CreateButton({
   Name = "Reset Speed",
   Callback = function()
      TargetSpeed = 16
      local char = Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") then
         char.Humanoid.WalkSpeed = 16
      end
   end,
})