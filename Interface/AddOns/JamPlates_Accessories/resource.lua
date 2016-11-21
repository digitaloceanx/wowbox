
local addonName, at = ...
local core = at.core

local main = CreateFrame('Frame', nil, UIParent)
main:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...)
end)

local UnitExists = UnitExists

core:AddCallback('Initialize', 'resource', function(self, ...)
	local tab = {}

	tab.enabled = true
	tab.anchor = 'TOP'
	tab.relative = 'CENTER'
	tab.x = 0
	tab.y = -2
	tab.scale = 1
	
	self.db.resource = tab
end)


core:AddCallback('VariablesLoaded', 'combopoints', function(self, frame)
	local function Update()
		if NamePlateTargetResourceFrame and UnitExists('target') then
			local namePlateTarget = C_NamePlate.GetNamePlateForUnit("target");
			if (namePlateTarget) then
				bar = NamePlateDriverFrame:GetClassNameplateBar()
				bar:SetParent(NamePlateTargetResourceFrame)
				bar:Show()
				NamePlateTargetResourceFrame:SetParent(namePlateTarget.UnitFrame)
				NamePlateTargetResourceFrame:ClearAllPoints()
				local tab = core.db.resource
				NamePlateTargetResourceFrame:SetPoint(tab.anchor, namePlateTarget.UnitFrame, tab.relative, tab.x, tab.y)
				NamePlateTargetResourceFrame:Show()
				NamePlateTargetResourceFrame:Layout()
			else
				NamePlateTargetResourceFrame:Hide()
			end
		end
	end
	main.PLAYER_TARGET_CHANGED = Update
end)



core:AddCallback('Toggle', 'resource', function(self, ...)
	local state = 'RemoveCallback'
	local reg = 'UnregisterEvent'
	if self.db.resource.enabled then
		state = 'AddCallback'
		reg = 'RegisterEvent'
	end
	main[reg](main, 'PLAYER_TARGET_CHANGED')
	
	self[state](self, 'NAME_PLATE_UNIT_REMOVED', 'combopoints', function(self, frame)
		main:PLAYER_TARGET_CHANGED()
	end)

	self[state](self, 'NAME_PLATE_UNIT_ADDED', 'combopoints', function(self, frame)
		main:PLAYER_TARGET_CHANGED()
	end)
end)
