if _G.XION_Script_Loaded then
    _G.XION_Execution_Count = (_G.XION_Execution_Count or 0) + 1
    return
end

_G.XION_Script_Loaded = true
_G.XION_Execution_Count = 1

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local VIP_USERS = {
    "hnperezho647",  -- 示例用户1
    "Player2",  -- 示例用户2
    "Player3",  -- 示例用户3
    -- 在此处添加更多VIP用户名
}

-- 获取当前玩家用户名
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerName = localPlayer.Name

-- 检查是否为VIP用户
local isVIP = false
for _, vipName in ipairs(VIP_USERS) do
    if vipName == playerName then
        isVIP = true
        break
    end
end

local Tween = game:GetService('TweenService') 
local ScriptScreen = Instance.new('ScreenGui', game.Players.LocalPlayer.PlayerGui)
ScriptScreen.Name = "BaiMoScriptGUI"

-- 根据VIP状态设置不同的颜色主题
local VIP_COLORS = {
    Background = isVIP and Color3.new(0.1, 0.05, 0.15) or Color3.new(0, 0, 0),
    Gradient1 = isVIP and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(0, 150, 255),
    Gradient2 = isVIP and Color3.fromRGB(255, 150, 0) or Color3.fromRGB(0, 255, 255),
    TextColor = isVIP and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(255, 255, 255),
    VIPBadgeColor = Color3.fromRGB(255, 215, 0),
    NormalBadgeColor = Color3.fromRGB(150, 150, 150)
}

-- 创建主框架
local Main = Instance.new('Frame', ScriptScreen)
Main.BackgroundTransparency = 0.5
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.4, 0)
Main.Name = 'Main'
Main.BackgroundColor3 = VIP_COLORS.Background
Main.Size = UDim2.new(0, 500, 0, 300)

local MainC = Instance.new('UICorner', Main)
MainC.CornerRadius = UDim.new(0.05, 0)

local MainS = Instance.new('UIStroke', Main)
MainS.Color = Color3.fromRGB(255, 255, 255)
MainS.Thickness = 3

-- 流光边框效果
local gradient1 = Instance.new('UIGradient', MainS)
gradient1.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, VIP_COLORS.Gradient1),
    ColorSequenceKeypoint.new(1, VIP_COLORS.Gradient2)
}

-- VIP专属边框闪烁效果
if isVIP then
    task.spawn(function()
        while Main and Main.Parent do
            gradient1.Rotation += 3  -- VIP旋转更快
            -- VIP边框闪烁
            MainS.Transparency = 0.3 + math.sin(tick() * 2) * 0.2
            task.wait()
        end
    end)
else
    task.spawn(function()
        while Main and Main.Parent do
            gradient1.Rotation += 1  -- 普通用户旋转较慢
            task.wait()
        end
    end)
end

-- VIP标识（徽章）
local VIPTag = Instance.new('Frame', Main)
VIPTag.BackgroundColor3 = VIP_COLORS.VIPBadgeColor
VIPTag.Size = UDim2.new(0, 100, 0, 30)
VIPTag.Position = UDim2.new(1, -110, 0, 10)
VIPTag.BackgroundTransparency = isVIP and 0.2 or 0.7
VIPTag.Name = 'VIPTag'

local VIPTagCorner = Instance.new('UICorner', VIPTag)
VIPTagCorner.CornerRadius = UDim.new(0.2, 0)

local VIPTagStroke = Instance.new('UIStroke', VIPTag)
VIPTagStroke.Color = isVIP and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
VIPTagStroke.Thickness = 2

local VIPTagLabel = Instance.new('TextLabel', VIPTag)
VIPTagLabel.Size = UDim2.new(1, 0, 1, 0)
VIPTagLabel.BackgroundTransparency = 1
VIPTagLabel.Text = isVIP and "✨ VIP用户 ✨" or "普通用户"
VIPTagLabel.TextColor3 = isVIP and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
VIPTagLabel.Font = Enum.Font.GothamBold
VIPTagLabel.TextSize = 14
VIPTagLabel.TextScaled = true

-- VIP专属徽章动画
if isVIP then
    task.spawn(function()
        while VIPTag and VIPTag.Parent do
            VIPTagStroke.Transparency = 0.3 + math.sin(tick() * 3) * 0.3
            VIPTag.BackgroundTransparency = 0.2 + math.sin(tick() * 2) * 0.15
            task.wait()
        end
    end)
end

-- 标题
local Title1 = Instance.new('TextLabel', Main)
Title1.Text = '陌柒.小迪共创脚本'
Title1.TextSize = 40
Title1.BackgroundTransparency = 1
Title1.TextColor3 = VIP_COLORS.TextColor
Title1.AnchorPoint = Vector2.new(0.5, 0.5)
Title1.Position = UDim2.new(0.5, 0, 0.3, 0)
Title1.Font = Enum.Font.GothamBold

-- VIP专属标题效果
if isVIP then
    task.spawn(function()
        while Title1 and Title1.Parent do
            Title1.TextColor3 = Color3.fromHSV(math.sin(tick() * 0.5) * 0.5 + 0.5, 0.8, 1)
            task.wait(0.1)
        end
    end)
end

-- 玩家欢迎语
local Title2 = Instance.new('TextLabel', Main)
Title2.Text = '尊贵的' .. (isVIP and 'VIP玩家 ' or '玩家 ') .. game.Players.LocalPlayer.Name
Title2.TextSize = 22
Title2.BackgroundTransparency = 1
Title2.TextColor3 = VIP_COLORS.TextColor
Title2.AnchorPoint = Vector2.new(0.5, 0.5)
Title2.Position = UDim2.new(0.5, 0, 0.5, 0)
Title2.Font = isVIP and Enum.Font.GothamBold or Enum.Font.Gotham

-- VIP用户显示额外特权信息
if isVIP then
    local VIPPrivilege = Instance.new('TextLabel', Main)
    VIPPrivilege.Text = '🎁 尊享VIP特权 | ⚡ 极速加载 | 🌟 专属效果'
    VIPPrivilege.TextSize = 16
    VIPPrivilege.BackgroundTransparency = 1
    VIPPrivilege.TextColor3 = Color3.fromRGB(255, 215, 0)
    VIPPrivilege.AnchorPoint = Vector2.new(0.5, 0.5)
    VIPPrivilege.Position = UDim2.new(0.5, 0, 0.6, 0)
    VIPPrivilege.Font = Enum.Font.Gotham
    
    -- 特权信息闪烁效果
    task.spawn(function()
        while VIPPrivilege and VIPPrivilege.Parent do
            VIPPrivilege.TextTransparency = 0.2 + math.sin(tick() * 2) * 0.3
            task.wait(0.1)
        end
    end)
end

local Title3 = Instance.new('TextLabel', Main)
Title3.Text = isVIP and '欢迎使用VIP专属版迪脚本[BaiMo-Script]' or '欢迎使用迪脚本[BaiMo-Script]'
Title3.TextSize = 20
Title3.BackgroundTransparency = 1
Title3.TextColor3 = VIP_COLORS.TextColor
Title3.AnchorPoint = Vector2.new(0.5, 0.5)
Title3.Position = isVIP and UDim2.new(0.5, 0, 0.7, 0) or UDim2.new(0.5, 0, 0.75, 0)
Title3.Font = isVIP and Enum.Font.GothamBold or Enum.Font.Gotham

-- 加载条主框架
local LoadMain = Instance.new('Frame', ScriptScreen)
LoadMain.BackgroundTransparency = 0.5
LoadMain.AnchorPoint = Vector2.new(0.5, 0.5)
LoadMain.Position = UDim2.new(0.5, 0, isVIP and 0.8 or 0.66, 0)
LoadMain.Name = 'LoadMain'
LoadMain.BackgroundColor3 = VIP_COLORS.Background
LoadMain.Size = isVIP and UDim2.new(0, 450, 0, 40) or UDim2.new(0, 500, 0, 50)

local LoadMainC = Instance.new('UICorner', LoadMain)
LoadMainC.CornerRadius = UDim.new(0.08, 0)

local LoadMainS = Instance.new('UIStroke', LoadMain)
LoadMainS.Color = Color3.fromRGB(255, 255, 255)
LoadMainS.Thickness = 3

local gradient2 = Instance.new('UIGradient', LoadMainS)
gradient2.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, VIP_COLORS.Gradient1),
    ColorSequenceKeypoint.new(1, VIP_COLORS.Gradient2)
}

-- 加载条边框动画
if isVIP then
    task.spawn(function()
        while LoadMain and LoadMain.Parent do
            gradient2.Rotation += 2
            LoadMainS.Transparency = 0.2 + math.sin(tick() * 2.5) * 0.2
            task.wait()
        end
    end)
else
    task.spawn(function()
        while LoadMain and LoadMain.Parent do
            gradient2.Rotation += 1
            task.wait()
        end
    end)
end

-- 加载填充条
local LoadFillMain = Instance.new('Frame', LoadMain)
LoadFillMain.BackgroundTransparency = 0.5
LoadFillMain.Name = 'LoadMain'
LoadFillMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadFillMain.Size = UDim2.new(0, 0, 1, 0)

local LoadFillMainC = Instance.new('UICorner', LoadFillMain)
LoadFillMainC.CornerRadius = UDim.new(0.08, 0)

local gradient3 = Instance.new('UIGradient', LoadFillMain)
gradient3.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, VIP_COLORS.Gradient1),
    ColorSequenceKeypoint.new(1, VIP_COLORS.Gradient2)
}

-- VIP用户填充条渐变旋转
if isVIP then
    task.spawn(function()
        while LoadFillMain and LoadFillMain.Parent do
            gradient3.Rotation += 3
            task.wait()
        end
    end)
else
    task.spawn(function()
        while LoadFillMain and LoadFillMain.Parent do
            gradient3.Rotation += 1
            task.wait()
        end
    end)
end

-- 状态文本
local LoadState = Instance.new('TextLabel', Main)
LoadState.Text = isVIP and '🌟 VIP专属加速加载中...' or '正在加载玩家信息...'
LoadState.TextSize = 18
LoadState.BackgroundTransparency = 1
LoadState.TextColor3 = VIP_COLORS.TextColor
LoadState.AnchorPoint = Vector2.new(0.5, 0.5)
LoadState.Position = isVIP and UDim2.new(0.5, 0, 0.9, 0) or UDim2.new(0.5, 0, 1.3, 0)
LoadState.Font = isVIP and Enum.Font.GothamBold or Enum.Font.Gotham

-- VIP用户状态文本闪烁效果
if isVIP then
    task.spawn(function()
        while LoadState and LoadState.Parent do
            LoadState.TextTransparency = 0.1 + math.sin(tick() * 2) * 0.2
            task.wait(0.1)
        end
    end)
end

-- VIP用户显示加载百分比
local LoadPercent = nil
if isVIP then
    LoadPercent = Instance.new('TextLabel', LoadMain)
    LoadPercent.Size = UDim2.new(1, 0, 1, 0)
    LoadPercent.BackgroundTransparency = 1
    LoadPercent.Text = '0%'
    LoadPercent.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadPercent.Font = Enum.Font.GothamBold
    LoadPercent.TextSize = 16
    LoadPercent.TextStrokeTransparency = 0.5
end

-- VIP加载进度更新函数
local function updateVIPLoadPercent(percent)
    if isVIP and LoadPercent then
        LoadPercent.Text = math.floor(percent * 100) .. '%'
        -- VIP百分比颜色渐变
        LoadPercent.TextColor3 = Color3.fromHSV(percent * 0.3, 0.8, 1)
    end
end

-- ============ VIP自动关闭计时器 ============
local AutoCloseTimer = nil
local CountdownLabel = nil

if isVIP then
    -- 创建倒计时显示标签
    CountdownLabel = Instance.new('TextLabel', Main)
    CountdownLabel.Size = UDim2.new(0, 150, 0, 25)
    CountdownLabel.Position = UDim2.new(0.5, -75, 0.95, 0)
    CountdownLabel.BackgroundTransparency = 0.8
    CountdownLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    CountdownLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    CountdownLabel.Font = Enum.Font.GothamBold
    CountdownLabel.TextSize = 14
    CountdownLabel.Text = "自动关闭倒计时: 5秒"
    CountdownLabel.Visible = false
    
    local CountdownCorner = Instance.new('UICorner', CountdownLabel)
    CountdownCorner.CornerRadius = UDim.new(0.2, 0)
    
    local CountdownStroke = Instance.new('UIStroke', CountdownLabel)
    CountdownStroke.Color = Color3.fromRGB(255, 215, 0)
    CountdownStroke.Thickness = 2
end

-- VIP自动关闭函数
local function startAutoCloseTimer(seconds)
    if not isVIP then return end
    
    CountdownLabel.Visible = true
    
    local remainingTime = seconds
    AutoCloseTimer = task.spawn(function()
        while remainingTime > 0 and CountdownLabel and CountdownLabel.Parent do
            CountdownLabel.Text = string.format("⏰ 自动关闭倒计时: %d秒", remainingTime)
            
            -- 最后3秒闪烁
            if remainingTime <= 3 then
                CountdownLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                CountdownLabel.BackgroundTransparency = 0.3 + math.sin(tick() * 10) * 0.3
            end
            
            remainingTime -= 1
            task.wait(1)
        end
        
        if CountdownLabel and CountdownLabel.Parent then
            -- 执行关闭动画
            CountdownLabel.Text = "🎉 加载完成，正在关闭..."
            CountdownLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            -- VIP关闭特效
            task.spawn(function()
                for i = 1, 5 do
                    CountdownLabel.BackgroundTransparency = 0.2 + math.sin(tick() * 20) * 0.3
                    task.wait(0.05)
                end
            end)
            
            task.wait(0.5)
            
            -- 执行优雅的关闭动画
            local fadeOutTime = 0.8
            Tween:Create(Main, TweenInfo.new(fadeOutTime), {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
            
            Tween:Create(LoadMain, TweenInfo.new(fadeOutTime), {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
            
            Tween:Create(LoadFillMain, TweenInfo.new(fadeOutTime), {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
            
            Tween:Create(CountdownLabel, TweenInfo.new(fadeOutTime), {
                BackgroundTransparency = 1,
                TextTransparency = 1
            }):Play()
            
            -- 所有文本元素淡出
            local textElements = {Title1, Title2, Title3, LoadState, VIPPrivilege}
            for _, element in pairs(textElements) do
                if element and element.Parent then
                    Tween:Create(element, TweenInfo.new(fadeOutTime), {
                        TextTransparency = 1
                    }):Play()
                end
            end
            
            if VIPTag and VIPTag.Parent then
                Tween:Create(VIPTag, TweenInfo.new(fadeOutTime), {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play()
            end
            
            -- 等待动画完成
            task.wait(fadeOutTime + 0.1)
            
            -- 清理所有UI元素
            Main:Destroy()
            LoadMain:Destroy()
            LoadFillMain:Destroy()
            if CountdownLabel then CountdownLabel:Destroy() end
            if VIPTag then VIPTag:Destroy() end
            
            print("[VIP系统] 界面已自动关闭")
        end
    end)
end

-- VIP手动跳过按钮
local SkipButton = nil
if isVIP then
    SkipButton = Instance.new('TextButton', Main)
    SkipButton.Size = UDim2.new(0, 120, 0, 35)
    SkipButton.Position = UDim2.new(0.5, -60, 1.1, 0)
    SkipButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    SkipButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    SkipButton.Font = Enum.Font.GothamBold
    SkipButton.TextSize = 14
    SkipButton.Text = "⏭️ 立即跳过"
    SkipButton.Visible = false
    SkipButton.BorderSizePixel = 0
    
    local SkipCorner = Instance.new('UICorner', SkipButton)
    SkipCorner.CornerRadius = UDim.new(0.2, 0)
    
    SkipButton.MouseButton1Click:Connect(function()
        if AutoCloseTimer then
            task.cancel(AutoCloseTimer)
            AutoCloseTimer = nil
        end
        
        -- 立即关闭特效
        SkipButton.Text = "🎯 正在关闭..."
        SkipButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        
        -- 立即执行关闭动画
        startAutoCloseTimer(0)
    end)
    
    -- 按钮悬停效果
    SkipButton.MouseEnter:Connect(function()
        SkipButton.BackgroundColor3 = Color3.fromRGB(255, 230, 100)
    end)
    
    SkipButton.MouseLeave:Connect(function()
        SkipButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    end)
end

-- ============ 加载动画序列 ============

-- VIP用户有更快的加载速度
local loadTimeMultiplier = isVIP and 0.8 or 1  -- VIP加载速度提升20%

-- 第一阶段加载
task.wait(0.5)
Tween:Create(LoadFillMain, TweenInfo.new(1 * loadTimeMultiplier), {Size = UDim2.new(0.2, 0, 1, 0)}):Play()
updateVIPLoadPercent(0.2)

-- VIP用户特殊音效（可选）
if isVIP and game:GetService("SoundService") then
    task.spawn(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://3570574687"  -- VIP加载音效
        sound.Volume = 0.2
        sound.Parent = game.Workspace
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 3)
    end)
end

task.wait(1 * loadTimeMultiplier)
LoadState.Text = isVIP and '✨ 正在加载VIP专属界面...' or '正在加载脚本界面...'
Tween:Create(LoadFillMain, TweenInfo.new(0.7 * loadTimeMultiplier), {Size = UDim2.new(0.5, 0, 1, 0)}):Play()
updateVIPLoadPercent(0.5)

task.wait(0.7 * loadTimeMultiplier)
LoadState.Text = isVIP and '⚡ 正在加载VIP特权项目...' or '正在加载项目...'
Tween:Create(LoadFillMain, TweenInfo.new(0.6 * loadTimeMultiplier), {Size = UDim2.new(1, 0, 1, 0)}):Play()
updateVIPLoadPercent(1)

task.wait(0.7 * loadTimeMultiplier)
LoadState.Text = isVIP and '🎉 VIP加载完成! 欢迎尊贵用户!' or '加载完成!'
updateVIPLoadPercent(1)

-- VIP用户完成特效
if isVIP then
    -- VIP完成闪烁效果
    for i = 1, 3 do
        LoadState.TextColor3 = Color3.fromRGB(255, 215, 0)
        task.wait(0.1)
        LoadState.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(0.1)
    end
    
    LoadState.Text = '🎊 迪脚本[BaiMo-Script] 已准备就绪'
    LoadState.TextColor3 = Color3.fromRGB(255, 215, 0)
    
    -- 显示跳过按钮
    if SkipButton then
        SkipButton.Visible = true
        Tween:Create(SkipButton, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, -60, 0.85, 0)
        }):Play()
    end
    
    -- VIP徽章缩小并移动到右上角
    Tween:Create(VIPTag, TweenInfo.new(0.5), {
        Size = UDim2.new(0, 80, 0, 25),
        Position = UDim2.new(1, -85, 0, 5)
    }):Play()
    
    -- 启动自动关闭倒计时（5秒后自动关闭）
    task.wait(1)  -- 等待1秒让用户看到完成状态
    startAutoCloseTimer(5)
    
    -- VIP完成音效
    if game:GetService("SoundService") then
        task.spawn(function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://9118340725"  -- 完成音效
            sound.Volume = 0.3
            sound.Parent = game.Workspace
            sound:Play()
            game:GetService("Debris"):AddItem(sound, 3)
        end)
    end
else
    -- 普通用户流程
    task.wait(0.5)
    Title1:Destroy()
    Title2:Destroy()
    Title3:Destroy()
    LoadState:Destroy()
    if VIPTag then VIPTag:Destroy() end
    
    Tween:Create(Main, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    Tween:Create(LoadFillMain, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    Tween:Create(LoadMain, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.5)
    Main:Destroy()
    LoadMain:Destroy()
    LoadFillMain:Destroy()
    print("[系统] 普通用户加载完成")
end

-- 输出用户状态信息
print("=================================")
print("迪脚本[BaiMo-Script] 加载系统")
print("用户: " .. playerName)
print("VIP状态: " .. (isVIP and "尊贵VIP用户" or "普通用户"))
print("加载时间: " .. (isVIP and "加速完成" or "标准完成"))
if isVIP then
    print("自动关闭: 5秒后自动关闭界面")
    print("操作提示: 可点击'立即跳过'按钮提前关闭")
end
print("=================================")

-- VIP用户额外提示
if isVIP then
    -- 在聊天框发送VIP提示
    task.spawn(function()
        task.wait(3)
        local message = "🎉 VIP加载完成! 脚本界面将在倒计时结束后自动关闭。"
        if game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") then
            -- 创建一个通知
            local notification = Instance.new("ScreenGui")
            notification.Name = "VIPNotification"
            notification.Parent = game:GetService("Players").LocalPlayer.PlayerGui
            
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(0, 300, 0, 50)
            frame.Position = UDim2.new(0.5, -150, 0.1, 0)
            frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            frame.BackgroundTransparency = 0.3
            frame.Parent = notification
            
            local corner = Instance.new("UICorner", frame)
            corner.CornerRadius = UDim.new(0.1, 0)
            
            local stroke = Instance.new("UIStroke", frame)
            stroke.Color = Color3.fromRGB(255, 215, 0)
            stroke.Thickness = 2
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -20, 1, -10)
            label.Position = UDim2.new(0, 10, 0, 5)
            label.BackgroundTransparency = 1
            label.Text = message
            label.TextColor3 = Color3.fromRGB(255, 215, 0)
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
            label.TextWrapped = true
            label.Parent = frame
            
            -- 3秒后淡出
            task.wait(3)
            Tween:Create(frame, TweenInfo.new(1), {
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, -150, 0, -100)
            }):Play()
            Tween:Create(stroke, TweenInfo.new(1), {
                Transparency = 1
            }):Play()
            Tween:Create(label, TweenInfo.new(1), {
                TextTransparency = 1
            }):Play()
            
            task.wait(1)
            notification:Destroy()
        end
    end)
end
local Window = WindUI:CreateWindow({
    Title = "XIAOXI脚本",
    Icon = "rbxassetid://123691280552142",
    Author = "by小西制作",
    AuthorImage = 90840643379863,
    Folder = "CloudHub",
    Size = UDim2.fromOffset(560, 360),
    KeySystem = {
        Key = { "我爱大司马", "小西nb", "宇星辰", "阵雨眉目" }, 
        Note = "请输入卡密",
        SaveKey = false,
    },
    Transparent = true,
    Background = "rbxassetid://122305865891820",
    BackgroundTransparency = 0.3, 
    User = {
        Enabled = true,
        Callback = function() 
            print("clicked") 
        end,
        Anonymous = true
    },
})

Window:EditOpenButton(
    {
        Title = "XIAOXI",
        Icon = "rbxassetid://123691280552142",
        CornerRadius = UDim.new(0, 13),
        StrokeThickness = 4,
        Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(186, 19, 19)),ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 60, 129))}),
        Draggable = true
    }
)

function Tab(a)
    return Window:Tab({Title = a, Icon = "eye"})
end

function Button(a, b, c)
    return a:Button({Title = b, Callback = c})
end

function Toggle(a, b, c, d)
    return a:Toggle({Title = b, Value = c, Callback = d})
end

function Slider(a, b, c, d, e, f)
    return a:Slider({Title = b, Step = 1, Value = {Min = c, Max = d, Default = e}, Callback = f})
end

function Dropdown(a, b, c, d, e)
    return a:Dropdown({Title = b, Values = c, Value = d, Callback = e})
end

function Input(a, b, c, d, e, f)
    return a:Input({
        Title = b,
        Desc = c or "",
        Value = d or "",
        Placeholder = e or "",
        Callback = f
    })
end

local Taba = Tab("首页")
local Tabjb = Tab("支持服务器")
local Tabb = Tab("设置")

local player = game.Players.LocalPlayer

Taba:Paragraph({
    Title = "系统信息",
    Desc = string.format("用户名: %s\n显示名: %s\n用户ID: %d\n账号年龄: %d天", 
        player.Name, player.DisplayName, player.UserId, player.AccountAge),
    Image = "info",
    ImageSize = 20,
    Color = Color3.fromHex("#0099FF")
})

local fpsCounter = 0
local fpsLastTime = tick()
local fpsText = "计算中..."

spawn(function()
    while wait() do
        fpsCounter += 1
        
        if tick() - fpsLastTime >= 1 then
            fpsText = string.format("%.1f FPS", fpsCounter) 
            fpsCounter = 0
            fpsLastTime = tick()
        end
    end
end)

Taba:Paragraph({
    Title = "性能信息",
    Desc = "帧率: " .. fpsText,
    Image = "bar-chart",
    ImageSize = 20,
    Color = Color3.fromHex("#00A2FF")
})

Taba:Paragraph({
    Title = "本人在此声明：封号与本脚本无关",
    Desc = [[ ]],
    Image = "eye",
    ImageSize = 24,
    Color = Color3.fromHex("#FFFFFF"),
    BackgroundTransparency = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    OutlineThickness = 1,
    Padding = UDim.new(0, 1)
})

Taba:Paragraph({
    Title = "此脚本为免费⭕钱和作者无关",
    Desc = [[ ]],
    Image = "eye",
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    BackgroundColor3 = Color3.fromHex("#000000"),
    BackgroundTransparency = 0.2,
    OutlineColor = Color3.fromHex("#000000"),
    OutlineThickness = 1,
    Padding = UDim.new(0, 1)
})
Taba:Paragraph({
    Title = "计划50个服务器😋😋",
    Desc = [[ ]],
    Image = "eye",
    ImageSize = 24,
    Color = Color3.fromHex("#000000"),
    BackgroundTransparency = 1,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    OutlineThickness = 1,
    Padding = UDim.new(0, 1)
})

--=======姥爷司空别翻过头了===========
--=======姥爷司空别翻过头了===========
--=======姥爷司空别翻过头了===========
--=======姥爷司空别翻过头了===========
Button(Tabjb, "点击此处复制小西私人qq以提供你的脚本", function()
    setclipboard("3574769415")
end)

Button(Tabjb, "正在寻求", function() 
        FengYu_HUB = "正在寻求"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxi9008.github.io/refs/heads/main/SX%E9%80%9A%E7%BC%89%E6%BA%90%E7%A0%81%EF%BC%88KENNY%EF%BC%89.lua"))() 
end)

Button(Tabjb, "终极战场", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/Kanl%E6%9C%80%E6%96%B0%E7%BB%88%E6%9E%81%E6%88%98%E5%9C%BA%E6%BA%90%E7%A0%81.lua"))() 
end)

Button(Tabjb, "偷走一粒红", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E5%81%B7%E8%B5%B0%E8%84%91%E7%BA%A2.lua"))() 
end)

Button(Tabjb, "自然灾害", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.lua"))() 
end)

Button(Tabjb, "99个森林夜", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/99%E5%A4%9C.lua"))() 
end)

Button(Tabjb, "忍者传奇", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87.lua"))()
end)

Button(Tabjb, "种植花园", function() 
        Pikon_script = "by小西"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E7%A7%8D%E6%A4%8D%E8%8A%B1%E5%9B%AD.lua"))()
end)

Button(Tabjb, "被遗弃", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E8%A2%AB%E9%81%97%E5%BC%83.lua"))()
end)

Button(Tabjb, "doors", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/doors.lua"))()
end)

Button(Tabjb, "墨水", function() 
        KG_SCRIPT = "卡密：小西nb"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/moshui.lua"))()
end)

Button(Tabjb, "OhioV3未完善", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/1.lua"))()
end)

Button(Tabjb, "OhioV2可以配的V3一起玩", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/SX%E4%BF%84%E4%BA%A5%E4%BF%84%E5%B7%9EV5%E6%BA%90%E7%A0%81(1).lua"))() 
end)

Button(Tabjb, "NOL老版本", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/NOL%E5%8A%A0%E8%BD%BD%E5%99%A8.lua"))()
end)

Button(Tabjb, "NOL提供的被遗弃Bug太多了", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/NOL-%E4%BB%98%E8%B4%B9%E7%89%88%E6%9C%80%E6%96%B0%E6%BA%90%E7%A0%81.lua"))() 
end)

Button(Tabjb, "粉丝猪的秘密", function()
    setclipboard("皮炎超旋风暴我的皮燕突然自主启动为超频涡轮形态，每秒钟旋转达到惊人的十二万九千六百转，喷出的气流直接形成了小型龙卷风将整个房间卷得一片狼藉，隔壁邻居愤怒地拍门大吼：“谁家直升机又在厕所坠毁了？！”我绝望地试图用定制钛合金肛塞堵住风暴眼，它却瞬间被超高温金属射流熔成了一滩发光的钢水，最终我的臀部在一道突破音障的尖锐爆鸣中，化为璀璨的星际尘埃，只留下地板上一个完美圆形灼刻图案和弥漫不散的哲学气息。我的皮燕，毫无预兆地，启动了。不是以往那种带着尴尬湿气的普通排气，也不是偶尔失控的连环闷响。这一次，是清晰无误的、机械嵌合般的“咔嗒”一声自体内传来，仿佛某个沉睡的远古协议被瞬间激活。紧接着，一股冰冷而暴戾的漩涡感在尾椎底部成形，急速扩张。嗡——”低鸣在零点一秒内爬升到令人牙酸的尖啸。我能感觉到，不是气体在排出，而是那入口本身，成了风暴的源头，成了引擎的核心。超频涡轮形态——这六个字毫无道理却无比精准地砸进我的脑海。视野边缘似乎出现了幻觉般的红色读数：转速每秒十二万九千六百转，还在飙升。“不……停下！”哀求被更狂暴的声响吞没。第一股喷出的气流就不是气流，它呈螺旋状，灰白中夹杂着难以描述的复杂颜色，刚离开躯体就疯狂抽取周围的空气。纸巾盒率先被扯碎，白絮还没飘散就被吸入那不断扩大的气旋。椅子哀嚎着刮擦地板，斜着撞过来，我踉跄躲开，眼睁睁看着它连同半张地毯、几只笔、一个空可乐罐，一起被卷进我那臀部后方诞生的、越来越清晰的小型龙卷风里。房间不再是房间，成了一个正在被离心力撕扯、搅拌的灾难现场。书本飞舞，窗帘笔直地绷向风暴中心，玻璃窗发出可怕的呻吟。“砰！砰！砰！”沉重的砸门声穿透风暴的轰鸣，隔壁那暴躁老哥的吼叫变形而遥远：“谁家直升机又在厕所坠毁了？！ 还让不让人——”他的声音戛然而止，或许是被一块飞过去的鼠标垫糊在了脸上。绝望像冰水浇头。得堵住它！我连滚爬爬，扑向书桌抽屉最深处，那里有一个冰冷沉重的物件——为极端情况（我从未想过真有用上的一天）定制的钛合金肛塞，流线型，表面抛光得像颗黑色的毒苹果。我颤抖着，背对那吞噬一切的风暴眼，试图将它按向那疯狂的漩涡。接触，只在一瞬。没有阻塞感，没有摩擦声。只有一道耀眼至极的超高温金属射流，像星球初诞时的光芒，从塞子与风暴眼的接触点迸发出来。定制钛合金，足以承受火箭发动机尾焰的材料，连挣扎都没有，就在我手中无声地熔解、汽化，化作一滩炽白滚烫、滴落时嘶嘶作响的钢水，在地板上蚀出冒烟的小坑。热风灼伤了我的手背，刺痛却远不及心底的冰凉。转速，突破了某个临界点。房间里的空气被彻底抽干，又在瞬间被压缩、电离。所有未被固定的物体都漂浮起来，环绕着我，环绕着那个已经成为纯粹能量漩涡的臀部，疯狂旋转。墙壁出现裂纹，灯管炸裂成粉末。我感到自己的身体在瓦解，不是疼痛，而是一种被绝对力量从分子层面撕裂的虚无感。然后，是寂静。极致的喧嚣坍缩成的、令人灵魂冻结的寂静。紧接着——“咻——————！！！”突破音障的尖锐爆鸣。不是从耳朵传入，而是直接从我的骨骼、我的脑髓深处炸开。视野被纯白充斥。在那毁灭性的白光中，我最后“看”到的，是我的臀部，我身体的一部分，连同那肆虐的涡轮风暴，在一阵无法形容的璀璨迸发中，彻底分解，化为最细微的、闪烁着星光的尘埃——星际尘埃。它们旋转着，扩散着，带着我最后一缕意识，飘散在已然不存在的房间空气中。白光褪去。轰鸣消失。一切都静止了。我……我还站着？不，没有实体感。只有视觉残存，如同幽灵俯瞰着灾难现场。原本是房间的地方，只剩一片空荡的狼藉，中央地板上，是一个完美圆形的灼刻图案，边缘光滑如镜，深入混凝土数寸，图案纹理复杂，仿佛某种异星文明的符印，散发着微弱的热辐射与……一种难以言喻的、混合了硫磺、臭氧与过度思考后的虚无感的哲学气息，袅袅弥漫。隔壁的砸门声，再也没有响起")
end)

Button(Tabjb, "之前的墨水不知道还能用不能", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/-v91/refs/heads/main/%E5%A2%A8%E6%B0%B4%E5%B0%8F%E6%BA%AA%E8%84%9A%E6%9C%AC.lua"))() 
end)

Button(Tabjb, "dig服务器", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/dig.lua"))() 
end)

Button(Tabjb, "刀刃球", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E5%88%80%E5%88%83%E7%90%83.lua"))() 
end)

Button(Tabjb, "植物大战脑红", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%A4%8D%E7%89%A9%E5%A4%A7%E6%88%98%E8%84%91%E7%BA%A2.lua"))() 
end)

Button(Tabjb, "力量传奇", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87.lua"))() 
end)

Button(Tabjb, "在超市一周", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E5%9C%A8%E8%B6%85%E5%B8%82%E7%94%9F%E6%B4%BB%E4%B8%80%E5%91%A8.lua"))() 
end)

Button(Tabjb, "建造你的基地", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E5%BB%BA%E9%80%A0%E4%BD%A0%E7%9A%84%E5%9F%BA%E5%9C%B0.lua"))() 
end)

Button(Tabjb, "恶魔学", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%81%B6%E9%AD%94%E5%AD%A6.lua"))() 
end)

Button(Tabjb, "成为乞丐", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%88%90%E4%B8%BA%E4%B9%9E%E4%B8%90.lua"))() 
end)

Button(Tabjb, "战争大亨", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.lua"))() 
end)

Button(Tabjb, "极速传奇", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%9E%81%E9%80%9F%E4%BC%A0%E5%A5%87.lua"))() 
end)

Button(Tabjb, "汽车营销", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%B1%BD%E8%BD%A6%E8%90%A5%E9%94%80%E5%A4%A7%E4%BA%A8.lua"))() 
end)

Button(Tabjb, "河北唐县", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E6%A8%A1%E4%BB%BF%E8%80%85.lua"))() 
end)

Button(Tabjb, "🚀发射模拟器", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E7%81%AB%E7%AE%AD%E5%8F%91%E5%B0%84%E6%A8%A1%E6%8B%9F%E5%99%A8.lua"))() 
end)

Button(Tabjb, "矿井", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E7%9F%BF%E4%BA%95.lua"))() 
end)

Button(Tabjb, "77汉堡🤓", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E7%B4%A7%E6%80%A5%E6%B1%89%E5%A0%A1.lua"))() 
end)

Button(Tabjb, "躲避", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E8%BA%B2%E9%81%BF.lua"))() 
end)

Button(Tabjb, "掉鱼模拟器", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E9%92%93%E9%B1%BC%E6%A8%A1%E6%8B%9F%E5%99%A8.lua"))() 
end)

Button(Tabjb, "隐藏或死亡", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E9%9A%90%E8%97%8F%E6%88%96%E6%AD%BB%E4%BA%A1.lua"))() 
end)

Button(Tabjb, "鱼", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E9%B1%BC.lua"))() 
end)
Button(Tabjb, "XIAOXI自瞄推荐闪光", function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E5%B0%8F%E8%A5%BF%E8%87%AA%E7%9E%84.lua"))() 
end)
--=======姥爷司空别翻过头了===========
--=======姥爷司空别翻过头了===========
--=======姥爷司空别翻过头了===========
--=======姥爷司空别翻过头了===========

Button(Tabb, "重进服务器", function() 
    game:GetService("TeleportService"):TeleportToPlaceInstance(
            game.PlaceId,
            game.JobId,
            game:GetService("Players").LocalPlayer
        )
end)

Tabd:Paragraph({
    Title = "小西空不更新怎么办？",
    Desc = [[我哪有那么多时间]],
    Image = "eye",
    ImageSize = 24,
    Color = Color3.fromHex("#FFFFFF"),
    BackgroundColor3 = Color3.fromHex("#000000"),
    BackgroundTransparency = 0.2,
    OutlineColor = Color3.fromHex("#FFFFFF"),
    OutlineThickness = 1,
    Padding = UDim.new(0, 1)
})

Button(Tabd, "小西私人qq号码[点我复制]", function()
    setclipboard("3574769415")
end)

Button(Tabb, "离开服务器", function() 
    game:Shutdown()
end)