local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local theme = {
    SchemeColor = Color3.fromRGB(119, 0, 199),
    Background = Color3.fromRGB(47, 34, 48),
    Header = Color3.fromRGB(36, 28, 41),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(47, 29, 48)
}
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
function notification(title, text, timee)
    task.spawn(function()
        local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 5;notif:Play();notif.Stopped:Wait();notif:Destroy()
    end)
    Notification:Notify(
        {Title = title, Description = text},
        {OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "image"},
        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
    )
end

local window = Library.CreateLib("Tulrium | Doors But-Bad", theme)
local main = window:NewTab("Main")
local render = window:NewTab("Render")
local player = window:NewTab("Player")
local automatics = window:NewTab("Automatics")
local espSection = render:NewSection("Esp")
local playerSection = player:NewSection("Player")
local automaticSection = automatics:NewSection("Automatics")
local mainSection = main:NewSection("Main")

local Players = game:GetService("Players")
local chr = Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
Lighting = game:GetService("Lighting")
local noclip = false

local ColorFill

local ColorOutline

local function ApplyEntityChams(inst, enable)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(ColorFill)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(ColorOutline)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Enabled = enable
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyKeyChams(inst, enable)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Adornee = inst
    Cham.Enabled = enable
    Cham.RobloxLocked = true
    return Cham
end

playerSection:NewSlider("WalkSpeed", "WalkSpeed", 25, 1, function(s) -- 25 (MaxValue) | 1 (MinValue)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s * 3
end)

playerSection:NewSlider("Fov", "Camera Fov", 150, 70, function(s) -- 25 (MaxValue) | 1 (MinValue)
	workspace.CurrentCamera.FieldOfView = s
end)

playerSection:NewToggle("Unlock Camera", "Camera Unlocked", function(state)
	if state then
		notification("Unlock Camera", "Unlock Camera Enabled", 3)
		Players.LocalPlayer.CameraMaxZoomDistance = 25
		Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
	else
		notification("Unlock Camera", "Unlock Camera Enabled", 3)
		Players.LocalPlayer.CameraMaxZoomDistance = 0.5
		Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	end
end)

playerSection:NewToggle("NoClip (Beta)", "NoClipping", function(state)
    if state then
		notification("Noclip", "Noclip Enabled", 3)
    else
		notification("Noclip", "Noclip Disabled", 3)
	end
end)

playerSection:NewButton("Remove Barriers", "Remove Barriers", function()
	notification("Remove Barriers", "Bariiers Removed", 3)
	game:GetService("Workspace")["Kill brick"]:Destroy()
	game:GetService("Workspace")["Kill brick"]:Destroy()
	game:GetService("Workspace")["Kill brick"]:Destroy()
	game:GetService("Workspace")["Kill brick"]:Destroy()
	game:GetService("Workspace")["Kill brick"]:Destroy()
	game:GetService("Workspace").HurtBrick:Destroy()
	game:GetService("Workspace").HurtBrick:Destroy()
	game:GetService("Workspace").HurtBrick:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").Couch:Destroy()
	game:GetService("Workspace").CouchFly:Destroy()
	game:GetService("Workspace").CouchFly1:Destroy()
	game:GetService("Workspace").CouchFly2:Destroy()
	game:GetService("Workspace").CouchFly3:Destroy()
	game:GetService("Workspace").CouchFly4:Destroy()
	game:GetService("Workspace").CouchFly5:Destroy()
	game:GetService("Workspace").CouchFly6:Destroy()
	game:GetService("Workspace").hand1:Destroy()
	game:GetService("Workspace").hand2:Destroy()
	game:GetService("Workspace").hand3:Destroy()
	game:GetService("Workspace").hand4:Destroy()
	game:GetService("Workspace")["falling shelf1"]:Destoy()
	game:GetService("Workspace")["falling shelf2"]:Destoy()
	game:GetService("Workspace")["falling shelf3"]:Destoy()
	game:GetService("Workspace")["falling shelf4"]:Destoy()
	game:GetService("Workspace")["falling shelf5"]:Destoy()
	game:GetService("Workspace")["falling shelf6"]:Destoy()
	game:GetService("Workspace")["falling shelf7"]:Destoy()
	game:GetService("Workspace")["falling shelf8"]:Destoy()
	game:GetService("Workspace")["falling shelf9"]:Destoy()
	game:GetService("Workspace")["falling shelf10"]:Destoy()
	game:GetService("Workspace")["falling shelf11"]:Destoy()
	game:GetService("Workspace")["falling shelf12"]:Destoy()
	game:GetService("Workspace")["falling shelf13"]:Destoy()
	game:GetService("Workspace")["falling shelf14"]:Destoy()
	game:GetService("Workspace")["falling shelf15"]:Destoy()
	game:GetService("Workspace")["falling shelf16"]:Destoy()
	game:GetService("Workspace")["falling shelf17"]:Destoy()
end)

playerSection:NewToggle("Anti Seek (Beta)", "Remove Seek", function(state)
    if state then
		notification("Anti Seek", "Anti Seek Enabled", 3)
		game:GetService("Workspace")["boss1"]:Destroy()
		game:GetService("Workspace")["boss1again"]:Destroy()
		game:GetService("Workspace")["boss1again2"]:Destroy()
    else
		notification("Anti Seek", "Anti Seek Disabled", 3)
	end
end)

playerSection:NewToggle("Anti Figure (Beta)", "Remove Figure", function(state)
    if state then
		notification("Anti Figure", "Anti Figure Enabled", 3)
		game:GetService("Workspace")["the figure"]:Destroy()
		game:GetService("Workspace")["the figure2"]:Destroy()
    else
		notification("Anti Figure", "Anti Figure Disabled", 3)
	end
end)

playerSection:NewToggle("Anti Ambush (Beta)", "Remove Ambush", function(state)
    if state then
		notification("Anti Ambush", "Anti Ambush Enabled", 3)
		game:GetService("Workspace")["Sneak Attack"]:Destroy()
    else
		notification("Anti Ambush", "Anti Ambush Disabled", 3)
	end
end)

playerSection:NewToggle("Anti Rush (Beta)", "Remove Rush", function(state)
    if state then
		notification("Anti Rush", "Anti Rush Enabled", 3)
		game:GetService("Workspace")["Rush"]:Destroy()
		game:GetService("Workspace")["Rush2"]:Destroy()
		game:GetService("Workspace")["Rushtest"]:Destroy()
    else
		notification("Anti Rush", "Anti Rush Disabled", 3)
	end
end)

playerSection:NewToggle("Anti Whiz (Beta)", "Remove Whiz", function(state)
    if state then
		notification("Anti Whiz", "Anti Whiz Enabled", 3)
		game:GetService("Workspace")["Whiz"]:Destroy()
    else
		notification("Anti Whiz", "Anti Whiz Disabled", 3)
	end
end)

playerSection:NewToggle("Anti Halt (Beta)", "Remove Halt", function(state)
    if state then
		notification("Anti Halt", "Anti Halt Enabled", 3)
		game:GetService("Workspace")["Aura"]:Destroy()
    else
		notification("Anti Halt", "Anti Halt Disabled", 3)
	end
end)

espSection:NewColorPicker("Esp Color Fill", "Color on Esp Fill", Color3.fromRGB(1, 0, 0), function(color)
    ColorFill = color
end)

espSection:NewColorPicker("Esp Color Outline", "Color on Esp Outline", Color3.fromRGB(0.792156, 0.792156, 0.792156), function(color)
    ColorOutline = color
end)

espSection:NewToggle("Figure Esp", "Esp on Entity Figure", function(state)
    if state then
		notification("Figure Esp", "Esp Enabled", 3)
		task.spawn(function()
        	local Entity = game:GetService("Workspace")["the figure"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, true))
		end)

		task.spawn(function()
			local Entity = game:GetService("Workspace")["the figure2"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, true))
		end)
    else
		notification("Figure Esp", "Esp Disabled", 3)
		task.spawn(function()
        	local Entity = game:GetService("Workspace")["the figure"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, false))
		end)

		task.spawn(function()
			local Entity = game:GetService("Workspace")["the figure2"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, false))
		end)
    end
end)

espSection:NewToggle("Seek Esp", "Esp on Entity Seek", function(state)
    if state then
		notification("Seek Esp", "Esp Enabled", 3)
		task.spawn(function()
        	local Entity = game:GetService("Workspace")["boss1"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, true))
		end)

		task.spawn(function()
			local Entity = game:GetService("Workspace")["boss1again"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, true))
		end)

		task.spawn(function()
			local Entity = game:GetService("Workspace")["boss1again2"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, true))
		end)
    else
		notification("Seek Esp", "Esp Disabled", 3)
		task.spawn(function()
        	local Entity = game:GetService("Workspace")["boss1"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, false))
		end)

		task.spawn(function()
			local Entity = game:GetService("Workspace")["boss1again"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, false))
		end)

		task.spawn(function()
			local Entity = game:GetService("Workspace")["boss1again2"]
    		Entity:WaitForChild("Torso",2.5)
    		table.insert(ApplyEntityChams(Entity, false))
		end)
    end
end)

espSection:NewToggle("Ambush Esp", "Esp on Entity Ambush", function(state)
    if state then
		notification("Ambush Esp", "Esp Enabled", 3)
        local Entity = game:GetService("Workspace")["Sneak Attack"]
    	Entity:WaitForChild("Torso",2.5)
    	table.insert(ApplyEntityChams(Entity, true))
    else
		notification("Ambush Esp", "Esp Disabled", 3)
        local Entity = game:GetService("Workspace")["Sneak Attack"]
    	Entity:WaitForChild("Torso",2.5)
    	table.insert(ApplyEntityChams(Entity, false))
    end
end)

espSection:NewToggle("Rush Esp", "Esp on Entity Rush", function(state)
    if state then
		notification("Rush Esp", "Esp Enabled", 3)
        task.spawn(function()
			local Entity = game:GetService("Workspace")["Rush"]
			Entity:WaitForChild("Torso", 2.5)
			table.insert(ApplyEntityChams(Entity, true));
		end)
		
		task.spawn(function()  
			local Entity = game:GetService("Workspace")["Rush2"]
			Entity:WaitForChild("Torso", 2.5)
			table.insert(ApplyEntityChams(Entity, true));     
		end)         
		
		task.spawn(function()   
			local Entity = game:GetService("Workspace")["Rushtest"]
			Entity:WaitForChild("Torso", 2.5)
			table.insert(ApplyEntityChams(Entity, true));
		end)
    else
		notification("Rush Esp", "Esp Disabled", 3)
        task.spawn(function()
			local Entity = game:GetService("Workspace")["Rush"]
			Entity:WaitForChild("Torso", 2.5)
			table.insert(ApplyEntityChams(Entity, false));
		end)
		
		task.spawn(function()  
			local Entity = game:GetService("Workspace")["Rush2"]
			Entity:WaitForChild("Torso", 2.5)
			table.insert(ApplyEntityChams(Entity, false));     
		end)         
		
		task.spawn(function()   
			local Entity = game:GetService("Workspace")["Rushtest"]
			Entity:WaitForChild("Torso", 2.5)
			table.insert(ApplyEntityChams(Entity, false));
		end)
    end
end)

espSection:NewToggle("Whiz Esp", "Esp on Entity Whiz", function(state)
    if state then
		notification("Whiz Esp", "Esp Enabled", 3)
        local Entity = game:GetService("Workspace")["Whiz"]
    	Entity:WaitForChild("Torso",2.5)
    	table.insert(ApplyEntityChams(Entity, true))
    else
		notification("Whiz Esp", "Esp Disabled", 3)
        local Entity = game:GetService("Workspace")["Whiz"]
    	Entity:WaitForChild("Torso",2.5)
    	table.insert(ApplyEntityChams(Entity, false))
    end
end)

espSection:NewToggle("Vitamins Esp", "Esp on Item Vitamins", function(state)
    if state then
		notification("Vitamins Esp", "Esp Enabled", 3)
		task.spawn(function()
        	local Item = game:GetService("Workspace")["Vitamins"]
    		table.insert(ApplyEntityChams(Item, true))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Vitamins"]
    		table.insert(ApplyEntityChams(Item, true))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Vitamins"]
    		table.insert(ApplyEntityChams(Item, true))
		end)
    else
		notification("Vitamins Esp", "Esp Disabled", 3)
		task.spawn(function()
        	local Item = game:GetService("Workspace")["Vitamins"]
    		table.insert(ApplyEntityChams(Item, false))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Vitamins"]
    		table.insert(ApplyEntityChams(Item, false))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Vitamins"]
    		table.insert(ApplyEntityChams(Item, false))
		end)
    end
end)

espSection:NewToggle("Yellow Key Esp", "Esp on Item Yellow Key", function(state)
    if state then
		notification("Yellow Key Esp", "Esp Enabled", 3)
		task.spawn(function()
        	local Item = game:GetService("Workspace")["Yellow Key"]
    		table.insert(ApplyEntityChams(Item, true))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Yellow Key"]
    		table.insert(ApplyEntityChams(Item, true))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Yellow Key"]
    		table.insert(ApplyEntityChams(Item, true))
		end)
    else
		notification("Yellow Key Esp", "Esp Disabled", 3)
		task.spawn(function()
        	local Item = game:GetService("Workspace")["Yellow Key"]
    		table.insert(ApplyEntityChams(Item, false))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Yellow Key"]
    		table.insert(ApplyEntityChams(Item, false))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Yellow Key"]
    		table.insert(ApplyEntityChams(Item, false))
		end)
    end
end)

espSection:NewToggle("Lighter Esp", "Esp on Lighter", function(state)
    if state then
		notification("Lighter Esp", "Esp Enabled", 3)
		task.spawn(function()
			local Item = game:GetService("Workspace")["Lighter"]
    		table.insert(ApplyEntityChams(Item, true))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Lighter"]
    		table.insert(ApplyEntityChams(Item, true))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Lighter"]
    		table.insert(ApplyEntityChams(Item, true))
		end)
    else
		notification("Lighter Esp", "Esp Disabled", 3)
        task.spawn(function()
			local Item = game:GetService("Workspace")["Lighter"]
    		table.insert(ApplyEntityChams(Item, false))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Lighter"]
    		table.insert(ApplyEntityChams(Item, false))
		end)

		task.spawn(function()
			local Item = game:GetService("Workspace")["Lighter"]
    		table.insert(ApplyEntityChams(Item, false))
		end)
    end
end)

espSection:NewToggle("Jeck Esp", "Esp on Entity Jeck", function(state)
    if state then
		notification("Jeck Esp", "Esp Enabled", 3)
        local Item = game:GetService("Workspace")["Closet12"]
    	table.insert(ApplyEntityChams(Item, true))
    else
		notification("Jeck Esp", "Esp Disabled", 3)
        local Item = game:GetService("Workspace")["Closet12"]
    	table.insert(ApplyEntityChams(Item, false))
    end
end)

automaticSection:NewButton("Auto Door 50", "Automatics 50 Door", function(state)
	notification("Automatics", "Auto Door 50 Complete", 3)
	fireclickdetector(workspace["Code door"].KeyPad.B4.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B9.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B2.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B8.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B5.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.Enter.ClickDetector)
end)

automaticSection:NewKeybind("Auto Door 50", "Automatics 50 Door", Enum.KeyCode.G, function()
    notification("Automatics", "Auto Door 50 Complete", 3)
	fireclickdetector(workspace["Code door"].KeyPad.B4.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B9.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B2.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B8.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.B5.ClickDetector)
	wait(0.01)
	fireclickdetector(workspace["Code door"].KeyPad.Enter.ClickDetector)
end)

automaticSection:NewButton("Auto Complete", "Automatics Complete Door But Bad", function(state)
	notification("Auto Complete", "Doors But Bad Complete", 3)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-813.7225952148438, 10010.5078125, -572.12548828125)
	wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-778.650634765625, 10018.9970703125, -584.8890991210938)
	print("Doors But Bad Complete")
end)

mainSection:NewKeybind("UI", "Binds UI", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)