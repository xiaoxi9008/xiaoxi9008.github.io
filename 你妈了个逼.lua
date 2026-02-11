local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "NOLScriptVerify"

local MainPanel = Instance.new("Frame", ScreenGui)
MainPanel.Position = UDim2.new(0.5, -250, 0.5, -200)
MainPanel.Size = UDim2.new(0, 500, 0, 400)
MainPanel.BackgroundColor3 = Color3.new(0.15, 0.08, 0.3)
MainPanel.CornerRadius = UDim.new(0, 15)
MainPanel.BorderSizePixel = 0

local Logo = Instance.new("TextLabel", MainPanel)
Logo.Position = UDim2.new(0.05, 0, 0.05, 0)
Logo.Size = UDim2.new(0, 40, 0, 40)
Logo.BackgroundTransparency = 1
Logo.Text = "xiaoxi"
Logo.TextColor3 = Color3.new(0.8, 0.4, 1)
Logo.TextStrokeColor3 = Color3.new(1, 0, 0.5)
Logo.TextStrokeTransparency = 0
Logo.Font = Enum.Font.Bangers
Logo.TextSize = 30

local WelcomeText = Instance.new("TextLabel", MainPanel)
WelcomeText.Position = UDim2.new(0.15, 0, 0.05, 0)
WelcomeText.Size = UDim2.new(0, 200, 0, 30)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "欢迎使用,"
WelcomeText.TextColor3 = Color3.new(1, 1, 1)
WelcomeText.Font = Enum.Font.SourceSans
WelcomeText.TextSize = 20

local TitleText = Instance.new("TextLabel", MainPanel)
TitleText.Position = UDim2.new(0.15, 0, 0.12, 0)
TitleText.Size = UDim2.new(0, 200, 0, 40)
TitleText.BackgroundTransparency = 1
TitleText.Text = "NOL SCRIPT"
TitleText.TextColor3 = Color3.new(0.8, 0.4, 1)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 30

local InputBox = Instance.new("TextBox", MainPanel)
InputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
InputBox.Size = UDim2.new(0.8, 0, 0.12, 0)
InputBox.BackgroundColor3 = Color3.new(0, 0, 0)
InputBox.BorderColor3 = Color3.new(0.6, 0.3, 1)
InputBox.BorderSizePixel = 2
InputBox.CornerRadius = UDim.new(0, 8)
InputBox.TextColor3 = Color3.new(1, 1, 1)
InputBox.PlaceholderText = "输入你的密钥..."
InputBox.Font = Enum.Font.SourceSans
InputBox.TextSize = 20
InputBox.TextXAlignment = Enum.TextXAlignment.Center

local VerifyBtn = Instance.new("TextButton", MainPanel)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
VerifyBtn.Size = UDim2.new(0.8, 0, 0.12, 0)
VerifyBtn.BackgroundColor3 = Color3.new(0.6, 0.3, 1)
VerifyBtn.CornerRadius = UDim.new(0, 8)
VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
VerifyBtn.Text = "验证密钥"
VerifyBtn.Font = Enum.Font.SourceSansBold
VerifyBtn.TextSize = 22

local GetKeyBtn = Instance.new("TextButton", MainPanel)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
GetKeyBtn.Size = UDim2.new(0.45, 0, 0.12, 0)
GetKeyBtn.BackgroundColor3 = Color3.new(0.6, 0.3, 1)
GetKeyBtn.CornerRadius = UDim.new(0, 8)
GetKeyBtn.TextColor3 = Color3.new(1, 1, 1)
GetKeyBtn.Text = "获取卡密"
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.TextSize = 20

local HelpBtn = Instance.new("TextButton", MainPanel)
HelpBtn.Position = UDim2.new(0.58, 0, 0.6, 0)
HelpBtn.Size = UDim2.new(0.32, 0, 0.12, 0)
HelpBtn.BackgroundColor3 = Color3.new(0, 0, 0)
HelpBtn.CornerRadius = UDim.new(0, 8)
HelpBtn.TextColor3 = Color3.new(1, 1, 1)
HelpBtn.Text = "如何获取和使用"
HelpBtn.Font = Enum.Font.SourceSans
HelpBtn.TextSize = 16

local HelpText = Instance.new("TextLabel", MainPanel)
HelpText.Position = UDim2.new(0.1, 0, 0.8, 0)
HelpText.Size = UDim2.new(0.3, 0, 0.08, 0)
HelpText.BackgroundTransparency = 1
HelpText.Text = "需要帮助?"
HelpText.TextColor3 = Color3.new(0.7, 0.7, 0.7)
HelpText.Font = Enum.Font.SourceSans
HelpText.TextSize = 16

local QQGroupText = Instance.new("TextLabel", MainPanel)
QQGroupText.Position = UDim2.new(0.7, 0, 0.8, 0)
QQGroupText.Size = UDim2.new(0.2, 0, 0.08, 0)
QQGroupText.BackgroundTransparency = 1
QQGroupText.Text = "加入QQ群"
QQGroupText.TextColor3 = Color3.new(0.8, 0.4, 1)
QQGroupText.Font = Enum.Font.SourceSansBold
QQGroupText.TextSize = 16

VerifyBtn.MouseButton1Click:Connect(function()
    if InputBox.Text ~= "" then
        print("验证成功！")
        ScreenGui:Destroy()
        
        -- ↓↓↓ 把你的脚本粘贴到这里 ↓↓↓


loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxi9008.github.io/refs/heads/main/%E6%B5%8B%E8%AF%95.lua"))() 



        -- ↑↑↑ 把你的脚本粘贴到这里 ↑↑↑
    else
        InputBox.PlaceholderText = "请输入任意内容"
    end
end)
