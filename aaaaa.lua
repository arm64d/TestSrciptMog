local Fluent = loadstring(game:HttpGet("https://github.com/StyearX/Fluent-modded/releases/download/1.5.1/FluentPro"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

local function Notify(title, content, ntype, icon, duration)
end

local ANIME_BG = "rbxassetid://133541508207801"

local THEMES = {
    HirukuViolet = {
        Accent = Color3.fromRGB(150,35,235),
        AcrylicMain = Color3.fromRGB(15,6,28),
        AcrylicBorder = Color3.fromRGB(130,48,225),
        AcrylicGradient = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(32,13,58)),
            ColorSequenceKeypoint.new(.55, Color3.fromRGB(19,8,38)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10,4,20))
        }),
        AcrylicNoise = .6, TitleBarLine = Color3.fromRGB(190,85,255),
        Tab = Color3.fromRGB(27,11,48), Element = Color3.fromRGB(38,16,66),
        ElementBorder = Color3.fromRGB(100,36,180), InElementBorder = Color3.fromRGB(150,35,235),
        ElementTransparency = .86, ToggleSlider = Color3.fromRGB(46,22,78),
        ToggleToggled = Color3.fromRGB(190,85,255), SliderRail = Color3.fromRGB(46,22,78),
        Text = Color3.fromRGB(245,236,255), SubText = Color3.fromRGB(198,168,235),
        IconColor = Color3.fromRGB(226,190,255), Hover = Color3.fromRGB(48,21,84),
        HoverChange = .05, ShineEnabled = true,
        Shine = { Speed = .5, RotationSpeed = 24, ColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(38,8,92)),
            ColorSequenceKeypoint.new(.5, Color3.fromRGB(255,60,196)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(38,8,92))
        })},
        StrokeShine = true, StrokeDark = Color3.fromRGB(70,20,135),
        ButtonGradient = {
            Background = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(150,35,235)),
                ColorSequenceKeypoint.new(.5, Color3.fromRGB(110,22,195)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(48,10,105))
            }),
            Stroke = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(150,35,235)),
                ColorSequenceKeypoint.new(.5, Color3.fromRGB(255,60,196)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(150,35,235))
            })
        }
    },
    NeonBlue = {
        Accent = Color3.fromRGB(0,180,255), AcrylicMain = Color3.fromRGB(10,14,28),
        AcrylicBorder = Color3.fromRGB(0,100,180),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(10,14,28), Color3.fromRGB(5,8,20)),
        TitleBarLine = Color3.fromRGB(0,100,180), Tab = Color3.fromRGB(15,22,48),
        Element = Color3.fromRGB(12,18,40), ElementBorder = Color3.fromRGB(0,80,160),
        InElementBorder = Color3.fromRGB(0,120,220), ToggleSlider = Color3.fromRGB(20,30,70),
        ToggleToggled = Color3.fromRGB(0,180,255), Text = Color3.fromRGB(230,245,255),
        SubText = Color3.fromRGB(120,170,220), Hover = Color3.fromRGB(20,36,80)
    },
    EmeraldDark = {
        Accent = Color3.fromRGB(0,220,120), AcrylicMain = Color3.fromRGB(8,20,14),
        AcrylicBorder = Color3.fromRGB(0,140,70),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(8,20,14), Color3.fromRGB(4,12,8)),
        TitleBarLine = Color3.fromRGB(0,140,70), Tab = Color3.fromRGB(10,28,18),
        Element = Color3.fromRGB(8,22,14), ElementBorder = Color3.fromRGB(0,110,55),
        InElementBorder = Color3.fromRGB(0,180,90), ToggleSlider = Color3.fromRGB(14,40,24),
        ToggleToggled = Color3.fromRGB(0,220,120), Text = Color3.fromRGB(220,255,235),
        SubText = Color3.fromRGB(120,200,155), Hover = Color3.fromRGB(14,42,26)
    },
    Sunset = {
        Accent = Color3.fromRGB(255,110,50), AcrylicMain = Color3.fromRGB(28,16,12),
        AcrylicBorder = Color3.fromRGB(180,80,30),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(28,16,12), Color3.fromRGB(14,8,6)),
        TitleBarLine = Color3.fromRGB(180,80,30), Tab = Color3.fromRGB(36,22,16),
        Element = Color3.fromRGB(30,18,13), ElementBorder = Color3.fromRGB(160,70,25),
        InElementBorder = Color3.fromRGB(220,100,45), ToggleSlider = Color3.fromRGB(50,30,20),
        ToggleToggled = Color3.fromRGB(255,110,50), Text = Color3.fromRGB(255,240,230),
        SubText = Color3.fromRGB(220,170,145), Hover = Color3.fromRGB(56,34,24)
    },
    SlateStatic = {
        Accent = Color3.fromRGB(140,150,165), AcrylicMain = Color3.fromRGB(22,24,28),
        AcrylicBorder = Color3.fromRGB(70,75,85),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(22,24,28), Color3.fromRGB(14,15,18)),
        TitleBarLine = Color3.fromRGB(70,75,85), Tab = Color3.fromRGB(28,30,35),
        Element = Color3.fromRGB(24,26,30), ElementBorder = Color3.fromRGB(60,64,72),
        InElementBorder = Color3.fromRGB(90,96,108), ToggleSlider = Color3.fromRGB(40,43,48),
        ToggleToggled = Color3.fromRGB(140,150,165), Text = Color3.fromRGB(235,237,240),
        SubText = Color3.fromRGB(150,155,165), Hover = Color3.fromRGB(34,37,42)
    },
    SlateAnimated = {
        Accent = Color3.fromRGB(140,150,165), AcrylicMain = Color3.fromRGB(22,24,28),
        AcrylicBorder = Color3.fromRGB(70,75,85),
        AcrylicGradient = ColorSequence.new(Color3.fromRGB(22,24,28), Color3.fromRGB(14,15,18)),
        TitleBarLine = Color3.fromRGB(70,75,85), Tab = Color3.fromRGB(28,30,35),
        Element = Color3.fromRGB(24,26,30), ElementBorder = Color3.fromRGB(60,64,72),
        InElementBorder = Color3.fromRGB(90,96,108), ToggleSlider = Color3.fromRGB(40,43,48),
        ToggleToggled = Color3.fromRGB(140,150,165), Text = Color3.fromRGB(235,237,240),
        SubText = Color3.fromRGB(150,155,165), Hover = Color3.fromRGB(34,37,42),
        ShineEnabled = true,
        Shine = { Speed = .5, RotationSpeed = 25, ColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(50,54,62)),
            ColorSequenceKeypoint.new(.5, Color3.fromRGB(140,150,165)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(50,54,62))
        })},
        StrokeShine = true, StrokeDark = Color3.fromRGB(50,54,62)
    }
}

for name, theme in pairs(THEMES) do
    theme.Background = ANIME_BG
    theme.BackgroundTransparency = .12
    theme.ViewportBackgroundImages = true
    theme.DropdownOutsideWindowBackgroundImages = true
    Fluent:RegisterCustomTheme(name, theme)
end

local Window = Fluent:CreateWindow({
    Title = "HIRUKU LUA",
    SubTitle = "Mog Evolution",
    Version = "v1.1.0",
    TabWidth = 130,
    Size = UDim2.fromOffset(580,410),
    Acrylic = true,
    Theme = "HirukuViolet",
    MinimizeKey = Enum.KeyCode.LeftControl,
    Search = true,
    Icons = "solar/planet-bold",
    UserInfoTop = true,
    UserInfoTitle = "Welcome",
    UserInfoSubtitle = LocalPlayer.DisplayName,
    UserInfoColor = Color3.fromRGB(185,70,255),
})



local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "solar/info-circle-bold" }),
    Farm = Window:AddTab({ Title = "Farm", Icon = "solar/box-minimalistic-bold" }),
    Character = Window:AddTab({ Title = "Character", Icon = "solar/user-bold" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "solar/rocket-2-bold" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "solar/tuning-2-bold" }),
}

local secInfo = Tabs.Info:AddSection("Information","solar/info-square-bold")
secInfo:AddParagraph({ Title = "Hiruku Lua", Content = "Cheat menu for +1 Mog Evolution" })
secInfo:AddDivider()
secInfo:AddParagraph({ Title = "Version", Content = "v1.1.0" })

local state = {
    autoClick = false,
    autoClickSpeed = 20,
    autoClickConn = nil,
    speedEnabled = false,
    walkSpeed = 100,
    jumpPower = 100,
    flyEnabled = false,
    flySpeed = 200,
    flyConn = nil,
    infiniteJump = false,
    antiAFK = true,
    autoRebirth = false,
    autoRebirthConn = nil,
    noclip = false,
    noclipConn = nil,
    autoClaimWins = false,
    autoClaimConn = nil,
    autoTeleportWins = false,
    autoTeleportConn = nil,
    winPoint = nil,
}

local function getChar()
    local c = LocalPlayer.Character
    if not c then return nil end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return nil end
    return c, hrp, hum
end

local function getClickRemotes()
    local remotes = {}
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local n = obj.Name:lower()
            if n:find("click") or n:find("power") or n:find("tap") then
                table.insert(remotes, obj)
            end
        end
    end
    return remotes
end

local function getWinRemotes()
    local remotes = {}
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local n = obj.Name:lower()
            if n:find("win") or n:find("reward") or n:find("claim") or n:find("prize") or n:find("getreward") then
                table.insert(remotes, obj)
            end
        end
    end
    return remotes
end

local function getRebirthRemotes()
    local remotes = {}
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local n = obj.Name:lower()
            if n:find("rebirth") or n:find("ascend") or n:find("prestige") then
                table.insert(remotes, obj)
            end
        end
    end
    return remotes
end

local function findWinButton()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return nil end
    for _, obj in ipairs(pg:GetDescendants()) do
        if obj:IsA("TextButton") or obj:IsA("ImageButton") then
            local name = obj.Name:lower()
            local text = ""
            if obj:IsA("TextButton") then text = (obj.Text or ""):lower() end
            if name:find("win") or name:find("claim") or name:find("reward") or
               text:find("500") or text:find("claim") or text:find("win") or text:find("get") then
                if obj.Visible and obj.AbsoluteSize.X > 20 then
                    return obj
                end
            end
        end
    end
    return nil
end

local function fireButton(btn)
    if not btn then return false end
    pcall(function()
        if firesignal and btn.Activated then
            firesignal(btn.Activated)
        end
        if firesignal and btn.MouseButton1Click then
            firesignal(btn.MouseButton1Click)
        end
        if firesignal and btn.MouseButton1Down then
            firesignal(btn.MouseButton1Down)
        end
        if getconnections then
            for _, c in pairs(getconnections(btn.MouseButton1Click)) do
                if c.Fire then c:Fire() end
            end
            for _, c in pairs(getconnections(btn.Activated)) do
                if c.Fire then c:Fire() end
            end
        end
    end)
    return true
end

local function startAutoClick()
    local remotes = getClickRemotes()
    if #remotes == 0 then
        Notify("Auto Click","Remote не найден","Error",nil,5)
        return false
    end
    state.autoClick = true
    local idx = 0
    state.autoClickConn = RunService.Heartbeat:Connect(function()
        if not state.autoClick then return end
        for i = 1, state.autoClickSpeed do
            idx = idx + 1
            if idx > #remotes then idx = 1 end
            pcall(function() remotes[idx]:FireServer() end)
        end
    end)
    Notify("Auto Click","Включён (".. #remotes .." remotes)","Success",nil,3)
    return true
end

local function stopAutoClick()
    state.autoClick = false
    if state.autoClickConn then state.autoClickConn:Disconnect() state.autoClickConn = nil end
    Notify("Auto Click","Выключен","Info",nil,2)
end

local function startAutoClaimWins()
    state.autoClaimWins = true
    state.autoClaimConn = RunService.Heartbeat:Connect(function()
        if not state.autoClaimWins then return end
        local btn = findWinButton()
        if btn then
            fireButton(btn)
        end
        local remotes = getWinRemotes()
        for _, r in ipairs(remotes) do
            pcall(function()
                if r:IsA("RemoteFunction") then r:InvokeServer()
                else r:FireServer() end
            end)
        end
        local fireWin = getWinRemotes()
        for _, r in ipairs(ReplicatedStorage:GetDescendants()) do
            if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
                local n = r.Name:lower()
                if n:find("500") or n:find("givewin") or n:find("addwin") then
                    pcall(function()
                        if r:IsA("RemoteFunction") then r:InvokeServer(500)
                        else r:FireServer(500) end
                    end)
                end
            end
        end
    end)
    Notify("Auto Claim Wins","Включён","Success",nil,3)
end

local function stopAutoClaimWins()
    state.autoClaimWins = false
    if state.autoClaimConn then state.autoClaimConn:Disconnect() state.autoClaimConn = nil end
    Notify("Auto Claim Wins","Выключен","Info",nil,2)
end

local function findWinPoint()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local n = obj.Name:lower()
            if n:find("win") or n:find("reward") or n:find("prize") or n:find("claim") then
                return obj
            end
        end
        if obj:IsA("Model") then
            local n = obj.Name:lower()
            if n:find("win") or n:find("reward") or n:find("prize") then
                local p = obj:FindFirstChildWhichIsA("BasePart") or obj.PrimaryPart
                if p then return p end
            end
        end
    end
    return nil
end

local function startAutoTeleportWins()
    state.winPoint = findWinPoint()
    if not state.winPoint then
        Notify("Auto Teleport","Точка побед не найдена","Error",nil,5)
        return false
    end
    state.autoTeleportWins = true
    state.autoTeleportConn = RunService.Heartbeat:Connect(function()
        if not state.autoTeleportWins then return end
        local c, hrp = getChar()
        if not hrp then return end
        if state.winPoint and state.winPoint.Parent then
            hrp.CFrame = CFrame.new(state.winPoint.Position + Vector3.new(0,3,0))
        end
    end)
    Notify("Auto Teleport","Включён к ".. state.winPoint.Name,"Success",nil,3)
    return true
end

local function stopAutoTeleportWins()
    state.autoTeleportWins = false
    if state.autoTeleportConn then state.autoTeleportConn:Disconnect() state.autoTeleportConn = nil end
    Notify("Auto Teleport","Выключен","Info",nil,2)
end

local function applySpeed()
    local c, hrp, hum = getChar()
    if not hum then return end
    hum.WalkSpeed = state.speedEnabled and state.walkSpeed or 16
    hum.UseJumpPower = true
    hum.JumpPower = state.jumpPower
end

local function startFly()
    local c, hrp, hum = getChar()
    if not hrp or not hum then return end
    state.flyEnabled = true
    hum.PlatformStand = true
    local bv = hrp:FindFirstChild("HirukuFlyVel")
    if not bv then
        bv = Instance.new("BodyVelocity")
        bv.Name = "HirukuFlyVel"
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.zero
        bv.Parent = hrp
    end
    local bg = hrp:FindFirstChild("HirukuFlyGyro")
    if not bg then
        bg = Instance.new("BodyGyro")
        bg.Name = "HirukuFlyGyro"
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.P = 10000
        bg.D = 100
        bg.CFrame = hrp.CFrame
        bg.Parent = hrp
    end
    if state.flyConn then state.flyConn:Disconnect() state.flyConn = nil end
    state.flyConn = RunService.RenderStepped:Connect(function()
        if not state.flyEnabled then return end
        local cc, p = getChar()
        if not p then return end
        local bvv = p:FindFirstChild("HirukuFlyVel")
        local bgg = p:FindFirstChild("HirukuFlyGyro")
        if not bvv or not bgg then return end
        local cam = workspace.CurrentCamera
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end
        if dir.Magnitude > 0 then dir = dir.Unit end
        bvv.Velocity = dir * state.flySpeed
        bgg.CFrame = CFrame.new(p.Position, p.Position + cam.CFrame.LookVector)
    end)
    Notify("Fly","Включён","Success",nil,3)
end

local function stopFly()
    state.flyEnabled = false
    if state.flyConn then state.flyConn:Disconnect() state.flyConn = nil end
    local c, hrp, hum = getChar()
    if hrp then
        local bv = hrp:FindFirstChild("HirukuFlyVel") if bv then bv:Destroy() end
        local bg = hrp:FindFirstChild("HirukuFlyGyro") if bg then bg:Destroy() end
        hrp.AssemblyLinearVelocity = Vector3.zero
    end
    if hum then hum.PlatformStand = false end
    Notify("Fly","Выключен","Info",nil,2)
end

local function startNoClip()
    state.noclip = true
    if state.noclipConn then state.noclipConn:Disconnect() end
    state.noclipConn = RunService.Stepped:Connect(function()
        if not state.noclip then return end
        local c = LocalPlayer.Character
        if not c then return end
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end)
    Notify("NoClip","Включён","Success",nil,2)
end

local function stopNoClip()
    state.noclip = false
    if state.noclipConn then state.noclipConn:Disconnect() state.noclipConn = nil end
    local c = LocalPlayer.Character
    if c then
        for _, p in ipairs(c:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end
        end
    end
    Notify("NoClip","Выключен","Info",nil,2)
end

UserInputService.JumpRequest:Connect(function()
    if not state.infiniteJump then return end
    local c, hrp, hum = getChar()
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

LocalPlayer.Idled:Connect(function()
    if not state.antiAFK then return end
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local secFarm = Tabs.Farm:AddSection("Auto Click","solar/cursor-bold")
local secWin = Tabs.Farm:AddSection("Wins & Rewards","solar/medal-star-bold")
local secRebirth = Tabs.Farm:AddSection("Rebirth","solar/refresh-bold")
local secChar = Tabs.Character:AddSection("Movement","solar/rocket-bold")
local secTeleport = Tabs.Character:AddSection("Teleport","solar/map-point-bold")
local secMisc = Tabs.Misc:AddSection("System","solar/widget-bold")
local secSet = Tabs.Settings:AddSection("Theme","solar/palette-bold")

secFarm:AddToggle("AutoClick", {
    Title = "Auto Click",
    Description = "Спамит все клик-ремоты",
    Icon = "solar/cursor-bold",
    Default = false,
    Callback = function(v) if v then startAutoClick() else stopAutoClick() end end
})

secFarm:AddSlider("ClickSpeed", {
    Title = "Clicks Per Frame",
    Icon = "solar/speedometer-bold",
    Min = 1, Max = 100, Default = 20, Rounding = 0,
    Callback = function(v) state.autoClickSpeed = v end
})

secWin:AddToggle("AutoClaimWins", {
    Title = "Auto Claim Wins",
    Description = "Автоматически жмёт кнопку получения 500 побед",
    Icon = "solar/medal-star-bold",
    Default = false,
    Callback = function(v) if v then startAutoClaimWins() else stopAutoClaimWins() end
end)

secWin:AddToggle("AutoTeleportWins", {
    Title = "Auto Teleport to Win Point",
    Description = "Телепортирует к точке получения побед",
    Icon = "solar/map-point-bold",
    Default = false,
    Callback = function(v) if v then startAutoTeleportWins() else stopAutoTeleportWins() end
})

secWin:AddButton({
    Title = "Force Claim 500 Wins",
    Description = "Пробует отправить серверу запрос на 500 побед",
    Icon = "solar/medal-star-bold",
    Callback = function()
        local count = 0
        for _, r in ipairs(ReplicatedStorage:GetDescendants()) do
            if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
                local n = r.Name:lower()
                if n:find("win") or n:find("reward") or n:find("claim") or n:find("prize") then
                    pcall(function()
                        if r:IsA("RemoteFunction") then r:InvokeServer(500)
                        else r:FireServer(500) end
                    end)
                    pcall(function()
                        if r:IsA("RemoteFunction") then r:InvokeServer()
                        else r:FireServer() end
                    end)
                    count = count + 1
                end
            end
        end
        Notify("Force Claim","Отправлено "..count.." запросов","Success",nil,3)
    end
})

secRebirth:AddToggle("AutoRebirth", {
    Title = "Auto Rebirth",
    Description = "Автоматически перерождается",
    Icon = "solar/refresh-bold",
    Default = false,
    Callback = function(v)
        state.autoRebirth = v
        if state.autoRebirthConn then state.autoRebirthConn:Disconnect() state.autoRebirthConn = nil end
        if v then
            state.autoRebirthConn = RunService.Heartbeat:Connect(function()
                if not state.autoRebirth then return end
                local remotes = getRebirthRemotes()
                for _, r in ipairs(remotes) do
                    pcall(function()
                        if r:IsA("RemoteFunction") then r:InvokeServer()
                        else r:FireServer() end
                    end)
                end
                local pg = LocalPlayer:FindFirstChild("PlayerGui")
                if pg then
                    for _, obj in ipairs(pg:GetDescendants()) do
                        if (obj:IsA("TextButton") or obj:IsA("ImageButton")) and obj.Visible then
                            local text = ""
                            if obj:IsA("TextButton") then text = (obj.Text or ""):lower() end
                            if text:find("rebirth") or text:find("ascend") or obj.Name:lower():find("rebirth") then
                                fireButton(obj)
                            end
                        end
                    end
                end
            end)
        end
    end
})

secChar:AddToggle("Speed", {
    Title = "Speed Hack",
    Icon = "solar/running-bold",
    Default = false,
    Callback = function(v) state.speedEnabled = v applySpeed() end
})

secChar:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Icon = "solar/speedometer-bold",
    Min = 16, Max = 500, Default = 100, Rounding = 0,
    Callback = function(v) state.walkSpeed = v applySpeed() end
})

secChar:AddSlider("JumpPower", {
    Title = "Jump Power",
    Icon = "solar/arrow-up-bold",
    Min = 50, Max = 500, Default = 100, Rounding = 0,
    Callback = function(v) state.jumpPower = v applySpeed() end
})

secChar:AddToggle("Fly", {
    Title = "Fly",
    Description = "WASD летит, Space вверх, LeftCtrl вниз",
    Icon = "solar/plain-2-bold",
    Default = false,
    Callback = function(v) if v then startFly() else stopFly() end end
})

secChar:AddSlider("FlySpeed", {
    Title = "Fly Speed",
    Icon = "solar/speedometer-bold",
    Min = 50, Max = 1000, Default = 200, Rounding = 0,
    Callback = function(v) state.flySpeed = v end
})

secChar:AddToggle("InfJump", {
    Title = "Infinite Jump",
    Icon = "solar/arrow-up-bold",
    Default = false,
    Callback = function(v) state.infiniteJump = v end
})

secChar:AddToggle("NoClip", {
    Title = "No Clip",
    Icon = "solar/ghost-bold",
    Default = false,
    Callback = function(v) if v then startNoClip() else stopNoClip() end end
})

secTeleport:AddButton({
    Title = "Teleport to Win Point",
    Description = "Телепорт к точке побед",
    Icon = "solar/map-point-bold",
    Callback = function()
        local wp = findWinPoint()
        if wp then
            local c, hrp = getChar()
            if hrp then
                hrp.CFrame = CFrame.new(wp.Position + Vector3.new(0,3,0))
                Notify("Teleport","К "..wp.Name,"Success",nil,2)
            end
        else
            Notify("Teleport","Точка не найдена","Error",nil,3)
        end
    end
})

secTeleport:AddButton({
    Title = "Teleport to Spawn",
    Icon = "solar/home-bold",
    Callback = function()
        local c, hrp = getChar()
        if hrp then
            local spawn = workspace:FindFirstChildOfClass("SpawnLocation")
            if spawn then
                hrp.CFrame = CFrame.new(spawn.Position + Vector3.new(0,3,0))
                Notify("Teleport","К спавну","Success",nil,2)
            end
        end
    end
})

secMisc:AddToggle("AntiAFK", {
    Title = "Anti-AFK",
    Icon = "solar/shield-check-bold",
    Default = true,
    Callback = function(v) state.antiAFK = v end
})

secMisc:AddButton({
    Title = "Rejoin Server",
    Icon = "solar/logout-2-bold",
    Callback = function()
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
    end
})

secMisc:AddButton({
    Title = "Server Hop (Random)",
    Icon = "solar/planet-bold",
    Callback = function()
        pcall(function()
            local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Desc&excludeFullGames=true&limit=100"
            local raw = game:HttpGet(url)
            local data = game:GetService("HttpService"):JSONDecode(raw)
            for _, srv in ipairs(data.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, srv.id, LocalPlayer)
                    return
                end
            end
            Notify("Server Hop","Не найдено","Error",nil,3)
        end)
    end
})

secMisc:AddButton({
    Title = "Reset Character",
    Icon = "solar/restart-bold",
    Callback = function()
        local c, hrp, hum = getChar()
        if hum then hum.Health = 0 end
    end
})

secSet:AddButton({ Title = "Theme: HirukuViolet", Icon = "solar/palette-bold", Callback = function() pcall(function() Fluent:SetTheme("HirukuViolet") end) Notify("Theme","HirukuViolet","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: NeonBlue", Icon = "solar/star-bold", Callback = function() Fluent:SetTheme("NeonBlue") Notify("Theme","NeonBlue","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: EmeraldDark", Icon = "solar/leaf-bold", Callback = function() Fluent:SetTheme("EmeraldDark") Notify("Theme","EmeraldDark","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: Sunset", Icon = "solar/sun-bold", Callback = function() Fluent:SetTheme("Sunset") Notify("Theme","Sunset","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: SlateStatic", Icon = "solar/pause-circle-bold", Callback = function() Fluent:SetTheme("SlateStatic") Notify("Theme","SlateStatic","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: SlateAnimated", Icon = "solar/play-circle-bold", Callback = function() Fluent:SetTheme("SlateAnimated") Notify("Theme","SlateAnimated","Success",nil,2) end })

pcall(function() Fluent:SetTheme("HirukuViolet") end)

local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "HirukuOpenUi"
toggleGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
toggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
toggleGui.ResetOnSpawn = false

local mainBtn = Instance.new("TextButton")
mainBtn.Name = "HirukuButton"
mainBtn.Parent = toggleGui
mainBtn.BackgroundColor3 = Color3.fromRGB(20,10,35)
mainBtn.BackgroundTransparency = 0.05
mainBtn.Position = UDim2.new(.1,0,.1,0)
mainBtn.Size = UDim2.new(0,60,0,60)
mainBtn.Text = "HL"
mainBtn.TextColor3 = Color3.fromRGB(230,190,255)
mainBtn.TextSize = 24
mainBtn.Font = Enum.Font.GothamBold
mainBtn.AutoButtonColor = false
mainBtn.ClipsDescendants = true

local corner = Instance.new("UICorner", mainBtn)
corner.CornerRadius = UDim.new(0.25, 0)

local stroke = Instance.new("UIStroke", mainBtn)
stroke.Color = Color3.fromRGB(190,85,255)
stroke.Thickness = 2

local grad = Instance.new("UIGradient", mainBtn)
grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60,20,110)),
    ColorSequenceKeypoint.new(.5, Color3.fromRGB(150,35,235)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(48,10,105))
})
grad.Rotation = 45

local gradConn = RunService.RenderStepped:Connect(function(dt)
    if grad and grad.Parent then
        grad.Rotation = (grad.Rotation + dt * 30) % 360
    end
end)

local function MakeDraggableOpenUi(topbar, obj)
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
    local holdingDrag, holdToken = false, 0
    obj:SetAttribute("Locked", false)
    local function Update(input)
        if obj:GetAttribute("Locked") then return end
        local delta = input.Position - dragStart
        obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    local function ToggleLock()
        local newState = not obj:GetAttribute("Locked")
        obj:SetAttribute("Locked", newState)
        Notify(newState and "Locked" or "Unlocked", newState and "Закреплено" or "Можно двигать", "Info", nil, 2)
    end
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
        dragging = not obj:GetAttribute("Locked")
        holdingDrag = true
        dragStart = input.Position
        startPos = obj.Position
        holdToken = holdToken + 1
        local token = holdToken
        task.delay(1, function()
            if holdingDrag and token == holdToken then ToggleLock() end
        end)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                holdingDrag = false
            end
        end)
    end)
    topbar.InputChanged:Connect(function(input)
        if not dragStart then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if (input.Position - dragStart).Magnitude > 6 then holdingDrag = false end
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then Update(input) end
    end)
end

MakeDraggableOpenUi(mainBtn, mainBtn)

local uiOpen = true

local function PlaySound(soundId)
    local sound = Instance.new("Sound")
    pcall(function() sound.SoundId = "rbxassetid://" .. soundId end)
    sound.Parent = game:GetService("SoundService")
    pcall(function() sound:Play() end)
    sound.Ended:Connect(function() sound:Destroy() end)
end

local function OpenAnimation()
    local originalSize = mainBtn.Size
    local originalPos = mainBtn.Position
    TweenService:Create(mainBtn, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 80, 0, 80)
    }):Play()
    task.wait(0.08)
    TweenService:Create(mainBtn, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = originalSize
    }):Play()
end

local function WindowAnimation()
    local win = Window
    pcall(function()
        if win and win.Root then
            local root = win.Root
            local originalSize = root.Size
            root.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(root, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = originalSize
            }):Play()
        end
    end)
end

mainBtn.MouseButton1Click:Connect(function()
    local sounds = {"7127123605","438666542"}
    pcall(function() PlaySound(sounds[math.random(#sounds)]) end)
    uiOpen = not uiOpen
    if uiOpen then
        Window:Show()
        WindowAnimation()
    else
        Window:Hide()
    end
    OpenAnimation()
end)

local oldChar
local function bindChar(char)
    if not char then return end
    task.wait(0.6)
    applySpeed()
    if state.flyEnabled and not state.flyConn then startFly() end
    if state.noclip and not state.noclipConn then startNoClip() end
end

LocalPlayer.CharacterAdded:Connect(bindChar)
if LocalPlayer.Character then bindChar(LocalPlayer.Character) end

task.delay(0.5, function()
    pcall(function()
        if Window and type(Window.SelectTab) == "function" then
            Window:SelectTab(1)
        end
    end)
end)