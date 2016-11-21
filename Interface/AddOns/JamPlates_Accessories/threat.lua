local addonName, at = ...
local core = at.core

core:AddCallback('Initialize', 'threat', function(self, ...)
	local tab = {}

	tab.enabled = false
	tab.anchor = 'LEFT'
	tab.relative = 'BOTTOMRIGHT'
	tab.x = -1
	tab.y = 10
	tab.width = 32
	tab.height = 32
	tab.scale = 1
	
	self.db.threat = tab
end)


local adapted = {}
core.threat = {} -- table to store excess threat textures

local threatStates = {
	-- TODO: maybe change color
	[1] = "Interface\\AddOns\\" .. addonName .. "\\Media\\Threat_Low",
	[2] = "Interface\\AddOns\\" .. addonName .. "\\Media\\Threat_Medium",
	--[3] = "Interface\\AddOns\\" .. addonName .. "\\Media\\Threat_Medium",
	[3] = "Interface\\AddOns\\" .. addonName .. "\\Media\\Threat_High",
	[4] = "Interface\\AddOns\\" .. addonName .. "\\Media\\Threat_Max",
}
local function Frame_SetTexture(self, state)
	self.texture:SetTexture(threatStates[state])
	self:Show()
end

-- Being green ain't easy.
local function RecyctableThreat(tab)
	if tab then
		-- put frame back into free frames
		tab:Hide()
		core.threat[#core.threat +1] = tab
		return nil

	elseif #core.threat > 0 then
		-- get a frame and send it out; there's no need for it to stick around either
		tab = core.threat[#core.threat]
		tab:SetSize(core.db.threat.width, core.db.threat.height)
		tab:SetScale(core.db.threat.scale)

		core.threat[#core.threat] = nil
		return tab

	else
		-- if nothing else just send a fresh frame; it should be returned later
		local frame = CreateFrame('Frame', nil, UIParent)
		frame:SetSize(core.db.threat.width, core.db.threat.height)
		frame:SetScale(core.db.threat.scale)
		frame:Hide()

		local texture = frame:CreateTexture()
		texture:SetTexture(threatStates[1])
		texture:SetAllPoints(frame)
		frame.texture = texture


		frame.SetThreatTexture = Frame_SetTexture

		frame.states = threatStates
		return frame

	end
end


local function Nameplate_OnUpdate(self, event, token)
		local state
		local _, _, scaledPercent, _, _ = UnitDetailedThreatSituation('player', token)
		if scaledPercent then
			if scaledPercent >= 99 then
				state = 4
			elseif scaledPercent > 66 then
				state = 3
			elseif scaledPercent > 33 then
				state = 2
			elseif scaledPercent > 0 then
				state = 1
			end
		else
			self.threatFrame:Hide()
		end
		if state then
			self.threatFrame:SetThreatTexture(state)
		end
end

core:AddCallback('Toggle', 'threat', function(self, ...)
	local state = 'RemoveCallback'
	if self.db.threat.enabled then
		state = 'AddCallback'
		for plate, frame in pairs(adapted) do
			frame:Show()
			frame.threatFrame = RecyctableThreat()
		end
	else
		for plate, frame in pairs(adapted) do
			frame:Hide()
			frame.threatFrame = RecyctableThreat(frame.threatFrame)
		end
	end
	
	self[state](self, 'NAME_PLATE_UNIT_ADDED', 'threat', function(self, frame, token)
		local tab = adapted[frame]
		tab.threatFrame = RecyctableThreat()
		tab.threatFrame:SetParent(frame)
		tab.threatFrame:SetPoint(self.db.threat.anchor, frame, self.db.threat.relative, self.db.threat.x, self.db.threat.y)
		
		adapted[frame] = tab
		tab:RegisterUnitEvent('UNIT_THREAT_LIST_UPDATE', token)
	end)
	
	self[state](self, 'NAME_PLATE_UNIT_REMOVED', 'threat', function(self, frame, token)
		local tab = adapted[frame]
		tab.threatFrame = RecyctableThreat(tab.threatFrame)
		tab.threatState = nil
		tab:UnregisterEvent('UNIT_THREAT_LIST_UPDATE')
	end)
	
end)

core:AddCallback('VariablesLoaded', 'threat', function(self, frame)
	self:AddCallback('NAME_PLATE_CREATED', 'threat', function(self, frame, _, threat)
		local sub = CreateFrame('Frame', nil, frame)
		sub:Hide()
		sub:HookScript('OnEvent', Nameplate_OnUpdate)
		adapted[frame] = sub
	end)
end)
