local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "IDLE COIN CLICK",
   LoadingTitle = "loading script.......",
   LoadingSubtitle = "by KINGKNOXXZ",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)

local AutoClick1 = false

local Toggle1 = MainTab:CreateToggle({
   Name = "Auto Click Money",
   CurrentValue = false,
   Flag = "AutoClickToggle1",
   Callback = function(Value)
      AutoClick1 = Value
      if Value then
         task.spawn(function()
            while AutoClick1 do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local clickEvent = events:FindFirstChild("ClickMoney")
                  if clickEvent then
                     clickEvent:FireServer()
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local UpgradeTab = Window:CreateTab("Upgrade", 4483362458)

local ClickerLevel = 2
local AutoUpgradeClicker = false

local ClickerSlider = UpgradeTab:CreateSlider({
   Name = "Uprate Clicker Level",
   Range = {1, 1000},
   Increment = 1,
   Suffix = " Level",
   CurrentValue = 2,
   Flag = "ClickerLevelSlider",
   Callback = function(Value)
      ClickerLevel = Value
   end,
})

local ClickerToggle = UpgradeTab:CreateToggle({
   Name = "Auto Uprate Clicker",
   CurrentValue = false,
   Flag = "AutoClickerToggle",
   Callback = function(Value)
      AutoUpgradeClicker = Value
      if Value then
         task.spawn(function()
            while AutoUpgradeClicker do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     upgradeEvent:FireServer(ClickerLevel, false)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoUpgradeAllClicker = false
local ClickerAllToggle = UpgradeTab:CreateToggle({
   Name = "Auto Uprate Clicker All",
   CurrentValue = false,
   Flag = "AutoUpgradeAllClickerToggle",
   Callback = function(Value)
      AutoUpgradeAllClicker = Value
      if Value then
         task.spawn(function()
            while AutoUpgradeAllClicker do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     for i = 1, 1000 do
                        if not AutoUpgradeAllClicker then break end
                        upgradeEvent:FireServer(i, false)
                        task.wait(0.05)
                     end
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoClickerMax = false
local ClickerMaxToggle = UpgradeTab:CreateToggle({
   Name = "Uprate Clicker Max",
   CurrentValue = false,
   Flag = "AutoClickerMaxToggle",
   Callback = function(Value)
      AutoClickerMax = Value
      if Value then
         task.spawn(function()
            while AutoClickerMax do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     upgradeEvent:FireServer(2, true)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local CorrecyLevel = 1
local AutoUpgradeCorrecy = false

local CorrecySlider = UpgradeTab:CreateSlider({
   Name = "Set Level Correcy",
   Range = {1, 1000},
   Increment = 1,
   Suffix = " Level",
   CurrentValue = 1,
   Flag = "CorrecyLevelSlider",
   Callback = function(Value)
      CorrecyLevel = Value
   end,
})

local CorrecyToggle = UpgradeTab:CreateToggle({
   Name = "Auto Correcy",
   CurrentValue = false,
   Flag = "AutoCorrecyToggle",
   Callback = function(Value)
      AutoUpgradeCorrecy = Value
      if Value then
         task.spawn(function()
            while AutoUpgradeCorrecy do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     upgradeEvent:FireServer(CorrecyLevel, false)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoUpgradeAllCorrecy = false
local CorrecyAllToggle = UpgradeTab:CreateToggle({
   Name = "Auto Correcy All",
   CurrentValue = false,
   Flag = "AutoUpgradeAllCorrecyToggle",
   Callback = function(Value)
      AutoUpgradeAllCorrecy = Value
      if Value then
         task.spawn(function()
            while AutoUpgradeAllCorrecy do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     for i = 1, 1000 do
                        if not AutoUpgradeAllCorrecy then break end
                        upgradeEvent:FireServer(i, false)
                        task.wait(0.05)
                     end
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoCorrecyMax = false
local CorrecyMaxToggle = UpgradeTab:CreateToggle({
   Name = "Uprate Correcy Max",
   CurrentValue = false,
   Flag = "AutoCorrecyMaxToggle",
   Callback = function(Value)
      AutoCorrecyMax = Value
      if Value then
         task.spawn(function()
            while AutoCorrecyMax do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     upgradeEvent:FireServer(1, true)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local GPULevel = 1
local AutoUpgradeGPU = false

local GPUSlider = UpgradeTab:CreateSlider({
   Name = "Uprate GPU Level",
   Range = {1, 1000},
   Increment = 1,
   Suffix = " Level",
   CurrentValue = 1,
   Flag = "GPULevelSlider",
   Callback = function(Value)
      GPULevel = Value
   end,
})

local GPUToggle = UpgradeTab:CreateToggle({
   Name = "Auto Uprate GPU",
   CurrentValue = false,
   Flag = "AutoGPUToggle",
   Callback = function(Value)
      AutoUpgradeGPU = Value
      if Value then
         task.spawn(function()
            while AutoUpgradeGPU do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     upgradeEvent:FireServer(GPULevel, false)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoUpgradeAllGPU = false
local GPUAllToggle = UpgradeTab:CreateToggle({
   Name = "Auto Uprate GPU All",
   CurrentValue = false,
   Flag = "AutoUpgradeAllGPUToggle",
   Callback = function(Value)
      AutoUpgradeAllGPU = Value
      if Value then
         task.spawn(function()
            while AutoUpgradeAllGPU do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     for i = 1, 1000 do
                        if not AutoUpgradeAllGPU then break end
                        upgradeEvent:FireServer(i, false)
                        task.wait(0.05)
                     end
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoGPUMax = false
local GPUMaxToggle = UpgradeTab:CreateToggle({
   Name = "Uprate GPU Max",
   CurrentValue = false,
   Flag = "AutoGPUMaxToggle",
   Callback = function(Value)
      AutoGPUMax = Value
      if Value then
         task.spawn(function()
            while AutoGPUMax do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local upgradeEvent = events:FindFirstChild("Upgrade")
                  if upgradeEvent then
                     upgradeEvent:FireServer(3, true)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local ClaimTab = Window:CreateTab("Auto Claim", 4483362458)

local AutoClaimDaily = false

local ClaimDailyToggle = ClaimTab:CreateToggle({
   Name = "Claim Daily",
   CurrentValue = false,
   Flag = "ClaimDailyToggle",
   Callback = function(Value)
      AutoClaimDaily = Value
      if Value then
         task.spawn(function()
            while AutoClaimDaily do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local claimEvent = events:FindFirstChild("ClaimDailyReward")
                  if claimEvent then
                     claimEvent:FireServer()
                  end
               end
               task.wait(1)
            end
         end)
      end
   end,
})

local AutoClaimAllDaily = false

local ClaimAllDailyToggle = ClaimTab:CreateToggle({
   Name = "Auto Claim All Daily",
   CurrentValue = false,
   Flag = "ClaimAllDailyToggle",
   Callback = function(Value)
      AutoClaimAllDaily = Value
      if Value then
         task.spawn(function()
            while AutoClaimAllDaily do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local claimEvent = events:FindFirstChild("ClaimDailyReward")
                  if claimEvent then
                     claimEvent:FireServer()
                  end
               end
               task.wait(1)
            end
         end)
      end
   end,
})

local PlaytimeNumber = 1
local AutoClaimPlaytime = false

local PlaytimeSlider = ClaimTab:CreateSlider({
   Name = "Claim Playtime Number",
   Range = {1, 1000},
   Increment = 1,
   Suffix = " Index",
   CurrentValue = 1,
   Flag = "PlaytimeNumberSlider",
   Callback = function(Value)
      PlaytimeNumber = Value
   end,
})

local ClaimPlaytimeToggle = ClaimTab:CreateToggle({
   Name = "Claim Playtime",
   CurrentValue = false,
   Flag = "ClaimPlaytimeToggle",
   Callback = function(Value)
      AutoClaimPlaytime = Value
      if Value then
         task.spawn(function()
            while AutoClaimPlaytime do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local claimChart = events:FindFirstChild("ClaimChart")
                  if claimChart then
                     claimChart:FireServer(PlaytimeNumber, 1)
                  end
               end
               task.wait(1)
            end
         end)
      end
   end,
})

local AutoClaimAllPlaytime = false

local ClaimAllPlaytimeToggle = ClaimTab:CreateToggle({
   Name = "Auto Claim All Playtime",
   CurrentValue = false,
   Flag = "ClaimAllPlaytimeToggle",
   Callback = function(Value)
      AutoClaimAllPlaytime = Value
      if Value then
         task.spawn(function()
            while AutoClaimAllPlaytime do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local claimChart = events:FindFirstChild("ClaimChart")
                  if claimChart then
                     for i = 1, 1000 do
                        if not AutoClaimAllPlaytime then break end
                        claimChart:FireServer(i, 1)
                        task.wait(0.05)
                     end
                  end
               end
               task.wait(1)
            end
         end)
      end
   end,
})

local CratesTab = Window:CreateTab("Crates", 4483362458)

local AutoOpenBasicCrates = false

local OpenBasicCratesToggle = CratesTab:CreateToggle({
   Name = "Auto Open Basic Crates",
   CurrentValue = false,
   Flag = "OpenBasicCratesToggle",
   Callback = function(Value)
      AutoOpenBasicCrates = Value
      if Value then
         task.spawn(function()
            while AutoOpenBasicCrates do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local openCrate = events:FindFirstChild("OpenCrate")
                  if openCrate then
                     openCrate:FireServer(1)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})

local AutoOpenGoldCrates = false

local OpenGoldCratesToggle = CratesTab:CreateToggle({
   Name = "Auto Open Gold Crates",
   CurrentValue = false,
   Flag = "OpenGoldCratesToggle",
   Callback = function(Value)
      AutoOpenGoldCrates = Value
      if Value then
         task.spawn(function()
            while AutoOpenGoldCrates do
               local replicatedStorage = game:GetService("ReplicatedStorage")
               local events = replicatedStorage:FindFirstChild("Events")
               if events then
                  local openCrate = events:FindFirstChild("OpenCrate")
                  if openCrate then
                     openCrate:FireServer(2)
                  end
               end
               task.wait(0.1)
            end
         end)
      end
   end,
})