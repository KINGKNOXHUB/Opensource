local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "GROW A GARDEN",
   LoadingTitle = "loading script....",
   LoadingSubtitle = "by  NOYATZY",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

local SeedsTab = Window:CreateTab("Seeds", 4483362458)
local GearsTab = Window:CreateTab("Gears", 4483362458)
local EggsTab = Window:CreateTab("Eggs", 4483362458)
local FallMarketTab = Window:CreateTab("Fall Market", 4483362458)
local SellTab = Window:CreateTab("Sell", 4483362458)

local BuySeedEvent = game:GetService("ReplicatedStorage").GameEvents.BuySeedStock
local BuyGearEvent = game:GetService("ReplicatedStorage").GameEvents.BuyGearStock
local BuyEggEvent = game:GetService("ReplicatedStorage").GameEvents.BuyPetEgg
local BuyFallShopEvent = game:GetService("ReplicatedStorage").GameEvents.BuyEventShopStock
local SubmitPlantsEvent = game:GetService("ReplicatedStorage").GameEvents.Events.FallMarketEvent.SubmitAllPlants
local SellEvent = game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory

local SeedList = {
    "Carrot",
    "Strawberry",
    "Blueberry",
    "Tomato",
    "Corn",
    "Daffodil",
    "Watermelon",
    "Pumpkin",
    "Apple",
    "Coconut",
    "Bamboo",
    "Cactus",
    "Dragon Fruit",
    "Mango",
    "Mushroom",
    "Pepper",
    "Cacao",
    "Sunflower",
    "Ember Lily",
    "Sugar Apple",
    "Burning Bud",
    "Romanesco",
    "Crimson Thorn",
    "Zebrazinkle",
    "Scarlet Aspen",
    "Alien Apple"
}

local GearList = {
    "Watering Can",
    "Basic Sprinkler",
    "Advanced Sprinkler",
    "Godly Sprinkler",
    "Master Sprinkler",
    "Grandmaster Sprinkler",
    "Trowel",
    "Recall Wrench",
    "Medium Toy",
    "Pet Name Reroller",
    "Medium Treat",
    "Pet Lead",
    "Magnifying Glass",
    "Favorite Tool",
    "Cleansing Pet Shard",
    "Friendship Pot",
    "Harvest Tool",
    "Levelup Lollipop",
    "Trading Ticket"
}

local EggList = {
    "Common Egg",
    "Uncommon Egg",
    "Rare Egg",
    "Legendary Egg",
    "Mythical Egg",
    "Bug Egg",
    "Jungle Egg"
}

local FallSeedList = {
    "Turnip",
    "Parsley",
    "Autumn Seed Pack",
    "Meyer Lemon",
    "Carnival Pumpkin",
    "Kniphofia",
    "Golden Peach",
    "Maple Resin"
}

local FallGearList = {
    "Firefly Jar",
    "Sky Lantern",
    "Maple Leaf Kite",
    "Leaf Blower",
    "Maple Syrup",
    "Maple Sprinkler",
    "Bonfire",
    "Harvest Basket",
    "Maple Leaf Charm",
    "Golden Acorn",
    "Rake",
    "Acorn Bell",
    "Acorn Lollipop",
    "Super Leaf Blower"
}

local FallPetList = {
    "Fall Egg",
    "Chipmunk",
    "Red Squirrel",
    "Salmon",
    "Marmot",
    "Sugar Glider",
    "Woodpecker",
    "Space Squirrel",
    "Mallard",
    "Red Panda"
}

local FallCosmeticList = {
    "Fall Crate",
    "Fall Leaf Chair",
    "Maple Flag",
    "Fall Wreath",
    "Fall Hay Bale",
    "Pile Of Leaves",
    "Flying Kite",
    "Autumn Crate",
    "Fall Fountain"
}

local SelectedSeeds = {}
local AutoBuySelectSeedEnabled = false
local AutoBuyAllSeedsEnabled = false

SeedsTab:CreateSection("Auto Buy Seeds")

SeedsTab:CreateDropdown({
   Name = "Select Seeds",
   Options = SeedList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "SeedDropdown",
   Callback = function(Option)
      SelectedSeeds = Option
   end,
})

SeedsTab:CreateToggle({
   Name = "Auto Buy Selected Seeds",
   CurrentValue = false,
   Flag = "AutoBuySelectSeedToggle",
   Callback = function(Value)
      AutoBuySelectSeedEnabled = Value
   end,
})

SeedsTab:CreateToggle({
   Name = "Auto Buy All Seeds",
   CurrentValue = false,
   Flag = "AutoBuyAllSeedsToggle",
   Callback = function(Value)
      AutoBuyAllSeedsEnabled = Value
   end,
})

local SelectedGears = {}
local AutoBuySelectGearEnabled = false
local AutoBuyAllGearsEnabled = false

GearsTab:CreateSection("Auto Buy Gears")

GearsTab:CreateDropdown({
   Name = "Select Gears",
   Options = GearList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "GearDropdown",
   Callback = function(Option)
      SelectedGears = Option
   end,
})

GearsTab:CreateToggle({
   Name = "Auto Buy Selected Gears",
   CurrentValue = false,
   Flag = "AutoBuySelectGearToggle",
   Callback = function(Value)
      AutoBuySelectGearEnabled = Value
   end,
})

GearsTab:CreateToggle({
   Name = "Auto Buy All Gears",
   CurrentValue = false,
   Flag = "AutoBuyAllGearsToggle",
   Callback = function(Value)
      AutoBuyAllGearsEnabled = Value
   end,
})

local SelectedEggs = {}
local AutoBuySelectEggEnabled = false
local AutoBuyAllEggsEnabled = false

EggsTab:CreateSection("Auto Buy Eggs")

EggsTab:CreateDropdown({
   Name = "Select Eggs",
   Options = EggList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "EggDropdown",
   Callback = function(Option)
      SelectedEggs = Option
   end,
})

EggsTab:CreateToggle({
   Name = "Auto Buy Selected Eggs",
   CurrentValue = false,
   Flag = "AutoBuySelectEggToggle",
   Callback = function(Value)
      AutoBuySelectEggEnabled = Value
   end,
})

EggsTab:CreateToggle({
   Name = "Auto Buy All Eggs",
   CurrentValue = false,
   Flag = "AutoBuyAllEggsToggle",
   Callback = function(Value)
      AutoBuyAllEggsEnabled = Value
   end,
})

local SelectedFallSeeds = {}
local AutoBuySelectFallSeedEnabled = false
local AutoBuyAllFallSeedsEnabled = false

local SelectedFallGears = {}
local AutoBuySelectFallGearEnabled = false
local AutoBuyAllFallGearsEnabled = false

local SelectedFallPets = {}
local AutoBuySelectFallPetEnabled = false
local AutoBuyAllFallPetsEnabled = false

local SelectedFallCosmetics = {}
local AutoBuySelectFallCosmeticEnabled = false
local AutoBuyAllFallCosmeticsEnabled = false

local AutoSubmitPlantsEnabled = false

FallMarketTab:CreateSection("Fall Market Event")

FallMarketTab:CreateButton({
   Name = "Submit All Plants",
   Callback = function()
      pcall(function()
         SubmitPlantsEvent:FireServer()
      end)
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Submit All Plants",
   CurrentValue = false,
   Flag = "AutoSubmitPlantsToggle",
   Callback = function(Value)
      AutoSubmitPlantsEnabled = Value
   end,
})

FallMarketTab:CreateSection("Auto Buy Fall Seeds")

FallMarketTab:CreateDropdown({
   Name = "Select Fall Seeds",
   Options = FallSeedList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "FallSeedDropdown",
   Callback = function(Option)
      SelectedFallSeeds = Option
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy Selected Fall Seeds",
   CurrentValue = false,
   Flag = "AutoBuySelectFallSeedToggle",
   Callback = function(Value)
      AutoBuySelectFallSeedEnabled = Value
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy All Fall Seeds",
   CurrentValue = false,
   Flag = "AutoBuyAllFallSeedsToggle",
   Callback = function(Value)
      AutoBuyAllFallSeedsEnabled = Value
   end,
})

FallMarketTab:CreateSection("Auto Buy Fall Gears")

FallMarketTab:CreateDropdown({
   Name = "Select Fall Gears",
   Options = FallGearList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "FallGearDropdown",
   Callback = function(Option)
      SelectedFallGears = Option
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy Selected Fall Gears",
   CurrentValue = false,
   Flag = "AutoBuySelectFallGearToggle",
   Callback = function(Value)
      AutoBuySelectFallGearEnabled = Value
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy All Fall Gears",
   CurrentValue = false,
   Flag = "AutoBuyAllFallGearsToggle",
   Callback = function(Value)
      AutoBuyAllFallGearsEnabled = Value
   end,
})

FallMarketTab:CreateSection("Auto Buy Fall Pets")

FallMarketTab:CreateDropdown({
   Name = "Select Fall Pets",
   Options = FallPetList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "FallPetDropdown",
   Callback = function(Option)
      SelectedFallPets = Option
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy Selected Fall Pets",
   CurrentValue = false,
   Flag = "AutoBuySelectFallPetToggle",
   Callback = function(Value)
      AutoBuySelectFallPetEnabled = Value
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy All Fall Pets",
   CurrentValue = false,
   Flag = "AutoBuyAllFallPetsToggle",
   Callback = function(Value)
      AutoBuyAllFallPetsEnabled = Value
   end,
})

FallMarketTab:CreateSection("Auto Buy Fall Cosmetics")

FallMarketTab:CreateDropdown({
   Name = "Select Fall Cosmetics",
   Options = FallCosmeticList,
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "FallCosmeticDropdown",
   Callback = function(Option)
      SelectedFallCosmetics = Option
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy Selected Fall Cosmetics",
   CurrentValue = false,
   Flag = "AutoBuySelectFallCosmeticToggle",
   Callback = function(Value)
      AutoBuySelectFallCosmeticEnabled = Value
   end,
})

FallMarketTab:CreateToggle({
   Name = "Auto Buy All Fall Cosmetics",
   CurrentValue = false,
   Flag = "AutoBuyAllFallCosmeticsToggle",
   Callback = function(Value)
      AutoBuyAllFallCosmeticsEnabled = Value
   end,
})

local AutoSellEnabled = false

SellTab:CreateSection("Auto Sell")

SellTab:CreateButton({
   Name = "Sell All Inventory",
   Callback = function()
      pcall(function()
         SellEvent:FireServer()
      end)
   end,
})

SellTab:CreateToggle({
   Name = "Auto Sell All",
   CurrentValue = false,
   Flag = "AutoSellToggle",
   Callback = function(Value)
      AutoSellEnabled = Value
   end,
})

task.spawn(function()
    while true do
        task.wait(0.5)
        
        if AutoBuySelectSeedEnabled then
            for _, seedName in pairs(SelectedSeeds) do
                pcall(function()
                    BuySeedEvent:FireServer("Shop", seedName)
                end)
            end
        end
        
        if AutoBuyAllSeedsEnabled then
            for _, seedName in pairs(SeedList) do
                pcall(function()
                    BuySeedEvent:FireServer("Shop", seedName)
                end)
            end
        end
        
        if AutoBuySelectGearEnabled then
            for _, gearName in pairs(SelectedGears) do
                pcall(function()
                    BuyGearEvent:FireServer(gearName)
                end)
            end
        end
        
        if AutoBuyAllGearsEnabled then
            for _, gearName in pairs(GearList) do
                pcall(function()
                    BuyGearEvent:FireServer(gearName)
                end)
            end
        end

        if AutoBuySelectEggEnabled then
            for _, eggName in pairs(SelectedEggs) do
                pcall(function()
                    BuyEggEvent:FireServer(eggName)
                end)
            end
        end
        
        if AutoBuyAllEggsEnabled then
            for _, eggName in pairs(EggList) do
                pcall(function()
                    BuyEggEvent:FireServer(eggName)
                end)
            end
        end

        if AutoSubmitPlantsEnabled then
            pcall(function()
                SubmitPlantsEvent:FireServer()
            end)
        end

        if AutoBuySelectFallSeedEnabled then
            for _, seedName in pairs(SelectedFallSeeds) do
                pcall(function()
                    BuyFallShopEvent:FireServer(seedName, "Fall Market Seed Shop")
                end)
            end
        end

        if AutoBuyAllFallSeedsEnabled then
            for _, seedName in pairs(FallSeedList) do
                pcall(function()
                    BuyFallShopEvent:FireServer(seedName, "Fall Market Seed Shop")
                end)
            end
        end

        if AutoBuySelectFallGearEnabled then
            for _, gearName in pairs(SelectedFallGears) do
                pcall(function()
                    BuyFallShopEvent:FireServer(gearName, "Fall Market Gear Shop")
                end)
            end
        end

        if AutoBuyAllFallGearsEnabled then
            for _, gearName in pairs(FallGearList) do
                pcall(function()
                    BuyFallShopEvent:FireServer(gearName, "Fall Market Gear Shop")
                end)
            end
        end

        if AutoBuySelectFallPetEnabled then
            for _, petName in pairs(SelectedFallPets) do
                pcall(function()
                    BuyFallShopEvent:FireServer(petName, "Fall Market Pet Shop")
                end)
            end
        end

        if AutoBuyAllFallPetsEnabled then
            for _, petName in pairs(FallPetList) do
                pcall(function()
                    BuyFallShopEvent:FireServer(petName, "Fall Market Pet Shop")
                end)
            end
        end

        if AutoBuySelectFallCosmeticEnabled then
            for _, cosmeticName in pairs(SelectedFallCosmetics) do
                pcall(function()
                    BuyFallShopEvent:FireServer(cosmeticName, "Fall Market Cosmetic Shop")
                end)
            end
        end

        if AutoBuyAllFallCosmeticsEnabled then
            for _, cosmeticName in pairs(FallCosmeticList) do
                pcall(function()
                    BuyFallShopEvent:FireServer(cosmeticName, "Fall Market Cosmetic Shop")
                end)
            end
        end
        
        if AutoSellEnabled then
            pcall(function()
                SellEvent:FireServer()
            end)
        end
    end
end)