local cloneref = cloneref or function(o) return o end
local ConfigsDropdown
getgenv().FPSLibraryProtectGui = true -- Place this above the loadstring
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CITY512/UI-Libs/refs/heads/main/FPSLibrary/FPSLibrary.lua", true))()
------------------------------------------------------------------------------------------
function UpdateConfigsDropdown()
	ConfigsDropdown.Options = Library:ListConfigurationFiles()
end
------------------------------------------------------------------------------------------
-- Window
local Window = Library:BootWindow({
	Name = "FPSLibrary";
	LoadingTitle = "FPSLibrary Interface Suite";
	TabsVisible = true;
	ConfigurationSaving = {
		Enabled = true;
		FolderName = "example987654321"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		PlaceId = true -- Only saves configs for a certain PlaceId
	};
	Discord = {
        Enabled = false;
		InviteLink = ""; -- discord invite link (eg. discord.gg/ABCD)
		RememberJoins = true
	};
	KeySystem = {
		Enabled = true; -- The thread will yield until key is validated
		Keys = {"CITYSSCRIPTZAREDABEST"}; -- An array of valid keys. Will not apply if GrabKeyFromSite is true
		Encrypt = false; -- Applies AES-256 encryption to key file
		CypherKey = ""; -- cypher key length must be 16 or more. https://catonmat.net/tools/generate-random-ascii
		FileName = "Key"; -- Must keep it unique, otherwise other scripts using FPSLibrary may overwrite your file
		RememberKey = true; -- Will not ask for the key unless key has changed or expired
		KeyTimeLimit = 86400; -- in seconds
		GrabKeyFromSite = false; -- Gets key from a website
		WebsiteURL = ""; -- website you will be directed to for the key (eg. https://linkvertise.com/<link>)
		KeyRAWURL = ""; -- website where the RAW key is checked by the Library for (eg. https://raw.githubusercontent.com/<username>/<directory> or https://pastebin.com/raw/<paste>)
		JSONDecode = false; -- If RAW key is in json format (eg. ["key1","key2","key3"])
	}
})
------------------------------------------------------------------------------------------
-- Tabs
local Tab = Window:CreateTab({
	Title = "Test Window"; -- Title of the Tab
	Subtitle = "Universal"; -- Second title under the title
	Opened = false; -- If the tab is open
	TitleRichText = false; -- Enables RichText for the Title
	SubtitleRichText = false; -- Enables RichText for the Subtitle
	SizeY = 250; -- Length of the tab dropdown, SizeY must be 100 or more
	MaxSizeY = 250; -- Maximum length of the tab dropdown, SizeY must be 100 or more
	Position = UDim2.new(0,20,0,20); -- Position of the Tab on Window
	Flag = ""; -- Identifier for the configuration file (cannot be changed)
})
local Tab2 = Window:CreateTab({
	Title = "Others"; -- Title of the Tab
	Subtitle = "Others"; -- Second title under the title
	Opened = false; -- If the tab is open
	TitleRichText = false; -- Enables RichText for the Title
	SubtitleRichText = false; -- Enables RichText for the Subtitle
	SizeY = 250; -- Length of the tab dropdown, SizeY must be 100 or more
	MaxSizeY = 250; -- Maximum length of the tab dropdown, SizeY must be 100 or more
	Position = UDim2.new(0,132,0,20); -- Position of the Tab on Window
	Flag = ""; -- Identifier for the configuration file (cannot be changed)
})
------------------------------------------------------------------------------------------
-- Elements
-- Universal
local Button = Tab:CreateButton({
	Name = "Button";
	RichText = false; -- Enables RichText for the Name
	SectionParent = nil; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		print("Button Clicked!")
	end
})
Window:AddElementTip(Button,"This is a button!",5)
local Toggle = Tab:CreateToggle({
	Name = "Toggle";
	RichText = false; -- Enables RichText for the Name
	ActivatedColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar
	SectionParent = nil; -- The SectionTab the button is parented to
	CurrentValue = true; -- If the toggle is on/off
	Flag = "TOGGLEFLAG"; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after toggle is pressed
		print("Toggle set to "..tostring(value))
	end
})
Window:AddElementTip(Toggle,"This is a toggle!",5)
local Slider = Tab:CreateSlider({
	Name = "Slider";
	RichText = false; -- Enables RichText for the Name
	ScrollBarRichText = false; -- Enables RichText for the Value Display
	SliderBackgroundColor = Color3.fromRGB(58, 58, 58); -- Color of the slider bar's background
	SliderColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar
	BlendColors = true; -- Blends MinColor & MaxColor depending on CurrentValue
	MinColor = Color3.fromRGB(255, 92, 92); -- Color of the slider bar at minimum value
	MaxColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar at maximum value
	SectionParent = nil; -- The SectionTab the button is parented to
	MinValue = 0; -- Minimum value of the slider
	MaxValue = 100; -- Maximum value of the slider
	CurrentValue = 50; -- The current value of the slider
	Increment = 1; -- The amount the value increases by when sliding. Increment cannot be 0 or negative
	FormatString = "Value: %d"; -- "%d" represents the CurrentValue
	CallbackOnRelease = false; -- Callback only when mouse is released
	Flag = "SLIDERFLAG"; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after slider is changed
		print("Slider set to "..tostring(value))
	end
})
Window:AddElementTip(Slider,"This is a slider!",5)
local Dropdown = Tab:CreateDropdown({
	Name = "Dropdown";
	RichText = false; -- Enables RichText for the Name
	Options = {"Option #1","Option #2","Option #3"};
	CurrentOption = {"Option #1"};
	MultiSelect = false; -- Select More Than One Option
	CallbackOnSelect = true; -- Callback anytime an option is selected
	SectionParent = nil; -- The SectionTab the element is parented to
	Flag = "DROPDOWNFLAG"; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(options) -- options will always return a table
		print("Options Selected:",table.unpack(options))
	end
})
Window:AddElementTip(Dropdown,"This is a dropdown!",5)
local PassCodeInput = Tab:CreateInput({
	Name = "Passcode";
	PlaceholderText = "Enter 3-Digit Code.";
	NumbersOnly = true;
	RichText = false; -- Enables RichText for the Name
	CharacterLimit = 3;
	ClearTextOnFocus = true;
	SectionParent = nil; -- The SectionTab the button is parented to
	CurrentValue = ""; -- The text of the textbox
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after toggle is pressed
		if value == 512 then
			Library:Notify({
				Type = "id0x3";
				Message = "Correct!";
				Duration = 3;
			})
		else
			Library:Notify({
				Type = "id0x1";
				Message = "Try Again!";
				Duration = 3;
			})
		end
	end
})
Window:AddElementTip(PassCodeInput,"Enter correct passcode.",5)
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
	Callback = function() -- The function that is called after button is activated
		print("Button Clicked!")
	end
})
Window:AddElementTip(ColorPicker,"This is a ColorPicker!",5)
local CallbackErrorButton = Tab:CreateButton({
	Name = "Callback Error!";
	RichText = false; -- Enables RichText for the Name
	SectionParent = nil; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		print("Hello world! "..function() end)
	end
})
Window:AddElementTip(CallbackErrorButton,"This is a Callback Error Button!",5)
-- Others
local PaddingSection = Tab2:CreateSection("Padding",120,true) -- Name, DropdownSizeY, Opened
local Padding
local OrganizeTabsButton = Tab2:CreateButton({
	Name = "Organize Tabs";
	RichText = false; -- Enables RichText for the Name
	SectionParent = PaddingSection; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		Window:OrganizeTabs(19,19,Padding.CurrentValue)
	end
})
Padding = Tab2:CreateSlider({
	Name = "Padding";
	RichText = false; -- Enables RichText for the Name
	ScrollBarRichText = false; -- Enables RichText for the Value Display
	SliderBackgroundColor = Color3.fromRGB(58, 58, 58); -- Color of the slider bar's background
	SliderColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar
	BlendColors = false; -- Blends MinColor & MaxColor depending on CurrentValue
	MinColor = Color3.fromRGB(255, 92, 92); -- Color of the slider bar at minimum value
	MaxColor = Color3.fromRGB(255, 206, 92); -- Color of the slider bar at maximum value
	SectionParent = PaddingSection; -- The SectionTab the button is parented to
	MinValue = 0; -- Minimum value of the slider
	MaxValue = 20; -- Maximum value of the slider
	CurrentValue = 0; -- The current value of the slider
	Increment = 1; -- The amount the value increases by when sliding. Increment cannot be 0 or negative
	FormatString = "%d"; -- "%d" represents the CurrentValue
	CallbackOnRelease = true; -- Callback only when mouse is released
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after slider is changed
		print("Padding set to "..tostring(value))
	end
})
local ConfigsSection = Tab2:CreateSection("Config Save",120,true) -- Name, DropdownSizeY, Opened
ConfigsDropdown = Tab2:CreateDropdown({
	Name = "Configs";
	RichText = false; -- Enables RichText for the Name
	Options = {};
	CurrentOption = {};
	MultiSelect = false; -- Select More Than One Option
	CallbackOnSelect = true; -- Callback anytime an option is selected
	SectionParent = ConfigsSection; -- The SectionTab the element is parented to
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(options) -- options will always return a table
		print("Options Selected:",table.unpack(options))
	end
})
local FileNameTextBox = Tab2:CreateInput({
	Name = "Name";
	PlaceholderText = "Enter File Name.";
	NumbersOnly = false;
	RichText = false; -- Enables RichText for the Name
	CharacterLimit = 50;
	ClearTextOnFocus = false;
	SectionParent = ConfigsSection; -- The SectionTab the button is parented to
	CurrentValue = ""; -- The text of the textbox
	Flag = ""; -- Identifier for the configuration file. Recommended to keep it unique otherwise other elements can override.
	Callback = function(value) -- The function that is called after toggle is pressed
		print("Toggle set to "..tostring(value))
	end
})
local SaveConfigsButton = Tab2:CreateButton({
	Name = "Save File";
	RichText = false; -- Enables RichText for the Name
	SectionParent = ConfigsSection; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		Library:SaveConfiguration(FileNameTextBox.CurrentValue)
		UpdateConfigsDropdown()
	end
})
local LoadConfigsButton = Tab2:CreateButton({
	Name = "Load File";
	RichText = false; -- Enables RichText for the Name
	SectionParent = ConfigsSection; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		Library:LoadConfiguration(ConfigsDropdown.CurrentOption[1])
	end
})
local DeleteConfigsButton = Tab2:CreateButton({
	Name = "Delete File";
	RichText = false; -- Enables RichText for the Name
	SectionParent = ConfigsSection; -- The SectionTab the element is parented to
	Callback = function() -- The function that is called after button is activated
		Library:DeleteConfiguration(ConfigsDropdown.CurrentOption[1])
		UpdateConfigsDropdown()
		if not table.find(ConfigsDropdown.Options,ConfigsDropdown.CurrentOption) then
			ConfigsDropdown.CurrentOption = {}
		end
	end
})
UpdateConfigsDropdown()
task.spawn(function()
	while task.wait(10) do
		UpdateConfigsDropdown()
	end
end)
------------------------------------------------------------------------------------------
-- Notify
task.wait(1.25)
Library:Notify({
	Type = "id0x2";
    Message = "FPSLibrary v1.0. First official release. Go to github website to learn more.";
	Image = "rbxassetid://132267442786910";
	Duration = 10;
	Actions = {
		Close = {
			Name = "Copy Link";
			Callback = function()
				if setclipboard then
                    setclipboard("https://github.com/CITY512/UI-Libs/blob/main/FPSLibrary")
					Library:Notify({
						Type = "id0x3";
						Message = "Link copied to clipboard!";
						Duration = 3;
					})
				end
			end
		}
	}
})
