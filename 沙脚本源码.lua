

-- 基础服务定义
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera

-- 加载 UI 库
local UI_Library_URL = "https://raw.githubusercontent.com/114514lzkill/ui/refs/heads/main/ui.lua"
local Library = loadstring(game:HttpGet(UI_Library_URL))()

-- 创建窗口
local Window = Library:CreateWindow({
    ["Folder"] = "MyTestHub",
    ["Title"] = "小西v2脚本",
    ["Author"] = "wind ui",
    ["Icon"] = "rbxassetid://7734068321",
    HideSearchBar = false,
})

-------------------------------------------------------------------------
-- Tab: 公告 (Announcements)
-------------------------------------------------------------------------
local Tab_Notice = Window:Tab({
    ["Locked"] = false,
    ["Title"] = "公告",
    ["Icon"] = "rbxassetid://115466270141583",
})

Tab_Notice:Section({
    TextSize = 17,
    ["Title"] = "作者小西，QQ群3574769415",
    TextXAlignment = "Left",
})

-- Tab: 支持服务器 (小西脚本)
-------------------------------------------------------------------------
local Tab_Ohio = Window:Tab({
    ["Locked"] = false,
    ["Title"] = "支持的服务器",
    ["Icon"] = "rbxassetid://11949291636",
})

Tab_Ohio:Button({
    ["Title"] = "小西被遗弃",
    ["Desc"] = "内侧",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E8%A2%AB%E9%81%97%E5%BC%83.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西通用",
    ["Desc"] = "通用脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/A.%E7%9A%AE%E8%84%9A%E6%9C%AC%E4%B8%BB%E8%84%9A%E6%9C%AC.lua"))()
    end
}) 

Tab_Ohio:Button({
    ["Title"] = "小西终极战场",
    ["Desc"] = "终极脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/Kanl%E6%9C%80%E6%96%B0%E7%BB%88%E6%9E%81%E6%88%98%E5%9C%BA%E6%BA%90%E7%A0%81.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西99夜",
    ["Desc"] = "99夜脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/99%E5%A4%9C.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西自然灾害",
    ["Desc"] = "自然灾害脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西偷走脑红",
    ["Desc"] = "偷走脑脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E5%81%B7%E8%B5%B0%E8%84%91%E7%BA%A2.lua"))()
    end
}) 

Tab_Ohio:Button({
    ["Title"] = "小西忍者传奇",
    ["Desc"] = "忍者传奇脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxibuxi/refs/heads/main/%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西gb",
    ["Desc"] = "内脏与火药脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxibuxi/refs/heads/main/%E5%86%85%E8%84%8F%E4%B8%8E%E9%BB%91%E7%81%AB%E8%8D%AF.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西请捐赠",
    ["Desc"] = "自动发脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxibuxi/refs/heads/main/%E8%AF%B7%E6%8D%90%E8%B5%A0.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西鱼",
    ["Desc"] = "鱼脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxibuxi/refs/heads/main/%E9%B1%BC.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西最强战场",
    ["Desc"] = "只有瞬移比较垃圾脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxibuxi/refs/heads/main/%E6%9C%80%E5%BC%BA%E6%88%98%E5%9C%BA.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "v1小西Ohio",
    ["Desc"] = "点不动的俄亥俄州脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/XA%20%E4%BF%84%E4%BA%A5%E4%BF%84%E5%B7%9E%E6%BA%90%E7%A0%81(1).lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西doors",
    ["Desc"] = "doors脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/doors.lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "v2小西",
    ["Desc"] = "v2俄亥俄州脚本",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/SX%E4%BF%84%E4%BA%A5%E4%BF%84%E5%B7%9EV5%E6%BA%90%E7%A0%81(1).lua"))()
    end
})

Tab_Ohio:Button({
    ["Title"] = "小西墨水游戏",
    ["Desc"] = "墨水脚本卡密小西nb",
    ["Callback"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/moshui.lua"))()
    end
})
