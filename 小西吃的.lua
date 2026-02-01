-- 1. 初始化Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "V3小西Ohio",
    LoadingTitle = "加载中...",
    LoadingSubtitle = "请稍候",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "你的文件夹名",
        FileName = "UI配置"
    },
    Discord = {
        Enabled = false
    }
})

-- 2. 创建“自动发脚本”标签页
local ScriptTab = Window:CreateTab("自动发脚本", 4483362458) -- 第二个参数是图标ID

-- 3. 定义脚本映射表（条目名称 → 脚本链接/路径）
local ScriptMap = {
    ["小西鱼"] = "https://xxx.com/小西鱼脚本.lua", -- 替换为实际链接
    ["小西最强战场"] = "https://xxx.com/最强战场脚本.lua",
    ["v1小西Ohio"] = "本地路径/v1小西Ohio.lua", -- 本地脚本用路径
    ["小西doors"] = "https://xxx.com/doors脚本.lua",
    ["v2小西"] = "https://xxx.com/v2小西脚本.lua"
}

-- 4. 创建列表条目，并绑定点击执行脚本的回调
for scriptName, scriptSource in pairs(ScriptMap) do
    ScriptTab:CreateList({
        Name = scriptName,
        PlaceholderText = "点击执行",
        Callback = function() -- 点击条目时触发的函数
            -- 执行脚本的逻辑
            if string.find(scriptSource, "http") then
                -- 情况1：执行网络脚本
                local success, scriptContent = pcall(function()
                    return game:GetService("HttpService"):GetAsync(scriptSource)
                end)
                if success then
                    local runScript, err = loadstring(scriptContent)
                    if runScript then
                        runScript()
                        Rayfield:Notify({
                            Title = "成功",
                            Content = "脚本[" .. scriptName .. "]执行完成",
                            Duration = 3,
                            Image = 4483362458
                        })
                    else
                        Rayfield:Notify({
                            Title = "失败",
                            Content = "编译错误：" .. err,
                            Duration = 3,
                            Image = 4483362458
                        })
                    end
                else
                    Rayfield:Notify({
                        Title = "失败",
                        Content = "下载错误：" .. scriptContent,
                        Duration = 3,
                        Image = 4483362458
                    })
                end
            else
                -- 情况2：执行本地脚本
                local runScript, err = loadfile(scriptSource)
                if runScript then
                    runScript()
                    Rayfield:Notify({
                        Title = "成功",
                        Content = "脚本[" .. scriptName .. "]执行完成",
                        Duration = 3,
                        Image = 4483362458
                    })
                else
                    Rayfield:Notify({
                        Title = "失败",
                        Content = "加载错误：" .. err,
                        Duration = 3,
                        Image = 4483362458
                    })
                end
            end
        end
    })
end

-- 5. 显示UI
Rayfield:LoadConfiguration()
