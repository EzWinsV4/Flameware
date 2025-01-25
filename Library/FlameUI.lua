--[[
    THIS UI IS MADE FOR FLAME
    CREDITS TO Aquabeary
]]--
local Library = {}
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

function Library:CreateWindow()
	if game:GetService("CoreGui"):FindFirstChild("FLAME") then
		game:GetService("CoreGui"):FindFirstChild("FLAME"):Destroy()
	end

  local GUI = {CurrentTab = nil, Tabs = {}, Items = {}}
  local minimized = false
  local closed = false
  
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "FLAME"
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")
  
  local Main = Instance.new("Frame")
  Main.BorderSizePixel = 0
  Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Main.Size = UDim2.new(0.5026, 0, 0.39929, 0)
  Main.Position = UDim2.new(0.24859, 0, 0.27912, 0)
  Main.BackgroundTransparency = 1
  Main.Parent = ScreenGui
  
  local MainContent = Instance.new("Frame")
  MainContent.BorderSizePixel = 0
  MainContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  MainContent.Size = UDim2.new(0.56995, 0, 0.94805, 0)
  MainContent.Position = UDim2.new(0.01942, 0, 0.12798, 0)
  MainContent.Parent = Main
  
  local UIGradient = Instance.new("UIGradient")
  UIGradient.Rotation = -45
  UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 24, 24)),ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 61, 61))}
  UIGradient.Parent = MainContent
  
  local UICorner = Instance.new("UICorner")
  UICorner.CornerRadius = UDim.new(0, 12)
  UICorner.Parent = MainContent
  
  local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
  UIAspectRatioConstraint.AspectRatio = 1.50685
  UIAspectRatioConstraint.Parent = MainContent

  local TabContainer = Instance.new("Frame")
  TabContainer.Name = "Tabs"
  TabContainer.BorderSizePixel = 0
  TabContainer.BackgroundTransparency = 1
  TabContainer.Size = UDim2.new(1, 0, 0.15, 0)
  TabContainer.Position = UDim2.new(0, 0, 0, 0)
  TabContainer.Parent = MainContent
  
  local ItemContainer = Instance.new("Frame")
  ItemContainer.Name = "Items"  
  ItemContainer.BorderSizePixel = 0
  ItemContainer.BackgroundTransparency = 1
  ItemContainer.Size = UDim2.new(1, 0, 0.85, 0)
  ItemContainer.Position = UDim2.new(0, 0, 0.15, 0)
  ItemContainer.Parent = MainContent
  
  local UserInfo = Instance.new("Frame")
  UserInfo.BorderSizePixel = 0
  UserInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  UserInfo.Size = UDim2.new(0.37824, 0, 0.94805, 0)
  UserInfo.Position = UDim2.new(0.60162, 0, 0.12798, 0)
  UserInfo.Parent = Main
  
  local UserInfoCorner = Instance.new("UICorner")
  UserInfoCorner.CornerRadius = UDim.new(0, 12)
  UserInfoCorner.Parent = UserInfo
  
  local UserInfoGradient = Instance.new("UIGradient")
  UserInfoGradient.Rotation = -45
  UserInfoGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 24, 24)),ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 61, 61))}
  UserInfoGradient.Parent = UserInfo
  
  local PlayerImage = Instance.new("ImageLabel")
  PlayerImage.BorderSizePixel = 0
  PlayerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id=" .. game.Players.LocalPlayer.UserId .. "&w=420&h=420"
  PlayerImage.Size = UDim2.new(0.82192, 0, 0.82192, 0)
  PlayerImage.Position = UDim2.new(0.09091, 0, 0.0274, 0)
  PlayerImage.Parent = UserInfo

  local PlayerImageCorner = Instance.new("UICorner")
  PlayerImageCorner.CornerRadius = UDim.new(0, 12)
  PlayerImageCorner.Parent = PlayerImage
  
  local Username = Instance.new("TextLabel")
  Username.TextWrapped = true
  Username.BorderSizePixel = 0
  Username.TextSize = 25
  Username.TextTransparency = 0.2
  Username.TextScaled = true
  Username.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
  Username.TextColor3 = Color3.fromRGB(255, 255, 255)
  Username.BackgroundTransparency = 1
  Username.Size = UDim2.new(0.49315, 0, 0.09589, 0)
  Username.Text = game.Players.LocalPlayer.Name
  Username.Position = UDim2.new(0.25255, 0, 0.87945, 0)
  Username.Parent = UserInfo
  
  local TitleBar = Instance.new("Frame")
  TitleBar.BorderSizePixel = 0
  TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TitleBar.Size = UDim2.new(0.96045, 0, 0.08193, 0)
  TitleBar.Position = UDim2.new(0.01942, 0, 0.02178, 0)
  TitleBar.Parent = Main
  
  local TitleBarCorner = Instance.new("UICorner")
  TitleBarCorner.CornerRadius = UDim.new(0, 12)
  TitleBarCorner.Parent = TitleBar
  
  local TitleBarGradient = Instance.new("UIGradient")
  TitleBarGradient.Rotation = -45
  TitleBarGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 24, 24)),ColorSequenceKeypoint.new(1, Color3.fromRGB(61, 61, 61))}
  TitleBarGradient.Parent = TitleBar
  
  local Logo = Instance.new("ImageLabel")
  Logo.BorderSizePixel = 0
  Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Logo.BackgroundTransparency = 1
  Logo.Image = "rbxassetid://93052521049443"
  Logo.Size = UDim2.new(0.02747, 0, 0.72006, 0)
  Logo.Position = UDim2.new(0.01617, 0, 0.14553, 0)
  Logo.Parent = TitleBar
  
  local Title = Instance.new("TextLabel")
  Title.TextWrapped = true
  Title.BorderSizePixel = 0
  Title.TextSize = 14
  Title.TextXAlignment = Enum.TextXAlignment.Left
  Title.TextScaled = true
  Title.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
  Title.TextColor3 = Color3.fromRGB(255, 255, 255)
  Title.BackgroundTransparency = 1
  Title.Size = UDim2.new(0.125, 0, 0.9726, 0)
  Title.Text = "FLAME"
  Title.Position = UDim2.new(0.05548, 0, 0.0274, 0)
  Title.Parent = TitleBar

  local CloseButton = Instance.new("TextButton")
  CloseButton.BorderSizePixel = 0
  CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  CloseButton.Size = UDim2.new(0.02729, 0, 0.71427, 0)
  CloseButton.Position = UDim2.new(0.95539, 0, 0.14216, 0)
  CloseButton.Text = "X"
  CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
  CloseButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
  CloseButton.TextSize = 18
  CloseButton.TextScaled = true
  CloseButton.Parent = TitleBar

  local MinimizeButton = Instance.new("TextButton")
  MinimizeButton.BorderSizePixel = 0
  MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  MinimizeButton.Size = UDim2.new(0.02729, 0, 0.71427, 0)
  MinimizeButton.Position = UDim2.new(0.9187, 0, 0.14216, 0)
  MinimizeButton.Text = "-"
  MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
  MinimizeButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
  MinimizeButton.TextSize = 18
  MinimizeButton.TextScaled = true
  MinimizeButton.Parent = TitleBar

  local CloseStroke = Instance.new("UIStroke")
  CloseStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  CloseStroke.Thickness = 3
  CloseStroke.Color = Color3.fromRGB(220, 20, 60)
  CloseStroke.Parent = CloseButton

  local MinimizeStroke = Instance.new("UIStroke")
  MinimizeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
  MinimizeStroke.Thickness = 3
  MinimizeStroke.Color = Color3.fromRGB(255, 127, 127)
  MinimizeStroke.Parent = MinimizeButton

  CloseButton.MouseButton1Click:Connect(function()
      ScreenGui.Enabled = false
      closed = true
  end)

  MinimizeButton.MouseButton1Click:Connect(function()
      minimized = not minimized
      MainContent.Visible = not minimized
      UserInfo.Visible = not minimized
  end)

  UIS.InputBegan:Connect(function(input)
      if input.KeyCode == Enum.KeyCode.RightShift then
          closed = not closed
          ScreenGui.Enabled = not closed
      end
  end)
  
  local function CreateDrag(bar)
      local dragToggle, dragSpeed, dragStart, startPos = nil, 0.25, nil, nil
      local function updateInput(input)
          local delta = input.Position - dragStart
          local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,startPos.Y.Scale, startPos.Y.Offset + delta.Y)
          TweenService:Create(Main, TweenInfo.new(dragSpeed), {Position = position}):Play()
      end
      bar.InputBegan:Connect(function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
              dragToggle = true
              dragStart = input.Position
              startPos = Main.Position
              input.Changed:Connect(function()
                  if input.UserInputState == Enum.UserInputState.End then
                      dragToggle = false
                  end
              end)
          end
      end)
      UIS.InputChanged:Connect(function(input)
          if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
              if dragToggle then
                  updateInput(input)
              end
          end
      end)
  end

  CreateDrag(TitleBar)

  function GUI:CreateTab(text)
      local tab = {Items = {}, Text = text}
      
      local TabButton = Instance.new("TextButton")
      TabButton.TextWrapped = true
      TabButton.BorderSizePixel = 0
      TabButton.TextSize = 18
      TabButton.TextScaled = true
      TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TabButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
      TabButton.Size = UDim2.new(0.12727, 0, 0.5, 0)
      TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
      TabButton.Text = text
      TabButton.Position = UDim2.new(0.015 + (#GUI.Tabs * 0.145), 0, 0.25, 0)
      TabButton.Parent = TabContainer
      
      local TabButtonCorner = Instance.new("UICorner")
      TabButtonCorner.CornerRadius = UDim.new(0, 12)
      TabButtonCorner.Parent = TabButton
      
      local TabStroke = Instance.new("UIStroke")
      TabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
      TabStroke.Thickness = 2.3
      TabStroke.Color = Color3.fromRGB(255, 94, 94)
      TabStroke.Transparency = 1
      TabStroke.Parent = TabButton
      
      local TabButtonAspect = Instance.new("UIAspectRatioConstraint")
      TabButtonAspect.AspectRatio = 2.33333
      TabButtonAspect.Parent = TabButton
      
      local TabContent = Instance.new("Frame")
      TabContent.Name = text .. "Tab"
      TabContent.BorderSizePixel = 0
      TabContent.BackgroundTransparency = 1
      TabContent.Size = UDim2.new(1, 0, 1, 0)
      TabContent.Visible = false
      TabContent.Parent = ItemContainer
      
if #GUI.Tabs == 0 then
  GUI.CurrentTab = tab
  TabStroke.Transparency = 0
  TabContent.Visible = true
end

TabButton.MouseButton1Click:Connect(function()
  if GUI.CurrentTab ~= tab then
      if GUI.CurrentTab then
          local prevContent = ItemContainer:FindFirstChild(GUI.CurrentTab.Text .. "Tab")
          if prevContent then
              prevContent.Visible = false
          end
      end
      
      TabContent.Visible = true
      GUI.CurrentTab = tab
      
      for _, btn in pairs(TabContainer:GetChildren()) do
          if btn:IsA("TextButton") then
              btn.UIStroke.Transparency = 1
          end
      end
      TabStroke.Transparency = 0
  end
end)

function tab:CreateToggle(text, callback)
  local toggle = {Enabled = false}
  
  local ToggleFrame = Instance.new("Frame")
  ToggleFrame.BorderSizePixel = 0
  ToggleFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
  ToggleFrame.Size = UDim2.new(0.96545, 0, 0.10959, 0)
  ToggleFrame.Position = UDim2.new(0.01636, 0, 0.05 + (#tab.Items * 0.127), 0)
  ToggleFrame.Parent = TabContent
  
  local ToggleCorner = Instance.new("UICorner")
  ToggleCorner.Parent = ToggleFrame
  
  local ToggleLabel = Instance.new("TextLabel")
  ToggleLabel.TextWrapped = true
  ToggleLabel.BorderSizePixel = 0
  ToggleLabel.TextSize = 20
  ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
  ToggleLabel.TextScaled = true
  ToggleLabel.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
  ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  ToggleLabel.BackgroundTransparency = 1
  ToggleLabel.Size = UDim2.new(0.83427, 0, 1, 0)
  ToggleLabel.Text = text
  ToggleLabel.Position = UDim2.new(0.01318, 0, 0, 0)
  ToggleLabel.Parent = ToggleFrame
  
  local ToggleButton = Instance.new("Frame")
  ToggleButton.BorderSizePixel = 0
  ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 83, 83)
  ToggleButton.Size = UDim2.new(0.12241, 0, 0.76, 0)
  ToggleButton.Position = UDim2.new(0.87193, 0, 0.1, 0)
  ToggleButton.Parent = ToggleFrame
  
  local ToggleButtonCorner = Instance.new("UICorner")
  ToggleButtonCorner.CornerRadius = UDim.new(0, 999)
  ToggleButtonCorner.Parent = ToggleButton
  
  local ToggleIndicator = Instance.new("Frame")
  ToggleIndicator.BorderSizePixel = 0
  ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  ToggleIndicator.Size = UDim2.new(0.4, 0, 0.8, 0)
  ToggleIndicator.Position = UDim2.new(0.169, 0, 0.099, 0)
  ToggleIndicator.Parent = ToggleButton
  
  local ToggleIndicatorCorner = Instance.new("UICorner")
  ToggleIndicatorCorner.CornerRadius = UDim.new(0, 999)
  ToggleIndicatorCorner.Parent = ToggleIndicator
  
  ToggleFrame.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
          toggle.Enabled = not toggle.Enabled
          TweenService:Create(ToggleButton, TweenInfo.new(0.1), {
              BackgroundColor3 = toggle.Enabled and Color3.fromRGB(86, 255, 128) or Color3.fromRGB(255, 83, 83)
          }):Play()
          TweenService:Create(ToggleIndicator, TweenInfo.new(0.1), {
              Position = toggle.Enabled and UDim2.new(0.477, 0, 0.099, 0) or UDim2.new(0.169, 0, 0.099, 0)
          }):Play()
          callback(toggle.Enabled)
      end
  end)
  
  table.insert(tab.Items, toggle)
  return toggle
end

function tab:CreateButton(text, callback)
  local button = {}
  
  local ButtonFrame = Instance.new("Frame")
  ButtonFrame.BorderSizePixel = 0
  ButtonFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
  ButtonFrame.Size = UDim2.new(0.96545, 0, 0.10959, 0)
  ButtonFrame.Position = UDim2.new(0.01636, 0, 0.05 + (#tab.Items * 0.127), 0)
  ButtonFrame.Parent = TabContent
  
  local ButtonCorner = Instance.new("UICorner")
  ButtonCorner.Parent = ButtonFrame
  
  local ButtonLabel = Instance.new("TextButton")
  ButtonLabel.BackgroundTransparency = 1
  ButtonLabel.Position = UDim2.new(0.013, 0, 0, 0)
  ButtonLabel.Size = UDim2.new(0.974, 0, 1, 0)
  ButtonLabel.Font = Enum.Font.DenkOne
  ButtonLabel.Text = text
  ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  ButtonLabel.TextScaled = true
  ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
  ButtonLabel.Parent = ButtonFrame
  
  ButtonLabel.MouseButton1Click:Connect(callback)
  
  table.insert(tab.Items, button)
  return button
end

function tab:CreateKeybind(text, default, callback)
  local keybind = {Key = default}
  
  local KeybindFrame = Instance.new("Frame")
  KeybindFrame.BorderSizePixel = 0
  KeybindFrame.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
  KeybindFrame.Size = UDim2.new(0.96545, 0, 0.10959, 0)
  KeybindFrame.Position = UDim2.new(0.01636, 0, 0.05 + (#tab.Items * 0.127), 0)
  KeybindFrame.Parent = TabContent
  
  local KeybindCorner = Instance.new("UICorner")
  KeybindCorner.Parent = KeybindFrame
  
  local KeybindLabel = Instance.new("TextLabel")
  KeybindLabel.BackgroundTransparency = 1 
  KeybindLabel.Position = UDim2.new(0.013, 0, 0, 0)
  KeybindLabel.Size = UDim2.new(0.834, 0, 1, 0)
  KeybindLabel.Font = Enum.Font.DenkOne
  KeybindLabel.Text = text
  KeybindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  KeybindLabel.TextScaled = true
  KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
  KeybindLabel.Parent = KeybindFrame
  
  local KeybindButton = Instance.new("TextButton")
  KeybindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  KeybindButton.BackgroundTransparency = 0.15
  KeybindButton.Position = UDim2.new(0.913, 0, 0.05, 0)
  KeybindButton.Size = UDim2.new(0.066, 0, 0.875, 0)
  KeybindButton.Font = Enum.Font.Oswald
  KeybindButton.Text = default.Name
  KeybindButton.TextColor3 = Color3.fromRGB(0, 0, 0)
  KeybindButton.TextScaled = true
  KeybindButton.Parent = KeybindFrame
  
  local KeybindButtonCorner = Instance.new("UICorner")
  KeybindButtonCorner.Parent = KeybindButton
  
  local listening = false
  
  KeybindButton.MouseButton1Click:Connect(function()
      listening = true
      KeybindButton.Text = "..."
      
      local connection
      connection = UIS.InputBegan:Connect(function(input)
          if input.UserInputType == Enum.UserInputType.Keyboard then
              keybind.Key = input.KeyCode
              KeybindButton.Text = input.KeyCode.Name
              listening = false
              connection:Disconnect()
          end
      end)
  end)
  
  UIS.InputBegan:Connect(function(input)
      if not listening and input.UserInputType == Enum.UserInputType.Keyboard then
          if input.KeyCode == keybind.Key then
              callback()
          end
      end
  end)
  
  table.insert(tab.Items, keybind)
  return keybind
end

table.insert(GUI.Tabs, tab)
return tab
end

return GUI
end

return Library
