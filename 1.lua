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
	Title = "此脚本为开源免费",
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
	Title = "速度倍数",
Desc = "调整移动速度倍数",
Value = {
Min = 1,
Max = 30,
Default = 1
},
Callback = function(value)
speedMultiplier = value
LocalPlayer:SetAttribute("speedModifier", speedMultiplier)
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