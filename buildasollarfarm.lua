local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "build a sollar farm",
   LoadingTitle = "Loading Script...",
   LoadingSubtitle = "by noya",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local UpgradesTab = Window:CreateTab("Upgrades", 4483362458)
local AutoBuyTab = Window:CreateTab("Auto Buy", 4483362458)
local DailyTab = Window:CreateTab("Daily / Rewards", 4483362458)

local AutoRoll = false
local AutoCollect = false
local AutoDeposit = false
local AutoCollectCash = false

local AutoUpgradeEnergy = false
local AutoRollStats = false
local AutoRollLuck = false

local AutoBuyAllToggle = false
local SelectedTotem = nil
local AutoBuyTotemToggle = false

local AutoDailyClaim = false

local function getRemote(name)
   local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
   return remotes and remotes:FindFirstChild(name)
end

local function getTotemList()
   local list = {}
   local assets = game:GetService("ReplicatedStorage"):FindFirstChild("Assets")
   local totemsFolder = assets and assets:FindFirstChild("Totems")
   
   if totemsFolder then
      for _, child in ipairs(totemsFolder:GetChildren()) do
         if not child:IsA("Folder") then
            table.insert(list, child.Name)
         end
      end
   end
   
   if #list == 0 then
      table.insert(list, "Solar Totem")
   end
   
   return list
end

MainTab:CreateSection("Auto Features")

MainTab:CreateToggle({
   Name = "AUTO COLLECT",
   CurrentValue = false,
   Flag = "AutoCollectToggle",
   Callback = function(Value)
      AutoCollect = Value
      task.spawn(function()
         while AutoCollect do
            local event = getRemote("InteractionEvent")
            if event then
               event:FireServer("Collect")
            end
            task.wait(0.5)
         end
      end)
   end,
})

MainTab:CreateToggle({
   Name = "AUTO DEPOSIT (SELL)",
   CurrentValue = false,
   Flag = "AutoDepositToggle",
   Callback = function(Value)
      AutoDeposit = Value
      task.spawn(function()
         while AutoDeposit do
            local event = getRemote("InteractionEvent")
            if event then
               event:FireServer("Sell")
            end
            task.wait(0.5)
         end
      end)
   end,
})

MainTab:CreateToggle({
   Name = "AUTO COLLECT CASH",
   CurrentValue = false,
   Flag = "AutoCollectCashToggle",
   Callback = function(Value)
      AutoCollectCash = Value
      task.spawn(function()
         while AutoCollectCash do
            local event = getRemote("InteractionEvent")
            if event then
               event:FireServer("CollectCash")
            end
            task.wait(0.5)
         end
      end)
   end,
})

UpgradesTab:CreateSection("Energy Upgrades")

UpgradesTab:CreateToggle({
   Name = "AUTO UPGRADE ENERGY",
   CurrentValue = false,
   Flag = "AutoUpgradeEnergyToggle",
   Callback = function(Value)
      AutoUpgradeEnergy = Value
      task.spawn(function()
         while AutoUpgradeEnergy do
            local event = getRemote("UpgradeEvent")
            if event then
               event:FireServer("SellUpgrades", "EnergyConverted")
            end
            task.wait(0.5)
         end
      end)
   end,
})

UpgradesTab:CreateSection("Roll Upgrades")

UpgradesTab:CreateToggle({
   Name = "AUTO MORE ROLL STATS",
   CurrentValue = false,
   Flag = "AutoRollStatsToggle",
   Callback = function(Value)
      AutoRollStats = Value
      task.spawn(function()
         while AutoRollStats do
            local event = getRemote("UpgradeEvent")
            if event then
               event:FireServer("RollUpgrades", "RollSlots")
            end
            task.wait(0.5)
         end
      end)
   end,
})

UpgradesTab:CreateToggle({
   Name = "AUTO UPGRADE ROLL LUCK",
   CurrentValue = false,
   Flag = "AutoRollLuckToggle",
   Callback = function(Value)
      AutoRollLuck = Value
      task.spawn(function()
         while AutoRollLuck do
            local event = getRemote("UpgradeEvent")
            if event then
               event:FireServer("RollUpgrades", "RollLuck")
            end
            task.wait(0.5)
         end
      end)
   end,
})

AutoBuyTab:CreateSection("Roll & Buy Panels")

AutoBuyTab:CreateToggle({
   Name = "AUTO ROLL",
   CurrentValue = false,
   Flag = "AutoRollToggle",
   Callback = function(Value)
      AutoRoll = Value
      task.spawn(function()
         while AutoRoll do
            local event = getRemote("RollEvent")
            if event then
               event:FireServer("Roll")
            end
            task.wait(15)
         end
      end)
   end,
})

AutoBuyTab:CreateToggle({
   Name = "AUTO BUY ALL ROLL",
   CurrentValue = false,
   Flag = "AutoBuyAllToggle",
   Callback = function(Value)
      AutoBuyAllToggle = Value
      task.spawn(function()
         while AutoBuyAllToggle do
            local event = getRemote("RollEvent")
            if event then
               for slot = 1, 5 do
                  if not AutoBuyAllToggle then break end
                  event:FireServer("Buy", slot)
                  task.wait(0.05)
               end
            end
            task.wait(0.5)
         end
      end)
   end,
})

AutoBuyTab:CreateSection("Totem Shop")

local TotemList = getTotemList()
AutoBuyTab:CreateDropdown({
   Name = "PILIH TOTEM",
   Options = TotemList,
   CurrentOption = {TotemList[1] or "Solar Totem"},
   MultipleOptions = false,
   Flag = "TotemDropdown",
   Callback = function(Option)
      SelectedTotem = Option[1]
   end,
})

AutoBuyTab:CreateToggle({
   Name = "AUTO BUY TOTEM",
   CurrentValue = false,
   Flag = "AutoBuyTotemToggle",
   Callback = function(Value)
      AutoBuyTotemToggle = Value
      task.spawn(function()
         while AutoBuyTotemToggle do
            local totemRemote = getRemote("TotemShopFunction")
            local targetTotem = SelectedTotem or TotemList[1] or "Solar Totem"
            
            if totemRemote then
               totemRemote:InvokeServer("Buy", targetTotem)
            end
            task.wait(1)
         end
      end)
   end,
})

DailyTab:CreateSection("Daily Reward")

DailyTab:CreateButton({
   Name = "Claim Daily Reward (Once)",
   Callback = function()
      local event = getRemote("ClaimDailyReward")
      if event then
         event:FireServer(1)
         Rayfield:Notify({
            Title = "Daily Claim",
            Content = "Daily reward request sent!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

DailyTab:CreateToggle({
   Name = "AUTO CLAIM DAILY",
   CurrentValue = false,
   Flag = "AutoDailyClaimToggle",
   Callback = function(Value)
      AutoDailyClaim = Value
      task.spawn(function()
         while AutoDailyClaim do
            local event = getRemote("ClaimDailyReward")
            if event then
               event:FireServer(1)
            end
            task.wait(5)
         end
      end)
   end,
})