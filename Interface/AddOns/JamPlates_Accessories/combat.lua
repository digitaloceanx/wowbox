local addonName, at = ...
local core = at.core

-- basic combat indicator

core:AddCallback('Initialize', 'combat', function(self, ...)
	local tab = {}

	tab.enabled = true
	tab.anchor = 'LEFT'
	tab.relative = 'RIGHT'
	tab.x = 0
	tab.y = 0
	tab.width = 25
	tab.height = 25
	tab.scale = 1
	
	self.db.combat = tab
end)

local adapted = {}
local function Combat_OnShow(self)
	local db = core.db.combat
	local frame = adapted[self]
	frame:SetSize(db.width, db.height)
	frame:SetScale(db.scale)
end

core:AddCallback('Toggle', 'combat', function(self, ...)
	local state = 'RemoveCallback'
	local reg = 'UnregisterEvent'
	if self.db.combat.enabled then
		state = 'AddCallback'
		ref = 'RegisterEvent'
	end
	
	self[state](self, 'NAME_PLATE_UNIT_REMOVED', 'combatindicator', function(self, plate, hastarget)
		--adapted[plate]:UnregisterEvent('UNIT_COMBAT')
		adapted[plate]:UnregisterEvent('UNIT_POWER')
		adapted[plate]:Hide()
	end)

	self[state](self, 'NAME_PLATE_UNIT_ADDED', 'combatindicator', function(self, plate, namePlateUnitToken)
		adapted[plate]:SetShown(UnitAffectingCombat(namePlateUnitToken))
		--adapted[plate]:RegisterUnitEvent('UNIT_COMBAT', namePlateUnitToken)
		adapted[plate]:RegisterUnitEvent('UNIT_POWER', namePlateUnitToken)
		Combat_OnShow(plate)
	end)
	
end)
core:AddCallback('VariablesLoaded', 'combatindicator', function(self, frame)
	self:AddCallback('NAME_PLATE_CREATED', 'combatindicator', function(self, plate)
		local db = self.db.combat
		local frame = CreateFrame('Frame', nil, plate)
		frame:ClearAllPoints()
		frame:SetPoint(db.anchor, plate.UnitFrame.healthBar, db.relative, db.x, db.y)
		frame:SetSize(db.width, db.height)
		frame:SetScale(db.scale)
		
		frame:SetScript('OnEvent', function(self, _, token)
			adapted[self:GetParent()]:SetShown(UnitAffectingCombat(token))
			Combat_OnShow(self:GetParent())
		end)
		
		local texture = frame:CreateTexture()
		texture:SetAllPoints()
		texture:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
		texture:SetTexCoord(0.5, 1.0, 0, 0.5)
		frame:Hide()
		
		adapted[plate] = frame
		
		frame:SetFrameStrata('HIGH')
		
		--Combat_OnShow(plate)
	end)
end)
