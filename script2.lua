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
local window = Library.CreateLib("Tulrium | Arsenal", theme)
local rageBot = window:NewTab("RageBot")
local antiAim = window:NewTab("Anti Aim")
local legitBot = window:NewTab("LegitBot")
local players = window:NewTab("Players")
local weapon = window:NewTab("Weapon")
local world = window:NewTab("World")
local view = window:NewTab("View")
local main = window:NewTab("Main")
local configs = window:NewTab("Configs")
local playerSection = players:NewSection("Players")
local rageMainSection = rageBot:NewSection("Main")
local rageExploisSection = rageBot:NewSection("Exploits")
local rageMiscSection = rageBot:NewSection("Misc")
local legitMainSection = legitBot:NewSection("Main")
local rageAimSection = legitBot:NewSection("Aim")
local antiAimMainSection = antiAim:NewSection("Main")
local antiAimFakeAngleSection = antiAim:NewSection("Fake Angle")
local playersEspSection = players:NewSection("ESP")
local playersChamsSection = players:NewSection("Chams")
local playersGlowSection = players:NewSection("Glow")
local viewMainSection = view:NewSection("Main")

local Players = game:GetService("Players")
local chr = Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
Lighting = game:GetService("Lighting")

local antiAimList = {
    "Forward",
    "Spin"
}

legitMainSection:NewToggle("Aim", "", function(state)
    local CurrentCamera = workspace.CurrentCamera
    local Players = game.Players
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    function ClosestPlayer()
        local MaxDist, Closest = math.huge
        for I,V in pairs(Players.GetPlayers(Players)) do
            if V == LocalPlayer then continue end
            if V.Team == LocalPlayer then continue end
            if not V.Character then continue end
            local Head = V.Character.FindFirstChild(V.Character, "Head")
            if not Head then continue end
            local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
            if not Vis then continue end
            local MousePos, TheirPos = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2), Vector2.new(Pos.X, Pos.Y)
            local Dist = (TheirPos - MousePos).Magnitude
            if Dist < MaxDist then
                MaxDist = Dist
                Closest = V
            end
        end
        return Closest
    end
    local MT = getrawmetatable(game)
    local OldNC = MT.__namecall
    local OldIDX = MT.__index
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
        local Args, Method = {...}, getnamecallmethod()
        if Method == "FindPartOnRayWithIgnoreList" and not checkcaller() then
            local CP = ClosestPlayer()
            if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, "Head") then
                Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character.Head.Position - CurrentCamera.CFrame.Position).Unit * 1000)
                return OldNC(self, unpack(Args))
            end
        end
        return OldNC(self, ...)
    end)
    MT.__index = newcclosure(function(self, K)
        if K == "Clips" then
            return workspace.Map
        end
        return OldIDX(self, K)
    end)
    setreadonly(MT, true)
end)

playersEspSection:NewToggle("Enable ESP", "", function(box)
    local function API_Check()

        if Drawing == nil then

            return "No"
        else
            return "Yes"
        end
    end
    
    local Find_Required = API_Check()
    
    if Find_Required == "No" then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "An error lol";
            Text = "Boxes script could not be loaded because your exploit is unsupported.";
            Duration = math.huge;
            Button1 = "OK"
        })
    
        return
    end
    
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera
    
    local Typing = false
    
    _G.SendNotifications = false   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
    _G.DefaultSettings = false   -- If set to true then the boxes script would run with default settings regardless of any changes you made.
    
    _G.TeamCheck = true   -- If set to true then the script would create boxes only for the enemy team members.
    
    _G.BoxesVisible = box   -- If set to true then the boxes will be visible and vice versa.
    _G.LineColor = Color3.fromRGB(255, 255, 255)   -- The color that the boxes would appear as.
    _G.LineThickness = 1   -- The thickness of the boxes.
    _G.LineTransparency = 0.7   -- The transparency of the boxes.
    _G.SizeIncrease = 1   -- How much the box's size is increased (The size is multiplied by the value of this variable). (1 is default, anything more then 2 is not recommended) <float> / <int>
    
    _G.DisableKey = Enum.KeyCode.RightAlt   -- The key that disables / enables the boxes.
    
    local function CreateBoxes()
        for _, v in next, Players:GetPlayers() do
            if v.Name ~= Players.LocalPlayer.Name then
                local TopLeftLine = Drawing.new("Line")
                local TopRightLine = Drawing.new("Line")
                local BottomLeftLine = Drawing.new("Line")
                local BottomRightLine = Drawing.new("Line")
    
                RunService.RenderStepped:Connect(function()
                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 
                        TopLeftLine.Thickness = _G.LineThickness
                        TopLeftLine.Transparency = _G.LineTransparency
                        TopLeftLine.Color = _G.LineColor
    
                        TopRightLine.Thickness = _G.LineThickness
                        TopRightLine.Transparency = _G.LineTransparency
                        TopRightLine.Color = _G.LineColor
    
                        BottomLeftLine.Thickness = _G.LineThickness
                        BottomLeftLine.Transparency = _G.LineTransparency
                        BottomLeftLine.Color = _G.LineColor
    
                        BottomRightLine.Thickness = _G.LineThickness
                        BottomRightLine.Transparency = _G.LineTransparency
                        BottomRightLine.Color = _G.LineColor
                        
                        local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease
    
                        local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                        local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                        local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
                        local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
    
                        if TopLeftVisible == true then
                            TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                            TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= v.Team then
                                    TopLeftLine.Visible = _G.BoxesVisible
                                else
                                    TopLeftLine.Visible = false
                                end
                            else
                                TopLeftLine.Visible = _G.BoxesVisible
                            end
                        else
                            TopLeftLine.Visible = false
                        end
    
                        if TopRightVisible == true and _G.BoxesVisible == true then
                            TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                            TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= v.Team then
                                    TopRightLine.Visible = _G.BoxesVisible
                                else
                                    TopRightLine.Visible = false
                                end
                            else
                                TopRightLine.Visible = _G.BoxesVisible
                            end
                        else
                            TopRightLine.Visible = false
                        end
    
                        if BottomLeftVisible == true and _G.BoxesVisible == true then
                            BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                            BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= v.Team then
                                    BottomLeftLine.Visible = _G.BoxesVisible
                                else
                                    BottomLeftLine.Visible = false
                                end
                            else
                                BottomLeftLine.Visible = _G.BoxesVisible
                            end
                        else
                            BottomLeftLine.Visible = false
                        end
    
                        if BottomRightVisible == true and _G.BoxesVisible == true then
                            BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                            BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= v.Team then
                                    BottomRightLine.Visible = _G.BoxesVisible
                                else
                                    BottomRightLine.Visible = false
                                end
                            else
                                BottomRightLine.Visible = _G.BoxesVisible
                            end
                        else
                            BottomRightLine.Visible = false
                        end
                    else
                        TopRightLine.Visible = false
                        TopLeftLine.Visible = false
                        BottomLeftLine.Visible = false
                        BottomRightLine.Visible = false
                    end
                end)
    
                Players.PlayerRemoving:Connect(function()
                    TopRightLine.Visible = false
                    TopLeftLine.Visible = false
                    BottomLeftLine.Visible = false
                    BottomRightLine.Visible = false
                end)
            end
        end
    
        Players.PlayerAdded:Connect(function(Player)
            Player.CharacterAdded:Connect(function(v)
                if v.Name ~= Players.LocalPlayer.Name then
                    local TopLeftLine = Drawing.new("Line")
                    local TopRightLine = Drawing.new("Line")
                    local BottomLeftLine = Drawing.new("Line")
                    local BottomRightLine = Drawing.new("Line")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then 
                            TopLeftLine.Thickness = _G.LineThickness
                            TopLeftLine.Transparency = _G.LineTransparency
                            TopLeftLine.Color = _G.LineColor
        
                            TopRightLine.Thickness = _G.LineThickness
                            TopRightLine.Transparency = _G.LineTransparency
                            TopRightLine.Color = _G.LineColor
        
                            BottomLeftLine.Thickness = _G.LineThickness
                            BottomLeftLine.Transparency = _G.LineTransparency
                            BottomLeftLine.Color = _G.LineColor
        
                            BottomRightLine.Thickness = _G.LineThickness
                            BottomRightLine.Transparency = _G.LineTransparency
                            BottomRightLine.Color = _G.LineColor
                            
                            local HumanoidRootPart_Position, HumanoidRootPart_Size = workspace[v.Name].HumanoidRootPart.CFrame, workspace[v.Name].HumanoidRootPart.Size * _G.SizeIncrease
        
                            local TopLeftPosition, TopLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                            local TopRightPosition, TopRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X,  HumanoidRootPart_Size.Y, 0).p)
                            local BottomLeftPosition, BottomLeftVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
                            local BottomRightPosition, BottomRightVisible = Camera:WorldToViewportPoint(HumanoidRootPart_Position * CFrame.new(-HumanoidRootPart_Size.X, -HumanoidRootPart_Size.Y, 0).p)
        
                            if TopLeftVisible == true then
                                TopLeftLine.From = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                TopLeftLine.To = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= Player.Team then
                                        TopLeftLine.Visible = _G.BoxesVisible
                                    else
                                        TopLeftLine.Visible = false
                                    end
                                else
                                    TopLeftLine.Visible = _G.BoxesVisible
                                end
                            else
                                TopLeftLine.Visible = false
                            end
        
                            if TopRightVisible == true and _G.BoxesVisible == true then
                                TopRightLine.From = Vector2.new(TopRightPosition.X, TopRightPosition.Y)
                                TopRightLine.To = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= Player.Team then
                                        TopRightLine.Visible = _G.BoxesVisible
                                    else
                                        TopRightLine.Visible = false
                                    end
                                else
                                    TopRightLine.Visible = _G.BoxesVisible
                                end
                            else
                                TopRightLine.Visible = false
                            end
        
                            if BottomLeftVisible == true and _G.BoxesVisible == true then
                                BottomLeftLine.From = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                BottomLeftLine.To = Vector2.new(TopLeftPosition.X, TopLeftPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= Player.Team then
                                        BottomLeftLine.Visible = _G.BoxesVisible
                                    else
                                        BottomLeftLine.Visible = false
                                    end
                                else
                                    BottomLeftLine.Visible = _G.BoxesVisible
                                end
                            else
                                BottomLeftLine.Visible = false
                            end
        
                            if BottomRightVisible == true and _G.BoxesVisible == true then
                                BottomRightLine.From = Vector2.new(BottomRightPosition.X, BottomRightPosition.Y)
                                BottomRightLine.To = Vector2.new(BottomLeftPosition.X, BottomLeftPosition.Y)
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= Player.Team then
                                        BottomRightLine.Visible = _G.BoxesVisible
                                    else
                                        BottomRightLine.Visible = false
                                    end
                                else
                                    BottomRightLine.Visible = _G.BoxesVisible
                                end
                            else
                                BottomRightLine.Visible = false
                            end
                        else
                            TopRightLine.Visible = false
                            TopLeftLine.Visible = false
                            BottomLeftLine.Visible = false
                            BottomRightLine.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        TopRightLine.Visible = false
                        TopLeftLine.Visible = false
                        BottomLeftLine.Visible = false
                        BottomRightLine.Visible = false
                    end)
                end
            end)
        end)
    end
    
    if _G.DefaultSettings == true then
        _G.TeamCheck = false
        _G.BoxesVisible = rue
        _G.LineColor = Color3.fromRGB(40, 90, 255)
        _G.LineThickness = 1
        _G.LineTransparency = 0.5
        _G.SizeIncrease = 1.5
        _G.DisableKey = Enum.KeyCode.Q
    end
    
    UserInputService.TextBoxFocused:Connect(function()
        Typing = true
    end)
    
    UserInputService.TextBoxFocusReleased:Connect(function()
        Typing = false
    end)
    
    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == _G.DisableKey and Typing == false then
            _G.BoxesVisible = not _G.BoxesVisible
            
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "The boxes' visibility is now set to "..tostring(_G.BoxesVisible)..".";
                    Duration = 5;
                })
            end
        end
    end)
    
    local Success, Errored = pcall(function()
        CreateBoxes()
    end)
    
    if Success and not Errored then
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Ash01";
                Text = "Boxes script has successfully loaded.";
                Duration = 5;
            })
        end
    elseif Errored and not Success then
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Exunys Developer";
                Text = "Boxes script has errored while loading, please check the developer console! (F9)";
                Duration = 5;
            })
        end
        TestService:Message("The boxes script has errored, please notify Exunys with the following information :")
        warn(Errored)
        print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
    end
end)

playersEspSection:NewToggle("ESP Name", "", function(name)
    local function API_Check()

        if Drawing == nil then

            return "No"
        else
            return "Yes"
        end
    end
    
    local Find_Required = API_Check()
    
    if Find_Required == "No" then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "An error lol";
            Text = "ESP script could not be loaded because your exploit is unsupported.";
            Duration = math.huge;
            Button1 = "OK"
        })
    
        return
    end
    
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Camera = workspace.CurrentCamera
    
    local Typing = false
    
    _G.SendNotifications = false   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
    _G.DefaultSettings = false   -- If set to true then the ESP script would run with default settings regardless of any changes you made.
    
    _G.TeamCheck = true   -- If set to true then the script would create ESP only for the enemy team members.
    
    _G.ESPVisible = name   -- If set to true then the ESP will be visible and vice versa.
    _G.TextColor = Color3.fromRGB(255, 255, 255)  -- The color that the boxes would appear as.
    _G.TextSize = 14   -- The size of the text.
    _G.Center = true   -- If set to true then the script would be located at the center of the label.
    _G.Outline = false   -- If set to true then the text would have an outline.
    _G.OutlineColor = Color3.fromRGB(0, 0, 0)   -- The outline color of the text.
    _G.TextTransparency = 0.7   -- The transparency of the text.
    _G.TextFont = Drawing.Fonts.UI   -- The font of the text. (UI, System, Plex, Monospace) 
    
    _G.DisableKey = Enum.KeyCode.RightAlt   -- The key that disables / enables the ESP.
    
    local function CreateESP()
        for _, v in next, Players:GetPlayers() do
            if v.Name ~= Players.LocalPlayer.Name then
                local ESP = Drawing.new("Text")
    
                RunService.RenderStepped:Connect(function()
                    if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
    
                        ESP.Size = _G.TextSize
                        ESP.Center = _G.Center
                        ESP.Outline = _G.Outline
                        ESP.OutlineColor = _G.OutlineColor
                        ESP.Color = _G.TextColor
                        ESP.Transparency = _G.TextTransparency
                        ESP.Font = _G.TextFont
    
                        if OnScreen == true then
                            local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                            local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                            local Dist = (Part1 - Part2).Magnitude
                            ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                            ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                            if _G.TeamCheck == true then 
                                if Players.LocalPlayer.Team ~= v.Team then
                                    ESP.Visible = _G.ESPVisible
                                else
                                    ESP.Visible = false
                                end
                            else
                                ESP.Visible = _G.ESPVisible
                            end
                        else
                            ESP.Visible = false
                        end
                    else
                        ESP.Visible = false
                    end
                end)
    
                Players.PlayerRemoving:Connect(function()
                    ESP.Visible = false
                end)
            end
        end
    
        Players.PlayerAdded:Connect(function(Player)
            Player.CharacterAdded:Connect(function(v)
                if v.Name ~= Players.LocalPlayer.Name then 
                    local ESP = Drawing.new("Text")
        
                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
        
                            ESP.Size = _G.TextSize
                            ESP.Center = _G.Center
                            ESP.Outline = _G.Outline
                            ESP.OutlineColor = _G.OutlineColor
                            ESP.Color = _G.TextColor
                            ESP.Transparency = _G.TextTransparency
        
                            if OnScreen == true then
                                local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                            local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                local Dist = (Part1 - Part2).Magnitude
                                ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= Player.Team then
                                        ESP.Visible = _G.ESPVisible
                                    else
                                        ESP.Visible = false
                                    end
                                else
                                    ESP.Visible = _G.ESPVisible
                                end
                            else
                                ESP.Visible = false
                            end
                        else
                            ESP.Visible = false
                        end
                    end)
        
                    Players.PlayerRemoving:Connect(function()
                        ESP.Visible = false
                    end)
                end
            end)
        end)
    end
    
    if _G.DefaultSettings == true then
        _G.TeamCheck = false
        _G.ESPVisible = true
        _G.TextColor = Color3.fromRGB(40, 90, 255)
        _G.TextSize = 14
        _G.Center = true
        _G.Outline = false
        _G.OutlineColor = Color3.fromRGB(0, 0, 0)
        _G.DisableKey = Enum.KeyCode.Q
        _G.TextTransparency = 0.75
    end
    
    UserInputService.TextBoxFocused:Connect(function()
        Typing = true
    end)
    
    UserInputService.TextBoxFocusReleased:Connect(function()
        Typing = false
    end)
    
    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == _G.DisableKey and Typing == false then
            _G.ESPVisible = not _G.ESPVisible
            
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Exunys Developer";
                    Text = "The ESP's visibility is now set to "..tostring(_G.ESPVisible)..".";
                    Duration = 5;
                })
            end
        end
    end)
    
    local Success, Errored = pcall(function()
        CreateESP()
    end)
    
    if Success and not Errored then
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Epic gamer esp";
                Text = "Epic gamer esp has been successful loaded";
                Duration = 5;
            })
        end
    elseif Errored and not Success then
        if _G.SendNotifications == true then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Ash01 Developer";
                Text = "ESP script has errored while loading, please check the developer console! (F9)";
                Duration = 5;
            })
        end
        TestService:Message("The ESP script has errored, please notify Ash01 with the following information :")
        warn(Errored)
        print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
    end
end)

viewMainSection:NewSlider("FOV", "", 200, 70, function(state)
    workspace.CurrentCamera.FieldOfView = s
end)

viewMainSection:NewKeybind("Thirdperson", "", Enum.KeyCode.LMENU, function()
    local thirdperson = not thirdperson
    if thirdperson then
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.thirdperson.Value = true
    else
        game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.thirdperson.Value = false
    end
end)

rageMiscSection:NewToggle("Infinity Ammo", "", function(state)
    if state then
        while wait() do
            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
        end
    end
end)

antiAimMainSection:NewDropdown("Yaw Base", "", antiAimList, function(list)
    if list == "Spin" then
        game:GetService("Players")["LocalPlayer"].PlayerGui.GUI.Client.Variables.thirdperson.Value = true

        local spin = Instance.new('BodyAngularVelocity', game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart'))
        spin.AngularVelocity = Vector3.new(0, math.random(-60000, 55000), 0)
        spin.MaxTorque = Vector3.new(0, 35000, 0)
    end
    if list == "Forward" then
        local forward = Instance.new('BodyAngularVelocity', game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart'))
        forward.AngularVelocity = Vector3.new(0, math.random(-1000, 1000), 0)
        forward.MaxTorque = Vector3.new(0, 35000, 0)
    end
end)
