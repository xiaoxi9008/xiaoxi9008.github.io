local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "小西脚本<font color='#00FF00'>V2</font>",
    Icon = "rbxassetid://4483362748",
    IconTransparency = 0.5,
    IconThemed = true,
    Author = "作者:小西",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(100, 100),
    User = {
        Enabled = true,
        Callback = function() end,
        Anonymous = false
    },
    KeySystem = {
        Key = { "小西nb", "25ytgcjNB" },
        Note = "卡密：小西nb",
        SaveKey = false,
    },
})

local function load78Script()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaoxi9008/-v91/refs/heads/main/78.lua"))()
    end)
    if not success then
        warn("78.lua加载失败：" .. err)
    else
        print("78.lua加载成功！")
    end
end

Window.KeySystem.Callback = function()
    load78Script()
end
