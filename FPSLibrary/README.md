# FPSLibrary v1.0
ROBLOX User Interface Library Created By CITY512.
## Features
- Every Working Element (eg. dropdown (multi-selectable), toggle, buttons etc)
- Configuration Saving
- Key System (including website)
- Auto Discord Invite
## Interface Preview
<img src="https://i.imgur.com/9mDoQR8.png" />

# How To Use FPSLibrary
## Boot Library
```lua
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/W6vhHP0G", true))()
```
### Protect Library Gui
```lua
-- WARNING: IF THE GAME YOU ARE RUNNING FPSLIBRARY ON IS CRASHING OR DETECTING
getgenv().FPSLibraryProtectGui = true -- Place this above the loadstring
```
## Create Window
```lua
local Window = Library:BootWindow({
	Name = "FPSLibrary Example";
	LoadingTitle = "FPSLibrary Interface Suite";
	ConfigurationSaving = {
		Enabled = true;
		FolderName = "configs"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		PlaceId = false -- Only saves configs for a certain PlaceId
	};
	Discord = {
        Enabled = false;
		InviteLink = ""; -- discord invite link (eg. discord.gg/ABCD)
		RememberJoins = true
	};
	KeySystem = {
		Enabled = true; -- The thread will yield until key is submitted
		Keys = {"key1","key2","key3"}; -- An array of valid keys. Recommended to set this to nil if GrabKeyFromSite is true
		FileName = "Key"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		RememberKey = true; -- Will not ask for the key unless key has expired
		KeyTimeLimit = 86400; -- in seconds
		GrabKeyFromSite = false; -- Gets key from a website
		WebsiteURL = "https://pastebin.com/LrbPFf3z"; -- (eg. https://linkvertise.com/<link>)
		KeyRAWURL = "https://pastebin.com/raw/xkxbJi08"; -- (eg. https://raw.githubusercontent.com/<username>/<directory> or https://pastebin.com/raw/<paste>)
		JSONDecode = true; -- If RAW website is in json format (must be written in an array eg. ["key1","key2","key3"])
	}
})
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
	RichText = false; -- Enables RichText for the Name
	Visible = true; -- If the element is displayed
	Active = false; -- If the element is clickable
	Tip = "This is a button"; -- Displays a tip that hovers under the cursor
	TipDuration = 5;
	ButtonColor = Color3.fromRGB(97,97,97); -- Color of the element
	SectionParent = nil; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is pressed
		print("Button Clicked!")
	end
})
```
### Create Toggle
```lua
local Toggle = Tab:CreateToggle({
	Name = "Toggle";
	RichText = false; -- Enables RichText for the Name
	Visible = true; -- If the element is displayed
	Active = true; -- If the element is clickable
	Tip = "This is a toggle"; -- Displays a tip that hovers under the cursor
	TipDuration = 5;
	ToggleColor = Color3.fromRGB(97,97,97); -- Color of the button
	SectionParent = nil; -- The SectionTab the button is parented to
	Callback = function(value) -- The function that is called after button is pressed
		print("Toggle set to "..tostring(value))
	end
})
```
### Prompt Discord Invite
```lua
Window:PromptDiscordInvite() -- If you want to prompt invite on boot, put it right under the BootWindow
```
### Getting Element Values
```lua
print(Toggle.CurrentValue)
```
### Changing Elements
```lua
-- Altering the properties of elements will take effect on its function & appearance
-- Properties will not take effect if changed through the 'Flag'
Tab.Title = "NewTitle"
```
