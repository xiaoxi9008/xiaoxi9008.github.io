-- 定义回调函数，防止报错
local bindable = Instance.new("BindableFunction")
bindable.OnInvoke = function(button)
    print("用户点击了: " .. button)
end

-- 欢迎提示（全局）
game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "小西通用脚本",
  Text = "欢迎使用小西脚本",
  Icon = "rbxassetid://158118263",
  Duration = 1,
  Callback = bindable,
  Button1 = "脚本功能多多",
  Button2 = "感谢您的使用",
})
wait(1.5)

-- 服务器ID判断与加载
local placeId = game.PlaceId

if placeId == 7239319209 then
    -- Ohio 服务器专用逻辑
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "皮脚本检测",
        Text = "检测到您正在使用xiaoxi脚本",
        Icon = "rbxassetid://18941716391",
        Duration = 1,
        Callback = bindable,
        Button1 = "皮脚本功能多多",
        Button2 = "感谢您的使用"
    })
    wait(1.5)

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

if game.PlaceId == 18687417158 then --- 服务器id
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/NOL-%E4%BB%98%E8%B4%B9%E7%89%88%E6%9C%80%E6%96%B0%E6%BA%90%E7%A0%81.lua"))()---该服务器脚本

 elseif game.PlaceId == 7239319209 then
     loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/Xiaoxi/refs/heads/main/obfuscated_script-1770370829905.lua"))() -- Ohio 服务器脚本
 
else
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/XIAOXIBUXINB/refs/heads/main/%E5%B0%8F%E8%A5%BF.lua"))()---加载通用raw

end---结束
