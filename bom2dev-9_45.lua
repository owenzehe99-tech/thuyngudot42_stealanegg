local Players = game.Players
local TweenService = game.TweenService
local RunService = game.RunService
local TextService = game.TextService
local HttpService = game.HttpService
local player = Players.LocalPlayer
local playerGui = game.CoreGui
local function safeDestroy(name)
	local g = playerGui:FindFirstChild(name)
	if g then g:Destroy() end
end
safeDestroy("AutoTypingOverlay")
safeDestroy("Bom2devHubV9.4")
local SaveFileName = "Bom2devNgonNgu.json"
local function saveLang(tbl)
	pcall(function()
		if writefile then
			writefile(SaveFileName, HttpService:JSONEncode(tbl))
		end
	end)
end
local function loadLang()
	local data = {lang = "en"}
	pcall(function()
		if readfile and isfile and isfile(SaveFileName) then
			local raw = readfile(SaveFileName)
			local ok, dec = pcall(function() return HttpService:JSONDecode(raw) end)
			if ok and type(dec) == "table" and dec.lang then
				data = dec
			end
		end
	end)
	return data
end
local savedLang = loadLang()
local currentLanguage = savedLang.lang or "en"
local gui = Instance.new("ScreenGui")
gui.Name = "AutoTypingOverlay"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.Position = UDim2.new(0,0,0,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0
bg.BorderSizePixel = 0
bg.Parent = gui
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.BackgroundTransparency = 0
textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
textLabel.Font = Enum.Font.Code
textLabel.TextSize = 20
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.TextYAlignment = Enum.TextYAlignment.Top
textLabel.TextWrapped = true
textLabel.Text = ""
textLabel.Parent = bg
local textContents = {
[[
Bom2/lua Script Gui
[NETWORK] Connecting to data node...
[NETWORK] Node found: 192.168.4.12
[NETWORK] Sending handshake request...
[AUTH] Session key granted.
[DOWNLOAD] Retrieving user memory package...
[DOWNLOAD] Chunk 1/5 complete (6.2 MB)
[DOWNLOAD] Chunk 2/5 complete (12.4 MB)
[DOWNLOAD] Chunk 3/5 complete (18.7 MB)
[DOWNLOAD] Chunk 4/5 complete (24.9 MB)
[DOWNLOAD] Chunk 5/5 complete (31.1 MB)
[CHECKSUM] Validating... OK
[INFO] Data download complete.
[INFO] Transferring to volatile storage...
[INFO] Transfer finished. Ready for execution.
[Wait] Waiting area to run data...
[DATA] Loading data from player.
[DATA] Loading functions...
]],
[[
Bom2/lua Script Gui
[DOWNLOAD] :: ██░░░░░░░░░░░░    → 14%
[DOWNLOAD] :: ███░░░░░░░░░░░    → 27%
[DOWNLOAD] :: ████░░░░░░░░░░    → 41%
[DOWNLOAD] :: ██████░░░░░░░░    → 56%
[DOWNLOAD] :: ████████░░░░░░    → 63%
[DOWNLOAD] :: █████████░░░░░    → 71%
[DOWNLOAD] :: ███████████░░░    → 82%
[DOWNLOAD] :: ████████████░░    → 88%
[DOWNLOAD] :: ████████████░░    → 89%
[DOWNLOAD] :: ████████████░░    → 92%
[DOWNLOAD] :: ████████████░░    → 93%
[DOWNLOAD] :: ████████████░░    → 94%
[DOWNLOAD] :: █████████████░    → 95%
[DOWNLOAD] :: █████████████░    → 97%
[DOWNLOAD] :: █████████████░    → 98%
[DOWNLOAD] :: ██████████████    → 99%
[DOWNLOAD] :: ██████████████    → 100%
]],
[[
Bom2/lua Script Gui
[LOADING]: 0101001010010101011010101010010111100101010100101010010101011010101
101010100101010010011010101010010111100101010100101010010101011010101
101010100101010010101011010101010010111100101010100101010010101011
101010100101010010101011010101010111100101010100101010010101011010101
101010100101010010101011010101010010111100101010100101010010101011010101
101010100101010010101011010101010011100101010100101010010101011010101
10101010010101011010101010010111100101010100101010010101011010101
1010101001010100101010110101010100101111010100101010010101011010101
101010100101010010101011010101010010111100101010100101010010101
101010100101010010101011010101010010111100101010100101010010101011010101
10101010010101001010101101010101001011110010101010010101001010101101
10101010010101001010101101010101001011110010101010010101001010101
101010100101010010101011010101010010111100101010100101010010110101
10101010010101001010101101010101001011110010101010010101001010101101
101010010101011010101010010111100101010100101010010101011010101
0100101010010101011010101010010111100101010100101010010101011010101
101010100101010010101011010101010010111100101010100101010010101011010
]],
[[
Bom2/lua Script Gui
[LOADING]
0101011101001010011100101010110011010101011100101010010110101001100110
221/991/443/20/88/11/552/331/998/441/22/991/55/203/77/889/44/22/991/553
AF10EE2244B188AA33FA662191C301FA77BC11FE44B102219AC311EE0021F101
10101010011010101100101101010111001010101101001010111001010100101101
77/552/88/991/221/003/22/551/442/991/77/44/552/113/203/88/991/22/551/442
AC39FF22EE109AC311FE8877B144D122CE0021AF10FF2233FA6621F00177BC44
01101011100101101010100110101011100101011010100110101001101010010101
991/77/22/889/001/113/551/442/22/77/991/552/88/44/203/442/551/22/991/77
FA22C91122CE01FA11FE44AC77AB0021FF889A1144B101FA33FA662191C3AF10
11010010110101101010010110101100101101011100101011010110010110101001
203/552/88/12/991/445/113/552/22/889/003/77/221/551/442/991/22/33/552/88
FF22EE10002144B191C301FE6621AF1088AA33FA7777BCF001AA39EE1044B177
01010111100101011010100110101011001010110101100101111001010101011010
8/233/99/12/77/444/991/22/55/203/552/331/88/22/991/77/003/551/442/889
AF10AA39FF2244B111FE002191C377BC662133FA01C288AA002144B1F00111FE
11101001101010110100101101011100101010111001011010110010111001010101
]]
}
local rng = Random.new(player.UserId + math.floor(tick()))
local textContent = textContents[rng:NextInteger(1,#textContents)]
local chars = {}
for _, cp in utf8.codes(textContent) do table.insert(chars, utf8.char(cp)) end
local totalChars = #chars
if totalChars == 0 then
	if gui and gui.Parent then gui:Destroy() end
	return
end
repeat task.wait() until textLabel.AbsoluteSize.X > 0 and textLabel.AbsoluteSize.Y > 0
textLabel.TextTransparency = 1
TweenService:Create(textLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {TextTransparency = 0}):Play()
local lastIndex = 0
local startTime = tick()
local typeDuration = math.random(1,3)
local typeConn
local funcFrameRef = nil
local searchBoxRef = nil
local ContentRef = nil
local titleRef = nil
local guiRef = nil
local function getText(t)
	if type(t) == "table" then
		return t[currentLanguage] or t.en or next(t) and t[next(t)] or ""
	end
	return tostring(t or "")
end
local changeLanguage

local functions = {	
{Text = {vn = "Trang Chủ", en = "Home"}, Scripts = {
{Text = {vn = "Bay V2", en = "Fly V2"}, Script = [[

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

for _, v in ipairs(playerGui:GetChildren()) do
	if v and v.Name == "Bom2devFlyUI" then
		pcall(function()
			v:Destroy()
		end)
	end
end

local gui = Instance.new("ScreenGui")
gui.Name = "Bom2devFlyUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

local idleR15List = {
	{name = "Idle 1", id = 77529400769588, speed = 1},
	{name = "Idle 2", id = 125340742319097, speed = 1},
	{name = "Idle 3", id = 93631911983416, speed = 1},
	{name = "Idle 4", id = 116157665289694, speed = 1},
	{name = "Idle 5", id = 138068953362959, speed = 1},
}

local selectedIdleR15 = idleR15List[1]
local idleMenuOpen = false

local speeds = 1
local nowe = false
local tpwalking = false

local translateConn
local animationConn
local activeBg
local activeBv
local rotateConn
local rotateTween

local flyTracks = {}
local currentFlyTrack = nil
local currentRigType = nil

local fadeTime = 0.3
local idleBobToken = 0
local idleBobRunning = false
local idleTween = nil

local function styleBomText(obj)
	if not obj then
		return nil
	end
	obj.TextColor3 = Color3.fromRGB(255, 242, 242)
	obj.Font = Enum.Font.GothamBlack
	local g = Instance.new("UIGradient")
	g.Rotation = 0
	g.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 120, 120)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
	})
	g.Parent = obj
	return g
end

local function makeCorner(obj, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 10)
	c.Parent = obj
	return c
end

local function makeStroke(obj, thickness, transparency, color)
	local s = Instance.new("UIStroke")
	s.Thickness = thickness or 1
	s.Transparency = transparency or 0
	s.Color = color or Color3.fromRGB(255, 0, 0)
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.LineJoinMode = Enum.LineJoinMode.Round
	s.Parent = obj
	return s
end

local function makeGradient(obj, sequence, rotation)
	local g = Instance.new("UIGradient")
	g.Color = sequence
	g.Rotation = rotation or 0
	g.Parent = obj
	return g
end

local function getChar()
	return player.Character
end

local function getHumanoid(char)
	if not char then
		return nil
	end
	return char:FindFirstChildWhichIsA("Humanoid")
end

local function getPrimaryPart(char)
	if not char then
		return nil
	end
	return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
end

local function getAnimator(hum)
	local animator = hum and hum:FindFirstChildOfClass("Animator")
	if hum and not animator then
		animator = Instance.new("Animator")
		animator.Parent = hum
	end
	return animator
end

local function freezeAnimations(char)
	if not char then
		return
	end

	pcall(function()
		local animate = char:FindFirstChild("Animate")
		if animate then
			animate.Disabled = true
		end
	end)

	local hum = char:FindFirstCh