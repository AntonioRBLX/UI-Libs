# FPSLibrary | MM2 Main Edition

A Version of FPSLibrary Made for the Soul Purpose of MM2 Main

## Features

- ### [v1.0] 14/11/24
- Undetectable
- Configuration Saving
- Key System
- Auto Discord Invite
- Customizable Themes

# How To Use FPSLibrary

> ## Library

### Protect Library Gui

```lua
-- WARNING: IF THE GAME YOU ARE RUNNING FPSLIBRARY ON IS CRASHING OR DETECTING
getgenv().FPSLibraryProtectGui = true -- Place this above the loadstring
```

### Load Library

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CITY512/UI-Libs/refs/heads/main/FPSLibrary%202.0/AnvilHubLibrary.lua"))()
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

### Change Library Theme

```lua
Library:ChangeTheme({
	PrimaryColor = Color3.fromRGB(31,31,31);
	SecondaryColor = Color3.fromRGB(25,25,25);
})
```


> ## Window

### Create Window

```lua
local Window = Library:BootWindow({
	Name = "FPSLibrary Interface Suite";
	YieldUntilMenuLoaded = true; -- Yields the thread until the tabs and elements load in.
	ConfigurationSaving = {
		Enabled = false;
		FolderName = "configs"; -- Folder for all script configuration files. Keep it unique to prevent other scripts from overwriting this file.
		PlaceId = false -- (Optional) Only saves specific configurations for PlaceId
	};
	Interface = {
		ShowTabsOnBoot = true;
		ToggleGUIKeybind = Enum.KeyCode.RightShift;
		MenuButton = {
			Title = "FPSLibrary";
			UseIcons = false; -- (Optional) Uses Icon on the menu button instead of title
			IconId = 0; -- IconId shown on the button
			HoverIconId = 0; -- IconId shown when user hovers over the button. Set to nil for no HoverIcon.
			Position = UDim2.new(0.5,0,0,18);
			AnchorPoint = Vector2.new(0.5,0.5);
			Draggable = true; -- (Optional)
		};
		KeySystem = {
			Enabled = false; -- The thread will yield until key is validated
			Keys = {"key1","key2","key3"};
			RememberKey = false; -- (Optional)
			FileName = "Key"; -- The file the key the user entered will be saved to.
			KeyTimeLimit = 86400; -- Set to 'math.huge' to remember forever
			GrabKeyFromSite = false; -- (Optional)
			RedirectURL = nil; -- The website the user will be redirected to for the key (eg. https://linkvertise.com)
			RAWKeyURL = ""; -- The RAW website that is used by the SCRIPT to validate the key (eg. https://pastebin.com)
			JSONDecode = false; -- If the RAW website is in JSON format (eg. ["key1","key2","key3"])
		};
		Miscellaneous = {
			AllowShortcuts = true; -- Alllows user to use shortcuts when interface is closed in replace for keybinds.
			MobileOnly = false; -- Shortcuts For Mobile Only
			AllowBackgroundBlur = true; -- Shows blur in background when tabs or prompts are shown
			BlurIntensity = 16;
			Tabs = {
				TweenFade = true;
				FadeSpeed = 0.25; -- How long it takes for tabs to fade or appear
			};
		}
	};
	Discord = {
		Enabled = false; -- Allows discord invites to be sent by script
		PromptMidBoot = true; -- Prompts the user during loading screen
		PromptMessage = "Wanna Join My Discord Server?";
		InviteLink = ""; -- discord invite link (eg. discord.gg/ABCD)
		RememberJoins = true -- (Optional) Will not prompt on-boot again once user has chosen an option.
	};
})
```

### Prompt Window

```lua
Window:Prompt({
	Type = 1, -- 1 = "Info", 2 = "Warning", 3 = "Error", 4 = Success
	Title = "This is an example title",
	Message = "This is an example message"
})
```

### Prompt Discord Invite

```lua
Window:PromptDiscordInvite() -- Will prompt the discord invite again regardless of RememberJoins. Discord invites must be enabled.
```

### Configuration Folder Management

```lua
Library:SaveConfiguration({Name = "Configuration #1"})
Library:LoadConfiguration({ -- If config file is corrupted or not found, it will error.
	Name = "Configuration #1",
	CallbackElements = true -- Callback Elements once all configs loaded
})
Library:ListConfigurationFiles({ShowDirectory = false}) -- returns a table of configurations from the local configuration folder
```

### Auto-Load Configuration File On Boot

```lua
-- To do this, you must copy the command 'AutoLoadFileOnBoot' with the filename as the argument, then paste the 'LoadConfiguration' command, where 1st argument is nil, at the very bottom of all of your FPSLibrary elements.
Library:AutoLoadFileOnBoot({ -- This function will set a config file to autoload once script is executed again. NOTE: Only ONE file can be auto-loaded.
	Toggle = true, -- To tell if you want to 'autoload' on boot or 'un-autoload' on boot. if false, you won't need to worry about the filename.
	Name = "Configuration #1"
})
Library:LoadConfiguration({
	FileName = nil, -- You must leave first argument nil to identify the config file you want to 'autoload' from the meta.
	CallbackElements = true -- Callback Elements once all configs loaded
}) --
```

> ## Elements

### Create Customized Popup GUI

```lua
local PopupGUI = Window:CreateCustomPopupGUI({
	Title = "This is an example title"
})
-- [ Elements ] --
PopupGUI:CreateTitle({
	Type = 1, -- 1 = Title, 2 = Subtitle, 3 = Heading, 4 = Subheading
	Title = "Example Title",
	RichText = true,
	Underlined = true,
})
PopupGUI:CreateContent({
	Content = "Some content under the title",
	RichText = true
}) -- (Text, RichText)
PopupGUI:CreateList({
	Style = 1, -- 1 = Numbered, 2 = Bulleted, 3 = Dashed
	List = { -- NOTE: INDEXES MUST BE NUMBERED OR IT WILL ERROR
		[1] = {
			Text = "Get Ingredients",
			RichText = true,
			List = { -- (Text, RichText, List)
				[1] = {Text = "Cinnamon Powder",RichText = true}; -- (Text, RichText)
				[2] = {Text = "Sugar",RichText = true}; -- (Text, RichText)
				[3] = {Text = "Vanilla Extract",RichText = true} -- (Text, RichText)
			}
		}
	}
})
PopupGUI:CreateImage({
	Image = "rbxassetid://97207553955899",
	Size = UDim2.new(0,100,0,100)
})
```

### Create Tab

```lua
local Tab = Window:CreateTab({
	Title = "Title";
	Subtitle = nil;
	TitleRichText = false; -- (Optional)
	SubtitleRichText = false; -- (Optional)
	Opened = false;
	Visible = true;
	Icon = 97207553955899; -- (Optional) Set to nil for no icon
	SizeY = 250; -- Length of the tab dropdown
	MaxSizeY = 250;
	ElementDependent = false; -- (Optional) Automatically adjusts the SizeY by the amount of elements, still limited to "MaxSizeY"
	Position = UDim2.new(0,20,0,20);
	Flag = ""; -- Identifier for the configuration file (read-only)
	IgnoreList = {} -- (Optional) The properties the flag will blacklist/not save
})
```

### Create Section

```lua
local Section = Tab:CreateTabSection({
	Name = "Button"; -- Name of the Button
	RichText = false; -- (Optional) Enables RichText for the Nameof them to be triggered.
	Opened = false;
	Flag = ""; -- Identifier for the configuration file (read-only)
	IgnoreList = {} -- (Optional) The properties the flag will blacklist/not save
})
```

### Create Button Section

```lua
local ButtonSection = Tab:CreateTabButton({
	Name = "Button"; -- Name of the Button
	RichText = false; -- (Optional) Enables RichText for the Name
	EnableKeybinds = false; -- (Optional) Enables keybinds for this element
	CurrentKeybind = Enum.KeyCode.E; -- Multiple elements with the same keybind will cause all of them to be triggered.
	Callback = function() -- The function that is called after button is activated (this will not be saved to the flags)
		print("Button Clicked!")
	end;
	Flag = ""; -- Identifier for the configuration file (read-only)
	IgnoreList = {} -- (Optional) The properties the flag will blacklist/not save
})
```

### Create Toggle Section

```lua
local ToggleSection = Tab:CreateTabToggle({
	Name = "Toggle"; -- Name of the Toggle
	RichText = false; -- (Optional) Enables RichText for the Name
	EnableKeybinds = false; -- (Optional) Enables keybinds for this element
	CurrentKeybind = Enum.KeyCode.E; -- Multiple elements with the same keybind will cause all of them to be triggered.
	CurrentValue = false; -- Changes value when Toggle is clicked.
	ActivatedColor = nil; -- Changes color when CurrentValue is set to true. Set to nil for user preferences.
	Callback = function(value) -- The function that is called after button is activated (this will not be saved to the flags)
		print("Toggle has been set to "..tostring(value))
	end;
	Flag = ""; -- Identifier for the configuration file (read-only)
	IgnoreList = {} -- (Optional) The properties the flag will blacklist/not save
})
```

> ## Tab Element Configuration Elements

### Create Button

```lua
Section:CreateButton({
	ConfigName = "SectionButton1" -- (Required) if there are multiple configs with the same name, it errors.
	Name = "Button"; -- Name of the Button
	RichText = false; -- (Optional) Enables RichText for the Name
	Callback = function(value) -- The function that is called after button is activated (this will not be saved to the flags)
	end;
	IgnoreList = {} -- (Optional) The properties the section flag will blacklist/not save
})
```

> ## Element Utilities

### Element Modifiers

```lua
Window:AddKeybind(ElementIdentifierName,Enum.KeyCode.E) -- Adds/Changes the keybind of an element, must have 'EnableKeybinds' enabled. Only works with 'Tab Elements' (ElementName,KeyCode)
Window:RemoveKeybind(ElementIdentifierName) -- Removes the keybind of an element. Only works with 'Tab Elements' (ElementName)
Window:AddTip(ElementIdentifierName,"This is a tip",5) -- Shows a tip under your mouse cursor. (ElementName,Tip,TipDuration)
Window:RemoveTip(ElementIdentifierName) -- Removes the tip. (ElementName)
Window:LockElement(ElementIdentifierName) -- Makes the element interactable. (ElementName)
Window:UnlockElement(ElementIdentifierName) -- Makes the element uninteractable. (ElementName)
Window:ShowElement(ElementIdentifierName) -- Shows the element. (ElementName)
Window:HideElement(ElementIdentifierName) -- Hides the element. (ElementName)
```

### Indexing Tab Element Properties / Configurations

```lua
-- Indexing the properties of elements from identifier or via 'FPSLibrary.Flags[FlagName]'
-- Errors if property is read-only or does not exist
-- [ Get CurrentValue ] --
print(ElementIdentifierName.CurrentValue)
print(Library.Flags[FlagName].CurrentValue)
print(Library.Flags[FlagName].Configs["ConfigName"].CurrentValue)
-- [ Change CurrentValue ] --
-- NOTE: Changing properties from Flags will not take effect
ElementIdentifierName.CurrentValue = 100
ElementIdentifierName.Configs["ConfigName"].CurrentValue = 100
```
