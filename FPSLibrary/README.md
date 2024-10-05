# FPSLibrary v1.0
ROBLOX User Interface Library Created By CITY512.
## Features
- Every Working Element
- Configuration Saving
- Key System (including website)
- Auto Discord Invite
## Interface Preview
<img src="https://i.imgur.com/9mDoQR8.png" />

# How To Use FPSLibrary
### Protect Library Gui
```lua
-- WARNING: IF THE GAME YOU ARE RUNNING FPSLIBRARY ON IS CRASHING OR DETECTING
getgenv().FPSLibraryProtectGui = true -- Place this above the loadstring
```
## Boot Library
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CITY512/UI-Libs/refs/heads/main/FPSLibrary/FPSLibrary.lua", true))()
```
## Create Window
```lua
local Window = Library:BootWindow({
	Name = "FPSLibrary Example";
	LoadingTitle = "FPSLibrary Interface Suite";
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
		EncryptKey = true; -- Applies AES-256 encryption to key array
		CypherKey = "" -- cypher key length must be 16 or more. https://catonmat.net/tools/generate-random-ascii
		FileName = "Key"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		RememberKey = false; -- Will not ask for the key unless key has changed or expired
		KeyTimeLimit = 86400; -- in seconds
		GrabKeyFromSite = false; -- Gets key from a website
		WebsiteURL = ""; -- website you will be directed to for the key (eg. https://linkvertise.com/<link>)
		KeyRAWURL = ""; -- website where the RAW key is checked for (eg. https://raw.githubusercontent.com/<username>/<directory> or https://pastebin.com/raw/<paste>)
		JSONDecode = false; -- If RAW key is in json format (key must be written as eg. ["key1","key2","key3"])
	}
})
```
### Prompt Discord Invite
```lua
Window:PromptDiscordInvite() -- If you want to prompt invite on boot, put it right under the BootWindow
```
### Create Tab
```lua
local Tab = Window:CreateTab({
	Title = "Title"; -- Title of the Tab
	Subtitle = "Subtitle"; -- Second title under the title
	Visible = true; -- If the tab is displayed
	Opened = false; -- If the tab is open
	TitleRichText = false; -- Enables RichText for the Title
	SubtitleRichText = false; -- Enables RichText for the Subtitle
	SizeY = 250; -- Length of the tab dropdown, SizeY must be 100 or more
	MaxSizeY = 250; -- Maximum length of the tab dropdown, SizeY must be 100 or more
	Position = UDim2.new(0,20,0,20); -- Position of the Tab on Window
	Flag = ""; -- Identifier for the configuration file (cannot be changed)
})
```
### Create Button
```lua
local Button = Tab:CreateButton({
	Name = "Button";
	FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal);
	RichText = false; -- Enables RichText for the Name
	Visible = true; -- If the element is displayed
	Active = true; -- If the element is clickable
	Tip = "This is a button"; -- Displays a tip that hovers under the cursor, set to nil to remove tip
	TipDuration = 5;
	ButtonColor = Color3.fromRGB(97,97,97); -- Color of the element
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
	FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal);
	RichText = false; -- Enables RichText for the Name
	Visible = true; -- If the element is displayed
	Active = true; -- If the element is clickable
	Tip = "This is a toggle"; -- Displays a tip that hovers under the cursor, set to nil to remove tip
	TipDuration = 5;
	ToggleColor = Color3.fromRGB(97,97,97); -- Color of the element
	SectionParent = nil; -- The SectionTab the button is parented to
	CurrentValue = false; -- If the toggle is on/off
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after toggle is pressed
		print("Toggle set to "..tostring(value))
	end
})
```
### Create Slider
```lua
local Slider = Tab:CreateSlider({
	Name = "Slider";
	FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json",Enum.FontWeight.Bold,Enum.FontStyle.Normal);
	RichText = false; -- Enables RichText for the Name
	ScrollBarRichText = false; -- Enables RichText for the Scroll Bar Section
	Visible = true; -- If the element is displayed
	Active = true; -- If the element is clickable
	Tip = "This is a slider"; -- Displays a tip that hovers under the cursor, set to nil to remove tip
	TipDuration = 5;
	SliderElementColor = Color3.fromRGB(97,97,97); -- Color of the element
	SliderBackgroundColor = Color3.fromRGB(58, 58, 58); -- Color of the scroll bar's background
	SliderColor = Color3.fromRGB(255, 206, 92); -- Color of the scroll bar
	SectionParent = nil; -- The SectionTab the button is parented to
	MinValue = 0; -- Minimum value of the slider
	MaxValue = 100; -- Maximum value of the slider
	CurrentValue = 50; -- The starting value of the slider
	Increment = 1; -- The amount the value increases by when scrolling.
	Suffix = "%"; -- The string that appears at the end of the value
	CallbackOnRelease = false; -- Callback only when mouse is released
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after slider is changed
		print("Slider set to "..tostring(value))
	end
})
```
### Getting Element Values
```lua
-- Indexing the properties of elements from identifier or via FPSLibrary.Flags[FlagName] (if property does not exist, it errors)
print(ElementName.CurrentValue)
```
### Changing Elements
```lua
-- Altering the properties of elements will take effect on its function & appearance (if property does not exist or is read-only, it errors)
-- If you wish to alter the properties through Flags you must write 'Library.Flags[<flagname>].Module[<property>]
Tab.Title = "NewTitle"
```
### Removing Elements
```lua
-- Note: This only works for elements, if you want to remove a tab, you must hide it (Tab.Visible = false)
ElementName:Destroy()
```
