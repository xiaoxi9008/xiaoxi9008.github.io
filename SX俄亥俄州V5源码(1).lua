--by 神青
if not game:IsLoaded() then
game.Loaded:Wait()
end
if writefile then
writefile = nil
end
--------------------------
game.TextChatService.ChatWindowConfiguration.Enabled = true
---------------------------
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/gycgchgyfytdttr/shenqin/refs/heads/main/ui.lua"))()
local Confirmed = false
WindUI:Popup({
Title = 'SX OHIO 1.0.9',
IconThemed = true,
Icon = "crown",
Content = "欢迎尊重的用户使用SX HUB\n你的支持是我们更新的动力\nQQ主群",
Buttons = {
{
Title = "取消",
Callback = function() end,
Variant = "Secondary",
},
{
Title = "执行",
Icon = "arrow-right",
Callback = function()
Confirmed = true
createUI()
end,
Variant = "Primary",
}
}
})
function createUI()
local Window = WindUI:CreateWindow({
Title = 'SX HUB',
Icon = "crown",
IconThemed = true,
Author = "v1.0.9 by 神青",
Folder = "CloudHub",
Size = UDim2.fromOffset(580, 440),
Transparent = true,
Theme = "Dark",
HideSearchBar = false,
ScrollBarEnabled = true,
Resizable = true,
Background = "",
BackgroundImageTransparency = 0.5,
User = {
Enabled = true,
Callback = function()
WindUI:Notify({
Title = "点击了自己",
Content = "没什么",
Duration = 1,
Icon = "4483362748"
})
end,
Anonymous = false
},
SideBarWidth = 250,
Search = {
Enabled = true,
Placeholder = "搜索...",
Callback = function(searchText)
print("搜索内容:", searchText)
end
},
SidePanel = {
Enabled = true,
Content = {
{
Type = "Button",
Text = "",
Style = "Subtle",
Size = UDim2.new(1, -20, 0, 30),
Callback = function()
end
}
}
}
})
Window:EditOpenButton({
Title = "SX HUB",
Icon = "crown",
CornerRadius = UDim.new(0,16),
StrokeThickness = 4,
Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
Draggable = true,
})
Window:Tag({
Title = "俄亥俄州",
Color = Color3.fromHex("#FFA500")
})
Window:Tag({
Title = "1.0.9",
Color = Color3.fromHex("#FFA500")
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local devv = require(ReplicatedStorage.devv)
local Signal = devv.load("Signal")
local v3item = devv.load("v3item")
local GUID = require(ReplicatedStorage.devv.shared.Helpers.string.GUID)
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")
local settings = {
color = Color3.fromRGB(252, 3, 90),
antifog = true,
fpsCap = 900
}
if setfpscap then
setfpscap(settings.fpsCap)
end
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "parke",
        Text = message,
        Duration = 5,
        Icon = "rbxassetid://89260669622248" 
    })
end

local A2 = {}

A2.A3 = {
    
    [79546208627805] = {
        name = "99夜大厅",
        version = "1.2",
        script = function()
        --源码
        end
    },
    
    [126509999114328] = {
        name = "99夜",
        version = "1.1",
        script = function()
        --源码
        end
    },
    
    [3101667897] = { 
        name = "极速传奇",
        version = "1.1",
        script = function()
        --源码
        end
    },
    
    [106487781999308] = { 
        name = "凌晨3点后大厅",
        version = "1.1",
        script = function()
        --源码
        end
    },
    
    [138103330716004] = { 
        name = "凌晨3点后",
        version = "1.1",
        script = function()
        --源码
        end
    }
}