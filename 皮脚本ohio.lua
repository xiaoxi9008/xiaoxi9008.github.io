---关注b站KennylolezUID:1531514159
---一群1035184654
---二群2168053189（聊天群）
---十九群1064447273（五百人群）
---二十一群178021813（五百人群）
---二十二群336225224（五百人群）
---二十三群218012845（五百人群）没满
---二十四群1035646571（五百人群）没满
---二十五群1071017763（五百人群）没满
---二十六群820782679（五百人群）没满
---二十七群1067211151（五百人群）
---Kenny脚本群1019547871（五百人群）

-- -----------------------------------------------------------------------------
-- 初始化通知与防挂机逻辑
-- -----------------------------------------------------------------------------

-- 发送初始通知：检测虚拟机
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "皮脚本检测",
    Text = "检测到您正在使用皮脚本",
    Icon = "rbxassetid://18941716391",
    Duration = 1,
    Callback = bindable,
    Button1 = "皮脚本功能多多",
    Button2 = "感谢您的使用"
})
wait(1.5)

-- 发送通知：适配器检测
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "皮脚本",
    Text = "自动检测到此服务器为ohio服务器",
    Icon = "rbxassetid://18941716391",
    Duration = 1,
    Callback = bindable,
    Button1 = "此皮脚本为永久免费形式",
    Button2 = "请勿倒卖"
})
wait(1.5)

-- 发送通知：开启功能
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "皮脚本",
    Text = "自动为您打开ohio服务器功能",
    Icon = "rbxassetid://18941716391",
    Duration = 2,
    Callback = bindable,
    Button1 = "祝您使用愉快",
    Button2 = "玩得开心"
})
wait(1.5)

-- 防挂机脚本 (Anti-AFK)
local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- 发送通知：反挂机开启成功
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "皮脚本",
    Text = "已自动开启反挂机",
    Icon = "rbxassetid://18941716391",
    Duration = 2,
    Callback = bindable,
    Button1 = "开启成功",
    Button2 = "谢谢使用"
})

-- -----------------------------------------------------------------------------
-- 加载 UI 库 (Revenant Library)
-- -----------------------------------------------------------------------------
local LibRevenant = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
LibRevenant.DefaultColor = Color3.fromRGB(255, 0, 0)

-- UI库加载提示
LibRevenant:Notification({
    Text = "皮脚本作者: 小皮ꀀ",
    Duration = 6
})
wait(1)
LibRevenant:Notification({
    Text = "皮脚本帮助者: 纠缠ꀀ",
    Duration = 6
})
wait(1)
LibRevenant:Notification({
    Text = "谢谢大家一直以来的支持^Ï‰^",
    Duration = 6
})

-- -----------------------------------------------------------------------------
-- 自瞄 (Aimbot) 与 FOV 配置
-- -----------------------------------------------------------------------------
local AimbotSettings = {
    fovsize = 50,
    fovlookAt = false,
    fovcolor = Color3.fromRGB(255, 255, 255),
    fovthickness = 2,
    Visible = false,
    distance = 200,
    ViewportSize = 2,
    Transparency = 5,
    Position = "Head",
    teamCheck = false,
    wallCheck = false,
    aliveCheck = false,
    prejudgingselfsighting = false,
    prejudgingselfsightingdistance = 100,
    smoothness = 5,
    aimSpeed = 5,
    targetLock = false,
    hitMarker = false,
    dynamicFOV = false,
    dynamicFOVScale = 1.5,
    priorityMode = "Smart",
    aimMode = "AI",
    autoFire = false,
    fireRate = 10,
    bulletDelay = 0.1,
    weaponSwitch = false,
    threatPriority = false,
    healthPriority = false
}

-- 颜色配置表
local ColorsConfig = {
    ["红色"] = Color3.fromRGB(255, 0, 0),
    ["蓝色"] = Color3.fromRGB(0, 0, 255),
    ["黄色"] = Color3.fromRGB(255, 255, 0),
    ["绿色"] = Color3.fromRGB(0, 255, 0),
    ["青色"] = Color3.fromRGB(0, 255, 255),
    ["橙色"] = Color3.fromRGB(255, 165, 0),
    ["紫色"] = Color3.fromRGB(128, 0, 128),
    ["白色"] = Color3.fromRGB(255, 255, 255),
    ["黑色"] = Color3.fromRGB(0, 0, 0)
}

-- 通用通知函数
function Notify(title, text, icon, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = icon,
        Duration = duration
    })
end

-- -----------------------------------------------------------------------------
-- 绘图 (Drawing API) - 用于绘制 FOV 圆圈
-- -----------------------------------------------------------------------------
local FOVCircle = nil
local FOVLine = nil -- 未使用
local FOVCrosshair = nil -- 未使用

-- 更新 FOV 圆圈的函数
local function UpdateFOV(radius, color, thickness, transparency)
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = game.Workspace.CurrentCamera

    -- 清理旧的圆圈
    if FOVCircle then
        FOVCircle:Remove()
        FOVCircle = nil
    end

    -- 创建新的圆圈
    FOVCircle = Drawing.new("Circle")
    FOVCircle.Visible = true
    FOVCircle.Thickness = thickness
    FOVCircle.Color = color
    FOVCircle.Filled = false
    FOVCircle.Radius = radius
    FOVCircle.Position = Camera.ViewportSize / 2
    FOVCircle.Transparency = transparency

    -- 辅助线 (目前逻辑中未完全启用)
    local Line = Drawing.new("Line")
    Line.Visible = false
    Line.Thickness = 2
    Line.Color = Color3.fromRGB(255, 0, 0)
    Line.Transparency = 1

    -- 十字准星 (目前逻辑中未完全启用)
    local Crosshair = Drawing.new("Line")
    Crosshair.Visible = true
    Crosshair.Thickness = 1
    Crosshair.Color = Color3.fromRGB(255, 255, 255)
    Crosshair.Transparency = 1

    -- 渲染循环：更新位置和大小
    local function UpdateRender()
        local ViewportSize = Camera.ViewportSize
        FOVCircle.Position = ViewportSize / 2
        
        -- 动态FOV逻辑
        if AimbotSettings.dynamicFOV then
            local scale = AimbotSettings.dynamicFOVScale
            FOVCircle.Radius = AimbotSettings.fovsize * scale
        else
            FOVCircle.Radius = AimbotSettings.fovsize
        end
        
        -- 这里看起来是想画十字准星，但逻辑被重写了
        Crosshair.From = Vector2.new(ViewportSize.X / 2 - 5, ViewportSize.Y / 2)
        Crosshair.To = Vector2.new(ViewportSize.X / 2 + 5, ViewportSize.Y / 2)
        -- 注意：下面的代码覆盖了上面的 From/To，导致只画竖线或逻辑冲突，保留原样
        Crosshair.From = Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2 - 5)
        Crosshair.To = Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2 + 5)
    end

    -- 按 Delete 键清除 FOV
    local function InputHandler(input)
        if input.KeyCode == Enum.KeyCode.Delete then
            RunService:UnbindFromRenderStep("FOVUpdate")
            if FOVCircle then FOVCircle:Remove(); FOVCircle = nil end
            if Line then Line:Remove(); Line = nil end
            if Crosshair then Crosshair:Remove(); Crosshair = nil end
        end
    end

    UserInputService.InputBegan:Connect(InputHandler)
    RunService.RenderStepped:Connect(function()
        UpdateRender()
    end)
end

-- 清除 FOV 函数
local function ClearFOV()
    if FOVCircle then FOVCircle:Remove(); FOVCircle = nil end
    -- 这里原代码的变量引用可能有问题，但按原样保留逻辑结构
end

-- 刷新 FOV 属性函数
local function RefreshFOVProperties()
    if FOVCircle then
        FOVCircle.Thickness = AimbotSettings.fovthickness
        FOVCircle.Radius = AimbotSettings.fovsize
        FOVCircle.Color = AimbotSettings.fovcolor
        FOVCircle.Transparency = AimbotSettings.Transparency / 10
    end
end

-- 动态 FOV 计算逻辑 (基于距离和速度)
local function CalculateDynamicFOV()
    -- 注意：getClosestPlayerBySmartSelection 函数在当前脚本片段中未定义，可能是外部环境
    local target = AimbotSettings.dynamicFOV and getClosestPlayerBySmartSelection(AimbotSettings.Position)
    if target and target.Character:FindFirstChild(AimbotSettings.Position) then
        local dist = (target.Character[AimbotSettings.Position].Position - game.Workspace.CurrentCamera.CFrame.Position).Magnitude
        local velocity = target.Character[AimbotSettings.Position].AssemblyLinearVelocity.Magnitude
        AimbotSettings.fovsize = math.clamp(20 / (dist / 50) * (1 + velocity / 100), 10, 100)
        RefreshFOVProperties()
    end
end

-- 自瞄主循环
game:GetService("RunService").RenderStepped:Connect(function()
    if AimbotSettings.fovlookAt then
        if AimbotSettings.aimMode ~= "AI" then
            if AimbotSettings.aimMode == "Function" then
                -- aimAtClosestPlayerFunction 未定义，保留调用
                aimAtClosestPlayerFunction()
            end
        else
            -- aimAtClosestPlayerAI 未定义，保留调用
            aimAtClosestPlayerAI()
        end
        CalculateDynamicFOV()
    end
end)

-- -----------------------------------------------------------------------------
-- 钩子与检测绕过 (Metatable Hooking)
-- -----------------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local GameWorkspace = workspace.Game
local ItemSpawns = workspace.ItemSpawns.items:GetChildren()
local RemoteStorage = ReplicatedStorage.devv.remoteStorage

-- 用于绕过检测或静默瞄准的变量
local HookedRemote1 = nil
local HookedRemote2 = nil
local OldNameCall = nil

OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    -- 检测是否调用的是 devv.remoteStorage 下的远程事件
    if self.Parent == RemoteStorage then
        if self.Name ~= "meleeHit" then
            if #args ~= 0 then
                -- 简单的物品/玩家交互检测逻辑
                if args[2] == "Items" or not table.find(ItemSpawns, args[1]) then
                    if table.find({"prop", "player"}, args[1]) then
                        HookedRemote2 = self
                    elseif typeof(args[1]) == "Instance" and args[1].ClassName == "Player" then
                        -- 特定 UserId 保护 (可能是作者ID)
                        if args[1].UserId == 5537193070 then
                            HookedRemote1 = RemoteStorage.meleeHit
                            return
                        end
                        HookedRemote1 = self
                    end
                else
                    -- 物品交互
                end
            end
        else
            -- 自身保护逻辑
            if LocalPlayer.UserId == 5537193070 then
                return
            end
            -- 发送消息逻辑 (可能用于调试或水印)
            -- if not sentMessage then ... end
        end
    end
    return OldNameCall(self, ...)
end)

-- 获取所有玩家列表
local PlayerList = {}
for _, player in pairs(Players:GetPlayers()) do
    table.insert(PlayerList, player.Name)
end

-- -----------------------------------------------------------------------------
-- 主 UI 构建 (XiaoPi Library)
-- -----------------------------------------------------------------------------
local UI_Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/%E7%9A%AE%E8%84%9A%E6%9C%ACUI%E6%BA%90%E7%A0%81.lua"))()
local UI_Window = UI_Lib:new("皮脚本")

-- ==================== 信息 Tab ====================
local Tab_Info = UI_Window:Tab("《信息》", "18930406865")
local Section_Info = Tab_Info:section("玩家信息", true)

Section_Info:Label("注意:可能是循环传送到所有人旁边有点问题 导致添加皮脚本后会自动传送 再开关一变即可")
Section_Info:Label("【循环传送到所有人旁边在主要功能那一栏】")
Section_Info:Label("您的注入器:" .. identifyexecutor())
Section_Info:Label("您的客户端ID:" .. game:GetService("RbxAnalyticsService"):GetClientId())

local Section_Author = Tab_Info:section("作者信息", true)
Section_Author:Label("皮脚本")
Section_Author:Label("永不跑路的脚本")
Section_Author:Label("作者: 小皮")
Section_Author:Label("作者QQ: 2131869117")
Section_Author:Label("皮脚本QQ主群: 894995244")
Section_Author:Label("皮脚本QQ前群: 1002100032")
Section_Author:Label("皮脚本QQ二群: 746849372")
Section_Author:Label("皮脚本QQ三群: 571553667")
Section_Author:Label("皮脚本QQ四群: 609250910")
Section_Author:Label("解卡群: 252251548")
Section_Author:Label("解卡群二群: 954149920")
Section_Author:Label("十分感谢纠缠对我的支持与帮助")
Section_Author:Label("给我提供了许多的功能源码")
Section_Author:Label("谢谢您的支持与帮助^Ï‰^")

-- 复制QQ号按钮
Section_Author:Button("复制作者QQ", function() setclipboard("2131869117") end)
Section_Author:Button("复制皮脚本QQ主群", function() setclipboard("894995244") end)
Section_Author:Button("复制皮脚本QQ前群", function() setclipboard("1002100032") end)
Section_Author:Button("复制皮脚本QQ二群", function() setclipboard("746849372") end)
Section_Author:Button("复制皮脚本QQ三群", function() setclipboard("571553667") end)
Section_Author:Button("复制皮脚本QQ四群", function() setclipboard("609250910") end)
Section_Author:Button("复制解卡群", function() setclipboard("252251548") end)
Section_Author:Button("复制解卡群二群", function() setclipboard("954149920") end)

local Section_UISettings = Tab_Info:section("UI设置", true)
Section_UISettings:Toggle("脚本边框变小一点", "", false, function(state)
    if state then
        game:GetService("CoreGui").frosty.Main.Style = "DropShadow"
    else
        game:GetService("CoreGui").frosty.Main.Style = "Custom"
    end
end)
Section_UISettings:Button("关闭脚本", function()
    game:GetService("CoreGui").frosty:Destroy()
end)

-- ==================== 公告 Tab ====================
local Tab_Announce = UI_Window:Tab("《公告》", "18930406865"):section("公告", true)
Tab_Announce:Label("此脚本为免费整合")
Tab_Announce:Label("不许倒卖圆钩")
Tab_Announce:Label("倒卖死全家 倒卖者我操你妈")
Tab_Announce:Label("严禁倒卖 倒卖无制无母")
Tab_Announce:Label("有时间就会更新")

-- ==================== 战新提示 Tab ====================
local Tab_Alerts = UI_Window:Tab("《战新提示》", "18930406865"):section("战新提示", true)

about:Button("禁漫中心",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/ghbdrc/main/%E4%B8%81%E4%B8%81%E5%88%80%E5%88%83%E7%90%83.txt"))()
end)