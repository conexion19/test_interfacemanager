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
end

return InterfaceManager
