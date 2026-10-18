--[[ 
    Steal an egg ULTRA HUB
    Made by Kryven
]]

repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer

-- ===== CONFIG (edit these) =====
local KEY_LINK = "https://www.roblox.rw/communities/213296865287/Steal-an-egg-hub-verification"
local KEY_CHECK_URL = ""                           -- optional: URL that returns the valid key as plain text
local STATIC_KEY = "PASTE_YOUR_KEY_HERE"           -- used if KEY_CHECK_URL is left empty
local TITLE = "Steal an egg ULTRA HUB"
local SUBTITLE = "made by Kryven"

local function onKeyAccepted()
    -- put your hub's main code / loadstring here
    print("Key accepted, loading hub...")
end
-- ===============================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local parentGui
pcall(function()
    parentGui = (gethui and gethui()) or CoreGui
    if parentGui:FindFirstChild("StealAnEggUltraKey") then
        parentGui.StealAnEggUltraKey:Destroy()
    end
end)
if not parentGui then
    parentGui = Players.LocalPlayer:WaitForChild("PlayerGui")
end

local function tween(obj, props, t)
    TweenService:Create(obj, TweenInfo.new(t or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end

local function corner(obj, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = obj
    return c
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "StealAnEggUltraKey"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if not pcall(function() gui.Parent = parentGui end) then
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
end

-- Main frame
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(0, 0)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui
corner(main, 14)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 170, 60)
stroke.Thickness = 1.5
stroke.Transparency = 0.2
stroke.Parent = main

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new(Color3.fromRGB(30, 30, 44), Color3.fromRGB(16, 16, 22))
gradient.Rotation = 90
gradient.Parent = main

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundTransparency = 1
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 28)
title.Position = UDim2.fromOffset(20, 10)
title.BackgroundTransparency = 1
title.Text = TITLE
title.TextColor3 = Color3.fromRGB(255, 200, 100)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, -50, 0, 16)
sub.Position = UDim2.fromOffset(22, 36)
sub.BackgroundTransparency = 1
sub.Text = SUBTITLE
sub.TextColor3 = Color3.fromRGB(150, 150, 170)
sub.Font = Enum.Font.Gotham
sub.TextSize = 12
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.Parent = titleBar

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(28, 28)
close.Position = UDim2.new(1, -38, 0, 10)
close.BackgroundColor3 = Color3.fromRGB(40, 40, 56)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(220, 220, 230)
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.AutoButtonColor = false
close.Parent = titleBar
corner(close, 8)

close.MouseEnter:Connect(function() tween(close, {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}, 0.15) end)
close.MouseLeave:Connect(function() tween(close, {BackgroundColor3 = Color3.fromRGB(40, 40, 56)}, 0.15) end)

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.fromOffset(20, 58)
divider.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
divider.BorderSizePixel = 0
divider.Parent = main

-- Key input
local inputLabel = Instance.new("TextLabel")
inputLabel.Size = UDim2.new(1, -40, 0, 18)
inputLabel.Position = UDim2.fromOffset(20, 72)
inputLabel.BackgroundTransparency = 1
inputLabel.Text = "Enter your key"
inputLabel.TextColor3 = Color3.fromRGB(190, 190, 205)
inputLabel.Font = Enum.Font.GothamMedium
inputLabel.TextSize = 13
inputLabel.TextXAlignment = Enum.TextXAlignment.Left
inputLabel.Parent = main

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -40, 0, 40)
inputBox.Position = UDim2.fromOffset(20, 94)
inputBox.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
inputBox.Text = ""
inputBox.PlaceholderText = "Paste key here..."
inputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 14
inputBox.ClearTextOnFocus = false
inputBox.Parent = main
corner(inputBox, 10)

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(60, 60, 85)
inputStroke.Thickness = 1
inputStroke.Parent = inputBox

inputBox.Focused:Connect(function() tween(inputStroke, {Color = Color3.fromRGB(255, 170, 60)}, 0.2) end)
inputBox.FocusLost:Connect(function() tween(inputStroke, {Color = Color3.fromRGB(60, 60, 85)}, 0.2) end)

-- Status label
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -40, 0, 18)
status.Position = UDim2.fromOffset(20, 140)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(150, 150, 170)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = main

local function setStatus(text, color)
    status.Text = text
    status.TextColor3 = color or Color3.fromRGB(150, 150, 170)
end

-- Buttons (left: Check Key, right: Copy link)
local function makeButton(text, xScale, xOffset, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.5, -26, 0, 42)
    b.Position = UDim2.new(xScale, xOffset, 0, 168)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 15
    b.AutoButtonColor = false
    b.Parent = main
    corner(b, 10)

    local base = color
    local hover = Color3.new(
        math.min(base.R + 0.08, 1),
        math.min(base.G + 0.08, 1),
        math.min(base.B + 0.08, 1)
    )
    b.MouseEnter:Connect(function() tween(b, {BackgroundColor3 = hover}, 0.15) end)
    b.MouseLeave:Connect(function() tween(b, {BackgroundColor3 = base}, 0.15) end)
    b.MouseButton1Down:Connect(function() tween(b, {Size = UDim2.new(0.5, -30, 0, 38)}, 0.08) end)
    b.MouseButton1Up:Connect(function() tween(b, {Size = UDim2.new(0.5, -26, 0, 42)}, 0.08) end)
    return b
end

local checkBtn = makeButton("Check Key", 0, 20, Color3.fromRGB(46, 160, 90))
local copyBtn = makeButton("Copy link", 0.5, 6, Color3.fromRGB(70, 110, 220))

-- Footer
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, -40, 0, 16)
footer.Position = UDim2.new(0, 20, 1, -26)
footer.BackgroundTransparency = 1
footer.Text = "Get a key with the Copy link button"
footer.TextColor3 = Color3.fromRGB(110, 110, 130)
footer.Font = Enum.Font.Gotham
footer.TextSize = 11
footer.Parent = main

-- Dragging
do
    local dragging, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Open / close animations
tween(main, {Size = UDim2.fromOffset(420, 250)}, 0.4)

local function closeGui()
    tween(main, {Size = UDim2.fromOffset(0, 0)}, 0.3)
    task.wait(0.32)
    gui:Destroy()
end
close.MouseButton1Click:Connect(closeGui)

-- Copy link
copyBtn.MouseButton1Click:Connect(function()
    local ok = false
    if setclipboard then
        ok = pcall(setclipboard, KEY_LINK)
    elseif toclipboard then
        ok = pcall(toclipboard, KEY_LINK)
    end
    if ok then
        setStatus("Link copied to clipboard!", Color3.fromRGB(100, 200, 255))
        copyBtn.Text = "Copied!"
        task.delay(1.5, function() if copyBtn.Parent then copyBtn.Text = "Copy link" end end)
    else
        setStatus("Clipboard not supported by your executor.", Color3.fromRGB(255, 120, 120))
    end
end)

-- Check key
local checking = false
checkBtn.MouseButton1Click:Connect(function()
    if checking then return end
    local entered = inputBox.Text:gsub("%s+", "")
    if entered == "" then
        setStatus("Please enter a key first.", Color3.fromRGB(255, 200, 100))
        return
    end

    checking = true
    setStatus("Checking key...", Color3.fromRGB(150, 150, 170))

    local validKey = STATIC_KEY
    if KEY_CHECK_URL ~= "" then
        local ok, result = pcall(function() return game:HttpGet(KEY_CHECK_URL) end)
        if ok and type(result) == "string" then
            validKey = result:gsub("%s+", "")
        else
            setStatus("Could not reach key server.", Color3.fromRGB(255, 120, 120))
            checking = false
            return
        end
    end

    if entered == validKey then
        setStatus("Key valid! Loading...", Color3.fromRGB(100, 230, 140))
        tween(stroke, {Color = Color3.fromRGB(100, 230, 140)}, 0.3)
        task.wait(0.8)
        closeGui()
        onKeyAccepted()
    else
        setStatus("Invalid key. Try again.", Color3.fromRGB(255, 100, 100))
        tween(stroke, {Color = Color3.fromRGB(255, 80, 80)}, 0.15)
        task.delay(0.6, function() tween(stroke, {Color = Color3.fromRGB(255, 170, 60)}, 0.3) end)
        checking = false
    end
end)

print("[Steal an egg ULTRA HUB] GUI loaded")
