local userInput = game:GetService("UserInputService"):PopupTextInput("请输入卡密")

if userInput ~= "" then
    print("卡密正确")

    -- ↓↓↓ 把你整个脚本 粘贴 在这里 ↓↓↓



loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/%E6%AD%A3%E5%9C%A8%E5%AF%BB%E6%B1%82.lua"))() 



    -- ↑↑↑ 把你整个脚本 粘贴 在这里 ↑↑↑
else
    print("卡密错误")
end
