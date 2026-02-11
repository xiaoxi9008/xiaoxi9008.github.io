local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "PurpleKeyVerify"

local Background = Instance.new("Frame", ScreenGui)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.new(0.2, 0.1, 0.4) 
Background.BackgroundTransparency = 0.2

local InputBox = Instance.new("TextBox", ScreenGui)
InputBox.Position = UDim2.new(0.5, -200, 0.5, -40)
InputBox.Size = UDim2.new(0, 400, 0, 50)
InputBox.BackgroundColor3 = Color3.new(0, 0, 0) 
InputBox.BorderColor3 = Color3.new(0.6, 0.3, 1) 
InputBox.BorderSizePixel = 2
InputBox.CornerRadius = UDim.new(0, 15) -- 圆角
InputBox.TextColor3 = Color3.new(1, 1, 1)
InputBox.PlaceholderText = "输入你的密钥..."
InputBox.Font = Enum.Font.SourceSans
InputBox.TextSize = 20
InputBox.TextXAlignment = Enum.TextXAlignment.Center

local VerifyBtn = Instance.new("TextButton", ScreenGui)
VerifyBtn.Position = UDim2.new(0.5, -200, 0.5, 20)
VerifyBtn.Size = UDim2.new(0, 400, 0, 50)
VerifyBtn.CornerRadius = UDim.new(0, 15) 
local Gradient = Instance.new("UIGradient", VerifyBtn)
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(0.7, 0.4, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(0.4, 0.2, 0.8))
})
VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
VerifyBtn.Text = "验证密钥"
VerifyBtn.Font = Enum.Font.SourceSansBold
VerifyBtn.TextSize = 22

VerifyBtn.MouseButton1Click:Connect(function()
    if InputBox.Text ~= "" then
        print("密钥验证成功！")
        ScreenGui:Destroy()
        
        -- ↓↓↓ 粘贴你的脚本到这里 ↓↓↓
        
        
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/xiaoxi9008.github.io/refs/heads/main/%E5%8A%A0%E8%BD%BD%E5%99%A8%E3%80%82.lua"))()         



        -- ↑↑↑ 粘贴你的脚本到这里 ↑↑↑
    else
        InputBox.PlaceholderText = "请输入密钥内容"
    end
end)
