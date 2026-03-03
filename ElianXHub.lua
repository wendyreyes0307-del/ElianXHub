-- Elian X Hub - Blox Fruits Edition (Estilo exacto Redz Hub UI y funciones)
-- Hecho por Bredix - Santo Domingo 2026 🇩🇴

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
    Title = "🅴🅻🅸🅰🅽 𝕏 🅷🆄🅱 | Blox Fruits",
    SubTitle = "by Bredix - v2.0 2026",
    SaveFolder = "ElianXHub_BF"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 10) }  -- Redondo como en Redz
})

-- Tab Principal (como en Redz: cherry icon)
local MainTab = Window:MakeTab({"Principal", "cherry"})

MainTab:AddDiscordInvite({
    Name = "Elian X Discord",
    Description = "Únete al server oficial 🇩🇴",
    Logo = "rbxassetid://18751483361",
    Invite = "discord.gg/elianx"  -- Cambia por tu invite real
})

local FarmSection = MainTab:AddSection({"Auto Farm Principal"})

local AutoFarmToggle = MainTab:AddToggle({
    Name = "Auto Farm Level",
    Description = "Farmea niveles auto <font color='rgb(88, 101, 242)'>rápido</font>",
    Default = false
})
AutoFarmToggle:Callback(function(Value)
    _G.AutoFarmLevel = Value
    spawn(function()
        while _G.AutoFarmLevel do
            for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                end
            end
            wait(0.1)
        end
    end)
end)

MainTab:AddToggle({
    Name = "Auto Farm Boss",
    Description = "Farmea bosses auto",
    Default = false,
    Callback = function(Value)
        _G.AutoBoss = Value
        spawn(function()
            while _G.AutoBoss do
                for _, boss in pairs(workspace.Enemies:GetChildren()) do
                    if boss.Name:find("Boss") and boss.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                end
                wait(0.2)
            end
        end)
    end
})

MainTab:AddToggle({
    Name = "Auto Collect Chests",
    Description = "Recolecta cofres auto",
    Default = false,
    Callback = function(Value)
        _G.AutoChest = Value
        spawn(function()
            while _G.AutoChest do
                for _, chest in pairs(workspace:GetChildren()) do
                    if chest.Name:find("Chest") then
                        fireclickdetector(chest:FindFirstChildOfClass("ClickDetector"))
                    end
                end
                wait(1)
            end
        end)
    end
})

-- Tab Farming (icon swords, como en Redz para combat/farm)
local FarmTab = Window:MakeTab({"Farming", "swords"})

FarmTab:AddToggle({
    Name = "Auto Farm Bone",
    Description = "Farmea bones en Haunted Castle",
    Default = false,
    Callback = function(Value)
        -- Lógica similar a Redz: TP a bones y farm
    end
})

FarmTab:AddToggle({
    Name = "Sea Events",
    Description = "Auto activa sea events",
    Default = false,
    Callback = function(Value)
        -- Placeholder para sea events como en Redz
    end
})

FarmTab:AddToggle({
    Name = "Auto Fishing",
    Description = "Pesca auto",
    Default = false,
    Callback = function(Value)
        -- Lógica fishing
    end
})

FarmTab:AddButton({
    Name = "Fruit Sniper / Rain Fruits",
    Callback = function()
        -- Lógica para snipar fruits como en Redz (busca y TP)
        for _, fruit in pairs(workspace:GetChildren()) do
            if fruit:IsA("Tool") and fruit.Name:find("Fruit") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
            end
        end
    end
})

-- Tab ESP y Aimbot (icon user-check)
local ESPTab = Window:MakeTab({"ESP & Aimbot", "user-check"})

ESPTab:AddToggle({
    Name = "Player ESP",
    Description = "Ve jugadores a través de walls",
    Default = false,
    Callback = function(Value)
        -- Lógica ESP simple (agrega highlight o billboard)
    end
})

ESPTab:AddToggle({
    Name = "Aimbot",
    Description = "Aimbot para combate",
    Default = false,
    Callback = function(Value)
        -- Lógica aimbot
    end
})

-- Tab Teleports (icon globe)
local TeleTab = Window:MakeTab({"Teleports", "globe"})

TeleTab:AddButton({
    Name = "TP to Dealer",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3855, 30, 105)
    end
})

TeleTab:AddButton({
    Name = "TP to Second Sea Cafe",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-380, 73, -297)
    end
})

-- Tab Config (icon settings)
local ConfigTab = Window:MakeTab({"Config", "settings"})

ConfigTab:AddToggle({
    Name = "Auto Stats",
    Description = "Distribuye stats auto",
    Default = false
})

ConfigTab:AddButton({
    Name = "Unload Hub",
    Callback = function()
        redzlib:Destroy()
    end
})

Window:SelectTab(MainTab)
