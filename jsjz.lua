local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "加载器-卡密验证",
    Icon = "rbxassetid://4483362748",
    Size = UDim2.fromOffset(300, 200),
    KeySystem = {
        Key = { "xiaoxi2026", "kxm123456" }, -- 可自定义卡密列表
        Note = "请输入卡密",
        SaveKey = false,
    },
    Author = "卡密系统整合",
})

local function loadTargetScript()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/-v91/refs/heads/main/%E5%8A%A0%E8%BD%BD%E5%99%A8%E3%80%82.lua"))()
    end)
    if success then
        print("脚本加载成功！")
        Window:Destroy() 
    else
        warn("脚本加载失败：" .. err)
    end
end

Window.KeySystem.Callback = function()
    loadTargetScript()
end
