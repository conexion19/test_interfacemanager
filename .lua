local InterfaceManager = {}
local httpService = game:GetService("HttpService")

InterfaceManager.Folder = "HeliosSettings"

function InterfaceManager:SetFolder(folder)
	self.Folder = folder
end

function InterfaceManager:SetLibrary(library)
	self.Library = library
end

function InterfaceManager:BuildInterfaceSection(tab)
	assert(self.Library, "Must set InterfaceManager.Library")
	
	local section = tab:AddSection("Interface Settings")

	section:AddKeybind("MenuKeybind", {
		Title = "Minimize Bind",
		Default = "RightShift",
		Callback = function(key)
			self.Library.MinimizeKeybind = key
		end
	})
	
	local themes = {}
	for name, _ in pairs(self.Library.Themes or {}) do
		table.insert(themes, name)
	end

	section:AddDropdown("InterfaceTheme", {
		Title = "Theme",
		Values = themes,
		Default = self.Library.Theme,
		Callback = function(themeName)
			self.Library:SetTheme(themeName)
		end
	})
end

return InterfaceManager
