local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Quality x Hub | Blox fruit",
    Icon = "rbxassetid://138614699274576",
    Author = "Made by Quality.Team",
    Folder = "Mybabeee",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Name = LocalPlayer.Name,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId,
        Callback = function() end,
    },
})

Window:EditOpenButton({ Enabled = false })

local ScreenGui = Instance.new("ScreenGui")
local ToggleBtn = Instance.new("ImageButton")

ScreenGui.Name = "WindUI_Toggle"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBtn.BackgroundTransparency = 0.2
ToggleBtn.Image = "rbxassetid://138614699274576"
ToggleBtn.ScaleType = Enum.ScaleType.Fit
ToggleBtn.ZIndex = 999
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local opened = true

local function toggle()
    opened = not opened
    if Window.UI then
        Window.UI.Enabled = opened
    else
        Window:Toggle()
    end
end

ToggleBtn.MouseButton1Click:Connect(function()
    ToggleBtn:TweenSize(
        UDim2.new(0, 56, 0, 56),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.12,
        true,
        function()
            ToggleBtn:TweenSize(
                UDim2.new(0, 50, 0, 50),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.12,
                true
            )
        end
    )
    toggle()
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.T then
        toggle()
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
end)

if not LocalPlayer.Character then
    LocalPlayer.CharacterAdded:Wait()
end

local Player = LocalPlayer
local Enemies = workspace:WaitForChild("Enemies")
local WorldOrigin = workspace:WaitForChild("_WorldOrigin")
local Locations = WorldOrigin:WaitForChild("Locations")

local Game_Setting   = Window:Tab({Title = "Game Setting", Icon = "config"})
local Main_Farm      = Window:Tab({Title = "Main Farm", Icon = "farm"})
local Subs_Farm      = Window:Tab({Title = "Subs Farm", Icon = "layers"})
local Main_Quest     = Window:Tab({Title = "Main Quest", Icon = "book"})
local Subs_Quest     = Window:Tab({Title = "Subs Quest", Icon = "book-open"})
local Sea_Event      = Window:Tab({Title = "Sea Event", Icon = "waves"})
local Main_Island    = Window:Tab({Title = "Island", Icon = "map"})
local Main_Race      = Window:Tab({Title = "Race", Icon = "zap"})
local Main_Raid      = Window:Tab({Title = "Raid", Icon = "swords"})
local Main_Bounty    = Window:Tab({Title = "Bounty", Icon = "target"})
local Main_Teleport  = Window:Tab({Title = "Location", Icon = "map-pin"})
local Main_Stat      = Window:Tab({Title = "Stats", Icon = "bar-chart"})
local Main_Shop      = Window:Tab({Title = "Shop", Icon = "shopping-cart"})
local Misc           = Window:Tab({Title = "Misc", Icon = "menu"})
local SaveManagerTab = Window:Tab({Title = "Save and UI", Icon = "save"})
