Players = cloneref(game:GetService("Players"))
RunService = cloneref(game:GetService("RunService"))
ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
LocalPlayer = Players.LocalPlayer
Character = LocalPlayer.Character
Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:Connect(function(char)
	Character = char
	HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
	Humanoid = char:WaitForChild("Humanoid")
end)

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/454244513/WindUIFix/refs/heads/main/main.lua"))()
local Window = WindUI:CreateWindow({
	Title = "小西俄亥俄",
	Author = "Ohio",
    OpenButton = {
		Title = "小西Ohio",
		CornerRadius = UDim.new(0, 16),
		StrokeThickness = 3,
		Color = ColorSequence.new( -- gradient
			Color3.fromHex("f9a8d4"),
			Color3.fromHex("f9a8d4")
		),
		OnlyMobile = false,
		Enabled = true,
		Draggable = true,
		Scale = 0.5,
	},
})

local Tab = Window:Tab({
	Title = "暴力",
})
Tab:Select()

Tab:Paragraph({
	Title = "官网 没油",
	Desc = "官方qq群没油",
})

Tab:Paragraph({
	Title = "此脚本为免费",
	Desc = "如果你是购买的那么恭喜你被骗了",
})

Tab:Toggle({
	Title = "阴间飞镖",
	Callback = function(state)
		bladeaura = state
	end,
})

load = require(ReplicatedStorage.devv).load
Signal = load("Signal")
FireServer = Signal.FireServer
InvokeServer = Signal.InvokeServer
GUID = load("GUID")
v3item = load("v3item")
Raycast = load("Raycast")
local inventory = v3item.inventory

hackthrow = function(plr, itemname, itemguid, velocity, epos)
	if plr ~= LocalPlayer then
		return
	end
	task.spawn(function()
		local throwGuid = GUID()
		local success, stickyId =
			InvokeServer("throwSticky", throwGuid, itemname, itemguid, velocity, epos)
		if not success then
			return
		end
		local dummyPart = Instance.new("Part")
		dummyPart.Size = Vector3.new(2, 2, 2)
		dummyPart.Position = epos
		dummyPart.Anchored = true
		dummyPart.Transparency = 1
		dummyPart.CanCollide = true
		dummyPart.Parent = workspace
		local rayParams = RaycastParams.new()
		rayParams.FilterType = Enum.RaycastFilterType.Blacklist
		rayParams.FilterDescendantsInstances = { plr.Character, workspace.Game.Local, workspace.Game.Drones }
		local dist = (epos - plr.Character.Head.Position).Magnitude
		local rayResult = workspace:Raycast(
			plr.Character.Head.Position,
			(epos - plr.Character.Head.Position).Unit * (dist + 5),
			rayParams
		)
		if rayResult and rayResult.Instance then
			local hitPart = rayResult.Instance
			local relativeHitCFrame =
				hitPart.CFrame:ToObjectSpace(CFrame.new(rayResult.Position, rayResult.Position + rayResult.Normal))
			local stickyCFrame = CFrame.new(rayResult.Position)
			if dummyPart.Parent then
				dummyPart:Destroy()
			end
			getgenv().throwargs = {
				"hitSticky",
				stickyId or throwGuid,
				hitPart,
				relativeHitCFrame,
				stickyCFrame,
			}
			InvokeServer("hitSticky", stickyId or throwGuid, hitPart, relativeHitCFrame, stickyCFrame)
		else
			if dummyPart.Parent then
				dummyPart:Destroy()
			end
		end
	end)
end

getinventory = function()
	return inventory.items
end

finditem = function(string)
	for guid, data in next, getinventory() do
		if data.name == string or data.type == string or data.subtype == string then
			return data
		end
	end
end

executebladekill = function(plr, head)
	local item = finditem("Ninja Star")
	if item then
		FireServer("equip", item.guid)

		if not getgenv().throwargs then
			local spos = LocalPlayer.Character.RightHand.Position
			local epos = head.Position
			local velocity = (epos - spos).Unit * ((spos - epos).Magnitude * 15)
			task.spawn(InvokeServer, "attemptPurchaseAmmo", "Ninja Star")
			hackthrow(LocalPlayer, "Ninja Star", item.guid, velocity, epos)
		end

		if getgenv().throwargs then
			getgenv().throwargs[3] = head
			task.spawn(InvokeServer, unpack(getgenv().throwargs))
		end
	else
		task.spawn(InvokeServer, "attemptPurchase", "Ninja Star")
	end
end

RunService.Heartbeat:Connect(function()
	if bladeaura and HumanoidRootPart then
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr == LocalPlayer then
				continue
			end
			local char = plr.Character
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			local head = char and char:FindFirstChild("Head")
			local dist = (HumanoidRootPart.Position - head.Position).Magnitude
			if hum and hum.Health > 0 and head and dist < 190 then
				executebladekill(plr, head)
				break
			end
		end
	end
end)

local Tab = Window:Tab({
	Title = "通用",
})
Tab:Select()

Tab:Toggle({
	Title = "透视",
Value = false,
Callback = function(enableESP)
if enableESP then
local function ApplyESP(v)
if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
v.Character.Humanoid.NameDisplayDistance = 9e9
v.Character.Humanoid.NameOcclusion = "NoOcclusion"
v.Character.Humanoid.HealthDisplayDistance = 9e9
v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
v.Character.Humanoid.Health = v.Character.Humanoid.Health
end
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
for i, v in pairs(Players:GetPlayers()) do
ApplyESP(v)
v.CharacterAdded:Connect(function()
task.wait(0.33)
ApplyESP(v)
end)
end
Players.PlayerAdded:Connect(function(v)
ApplyESP(v)
v.CharacterAdded:Connect(function()
task.wait(0.33)
ApplyESP(v)
end)
end)
local espConnection = RunService.Heartbeat:Connect(function()
for i, v in pairs(Players:GetPlayers()) do
if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
v.Character.Humanoid.NameDisplayDistance = 9e9
v.Character.Humanoid.NameOcclusion = "NoOcclusion"
v.Character.Humanoid.HealthDisplayDistance = 9e9
v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
end
end
end)
_G.ESPConnection = espConnection
else
if _G.ESPConnection then
_G.ESPConnection:Disconnect()
_G.ESPConnection = nil
end
local Players = game:GetService("Players")
for i, v in pairs(Players:GetPlayers()) do
if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
v.Character.Humanoid.NameDisplayDistance = 100
v.Character.Humanoid.NameOcclusion = "OccludeAll"
v.Character.Humanoid.HealthDisplayDistance = 100
v.Character.Humanoid.HealthDisplayType = "DisplayWhenDamaged"
end
end
end
end
})

Tab:Toggle({
	Title = "自动穿甲",
Default = false,
Callback = function(Value)
AutoArmor = Value
if Value then
local heartbeat = game:GetService("RunService").Heartbeat
local connection
connection = heartbeat:Connect(function()
if not AutoArmor then
connection:Disconnect()
return
end
pcall(function()
local player = game:GetService('Players').LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
if humanoid and humanoid.Health > 35 then
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
local hasLightVest = false
for i, v in next, b1 do
if v.name == "Light Vest" then
hasLightVest = true
light = v.guid
local armor = player:GetAttribute('armor')
if armor == nil or armor <= 0 then
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("equip", light)
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("useConsumable", light)
require(game:GetService("ReplicatedStorage").devv).load("Signal").FireServer("removeItem", light)
end
break
end
end
if not hasLightVest then
require(game:GetService("ReplicatedStorage").devv).load("Signal").InvokeServer("attemptPurchase", "Light Vest")
end
end
end)
end)
end
end
})

Tab:Toggle({
	Title = "自动回血",
Default = false,
Callback = function(Value)
if healThread then
healThread:Disconnect()
healThread = nil
end
if Value then
local heartbeat = game:GetService("RunService").Heartbeat
healThread = heartbeat:Connect(function()
Signal.InvokeServer("attemptPurchase", 'Bandage')
for _, v in next, item.inventory.items do
if v.name == 'Bandage' then
local bande = v.guid
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
if Humanoid.Health >= 5 and Humanoid.Health < Humanoid.MaxHealth then
Signal.FireServer("equip", bande)
Signal.FireServer("useConsumable", bande)
Signal.FireServer("removeItem", bande)
end
break
end
end
end)
end
end
})

Tab:Toggle({
	Title = "自动面具",
Value = false,
Callback = function(state)
autokz = state
if autokz then
while autokz and wait(1) do
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local Mask = character:FindFirstChild("Hockey Mask")
local Signal = require(game:GetService("ReplicatedStorage").devv).load("Signal")
local b1 = require(game:GetService('ReplicatedStorage').devv).load('v3item').inventory.items
if not Mask then
Signal.InvokeServer("attemptPurchase", "Hockey Mask")
for i, v in next, b1 do
if v.name == "Hockey Mask" then
sugid = v.guid
if not Mask then
Signal.FireServer("equip", sugid)
Signal.FireServer("wearMask", sugid)
end
break
end
end
end
end
end
end
})

local Tab = Window:Tab({
	Title = "刷钱",
})
Tab:Select()

Tab:Toggle({
	Title = "自动ATM",
Default = false,
Callback = function(Value)
autoATMCashCombo = Value
if autoATMCashCombo then
local function collectCash()
local player = game:GetService("Players").LocalPlayer
local cashSize = Vector3.new(2, 0.2499999850988388, 1)
for _, part in ipairs(workspace.Game.Entities.CashBundle:GetDescendants()) do
if part:IsA("BasePart") and part.Size == cashSize then
player.Character.HumanoidRootPart.CFrame = part.CFrame
task.wait()
end
end
end
coroutine.wrap(function()
while autoATMCashCombo and task.wait() do
local ATMsFolder = workspace:FindFirstChild("ATMs")
local localPlayer = game:GetService("Players").LocalPlayer
local hasActiveATM = false
if ATMsFolder and localPlayer.Character then
for _, atm in ipairs(ATMsFolder:GetChildren()) do
if atm:IsA("Model") then
local hp = atm:GetAttribute("health")
if hp ~= 0 then
hasActiveATM = true
for _, part in ipairs(atm:GetChildren()) do
if part.Name == "Main" and part:IsA("BasePart") then
localPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
task.wait()
atm:SetAttribute("health", 0)
break
end
end
task.wait()
end
end
end
end
if hasActiveATM then
task.wait(1)
else
collectCash()
task.wait()
end
end
end)()
end
end
})

Tab:Toggle({
	Title = "自动抢银行",
Value = false,
Callback = function(state)
autobank = state
if autobank then
startBankRobberyLoop()
else
stopBankRobberyLoop()
end
end
})

Tab:Toggle({
	Title = "现金光环",
Value = false,
Callback = function(state)
cashAuraEnabled = state
if state then
task.spawn(function()
while cashAuraEnabled do
for _, cash in pairs(Workspace.Game.Entities.CashBundle:GetChildren()) do
if not cashAuraEnabled then break end
if cash:FindFirstChildOfClass("Part") then
local part = cash:FindFirstChildOfClass("Part")
local distance = (HumanoidRootPart.Position - part.Position).magnitude
if distance <= 30 and cash:FindFirstChildOfClass("ClickDetector") then
fireclickdetector(cash:FindFirstChildOfClass("ClickDetector"))
end
end
end
task.wait(0.1)
end
end)
end
end
})

Tab:Toggle({
	Title = "自动捡钱",
Default = false,
Callback = function(Value)
setting.autoMoney = Value
if Value then
task.spawn(function()
while setting.autoMoney and task.wait(0.1) do
fastCollectMoney()
end
end)
end
end
})

local Tab = Window:Tab({
	Title = "免费通行证",
})
Tab:Select()

Tab:Toggle({
	Title = "绕过移动经销商[新版本]",
Callback = function()
local pjyd pjyd=hookmetamethod(game,"__namecall",function(self,...)local args={...}local method=getnamecallmethod()if method=="InvokeServer" and args[2]==true then args[2]=false return pjyd(self,unpack(args))end return pjyd(self,...)end)
game:GetService("Players").LocalPlayer:SetAttribute("mobileDealer",true)
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local mobileDealer=require(ReplicatedStorage.devv.shared.Indicies.mobileDealer)
for category,items in pairs(mobileDealer)do
for _,item in ipairs(items)do
item.stock=999999
end
end
table.insert(mobileDealer.Gun,{itemName="Acid Gun",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Candy Bucket",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Golden Rose",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Black Rose",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Dollar Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Bat Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Bunny Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Clover Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Ghost Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Gold Clover Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Heart Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Skull Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Snowflake Balloon",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Admin AK-47",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Admin Nuke Launcher",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Admin RPG",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Void Gem",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Pulse Rifle",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Unusual Money Printer",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Money Printer",stock=9999})
table.insert(mobileDealer.Gun,{itemName="Trident",stock=9999})
table.insert(mobileDealer.Gun,{itemName="NextBot Grenade",stock=9999})
table.insert(mobileDealer.Gun,{itemName="El Fuego",stock=9999})
end
})

Tab:Toggle({
	Title = "绕过高级表情包",
Callback = function()
for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Emotes.Frame.ScrollingFrame:GetDescendants()) do
if v.Name == "Locked" then
v.Visible = false
end
end
end
})

Tab:Toggle({
	Title = "绕过物品栏封禁",
Callback = function()
if game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion") then
game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion"):Destroy()
end
end
})

Tab:Toggle({
	Title = "绕过飞行检测",
Callback = function()
if game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion") then
game:GetService("ReplicatedStorage"):FindFirstChild("devv"):FindFirstChild("remoteStorage"):FindFirstChild("makeExplosion"):Destroy()
end
end
})
	