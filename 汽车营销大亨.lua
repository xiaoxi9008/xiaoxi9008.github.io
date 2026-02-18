local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zephyr688/Lua-Script/refs/heads/main/UI"))()
local window = library:new("大司马｜汽车经销大亨")
local Tab1 = window:Tab("功能1", "10882439086")
local Section2 = Tab1:section("自动功能")
local Section = Tab1:section("比赛功能")

Section2:Toggle("自动刷钱",'Toggleflag',false,function(dsd)
    Auto = dsd
		task.spawn(function()
			while task.wait() do
				if not Auto then
					break
				end
local part = Instance.new("Part")
part.Position = Vector3.new(0,60,0)
part.Size = Vector3.new(1000,5,1000)
part.Anchored = true
part.Name = "Keaths Platform"
part.CollisionGroupId = 5
part.Parent = workspace

local part2 = Instance.new("Part")
part.Position = Vector3.new(0,10,0)
part.Size = Vector3.new(1000,5,1000)
part.Anchored = true
part.Name = "Keaths Platform"
part.CollisionGroupId = 5
part.Parent = workspace

local part3 = Instance.new("Part")
part.Position = Vector3.new(0,99,0)
part.Size = Vector3.new(1000,5,1000)
part.Anchored = true
part.Name = "Keaths Platform"
part.CollisionGroupId = 5
part.Parent = workspace

while true do
    wait(0.1)
    local chr = game.Players.LocalPlayer.Character
    local car = chr.Humanoid.SeatPart.Parent.Parent
    car:PivotTo(CFrame.new(0,0,0))
    wait(0.81)
    car:PivotTo(part.CFrame)
    wait(1)
        car:PivotTo(part2.CFrame)
wait(1)
    car:PivotTo(part3.CFrame)
end
		end
    end)
end)

Section2:Toggle("自动建造",'Toggleflag',false,function(state)
    getfenv().buyer = (state and true or false )
while getfenv().buyer do
task.wait()
local function plot()
    for i,v in pairs(workspace.Tycoons:GetDescendants()) do
    if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == game.Players.LocalPlayer.Name then
    tycoon = v.Parent
    end
    end
    return tycoon
    end
    pcall(function()
    for i,v in pairs(plot().Dealership.Purchases:GetChildren()) do 
        if getfenv().buyer == true and v.TycoonButton.Button.Transparency == 0 then
    game:GetService("ReplicatedStorage").Remotes.Build:FireServer("BuyItem", v.Name)
    wait(0.3)
    end 
end   
end)
end
end)

Section:Toggle("自动完成赛季11比赛",'Toggleflag',false,function(dsd)
    season = dsd
		task.spawn(function()
			while task.wait() do
				if not season then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.Season.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "20" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "20" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
		end)
end)

Section:Toggle("自动完成圆形赛",'Toggleflag',false,function(dsd)
    oval = dsd
		task.spawn(function()
			while task.wait() do
				if not oval then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.Race.Oval.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "4" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "4" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
        end)
end)

Section:Toggle("自动完成卡丁车赛",'Toggleflag',false,function(dsd)
    gokart = dsd
		task.spawn(function()
			while task.wait() do
				if not gokart then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.Race.Gokart.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "9" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "9" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
	    end)
end)

Section:Toggle("自动完成转圈赛",'Toggleflag',false,function(dsd)
     circuit = dsd
		task.spawn(function()
			while task.wait() do
				if not circuit then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.Race.Circuit.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "13" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "13" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
	    end)
end)

Section:Toggle("自动完成漂移赛",'Toggleflag',false,function(state)
    _G.racetest3 = (state and true or false)
            if _G.racetest3 == false then
            local distance = math.huge
            for a,b in pairs(workspace.DriftTrack:GetDescendants()) do
                if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
            local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
            if Dist < distance then
            distance = Dist
            partvelo = b
            end
            end
            end
            partvelo.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*0
        end
            while _G.racetest3 do
                wait()
            if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                local chr = game.Players.LocalPlayer.Character
            local car = chr.Humanoid.SeatPart.Parent.Parent
             car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
             car.Engine.Velocity = Vector3.new(0,0,0)
             chr.Head.Anchored = true
             car.Engine.Velocity = Vector3.new(0,0,0)
             wait(1)
             car.Engine.Velocity = Vector3.new(0,0,0)
             chr.Head.Anchored = false
             car.Engine.Velocity = Vector3.new(0,0,0)
             wait(1)
             workspace.Races.RaceHandler.StartLobby:FireServer("Drift")
             partvelo = nil
             repeat wait()
                if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125)) > 10 then
                car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
                car.Engine.Velocity = Vector3.new(0,0,0)
                wait(0.1)
                workspace.Races.RaceHandler.StartLobby:FireServer("Drift")
                end
             until game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true or _G.racetest3 == false
             elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
    if partvelo == nil then
local distance = math.huge
for a,b in pairs(workspace.DriftTrack:GetDescendants()) do
    if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
if Dist < distance then
distance = Dist
partvelo = b
end
end
end
partvelo.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector*1000
end
if game.Players.LocalPlayer:DistanceFromCharacter(partvelo.Position) > 10 then
    local chr = game.Players.LocalPlayer.Character
    local car = chr.Humanoid.SeatPart.Parent.Parent
    car:PivotTo(partvelo.CFrame)
end
task.wait()
end
end
end)

Section:Toggle("自动完成警察抓小偷赛",'Toggleflag',false,function(dsd)
    police = dsd
		task.spawn(function()
			while task.wait() do
				if not police then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.Police.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "18" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "18" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
		end)
end)

Section:Toggle("自动完成城市赛",'Toggleflag',false,function(dsd)
    city = dsd
		task.spawn(function()
			while task.wait() do
				if not city then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.City.City.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "17" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "17" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
		end)
end)

Section:Toggle("自动完成公路赛",'Toggleflag',false,function(dsd)
    highway = dsd
		task.spawn(function()
			while task.wait() do
				if not highway then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.City.Highway.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "23" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "23" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
		end)
end)

Section:Toggle("自动完成山脉赛",'Toggleflag',false,function(dsd)
    mountain = dsd
		task.spawn(function()
			while task.wait() do
				if not mountain then
					break
				end
				for i, v in pairs(game:GetService("Workspace").Races.Mountain.Checkpoints:GetDescendants()) do
					if v.Name == "IsActive" and v.Value == true and v.Parent.Name ~= "26" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
					elseif v.Name == "IsActive" and v.Value == true and v.Parent.Name == "26" then
						local chr = game:GetService("Players").LocalPlayer.Character
						local car = chr.Humanoid.SeatPart.Parent.Parent
						car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
						task.wait(0.2)
						car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
					end
					task.wait(0.2)
				end
			end
		end)
end)

Section:Toggle("自动完成海绵赛",'Toggleflag',false,function(dsd)
    Sponge = dsd
		task.spawn(function()
			while task.wait() do
				if not Sponge then
					break
				end
    local chr = game.Players.LocalPlayer.Character
    local car = chr.Humanoid.SeatPart.Parent.Parent
    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["1"].Checkpoint.CFrame)
    wait(1)
    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["2"].Checkpoint.CFrame)
    wait(0.1)
        car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["3"].Checkpoint.CFrame)
    wait(1)
    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["4"].Checkpoint.CFrame)
        wait(0.1)

    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["5"].Checkpoint.CFrame)
    wait(1)
    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["6"].Checkpoint.CFrame)
        wait(0.1)

    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["7"].Checkpoint.CFrame)
    wait(1)
    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["8"].Checkpoint.CFrame)

    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["9"].Checkpoint.CFrame)
    wait(1)
    car:PivotTo(workspace.Races.SpongeBobRace.Checkpoints["10"].Checkpoint.CFrame)
wait(0.2)
    car:PivotTo(part.CFrame)
end
		end)
end)