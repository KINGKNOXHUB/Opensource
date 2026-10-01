local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "[UPD 5] ANIME DICE",
   LoadingTitle = "Loading script...",
   LoadingSubtitle = "by NOYATZY",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")

local equipBestRemote      = Network:WaitForChild("PlotService"):WaitForChild("RE"):WaitForChild("EquipBest")
local equipBestTowerRemote = Network:WaitForChild("Towers"):WaitForChild("RE"):WaitForChild("EquipBestTowerTeam")
local rebirthRemote        = Network:WaitForChild("RebirthService"):WaitForChild("RE"):WaitForChild("Rebirth")
local collectRemote        = Network:WaitForChild("PlotService"):WaitForChild("RE"):WaitForChild("CollectBalance")
local claimDailyRemote     = Network:WaitForChild("DailyRewardService"):WaitForChild("RE"):WaitForChild("Claim")

local EquipTab = Window:CreateTab("Equip Best", 4483362458)

local autoEquip = false
EquipTab:CreateToggle({
   Name = "Auto Equip Best anime",
   CurrentValue = false,
   Flag = "AutoEquipBestFlag",
   Callback = function(Value)
      autoEquip = Value
      task.spawn(function()
         while autoEquip do
            equipBestRemote:FireServer()
            task.wait(1)
         end
      end)
   end,
})

local autoEquipTower = false
EquipTab:CreateToggle({
   Name = "Auto Equip Best Tower Team",
   CurrentValue = false,
   Flag = "AutoEquipTowerFlag",
   Callback = function(Value)
      autoEquipTower = Value
      task.spawn(function()
         while autoEquipTower do
            equipBestTowerRemote:FireServer()
            task.wait(1)
         end
      end)
   end,
})

local RebirthTab = Window:CreateTab("REBIRTH", 4483362458)

RebirthTab:CreateButton({
   Name = "Do Rebirth",
   Callback = function()
      rebirthRemote:FireServer()
   end,
})

local autoRebirth = false
RebirthTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "AutoRebirthFlag",
   Callback = function(Value)
      autoRebirth = Value
      task.spawn(function()
         while autoRebirth do
            rebirthRemote:FireServer()
            task.wait(1)
         end
      end)
   end,
})

local CollectTab = Window:CreateTab("Auto Collect", 4483362458)

local function collectAllPlots()
   for i = 1, 20 do
      collectRemote:FireServer(i)
      task.wait(0.05)
   end
end

CollectTab:CreateButton({
   Name = "Collect All Balance",
   Callback = function()
      collectAllPlots()
   end,
})

local autoCollect = false
CollectTab:CreateToggle({
   Name = "Auto Collect Balance",
   CurrentValue = false,
   Flag = "AutoCollectFlag",
   Callback = function(Value)
      autoCollect = Value
      task.spawn(function()
         while autoCollect do
            collectAllPlots()
            task.wait(1)
         end
      end)
   end,
})

CollectTab:CreateButton({
   Name = "Claim Daily Reward",
   Callback = function()
      claimDailyRemote:FireServer()
   end,
})

local autoDaily = false
CollectTab:CreateToggle({
   Name = "Auto Claim Daily Reward",
   CurrentValue = false,
   Flag = "AutoDailyFlag",
   Callback = function(Value)
      autoDaily = Value
      task.spawn(function()
         while autoDaily do
            claimDailyRemote:FireServer()
            task.wait(5)
         end
      end)
   end,
})