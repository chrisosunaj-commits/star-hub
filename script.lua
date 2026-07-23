-- ==============================================================================
-- 🌠 Star Executor - Arceus X Compatible Version (Infinite Yield Added)
-- ==============================================================================

if not game:IsLoaded() then 
	game.Loaded:Wait() 
end
task.wait(0.5)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SelectedFont = Enum.Font.GothamBold

-- 1. MAIN SCREEN GUI CREATION
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StarExecutor"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999999
ScreenGui.Enabled = true

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
if PlayerGui then
	ScreenGui.Parent = PlayerGui
else
	pcall(function()
		ScreenGui.Parent = game:GetService("CoreGui")
	end)
end

-- 2. MAIN FRAME (Wider and clean UI layout)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 520)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- TITLE AND LOGO
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 220, 0, 40)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "🌠 Star Executor"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 20
Title.Font = SelectedFont
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.ZIndex = 3
Title.Parent = MainFrame

-- 3. CLOSE BUTTON (X)
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 85, 85)
CloseButton.TextSize = 18
CloseButton.Font = SelectedFont
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CloseButton.ZIndex = 3
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- 4. MINIMIZE BUTTON (-)
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -75, 0, 10)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(240, 240, 240)
MinimizeButton.TextSize = 20
MinimizeButton.Font = SelectedFont
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MinimizeButton.ZIndex = 3
MinimizeButton.Parent = MainFrame

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 6)
MiniCorner.Parent = MinimizeButton

-- 5. FLOATING CIRCLE
local FloatingCircle = Instance.new("TextButton")
FloatingCircle.Name = "FloatingCircle"
FloatingCircle.Size = UDim2.new(0, 60, 0, 60)
FloatingCircle.Position = UDim2.new(0.05, 0, 0.35, 0)
FloatingCircle.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
FloatingCircle.Text = "🌠"
FloatingCircle.TextSize = 28
FloatingCircle.Visible = false
FloatingCircle.Active = true
FloatingCircle.Parent = ScreenGui

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = FloatingCircle

local CircleStroke = Instance.new("UIStroke")
CircleStroke.Color = Color3.fromRGB(255, 215, 0)
CircleStroke.Thickness = 2
CircleStroke.Parent = FloatingCircle

-- ==========================================
-- TABS SYSTEM
-- ==========================================
local TabButton1 = Instance.new("TextButton")
TabButton1.Size = UDim2.new(0, 175, 0, 32)
TabButton1.Position = UDim2.new(0, 20, 0, 48)
TabButton1.Text = "⚡ Main & Hacks"
TabButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
TabButton1.TextSize = 13
TabButton1.Font = SelectedFont
TabButton1.BackgroundColor3 = Color3.fromRGB(130, 50, 200)
TabButton1.ZIndex = 3
TabButton1.Parent = MainFrame

local Tab1Corner = Instance.new("UICorner")
Tab1Corner.CornerRadius = UDim.new(0, 6)
Tab1Corner.Parent = TabButton1

local TabButton2 = Instance.new("TextButton")
TabButton2.Size = UDim2.new(0, 175, 0, 32)
TabButton2.Position = UDim2.new(1, -195, 0, 48)
TabButton2.Text = "🎯 MM2 & Extra"
TabButton2.TextColor3 = Color3.fromRGB(200, 200, 200)
TabButton2.TextSize = 13
TabButton2.Font = SelectedFont
TabButton2.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TabButton2.ZIndex = 3
TabButton2.Parent = MainFrame

local Tab2Corner = Instance.new("UICorner")
Tab2Corner.CornerRadius = UDim.new(0, 6)
Tab2Corner.Parent = TabButton2

-- CONTAINER 1: MAIN & HACKS
local Container1 = Instance.new("ScrollingFrame")
Container1.Size = UDim2.new(0, 360, 0, 410)
Container1.Position = UDim2.new(0, 20, 0, 88)
Container1.BackgroundTransparency = 1
Container1.BorderSizePixel = 0
Container1.CanvasSize = UDim2.new(0, 0, 0, 540)
Container1.ScrollBarThickness = 4
Container1.Visible = true
Container1.ZIndex = 3
Container1.Parent = MainFrame

-- CONTAINER 2: MM2 & EXTRA
local Container2 = Instance.new("ScrollingFrame")
Container2.Size = UDim2.new(0, 360, 0, 410)
Container2.Position = UDim2.new(0, 20, 0, 88)
Container2.BackgroundTransparency = 1
Container2.BorderSizePixel = 0
Container2.CanvasSize = UDim2.new(0, 0, 0, 460)
Container2.ScrollBarThickness = 4
Container2.Visible = false
Container2.ZIndex = 3
Container2.Parent = MainFrame

-- --- CONTAINER 1 ELEMENTS ---
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 172, 0, 38)
SpeedButton.Position = UDim2.new(0, 0, 0, 0)
SpeedButton.Text = "Speed"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.TextSize = 14
SpeedButton.Font = SelectedFont
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
SpeedButton.ZIndex = 3
SpeedButton.Parent = Container1
Instance.new("UICorner", SpeedButton).CornerRadius = UDim.new(0, 8)

local JumpButton = Instance.new("TextButton")
JumpButton.Size = UDim2.new(0, 172, 0, 38)
JumpButton.Position = UDim2.new(1, -172, 0, 0)
JumpButton.Text = "Jump"
JumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpButton.TextSize = 14
JumpButton.Font = SelectedFont
JumpButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
JumpButton.ZIndex = 3
JumpButton.Parent = Container1
Instance.new("UICorner", JumpButton).CornerRadius = UDim.new(0, 8)

local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0, 360, 0, 38)
FlyButton.Position = UDim2.new(0, 0, 0, 48)
FlyButton.Text = "Fly: OFF"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextSize = 14
FlyButton.Font = SelectedFont
FlyButton.BackgroundColor3 = Color3.fromRGB(130, 50, 200)
FlyButton.ZIndex = 3
FlyButton.Parent = Container1
Instance.new("UICorner", FlyButton).CornerRadius = UDim.new(0, 8)

local AntiFlingButton = Instance.new("TextButton")
AntiFlingButton.Size = UDim2.new(0, 360, 0, 38)
AntiFlingButton.Position = UDim2.new(0, 0, 0, 96)
AntiFlingButton.Text = "🛡️ Anti-Fling: OFF"
AntiFlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiFlingButton.TextSize = 14
AntiFlingButton.Font = SelectedFont
AntiFlingButton.BackgroundColor3 = Color3.fromRGB(80, 20, 100)
AntiFlingButton.ZIndex = 3
AntiFlingButton.Parent = Container1
Instance.new("UICorner", AntiFlingButton).CornerRadius = UDim.new(0, 8)

local NoclipButton = Instance.new("TextButton")
NoclipButton.Size = UDim2.new(0, 360, 0, 38)
NoclipButton.Position = UDim2.new(0, 0, 0, 144)
NoclipButton.Text = "👻 Noclip: OFF"
NoclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipButton.TextSize = 14
NoclipButton.Font = SelectedFont
NoclipButton.BackgroundColor3 = Color3.fromRGB(50, 100, 120)
NoclipButton.ZIndex = 3
NoclipButton.Parent = Container1
Instance.new("UICorner", NoclipButton).CornerRadius = UDim.new(0, 8)

local AimbotButton = Instance.new("TextButton")
AimbotButton.Size = UDim2.new(0, 360, 0, 38)
AimbotButton.Position = UDim2.new(0, 0, 0, 192)
AimbotButton.Text = "Camera Aimbot: OFF"
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.TextSize = 14
AimbotButton.Font = SelectedFont
AimbotButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
AimbotButton.ZIndex = 3
AimbotButton.Parent = Container1
Instance.new("UICorner", AimbotButton).CornerRadius = UDim.new(0, 8)

-- SIZE SLIDER
local SizeLabel = Instance.new("TextLabel")
SizeLabel.Size = UDim2.new(0, 360, 0, 18)
SizeLabel.Position = UDim2.new(0, 0, 0, 240)
SizeLabel.Text = "Character Size: 1.0x"
SizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeLabel.TextSize = 13
SizeLabel.Font = SelectedFont
SizeLabel.BackgroundTransparency = 1
SizeLabel.ZIndex = 3
SizeLabel.Parent = Container1

local SizeBarBackground = Instance.new("TextButton")
SizeBarBackground.Size = UDim2.new(0, 360, 0, 22)
SizeBarBackground.Position = UDim2.new(0, 0, 0, 260)
SizeBarBackground.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SizeBarBackground.Text = ""
SizeBarBackground.AutoButtonColor = false
SizeBarBackground.ZIndex = 3
SizeBarBackground.Parent = Container1
Instance.new("UICorner", SizeBarBackground).CornerRadius = UDim.new(0, 6)

local SizeBarFill = Instance.new("Frame")
SizeBarFill.Size = UDim2.new(0.5, 0, 1, 0)
SizeBarFill.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
SizeBarFill.BorderSizePixel = 0
SizeBarFill.ZIndex = 3
SizeBarFill.Parent = SizeBarBackground
Instance.new("UICorner", SizeBarFill).CornerRadius = UDim.new(0, 6)

local SizeKnob = Instance.new("Frame")
SizeKnob.Size = UDim2.new(0, 12, 0, 28)
SizeKnob.Position = UDim2.new(0.5, -6, 0.5, -14)
SizeKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SizeKnob.BorderSizePixel = 0
SizeKnob.ZIndex = 4
SizeKnob.Parent = SizeBarBackground
Instance.new("UICorner", SizeKnob).CornerRadius = UDim.new(0, 4)

local UniversalFlingButton = Instance.new("TextButton")
UniversalFlingButton.Size = UDim2.new(0, 360, 0, 38)
UniversalFlingButton.Position = UDim2.new(0, 0, 0, 292)
UniversalFlingButton.Text = "Universal Fling (Click Target)"
UniversalFlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UniversalFlingButton.TextSize = 13
UniversalFlingButton.Font = SelectedFont
UniversalFlingButton.BackgroundColor3 = Color3.fromRGB(210, 40, 40)
UniversalFlingButton.ZIndex = 3
UniversalFlingButton.Parent = Container1
Instance.new("UICorner", UniversalFlingButton).CornerRadius = UDim.new(0, 8)

local RejoinButton = Instance.new("TextButton")
RejoinButton.Size = UDim2.new(0, 172, 0, 38)
RejoinButton.Position = UDim2.new(0, 0, 0, 340)
RejoinButton.Text = "🔄 Rejoin Server"
RejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinButton.TextSize = 13
RejoinButton.Font = SelectedFont
RejoinButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
RejoinButton.ZIndex = 3
RejoinButton.Parent = Container1
Instance.new("UICorner", RejoinButton).CornerRadius = UDim.new(0, 8)

local FullbrightButton = Instance.new("TextButton")
FullbrightButton.Size = UDim2.new(0, 172, 0, 38)
FullbrightButton.Position = UDim2.new(1, -172, 0, 340)
FullbrightButton.Text = "💡 Fullbright: OFF"
FullbrightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FullbrightButton.TextSize = 13
FullbrightButton.Font = SelectedFont
FullbrightButton.BackgroundColor3 = Color3.fromRGB(180, 140, 0)
FullbrightButton.ZIndex = 3
FullbrightButton.Parent = Container1
Instance.new("UICorner", FullbrightButton).CornerRadius = UDim.new(0, 8)

-- --- CONTAINER 2 ELEMENTS (MM2 & INFINITE YIELD) ---
local MM2EspButton = Instance.new("TextButton")
MM2EspButton.Size = UDim2.new(0, 360, 0, 42)
MM2EspButton.Position = UDim2.new(0, 0, 0, 0)
MM2EspButton.Text = "MM2 Roles ESP: OFF"
MM2EspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MM2EspButton.TextSize = 14
MM2EspButton.Font = SelectedFont
MM2EspButton.BackgroundColor3 = Color3.fromRGB(220, 130, 0)
MM2EspButton.ZIndex = 3
MM2EspButton.Parent = Container2
Instance.new("UICorner", MM2EspButton).CornerRadius = UDim.new(0, 8)

local TpGunButton = Instance.new("TextButton")
TpGunButton.Size = UDim2.new(0, 360, 0, 42)
TpGunButton.Position = UDim2.new(0, 0, 0, 52)
TpGunButton.Text = "🔫 Teleport to Dropped Gun (MM2)"
TpGunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TpGunButton.TextSize = 13
TpGunButton.Font = SelectedFont
TpGunButton.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
TpGunButton.ZIndex = 3
TpGunButton.Parent = Container2
Instance.new("UICorner", TpGunButton).CornerRadius = UDim.new(0, 8)

-- INFINITE YIELD BUTTON (Reemplazo de los teleports de mapa/lobby)
local InfYieldButton = Instance.new("TextButton")
InfYieldButton.Size = UDim2.new(0, 360, 0, 42)
InfYieldButton.Position = UDim2.new(0, 0, 0, 104)
InfYieldButton.Text = "⚡ Load Infinite Yield (IY)"
InfYieldButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InfYieldButton.TextSize = 14
InfYieldButton.Font = SelectedFont
InfYieldButton.BackgroundColor3 = Color3.fromRGB(150, 0, 200)
InfYieldButton.ZIndex = 3
InfYieldButton.Parent = Container2
Instance.new("UICorner", InfYieldButton).CornerRadius = UDim.new(0, 8)

local FlingMurderButton = Instance.new("TextButton")
FlingMurderButton.Size = UDim2.new(0, 172, 0, 42)
FlingMurderButton.Position = UDim2.new(0, 0, 0, 156)
FlingMurderButton.Text = "Fling Murderer"
FlingMurderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingMurderButton.TextSize = 13
FlingMurderButton.Font = SelectedFont
FlingMurderButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlingMurderButton.ZIndex = 3
FlingMurderButton.Parent = Container2
Instance.new("UICorner", FlingMurderButton).CornerRadius = UDim.new(0, 8)

local FlingSheriffButton = Instance.new("TextButton")
FlingSheriffButton.Size = UDim2.new(0, 172, 0, 42)
FlingSheriffButton.Position = UDim2.new(1, -172, 0, 156)
FlingSheriffButton.Text = "Fling Sheriff"
FlingSheriffButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingSheriffButton.TextSize = 13
FlingSheriffButton.Font = SelectedFont
FlingSheriffButton.BackgroundColor3 = Color3.fromRGB(0, 50, 180)
FlingSheriffButton.ZIndex = 3
FlingSheriffButton.Parent = Container2
Instance.new("UICorner", FlingSheriffButton).CornerRadius = UDim.new(0, 8)

local TpPlayerButton = Instance.new("TextButton")
TpPlayerButton.Size = UDim2.new(0, 360, 0, 42)
TpPlayerButton.Position = UDim2.new(0, 0, 0, 208)
TpPlayerButton.Text = "📍 Teleport to Random Player"
TpPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TpPlayerButton.TextSize = 13
TpPlayerButton.Font = SelectedFont
TpPlayerButton.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
TpPlayerButton.ZIndex = 3
TpPlayerButton.Parent = Container2
Instance.new("UICorner", TpPlayerButton).CornerRadius = UDim.new(0, 8)

-- TABS CONTROL
TabButton1.MouseButton1Click:Connect(function()
	Container1.Visible = true
	Container2.Visible = false
	TabButton1.BackgroundColor3 = Color3.fromRGB(130, 50, 200)
	TabButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabButton2.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
	TabButton2.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

TabButton2.MouseButton1Click:Connect(function()
	Container1.Visible = false
	Container2.Visible = true
	TabButton2.BackgroundColor3 = Color3.fromRGB(130, 50, 200)
	TabButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabButton1.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
	TabButton1.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

--- ==========================================
--- BACKGROUND STARS EFFECT
--- ==========================================
for i = 1, 35 do
	local StarDot = Instance.new("Frame")
	StarDot.Name = "NightStar"
	StarDot.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
	StarDot.Position = UDim2.new(math.random(0, 100)/100, 0, math.random(0, 100)/100, 0)
	StarDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	StarDot.BorderSizePixel = 0
	StarDot.ZIndex = 1

	local StarCorner = Instance.new("UICorner")
	StarCorner.CornerRadius = UDim.new(1, 0)
	StarCorner.Parent = StarDot
	StarDot.Parent = MainFrame

	task.spawn(function()
		while task.wait(math.random(10, 30) / 10) do
			if MainFrame.Visible then
				local TargetTrans = math.random(3, 8) / 10
				TweenService:Create(StarDot, TweenInfo.new(1), {BackgroundTransparency = TargetTrans}):Play()
			end
		end
	end)
end

--- ==========================================
--- DRAGGABLE SYSTEM (Fully Mobile/Arceus X Friendly)
--- ==========================================
local function makeDraggable(guiObject)
	local dragging, dragInput, dragStart, startPos

	guiObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = guiObject.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	guiObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

makeDraggable(MainFrame)
makeDraggable(FloatingCircle)

--- ==========================================
--- UI CONTROLS
--- ==========================================
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

MinimizeButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	FloatingCircle.Visible = true
end)

FloatingCircle.MouseButton1Click:Connect(function()
	FloatingCircle.Visible = false
	MainFrame.Visible = true
end)

--- ==========================================
--- CORE MOD FEATURES
--- ==========================================
local speedActive = false
local jumpActive = false
local flyActive = false
local espActive = false
local antiFlingActive = false
local noclipActive = false
local aimbotActive = false
local fullbrightActive = false

local flyConnection, flyGyro, flyVelocity
local antiFlingConnection = nil
local noclipConnection = nil

SpeedButton.MouseButton1Click:Connect(function()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		speedActive = not speedActive
		if speedActive then
			humanoid.WalkSpeed = 64
			SpeedButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			SpeedButton.Text = "Normal (Speed)"
		else
			humanoid.WalkSpeed = 16
			SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
			SpeedButton.Text = "Speed"
		end
	end
end)

JumpButton.MouseButton1Click:Connect(function()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		jumpActive = not jumpActive
		if jumpActive then
			humanoid.UseJumpPower = true
			humanoid.JumpPower = 120
			JumpButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			JumpButton.Text = "Normal (Jump)"
		else
			humanoid.JumpPower = 50
			JumpButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
			JumpButton.Text = "Jump"
		end
	end
end)

-- ==============================================================================
-- 🚀 TRUE CLASSIC /FLY ENGINE
-- ==============================================================================
FlyButton.MouseButton1Click:Connect(function()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not rootPart or not humanoid then return end

	flyActive = not flyActive
	if flyActive then
		FlyButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		FlyButton.Text = "Fly: ON"

		flyGyro = Instance.new("BodyGyro")
		flyGyro.P = 9e4
		flyGyro.maxTorque = Vector3.new(9e5, 9e5, 9e5)
		flyGyro.cframe = rootPart.CFrame
		flyGyro.Parent = rootPart

		flyVelocity = Instance.new("BodyVelocity")
		flyVelocity.maxForce = Vector3.new(9e5, 9e5, 9e5)
		flyVelocity.velocity = Vector3.new(0, 0, 0)
		flyVelocity.Parent = rootPart

		humanoid.PlatformStand = true
		local camera = workspace.CurrentCamera
		
		flyConnection = RunService.RenderStepped:Connect(function()
			if rootPart and flyVelocity and flyGyro then
				flyGyro.cframe = camera.CFrame
				
				local moveDir = humanoid.MoveDirection
				local speedVal = 50
				
				if moveDir.Magnitude > 0 then
					local camLook = camera.CFrame.LookVector
					local camRight = camera.CFrame.RightVector
					
					local targetMove = Vector3.new(0, 0, 0)
					if moveDir.Z < 0 then
						targetMove = targetMove + camLook
					elseif moveDir.Z > 0 then
						targetMove = targetMove - camLook
					end
					
					if moveDir.X > 0 then
						targetMove = targetMove + camRight
					elseif moveDir.X < 0 then
						targetMove = targetMove - camRight
					end
					
					flyVelocity.velocity = targetMove.Unit * speedVal
				else
					flyVelocity.velocity = Vector3.new(0, 0, 0)
				end
			end
		end)
	else
		FlyButton.BackgroundColor3 = Color3.fromRGB(130, 50, 200)
		FlyButton.Text = "Fly: OFF"
		if flyConnection then flyConnection:Disconnect() flyConnection = nil end
		if flyGyro then flyGyro:Destroy() flyGyro = nil end
		if flyVelocity then flyVelocity:Destroy() flyVelocity = nil end
		humanoid.PlatformStand = false
	end
end)

-- ==============================================================================
-- 🛡️ ANTI-FLING ENGINE
-- ==============================================================================
AntiFlingButton.MouseButton1Click:Connect(function()
	antiFlingActive = not antiFlingActive
	if antiFlingActive then
		AntiFlingButton.BackgroundColor3 = Color3.fromRGB(0, 180, 50)
		AntiFlingButton.Text = "🛡️ Anti-Fling: ON"

		antiFlingConnection = RunService.Stepped:Connect(function()
			local character = LocalPlayer.Character
			if character then
				local rootPart = character:FindFirstChild("HumanoidRootPart")
				if rootPart then
					for _, child in pairs(rootPart:GetChildren()) do
						if child:IsA("BodyVelocity") or child:IsA("BodyAngularVelocity") or child:IsA("BodyForce") or child:IsA("LinearVelocity") then
							child:Destroy()
						end
					end
					rootPart.RotVelocity = Vector3.new(0, 0, 0)
				end
			end
		end)
	else
		AntiFlingButton.BackgroundColor3 = Color3.fromRGB(80, 20, 100)
		AntiFlingButton.Text = "🛡️ Anti-Fling: OFF"
		if antiFlingConnection then
			antiFlingConnection:Disconnect()
			antiFlingConnection = nil
		end
	end
end)

-- ==============================================================================
-- 👻 NOCLIP ENGINE
-- ==============================================================================
NoclipButton.MouseButton1Click:Connect(function()
	noclipActive = not noclipActive
	if noclipActive then
		NoclipButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		NoclipButton.Text = "👻 Noclip: ON"

		noclipConnection = RunService.Stepped:Connect(function()
			local character = LocalPlayer.Character
			if character then
				for _, part in pairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		end)
	else
		NoclipButton.BackgroundColor3 = Color3.fromRGB(50, 100, 120)
		NoclipButton.Text = "👻 Noclip: OFF"
		if noclipConnection then
			noclipConnection:Disconnect()
			noclipConnection = nil
		end
		local character = LocalPlayer.Character
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
					part.CanCollide = true
				end
			end
		end
	end
end)

-- ==============================================================================
-- 📏 INSTANT WORKING CHARACTER SIZE SLIDER ENGINE
-- ==============================================================================
local function setCharacterScale(scaleMultiplier)
	local character = LocalPlayer.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	pcall(function()
		for _, desc in pairs(humanoid:GetChildren()) do
			if desc:IsA("NumberValue") and (desc.Name:find("Scale") or desc.Name:find("Height") or desc.Name:find("Width") or desc.Name:find("Head")) then
				desc.Value = scaleMultiplier
			end
		end
		
		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if rootPart then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					if not part:FindFirstChild("OriginalSize") then
						local origSize = Instance.new("Vector3Value")
						origSize.Name = "OriginalSize"
						origSize.Value = part.Size
						origSize.Parent = part
					end
					
					if part.Name ~= "HumanoidRootPart" and part:FindFirstChild("OriginalSize") then
						part.Size = part.OriginalSize.Value * scaleMultiplier
					end
				end
			end
		end
	end)
end

local isDraggingSize = false

SizeBarBackground.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isDraggingSize = true
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isDraggingSize = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if isDraggingSize and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local barAbsolutePos = SizeBarBackground.AbsolutePosition.X
		local barAbsoluteSize = SizeBarBackground.AbsoluteSize.X
		local inputX = input.Position.X

		local relativeX = math.clamp((inputX - barAbsolutePos) / barAbsoluteSize, 0, 1)
		SizeBarFill.Size = UDim2.new(relativeX, 0, 1, 0)
		SizeKnob.Position = UDim2.new(relativeX, -6, 0.5, -14)

		local scaleValue = 0.3 + (relativeX * 2.7)
		if math.abs(relativeX - 0.5) < 0.03 then
			scaleValue = 1.0
		end

		SizeLabel.Text = string.format("Character Size: %.1fx", scaleValue)
		setCharacterScale(scaleValue)
	end
end)

-- ==============================================================================
-- UTILITIES & INFINITE YIELD EXECUTOR
-- ==============================================================================
RejoinButton.MouseButton1Click:Connect(function()
	local TeleportService = game:GetService("TeleportService")
	TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

FullbrightButton.MouseButton1Click:Connect(function()
	fullbrightActive = not fullbrightActive
	if fullbrightActive then
		FullbrightButton.BackgroundColor3 = Color3.fromRGB(0, 180, 50)
		FullbrightButton.Text = "💡 Fullbright: ON"
		game:GetService("Lighting").Brightness = 2
		game:GetService("Lighting").ClockTime = 14
		game:GetService("Lighting").GlobalShadows = false
	else
		FullbrightButton.BackgroundColor3 = Color3.fromRGB(180, 140, 0)
		FullbrightButton.Text = "💡 Fullbright: OFF"
		game:GetService("Lighting").GlobalShadows = true
	end
end)

TpGunButton.MouseButton1Click:Connect(function()
	local character = LocalPlayer.Character
	local rootPart = character and character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	local foundGun = false
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("Tool") and obj.Name == "Gun" and obj:FindFirstChild("Handle") then
			rootPart.CFrame = obj.Handle.CFrame + Vector3.new(0, 3, 0)
			foundGun = true
			break
		end
	end
	if not foundGun then
		for _, dropped in pairs(workspace:GetChildren()) do
			if dropped.Name == "GunDrop" or dropped.Name == "Gun" then
				if dropped:IsA("BasePart") then
					rootPart.CFrame = dropped.CFrame + Vector3.new(0, 3, 0)
					foundGun = true
					break
				end
			end
		end
	end
end)

-- Botón para cargar Infinite Yield de golpe
InfYieldButton.MouseButton1Click:Connect(function()
	pcall(function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
end)

TpPlayerButton.MouseButton1Click:Connect(function()
	local character = LocalPlayer.Character
	local rootPart = character and character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end

	local playersList = Players:GetPlayers()
	for _, p in pairs(playersList) do
		if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			rootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(3, 0, 3)
			break
		end
	end
end)

-- ==============================================================================
-- CAMERA AIMBOT
-- ==============================================================================
local camera = workspace.CurrentCamera
local isPressingScreen = false
local aimbotConnection = nil

local function getClosestPlayerToCenter()
	local closestPlayer = nil
	local shortestDistance = math.huge
	local screenSize = camera.ViewportSize
	local centerScreen = Vector2.new(screenSize.X / 2, screenSize.Y / 2)

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.Health > 0 then
				local pos, onScreen = camera:WorldToViewportPoint(player.Character.Head.Position)
				if onScreen then
					local distance = (Vector2.new(pos.X, pos.Y) - centerScreen).Magnitude
					if distance < shortestDistance then
						shortestDistance = distance
						closestPlayer = player
					end
				end
			end
		end
	end
	return closestPlayer
end

AimbotButton.MouseButton1Click:Connect(function()
	aimbotActive = not aimbotActive
	if aimbotActive then
		AimbotButton.BackgroundColor3 = Color3.fromRGB(0, 180, 50)
		AimbotButton.Text = "Camera Aimbot: ON"

		aimbotConnection = RunService.RenderStepped:Connect(function()
			if aimbotActive and isPressingScreen then
				local target = getClosestPlayerToCenter()
				if target and target.Character and target.Character:FindFirstChild("Head") then
					camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
				end
			end
		end)
	else
		AimbotButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		AimbotButton.Text = "Camera Aimbot: OFF"
		if aimbotConnection then aimbotConnection:Disconnect() aimbotConnection = nil end
	end
end)

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isPressingScreen = true
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		isPressingScreen = false
	end
end)

--- ==========================================
--- MM2 ROLE DETECTOR & ESP SYSTEM
--- ==========================================
local currentEspHighlights = {}

local function cleanEsp()
	local success, err = pcall(function()
		for _, inst in pairs(currentEspHighlights) do
			if inst then inst:Destroy() end
		end
		currentEspHighlights = {}
	end)
end

local function getMM2Role(player)
	local success, result = pcall(function()
		if player.Backpack:FindFirstChild("Knife") or (player.Character and player.Character:FindFirstChild("Knife")) then
			return "Murderer"
		elseif player.Backpack:FindFirstChild("Gun") or (player.Character and player.Character:FindFirstChild("Gun")) then
			return "Sheriff"
		end
		return "Innocent"
	end)
	return success and result or "Innocent"
end

task.spawn(function()
	while task.wait(1) do
		if espActive then
			cleanEsp()
			for _, p in pairs(Players:GetPlayers()) do
				pcall(function()
					if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
						local role = getMM2Role(p)
						local roleColor = Color3.fromRGB(0, 255, 100)

						if role == "Murderer" then
							roleColor = Color3.fromRGB(255, 0, 0)
						elseif role == "Sheriff" then
							roleColor = Color3.fromRGB(0, 100, 255)
						end

						local Highlight = Instance.new("Highlight")
						Highlight.Name = "StarESP"
						Highlight.FillColor = roleColor
						Highlight.FillTransparency = 0.6
						Highlight.OutlineColor = roleColor
						Highlight.OutlineTransparency = 0.1
						Highlight.Adornee = p.Character
						Highlight.Parent = ScreenGui
						table.insert(currentEspHighlights, Highlight)

						local Billboard = Instance.new("BillboardGui")
						Billboard.Size = UDim2.new(0, 100, 0, 30)
						Billboard.AlwaysOnTop = true
						Billboard.Adornee = p.Character:FindFirstChild("Head")
						Billboard.ExtentsOffset = Vector3.new(0, 2.5, 0)

						local Label = Instance.new("TextLabel", Billboard)
						Label.Size = UDim2.new(1, 0, 1, 0)
						Label.BackgroundTransparency = 1
						Label.Text = p.Name .. " [" .. role .. "]"
						Label.TextColor3 = roleColor
						Label.TextSize = 14
						Label.Font = SelectedFont

						Billboard.Parent = ScreenGui
						table.insert(currentEspHighlights, Billboard)
					end
				end)
			end
		end
	end
end)

MM2EspButton.MouseButton1Click:Connect(function()
	espActive = not espActive
	if espActive then
		MM2EspButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		MM2EspButton.Text = "MM2 Roles ESP: ON"
	else
		MM2EspButton.BackgroundColor3 = Color3.fromRGB(220, 130, 0)
		MM2EspButton.Text = "MM2 Roles ESP: OFF"
		cleanEsp()
	end
end)

--- ==========================================
--- CLASSIC YARHAM-STYLE FLING ENGINE
--- ==========================================
local function executeFling(targetPlayer)
	if not targetPlayer or not targetPlayer.Character then return end
	local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	local myChar = LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	local myHumanoid = myChar and myChar:FindFirstChildOfClass("Humanoid")

	if not targetRoot or not myRoot or not myHumanoid then return end

	local originalOldPos = myRoot.CFrame
	local originalPlatformStand = myHumanoid.PlatformStand

	myHumanoid.PlatformStand = true

	local bv = Instance.new("BodyVelocity")
	bv.Name = "StarFlingVelocity"
	bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bv.Velocity = Vector3.new(0, 0, 0)
	bv.Parent = myRoot

	local bav = Instance.new("BodyAngularVelocity")
	bav.Name = "StarFlingAngular"
	bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bav.AngularVelocity = Vector3.new(30000, 30000, 30000)
	bav.Parent = myRoot

	local connection
	local startTime = os.clock()
	
	connection = RunService.RenderStepped:Connect(function()
		if targetRoot and myRoot and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			targetRoot = targetPlayer.Character.HumanoidRootPart
			local randomOffset = Vector3.new(math.random(-2, 2), math.random(0, 3), math.random(-2, 2))
			myRoot.CFrame = targetRoot.CFrame + randomOffset
			bv.Velocity = Vector3.new(math.random(-8000, 8000), 8000, math.random(-8000, 8000))
		else
			if connection then connection:Disconnect() end
		end
		
		if os.clock() - startTime > 0.6 then
			if connection then connection:Disconnect() end
		end
	end)

	task.wait(0.65)
	if connection then connection:Disconnect() end

	pcall(function()
		bv:Destroy()
		bav:Destroy()
	end)

	myHumanoid.PlatformStand = originalPlatformStand
	task.wait(0.1)
	myRoot.CFrame = originalOldPos
end

UniversalFlingButton.MouseButton1Click:Connect(function()
	local Mouse = LocalPlayer:GetMouse()
	local targetPlayer = nil

	local Connection
	Connection = UserInputService.InputBegan:Connect(function(input, processed)
		if processed then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local target = Mouse.Target
			if target and target.Parent and target.Parent:FindFirstChildOfClass("Humanoid") then
				targetPlayer = Players:GetPlayerFromCharacter(target.Parent)
				if targetPlayer and targetPlayer ~= LocalPlayer then
					Connection:Disconnect()
					executeFling(targetPlayer)
				end
			end
		end
	end)

	task.delay(6, function()
		if Connection then Connection:Disconnect() end
	end)
end)

FlingMurderButton.MouseButton1Click:Connect(function()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and getMM2Role(p) == "Murderer" then
			executeFling(p)
			break
		end
	end
end)

FlingSheriffButton.MouseButton1Click:Connect(function()
	for _, p in pairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and getMM2Role(p) == "Sheriff" then
			executeFling(p)
			break
		end
	end
end)
