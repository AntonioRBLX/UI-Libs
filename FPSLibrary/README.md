# FPSLibrary v1.1

ROBLOX User Interface Library Created By CITY512.

## Features

- ### [v1.0] 09/08/24
- Undetectable
- Every Working Element
- Configuration Saving
- Key System (including website)
- Auto Discord Invite
- ### [v1.1] 10/23/24
- Improved GUI Appearance
- FPSLibrary Custom Notification Popup
- Tween Effects
- Added Glow Effects
- ColorPicker Rainbow Mode
- Fixed Config Saving Bugs
- Mobile Supported Tab Minimizer

## Interface Preview

<img src="https://i.imgur.com/zfIKrwp.jpg" />

# How To Use FPSLibrary

## Boot Library

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CITY512/UI-Libs/main/FPSLibrary/FPSLibrary.lua", true))()
```

### Protect Library Gui

```lua
-- WARNING: IF THE GAME YOU ARE RUNNING FPSLIBRARY ON IS CRASHING OR DETECTING
getgenv().FPSLibraryProtectGui = true -- Place this above the loadstring
```

## Create Window

```lua
local Window = Library:BootWindow({
	Name = "FPSLibrary";
	LoadingTitle = "FPSLibrary Interface Suite";
	WindowVisible = true;
	ToggleGUIKeybind = Enum.KeyCode.RightShift;
	ConfigurationSaving = {
		Enabled = false;
		FolderName = "configs"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		PlaceId = false -- Only saves configs for a certain PlaceId
	};
	Discord = {
        Enabled = false;
		InviteLink = ""; -- discord invite link (eg. discord.gg/ABCD)
		RememberJoins = true
	};
	KeySystem = {
		Enabled = false; -- The thread will yield until key is validated
		Keys = {"key1","key2","key3"}; -- An array of valid keys. Will not apply if GrabKeyFromSite is true
		EncryptKey = false; -- Applies AES-256 encryption to key file (currently not working)
		CypherKey = ""; -- cypher key length must be 16 or more. https://catonmat.net/tools/generate-random-ascii
		FileName = "Key"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		RememberKey = false; -- Will not ask for the key unless key has changed or expired
		KeyTimeLimit = 86400; -- in seconds
		GrabKeyFromSite = false; -- Gets key from a website
		WebsiteURL = ""; -- website you will be directed to for the key (eg. https://linkvertise.com/<link>)
		KeyRAWURL = ""; -- website where the RAW key is checked for (eg. https://raw.githubusercontent.com/<username>/<directory> or https://pastebin.com/raw/<paste>)
		JSONDecode = false; -- If RAW key is in json format (eg. ["key1","key2","key3"])
	}
})
```

### Prompt Discord Invite

```lua
Window:PromptDiscordInvite() -- If you want to prompt invite on boot, put it right under the BootWindow
```

### Organize Tabs

```lua
Window:OrganizeTabs(25,25,0) -- x, y, padding
```

### Create Tab

```lua
local Tab = Window:CreateTab({
	Title = "Title"; -- Title of the Tab
	Subtitle = "Subtitle"; -- Second title under the title
	Opened = false; -- If the tab is open
	TitleRichText = false; -- Enables RichText for the Title
	SubtitleRichText = false; -- Enables RichText for the Subtitle
	SizeY = 250; -- Length of the tab dropdown, SizeY must be 100 or more
	MaxSizeY = 250; -- Maximum length of the tab dropdown, SizeY must be 100 or more
	Position = UDim2.new(0,20,0,20); -- Position of the Tab on Window
	Flag = ""; -- Identifier for the configuration file (cannot be changed)
	IgnoreList = {} -- The properties the flag will blacklist/not saved
})
```

### Create Button

```lua
local Button = Tab:CreateButton({
	Name = "Button";
	RichText = false; -- Enables RichText for the Name
	SectionParent = nil; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		print("Button Clicked!")
	end
})
```

### Create Toggle

```lua
local Toggle = Tab:CreateToggle({
	Name = "Toggle";
	RichText = false; -- Enables RichText for the Name
	ActivatedColor = Color3.fromRGB(255, 206, 92); -- Color of the toggle when activated
	SectionParent = nil; -- The SectionTab the button is parented to
	CurrentValue = false; -- If the toggle is on/off
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	IgnoreList = {}; -- The properties the flag will blacklist/not saved
	Callback = function(value) -- The function that is called after toggle is pressed
		print("Toggle set to "..tostring(value))
	end
})
```

### Create Slider

```lua
local Slider = Tab:CreateSlider({
	Name = "Slider";
	RichText = false; -- Enables RichText for the Name
	ScrollBarRichText = false; -- Enables RichText for the Value Display
	SliderColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar
	BlendColors = false; -- Blends MinColor & MaxColor depending on CurrentValue
	MinColor = Color3.fromRGB(255, 92, 92); -- Color of the slider bar at minimum value
	MaxColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar at maximum value
	SectionParent = nil; -- The SectionTab the button is parented to
	MinValue = 0; -- Minimum value of the slider
	MaxValue = 100; -- Maximum value of the slider
	CurrentValue = 50; -- The current value of the slider
	Increment = 1; -- The amount the value increases by when sliding. Increment cannot be 0 or negative
	FormatString = "Value: %d"; -- "%d" represents the CurrentValue
	CallbackOnRelease = false; -- Callback only when mouse is released
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	IgnoreList = {}; -- The properties the flag will blacklist/not saved
	Callback = function(value) -- The function that is called after slider is changed
		print("Slider set to "..tostring(value))
	end
})
```

### Create Dropdown

```lua
local Dropdown = Tab:CreateDropdown({
	Name = "Dropdown";
	RichText = false; -- Enables RichText for the Name
	Options = {"Option #1","Option #2","Option #3"};
	CurrentOption = {"Option #1"};
	SelectedColor = Color3.fromRGB(121, 152, 255); -- Color of the slider bar
	MultiSelect = false; -- Select More Than One Option
	CallbackOnSelect = true; -- Callback anytime an option is selected
	SectionParent = nil; -- The SectionTab the element is parented to
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	IgnoreList = {}; -- The properties the flag will blacklist/not saved
	Callback = function(options) -- options will always return a table
		print("Options Selected:",table.unpack(options))
	end
})

```

### Create Input

```lua
local Input = Tab:CreateInput({
	Name = "Input";
	PlaceholderText = "Type anything here!";
	NumbersOnly = false;
	RichText = false; -- Enables RichText for the Name
	CharacterLimit = 20;
	ClearTextOnFocus = false;
	SectionParent = nil; -- The SectionTab the button is parented to
	CurrentValue = ""; -- The text of the textbox
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	IgnoreList = {}; -- The properties the flag will blacklist/not saved
	Callback = function(value) -- The function that is called after toggle is pressed
		print("Input: "..tostring(value))
	end
})
```

### Create Color Picker

```lua
local ColorPicker = Tab:CreateColorPicker({
	Name = "ColorPicker";
	RichText = false; -- Enables RichText for the Name
	CurrentColor = Color3.fromRGB(255, 206, 92);
	CallbackOnRelease = false; -- Callback only when mouse is released
	EnableRainbowMode = true; -- Allows the user to switch between rainbow mode
	Rainbow = false;
	RainbowSpeed = 1; -- Cycles per second
	RainbowSaturation = 163; -- (0 - 255)
	RainbowBrightness = 255; -- (0 - 255)
	RainbowCallback = false; -- Callback every rainbow step
	SectionParent = nil; -- The SectionTab the element is parented to
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	IgnoreList = {}; -- The properties the flag will blacklist/not saved
	Callback = function(color) -- The function that is called after button is activated
		print("Color Picked:",tostring(color))
	end
})
```

### Create Keybind

```lua
local Keybind = Tab:CreateKeybind({
	Name = "Keybind";
	RichText = false; -- Enables RichText for the Name
	CurrentKeybind = Enum.KeyCode.E;
   	HoldToInteract = false;
	SectionParent = nil; -- The SectionTab the element is parented to
	Callback = function(keybind) -- The function that is called after button is activated
		print("Keybind set to: "..tostring(keybind))
	end
})
```

### Create Section

```lua
local Section = Tab:CreateSection("Section",120,false) -- Name, DropdownSizeY, Opened
```

### Create Separator

```lua
local Separator = Tab:CreateSeparator("Separator",nil) -- Text, SectionParent
```

### Create Paragraph

```lua
local Paragraph = Tab:CreateParagraph("This is a title","This is content",nil) -- Title, Content, SectionParent
```

### Element Modifiers

```lua
Window:AddElementTip(ElementName,"This is a tip",5) -- Shows a tip under your mouse cursor (ElementName,Tip,Duration)
Window:RemoveElementTip(ElementName) -- Removes the tip
Window:ActivateElement(ElementName) -- Makes the element clickable
Window:DeactivateElement(ElementName) -- Makes the element uninteractable
Window:ShowElement(ElementName) -- Shows the element
Window:HideElement(ElementName) -- Hides the element
```

### Getting Element Properties

```lua
-- Indexing the properties of elements from identifier or via 'FPSLibrary.Flags[FlagName]'
print(ElementName.CurrentValue)
print(Library.Flags[FlagName].CurrentValue)
-- returns nil if property is read-only or does not exist
```

### Changing Elements

```lua
-- Altering the properties of elements will take effect on its function & appearance (wont apply to properties that are read-only)
Tab.Title = "NewTitle"
-- Altering properties in the 'FPSLibrary.Flags' will not take effect.
```
