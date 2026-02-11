local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "KamiVerify"

local InputBox = Instance.new("TextBox", ScreenGui)
InputBox.Position = UDim2.new(0.5, -120, 0.5, -30)
InputBox.Size = UDim2.new(0, 240, 0, 40)
InputBox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
InputBox.TextColor3 = Color3.new(1, 1, 1)
InputBox.PlaceholderText = "输入任意内容验证"
InputBox.Font = Enum.Font.SourceSans
InputBox.TextSize = 18

local VerifyBtn = Instance.new("TextButton", ScreenGui)
VerifyBtn.Position = UDim2.new(0.5, -80, 0.5, 20)
VerifyBtn.Size = UDim2.new(0, 160, 0, 35)
VerifyBtn.BackgroundColor3 = Color3.new(0, 0.6, 0.2)
VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
VerifyBtn.Text = "立即验证"
VerifyBtn.Font = Enum.Font.SourceSans
VerifyBtn.TextSize = 18

VerifyBtn.MouseButton1Click:Connect(function()
    local userInput = InputBox.Text
    if userInput ~= "" then 
        print("验证成功！加载脚本...")
        ScreenGui:Destroy() 

        -- ↓↓↓ 粘贴你的脚本到这里 ↓↓↓


loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/-v91/refs/heads/main/SX%E4%BF%84%E4%BA%A5%E4%BF%84%E5%B7%9EV5%E6%BA%90%E7%A0%81(1).lua"))() 



        -- ↑↑↑ 粘贴你的脚本到这里 ↑↑↑

    else
        InputBox.PlaceholderText = "请输入任意内容再验证"
    end
end)
