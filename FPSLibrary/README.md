# FPSLibrary v1.1

ROBLOX User Interface Library Created By inkvy.

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
- Added New Elements (keybinds and paragraphs)
- ColorPicker Rainbow Mode
- Bug Fixes (configurations crashing executors)
- Mobile Supported Tab Minimizer
- Roblox Studio Support (for interface beta testing)
- ### [v1.1.1] 11/12/2024
- Lag Issues Fixed
- Bug Fixes (dropdown issues with non-string elements)
- Fixed Key System Close Button
- ### [v1.1.2] 12/8/2024
- Bug Fixes (colorpicker issues, and key system not closing)
- Changed Notification Appearance
- Changed Toggle Appearance
- Added Icon Styled Tab Minimizer

## Interface Preview

<img src="https://i.imgur.com/zfIKrwp.jpg" />

# How To Use FPSLibrary

> ## Library

### Protect Library Gui

```lua
-- WARNING: IF THE GAME YOU ARE RUNNING FPSLIBRARY ON IS CRASHING OR DETECTING
getgenv().FPSLibraryProtectGui = true -- Place this above the loadstring
```

### Boot Library

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CITY512/UI-Libs/refs/heads/main/FPSLibrary/FPSLibrary.lua"))()
```

### Prompt Notification

```lua
Library:Notify({
	Type = "info"; -- (Optional) types: error, info, success, (case-sensitive) delete this line or set to nil for normal notification
	Title = "This is a title" -- (Required)
	Message = "This is an example message."; -- (Required)
	Icon = nil; -- (Optional) delete this line or set to nil for no icon
	Image = 97207553955899; -- (Optional) Shows a giant image at the center of the notification. Delete this line or set to nil for no image
	Sound = 3398620867; -- (Optional) delete this line or set to nil for no sound / custom notification type sound.
	Duration = 10; -- (Required)
	Actions = { -- (Optional) Delete this line or set to nil for no action buttons
		Action1 = {
			Name = "Action1";
			Callback = function()
				print("Action #1 pressed")
			end
		};
		Action2 = {
			Name = "Action2";
			Callback = function()
				print("Action #2 pressed")
			end
		};
	}
})
```

> ## Window

### Create Window

```lua
local Window = Library:BootWindow({
	LoadingTitle = "FPSLibrary Interface Suite";
	WindowVisible = true;
	ToggleGUIKeybind = Enum.KeyCode.RightShift;
	AsynchronousLoad = false;
	ConfigurationSaving = {
		Enabled = false;
		FolderName = "configs"; -- (Required) Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		PlaceId = false -- (Optional) Only saves configs for a certain PlaceId
	};
	Discord = {
        Enabled = false;
		InviteLink = ""; -- (Required) discord invite link (eg. discord.gg/ABCD)
		RememberJoins = true -- (Optional)
	};
	ToggleInterface = {
		Enabled = false;
		KeyboardCheck = false; -- (Required) Automatically Hides Button When Keyboard is Enabled
		Title = "Toggle GUI"; -- (Required) only required when UseIcon is false
		UseIcon = false; -- (Optional)
		Icon = nil; -- (Required) Shows a small icon that toggles GUI appearance.
		BackgroundColor = Color3.new(0,0,0); -- (Required)
		Position = UDim2.new(0.5,0,0,18); -- (Required)
		AnchorPoint = Vector2.new(0.5,0.5); -- (Required)
		Draggable = true; -- (Optional)
		ShowAfterKeySystem = false; -- (Optional)
	};
	KeySystem = {
		Enabled = false; -- The thread will yield until key is validated
		Title = "Key System"; -- (Required)
		Keys = {"key1","key2","key3"}; -- (Required) An array of valid keys. Will not apply if GrabKeyFromSite is true
		EncryptKey = false; -- (Optional) Applies AES-256 encryption to key file (currently not working)
		CypherKey = ""; -- (Required) cypher key length must be 16 or more. https://catonmat.net/tools/generate-random-ascii
		RememberKey = false; -- (Optional) Will not ask for the key unless key has changed or expired
		FileName = "Key"; -- (Required) The file the key is saved to.
		KeyTimeLimit = 86400;  -- (Required) in seconds
		GrabKeyFromSite = false;  -- (Optional) Gets key from a website
		WebsiteURL = ""; -- (Required) website you will be directed to for the key (eg. https://linkvertise.com/<link>)
		KeyRAWURL = ""; -- (Required) website where the RAW key is checked for (eg. https://raw.githubusercontent.com/<username>/<directory> or https://pastebin.com/raw/<paste>)
		JSONDecode = false; -- (Optional) If RAW key is in json format (eg. ["key1","key2","key3"])
	}
})
```

### Configuration Folder Management

```lua
Library:SaveConfiguration("Configuration #1")
Library:LoadConfiguration("Configuration #1", true) -- 2nd argument is to callback elements once loaded
Library:ListConfigurationFiles() -- returns a table of configurations from the local folder
```

### Auto Load Configuration File
```lua
-- To do hhis, you must copy the command 'AutoLoadFileOnBoot' with the filename as the argument, then use the 'LoadConfiguration' command where 1st argument is nil, and paste it at the very bottom of all of your FPSLibrary elements.
Library:AutoLoadFileOnBoot(true,"Configuration #1") -- 1st argument is to tell if you want to 'autoload' on boot or 'un-autoload' on boot. if 1st argument is false, you won't need to worry about the filename.
Library:LoadConfiguration(nil,true) -- 2nd argument is still to callback elements once loaded
```

### Prompt Discord Invite

```lua
Window:PromptDiscordInvite() -- If you want to prompt invite on boot, put it right under the BootWindow
```
> ## Elements

### Create Tab

```lua
local Tab = Window:CreateTab({
	Title = "Title"; -- (Required) Title of the Tab
	Subtitle = "Subtitle"; -- (Required) Second title under the title
	Opened = false; -- (Required) If the tab is open
	TitleRichText = false; -- (Optional) Enables RichText for the Title
	SubtitleRichText = false; -- (Optional) Enables RichText for the Subtitle
	Image = 97207553955899 -- (Optional)
	SizeY = 250; -- (Required) Length of the tab dropdown, SizeY must be 100 or more
	MaxSizeY = 250; -- (Required) Maximum length of the tab dropdown, SizeY must be 100 or more
	Position = UDim2.new(0,20,0,20); -- (Required) Position of the Tab on Window
	Flag = ""; -- (Optional) Identifier for the configuration file (cannot be changed)
	IgnoreList = {} -- (Optional) The properties the flag will blacklist/not saved
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
	MinOptions = 0; -- Minimum amount of options the user can select
	MaxOptions = 1; -- Maximum amount of options the user can select
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
