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
    Fluent:Notify({ Title = title, Content = content, Type = ntype or "Info", Icon = icon, Duration = duration or 3 })
end

Fluent:RegisterCustomTheme("HirukuViolet", {
    Accent = Color3.fromRGB(150,35,235),
    AcrylicMain = Color3.fromRGB(15,6,28),
    AcrylicBorder = Color3.fromRGB(130,48,225),
    AcrylicGradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32,13,58)),
        ColorSequenceKeypoint.new(.55, Color3.fromRGB(19,8,38)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10,4,20))
    }),
    AcrylicNoise = .6,
    TitleBarLine = Color3.fromRGB(190,85,255),
    Tab = Color3.fromRGB(27,11,48),
    Element = Color3.fromRGB(38,16,66),
    ElementBorder = Color3.fromRGB(100,36,180),
    InElementBorder = Color3.fromRGB(150,35,235),
    ElementTransparency = .86,
    ToggleSlider = Color3.fromRGB(46,22,78),
    ToggleToggled = Color3.fromRGB(190,85,255),
    SliderRail = Color3.fromRGB(46,22,78),
    DropdownFrame = Color3.fromRGB(21,8,38),
    DropdownHolder = Color3.fromRGB(14,5,27),
    DropdownBorder = Color3.fromRGB(100,36,180),
    DropdownOption = Color3.fromRGB(27,11,48),
    Keybind = Color3.fromRGB(27,11,48),
    Input = Color3.fromRGB(21,8,38),
    InputFocused = Color3.fromRGB(14,5,27),
    InputIndicator = Color3.fromRGB(150,35,235),
    Dialog = Color3.fromRGB(13,5,25),
    DialogHolder = Color3.fromRGB(9,3,18),
    DialogHolderLine = Color3.fromRGB(92,32,168),
    DialogButton = Color3.fromRGB(27,11,48),
    DialogButtonBorder = Color3.fromRGB(114,42,200),
    DialogBorder = Color3.fromRGB(114,42,200),
    DialogInput = Color3.fromRGB(21,8,38),
    DialogInputLine = Color3.fromRGB(150,35,235),
    Text = Color3.fromRGB(245,236,255),
    SubText = Color3.fromRGB(198,168,235),
    IconColor = Color3.fromRGB(226,190,255),
    Hover = Color3.fromRGB(48,21,84),
    HoverChange = .05,
    ShineEnabled = true,
    Shine = {
        Speed = .5,
        RotationSpeed = 24,
        ColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(38,8,92)),
            ColorSequenceKeypoint.new(.5, Color3.fromRGB(255,60,196)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(38,8,92))
        })
    },
    StrokeShine = true,
    StrokeDark = Color3.fromRGB(70,20,135),
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
    },
    Background = "rbxassetid://133541508207801",
    BackgroundTransparency = .12,
    ViewportBackground = Color3.fromRGB(20,7,34),
    ViewportBackgroundImages = true,
    DropdownOutsideWindowBackground = Color3.fromRGB(26,9,42),
    DropdownOutsideWindowBackgroundImages = true,
})

Fluent:RegisterCustomTheme("NeonBlue", {
    Accent = Color3.fromRGB(0,180,255),
    AcrylicMain = Color3.fromRGB(10,14,28),
    AcrylicBorder = Color3.fromRGB(0,100,180),
    AcrylicGradient = ColorSequence.new(Color3.fromRGB(10,14,28), Color3.fromRGB(5,8,20)),
    TitleBarLine = Color3.fromRGB(0,100,180),
    Tab = Color3.fromRGB(15,22,48),
    Element = Color3.fromRGB(12,18,40),
    ElementBorder = Color3.fromRGB(0,80,160),
    InElementBorder = Color3.fromRGB(0,120,220),
    ToggleSlider = Color3.fromRGB(20,30,70),
    ToggleToggled = Color3.fromRGB(0,180,255),
    Text = Color3.fromRGB(230,245,255),
    SubText = Color3.fromRGB(120,170,220),
    Hover = Color3.fromRGB(20,36,80),
})

Fluent:RegisterCustomTheme("EmeraldDark", {
    Accent = Color3.fromRGB(0,220,120),
    AcrylicMain = Color3.fromRGB(8,20,14),
    AcrylicBorder = Color3.fromRGB(0,140,70),
    AcrylicGradient = ColorSequence.new(Color3.fromRGB(8,20,14), Color3.fromRGB(4,12,8)),
    TitleBarLine = Color3.fromRGB(0,140,70),
    Tab = Color3.fromRGB(10,28,18),
    Element = Color3.fromRGB(8,22,14),
    ElementBorder = Color3.fromRGB(0,110,55),
    InElementBorder = Color3.fromRGB(0,180,90),
    ToggleSlider = Color3.fromRGB(14,40,24),
    ToggleToggled = Color3.fromRGB(0,220,120),
    Text = Color3.fromRGB(220,255,235),
    SubText = Color3.fromRGB(120,200,155),
    Hover = Color3.fromRGB(14,42,26),
})

Fluent:RegisterCustomTheme("Sunset", {
    Accent = Color3.fromRGB(255,110,50),
    AcrylicMain = Color3.fromRGB(28,16,12),
    AcrylicBorder = Color3.fromRGB(180,80,30),
    AcrylicGradient = ColorSequence.new(Color3.fromRGB(28,16,12), Color3.fromRGB(14,8,6)),
    TitleBarLine = Color3.fromRGB(180,80,30),
    Tab = Color3.fromRGB(36,22,16),
    Element = Color3.fromRGB(30,18,13),
    ElementBorder = Color3.fromRGB(160,70,25),
    InElementBorder = Color3.fromRGB(220,100,45),
    ToggleSlider = Color3.fromRGB(50,30,20),
    ToggleToggled = Color3.fromRGB(255,110,50),
    Text = Color3.fromRGB(255,240,230),
    SubText = Color3.fromRGB(220,170,145),
    Hover = Color3.fromRGB(56,34,24),
})

Fluent:RegisterCustomTheme("SlateStatic", {
    Accent = Color3.fromRGB(140,150,165),
    AcrylicMain = Color3.fromRGB(22,24,28),
    AcrylicBorder = Color3.fromRGB(70,75,85),
    AcrylicGradient = ColorSequence.new(Color3.fromRGB(22,24,28), Color3.fromRGB(14,15,18)),
    TitleBarLine = Color3.fromRGB(70,75,85),
    Tab = Color3.fromRGB(28,30,35),
    Element = Color3.fromRGB(24,26,30),
    ElementBorder = Color3.fromRGB(60,64,72),
    InElementBorder = Color3.fromRGB(90,96,108),
    ToggleSlider = Color3.fromRGB(40,43,48),
    ToggleToggled = Color3.fromRGB(140,150,165),
    Text = Color3.fromRGB(235,237,240),
    SubText = Color3.fromRGB(150,155,165),
    Hover = Color3.fromRGB(34,37,42),
})

Fluent:RegisterCustomTheme("SlateAnimated", {
    Accent = Color3.fromRGB(140,150,165),
    AcrylicMain = Color3.fromRGB(22,24,28),
    AcrylicBorder = Color3.fromRGB(70,75,85),
    AcrylicGradient = ColorSequence.new(Color3.fromRGB(22,24,28), Color3.fromRGB(14,15,18)),
    TitleBarLine = Color3.fromRGB(70,75,85),
    Tab = Color3.fromRGB(28,30,35),
    Element = Color3.fromRGB(24,26,30),
    ElementBorder = Color3.fromRGB(60,64,72),
    InElementBorder = Color3.fromRGB(90,96,108),
    ToggleSlider = Color3.fromRGB(40,43,48),
    ToggleToggled = Color3.fromRGB(140,150,165),
    Text = Color3.fromRGB(235,237,240),
    SubText = Color3.fromRGB(150,155,165),
    Hover = Color3.fromRGB(34,37,42),
    ShineEnabled = true,
    Shine = {
        Speed = .5,
        RotationSpeed = 25,
        ColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(50,54,62)),
            ColorSequenceKeypoint.new(.5, Color3.fromRGB(140,150,165)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(50,54,62))
        })
    },
    StrokeShine = true,
    StrokeDark = Color3.fromRGB(50,54,62),
})

local Window = Fluent:CreateWindow({
    Title = "HIRUKU LUA",
    SubTitle = "Mog Evolution",
    Version = "v1.0.0",
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

Fluent:SetErrorHandler(function(msg) pcall(function() Notify("Error", tostring(msg), "Error", nil, 5) end) end)

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
secInfo:AddParagraph({ Title = "Version", Content = "v1.0.0" })

local ClickRemote = nil
local function findClickRemote()
    local paths = {
        {"PowerRemotes","ClickPower"},{"PowerRemotes","Click"},
        {"Remotes","ClickPower"},{"Remotes","Click"},
        {"ClickPower"},{"Click"},
    }
    for _, path in ipairs(paths) do
        local obj = ReplicatedStorage
        for _, name in ipairs(path) do
            if obj then obj = obj:FindFirstChild(name) end
        end
        if obj and obj:IsA("RemoteEvent") then return obj end
    end
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local n = obj.Name:lower()
            if n:find("click") or n:find("power") then return obj end
        end
    end
    return nil
end

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
}

local function startAutoClick()
    ClickRemote = findClickRemote()
    if not ClickRemote then
        Notify("Auto Click","Remote не найден","Error",nil,5)
        return false
    end
    state.autoClick = true
    state.autoClickConn = RunService.Heartbeat:Connect(function()
        if not state.autoClick then return end
        for i = 1, state.autoClickSpeed do
            pcall(function() ClickRemote:FireServer() end)
        end
    end)
    Notify("Auto Click","Включён","Success",nil,3)
    return true
end

local function stopAutoClick()
    state.autoClick = false
    if state.autoClickConn then state.autoClickConn:Disconnect() state.autoClickConn = nil end
    Notify("Auto Click","Выключен","Info",nil,2)
end

local function applySpeed()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = state.speedEnabled and state.walkSpeed or 16
        hum.UseJumpPower = true
        hum.JumpPower = state.jumpPower
    end
end

local function startFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    state.flyEnabled = true
    hum.PlatformStand = true
    local bv = Instance.new("BodyVelocity")
    bv.Name = "HirukuFlyVel"
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.zero
    bv.Parent = hrp
    local bg = Instance.new("BodyGyro")
    bg.Name = "HirukuFlyGyro"
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.P = 10000
    bg.D = 100
    bg.CFrame = hrp.CFrame
    bg.Parent = hrp
    state.flyConn = RunService.RenderStepped:Connect(function()
        if not state.flyEnabled then return end
        local c = LocalPlayer.Character
        local p = c and c:FindFirstChild("HumanoidRootPart")
        if not p or not bv.Parent then return end
        local cam = workspace.CurrentCamera
        local dir = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end
        if dir.Magnitude > 0 then dir = dir.Unit end
        bv.Velocity = dir * state.flySpeed
        bg.CFrame = CFrame.new(p.Position, p.Position + cam.CFrame.LookVector)
    end)
    Notify("Fly","Включён","Success",nil,3)
end

local function stopFly()
    state.flyEnabled = false
    if state.flyConn then state.flyConn:Disconnect() state.flyConn = nil end
    local char = LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hrp then
            local bv = hrp:FindFirstChild("HirukuFlyVel") if bv then bv:Destroy() end
            local bg = hrp:FindFirstChild("HirukuFlyGyro") if bg then bg:Destroy() end
            hrp.AssemblyLinearVelocity = Vector3.zero
        end
        if hum then hum.PlatformStand = false end
    end
    Notify("Fly","Выключен","Info",nil,2)
end

local function startNoClip()
    state.noclip = true
    state.noclipConn = RunService.Stepped:Connect(function()
        if not state.noclip then return end
        local char = LocalPlayer.Character
        if not char then return end
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end)
    Notify("NoClip","Включён","Success",nil,2)
end

local function stopNoClip()
    state.noclip = false
    if state.noclipConn then state.noclipConn:Disconnect() state.noclipConn = nil end
    local char = LocalPlayer.Character
    if char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end
        end
    end
    Notify("NoClip","Выключен","Info",nil,2)
end

UserInputService.JumpRequest:Connect(function()
    if not state.infiniteJump then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

LocalPlayer.Idled:Connect(function()
    if not state.antiAFK then return end
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local secFarm = Tabs.Farm:AddSection("Auto Click","solar/cursor-bold")
local secChar = Tabs.Character:AddSection("Movement","solar/rocket-bold")
local secMisc = Tabs.Misc:AddSection("System","solar/widget-bold")
local secSet = Tabs.Settings:AddSection("Theme","solar/palette-bold")

secFarm:AddToggle("AutoClick", {
    Title = "Auto Click",
    Description = "Автоматически кликает по Remote события клика",
    Icon = "solar/cursor-bold",
    Default = false,
    Callback = function(v)
        if v then startAutoClick() else stopAutoClick() end
    end
})

secFarm:AddSlider("ClickSpeed", {
    Title = "Clicks Per Frame",
    Description = "Сколько FireServer за кадр (60 кадров = x60 в сек)",
    Icon = "solar/speedometer-bold",
    Min = 1, Max = 100, Default = 20, Rounding = 0,
    Callback = function(v) state.autoClickSpeed = v end
})

secFarm:AddToggle("AutoRebirth", {
    Title = "Auto Rebirth",
    Description = "Автоматически перерождается когда доступно",
    Icon = "solar/refresh-bold",
    Default = false,
    Callback = function(v)
        state.autoRebirth = v
        if state.autoRebirthConn then state.autoRebirthConn:Disconnect() state.autoRebirthConn = nil end
        if v then
            state.autoRebirthConn = RunService.Heartbeat:Connect(function()
                if not state.autoRebirth then return end
                pcall(function()
                    for _, r in ipairs(ReplicatedStorage:GetDescendants()) do
                        if r:IsA("RemoteEvent") and r.Name:lower():find("rebirth") then
                            r:FireServer()
                        end
                    end
                end)
            end)
        end
    end
})

secChar:AddToggle("Speed", {
    Title = "Speed Hack",
    Description = "Увеличивает скорость передвижения",
    Icon = "solar/running-bold",
    Default = false,
    Callback = function(v)
        state.speedEnabled = v
        applySpeed()
    end
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
    Callback = function(v)
        if v then startFly() else stopFly() end
    end
})

secChar:AddSlider("FlySpeed", {
    Title = "Fly Speed",
    Icon = "solar/speedometer-bold",
    Min = 50, Max = 1000, Default = 200, Rounding = 0,
    Callback = function(v) state.flySpeed = v end
})

secChar:AddToggle("InfJump", {
    Title = "Infinite Jump",
    Description = "Позволяет прыгать бесконечно в воздухе",
    Icon = "solar/arrow-up-bold",
    Default = false,
    Callback = function(v) state.infiniteJump = v end
})

secChar:AddToggle("NoClip", {
    Title = "No Clip",
    Description = "Проходит сквозь стены",
    Icon = "solar/ghost-bold",
    Default = false,
    Callback = function(v)
        if v then startNoClip() else stopNoClip() end
    end
})

secMisc:AddToggle("AntiAFK", {
    Title = "Anti-AFK",
    Description = "Не даёт кикнуть за неактивность",
    Icon = "solar/shield-check-bold",
    Default = true,
    Callback = function(v) state.antiAFK = v end
})

secMisc:AddButton({
    Title = "Rejoin Server",
    Description = "Переподключиться к этому же серверу",
    Icon = "solar/logout-2-bold",
    Callback = function()
        pcall(function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end)
    end
})

secMisc:AddButton({
    Title = "Reset Character",
    Description = "Перерождает персонажа",
    Icon = "solar/restart-bold",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = 0 end
        end
    end
})

secSet:AddButton({ Title = "Theme: HirukuViolet", Icon = "solar/palette-bold",
    Callback = function() Fluent:SetTheme("HirukuViolet") Notify("Theme","HirukuViolet","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: NeonBlue", Icon = "solar/star-bold",
    Callback = function() Fluent:SetTheme("NeonBlue") Notify("Theme","NeonBlue","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: EmeraldDark", Icon = "solar/leaf-bold",
    Callback = function() Fluent:SetTheme("EmeraldDark") Notify("Theme","EmeraldDark","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: Sunset", Icon = "solar/sun-bold",
    Callback = function() Fluent:SetTheme("Sunset") Notify("Theme","Sunset","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: SlateStatic", Icon = "solar/pause-circle-bold",
    Callback = function() Fluent:SetTheme("SlateStatic") Notify("Theme","SlateStatic","Success",nil,2) end })
secSet:AddButton({ Title = "Theme: SlateAnimated", Icon = "solar/play-circle-bold",
    Callback = function() Fluent:SetTheme("SlateAnimated") Notify("Theme","SlateAnimated","Success",nil,2) end })

Fluent:SetTheme("HirukuViolet")

local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "HirukuOpenUi"
toggleGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
toggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
toggleGui.ResetOnSpawn = false

local mainBtn = Instance.new("TextButton")
mainBtn.Name = "HirukuButton"
mainBtn.Parent = toggleGui
mainBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
mainBtn.BackgroundTransparency = 1
mainBtn.Position = UDim2.new(.1,0,.1,0)
mainBtn.Size = UDim2.new(0,64,0,40)
mainBtn.Text = ""
mainBtn.Visible = true
Instance.new("UICorner", mainBtn)

local sizeBackMulti = .3

local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Name = "RotatingBackground"
backgroundImage.Parent = mainBtn
backgroundImage.Size = UDim2.new(2.3 + sizeBackMulti, 0, 2.3 + sizeBackMulti, 0)
backgroundImage.Position = UDim2.new(.5,0,.5,0)
backgroundImage.AnchorPoint = Vector2.new(.5,.5)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Image = "rbxassetid://101413790701475"
backgroundImage.SizeConstraint = Enum.SizeConstraint.RelativeXX

local frontImage = Instance.new("ImageLabel")
frontImage.Name = "StaticIcon"
frontImage.Parent = mainBtn
frontImage.Size = UDim2.fromOffset(55,55)
frontImage.Position = UDim2.new(.5,0,.5,0)
frontImage.AnchorPoint = Vector2.new(.5,.5)
frontImage.BackgroundTransparency = 1
frontImage.Image = "rbxassetid://134899357436301"
frontImage.ZIndex = 1
Instance.new("UICorner", frontImage).CornerRadius = UDim.new(.2,0)

local rotation = 0
local rotSpeed = 90
local lastTime = tick()
task.spawn(function()
    while true do
        local now = tick()
        local delta = now - lastTime
        lastTime = now
        rotation = (rotation + rotSpeed * delta) % 360
        backgroundImage.Rotation = rotation
        task.wait()
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

mainBtn.MouseButton1Click:Connect(function()
    local sounds = {"7127123605","438666542"}
    PlaySound(sounds[math.random(#sounds)])
    uiOpen = not uiOpen
    if uiOpen then Window:Show() else Window:Hide() end
    local function SmoothSpeed(target, dur)
        local start = rotSpeed
        local steps = 30
        for i = 1, steps do
            rotSpeed = start + (target - start) * (i / steps)
            task.wait(dur / steps)
        end
        rotSpeed = target
    end
    task.spawn(function()
        SmoothSpeed(360, .4)
        task.wait(.5)
        SmoothSpeed(180, .4)
        task.wait(.3)
        SmoothSpeed(90, .4)
    end)
end)

local oldChar
local function bindChar(char)
    if not char then return end
    task.wait(.6)
    applySpeed()
    if state.flyEnabled and not state.flyConn then startFly() end
    if state.noclip and not state.noclipConn then startNoClip() end
end

LocalPlayer.CharacterAdded:Connect(bindChar)
if LocalPlayer.Character then bindChar(LocalPlayer.Character) end

Notify("Hiruku Lua","Меню загружено","Success","solar/planet-bold",4)
task.delay(.5, function() Window:SelectTab(1) end)