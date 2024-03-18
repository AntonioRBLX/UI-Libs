loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
RayfieldLibrary:Notify({
	Title = "This is a notification";
	Actions = true;
	Content = "This is the notification content";
	Image = "rbxassetid://11777915661";
	Duration = 5;
})
local Window = RayfieldLibrary:CreateWindow({
	Name = "Window";
	LoadingTitle = "Loading Title";
	LoadingSubtitle = "Loading Subtitle";
	ConfigurationSaving = {
		Enabled = false;
		FileName = nil; -- <string>
		FolderName = nil; -- <string>
	};
	Discord = {
		Invite = nil; -- <url>
	};
	KeySystem = false;
	KeySettings = {
		Title = "Key System";
		Subtitle = "Key System Subtitle";
		Key = "1234";
		FileName = "";
	};

})
local Tab = Window:CreateTab("Tab","rbxassetid://11777915661")

local Button = Tab:CreateButton({
	Name = "This is a button";
	Callback = function()
		print("Button pressed")
	end;
})
-- Button:Set(<name: string>)

local ColorPicker = Tab:CreateColorPicker({
	Name = "This is a color picker";
	Color = Color3.new(1,1,1);
	Callback = function(value)
		print(value)
	end;
})
-- ColorPicker:Set(<color3>)

local Section = Tab:CreateSection("This is a section")
-- Section:Set(<name: string>)

local Label = Tab:CreateLabel("This is a label")
-- Label:Set(<text: string>)

local Paragraph = Tab:CreateParagraph({
	Title = "This is a paragraph";
	Content = "This is the paragraph content";
})
--[[ 
Paragraph:Set({
	Title = <string>
	Content = <string>
})
--]]

local Input = Tab:CreateInput({
	Name = "This is a input";
	PlaceholderText = "This is the input placeholder";
	RemoveTextAfterFocusLost = false;
	Callback = function(value)
		print(value)
	end
})
-- Input:Set(text: string)

local Dropdown = Tab:CreateDropdown({
	Name = "My Dropdown";
	Options = {
		"Option1";
		"Option2";
		"Option3";
	};
	MultipleOptions = false;
	CurrentOption = "Option1";
	Callback = function(newoption)
		print(newoption)
	end
})
-- Dropdown:Set(newoption: string)

local Keybind = Tab:CreateKeybind({
	Name = "This is a keybind switch";
	CurrentKeybind = Enum.KeyCode.G;
	HoldToInteract = true;
	Callback = function()

	end;
})
-- Keybind:Set(newkeybind: Enum.KeyCode)

local Toggle = Tab:CreateToggle({
	Name = "This is a toggle";
	CurrentValue = false;
	Callback = function(value)
		print(value)
	end;
})
-- Toggle:Set(value: boolean)

local Slider = Tab:CreateSlider({
	Name = "This is a slider";
	CurrentValue = 100;
	Range = {
		0; -- Start
		100; -- End
	};
	Increment = 1;
	Suffix = "%";
	Callback = function(value)
		print(value)
	end;
})
-- Slider:Set(value: number)
