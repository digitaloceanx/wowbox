local addonName, at = ...
local core = at.core

local main = CreateFrame('Frame', nil, UIParent)
main:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)

core:AddCallback('Initialize', nil, function(self, ...)
	local tab = {}

	tab.enabled = true
	
	tab.defaultEnabled = false
	--tab.defaultTimers = true -- maybe some day
	
	--tab.invert = false
	tab.ShowBorder = true
	tab.BPR = 6
	tab.scale = 1
	tab.width = 17
	tab.height = 17
	tab.anchor = 'BOTTOMLEFT'
	tab.relative = 'TOPLEFT'
	tab.growth = false
	tab.direction = false
	tab.x = 0
	tab.y = 0
	
	tab.showPlayerBuff = true
	tab.showPlayerDebuff = true
	tab.showPetBuff = true
	tab.showPetDebuff = true
	tab.showFriendlyBuff = false
	tab.showFriendlyDebuff = false
	tab.showHostileBuff = false
	tab.showHostileDebuff = false
	
	tab.filter = {
		--[1459] = true, -- mage: arcane brilliance
		--[21562] = true, -- priest: Power word: fortitude
	}
	
	self.db.aura = tab

	self:AddCallback('VariablesLoaded', 'aura', function(self)
		self.spells = JamPlatesAccessoriesDB.spells or {}
		if not self.db.aura then
			self.db.aura = self:CopyTable(tab)
		else
			self.db.aura.filter = self:CopyTable(JamPlatesAccessoriesDB[JamPlatesAccessoriesCP].aura.filter)
		end
	end)


	tab = {}

	tab.enabled = true
	tab.ShowBorder = true
	tab.BPR = 6
	tab.scale = 1
	tab.width = 17
	tab.height = 17
	tab.anchor = 'TOPRIGHT'
	tab.relative = 'LEFT'
	tab.growth = false
	tab.direction = true
	tab.x = 0
	tab.y = 0
	
	tab.showPlayerBuff = true
	tab.showPlayerDebuff = true
	tab.showPetBuff = true
	tab.showPetDebuff = true
	tab.showFriendlyBuff = true
	tab.showFriendlyDebuff = true
	tab.showHostileBuff = true
	tab.showHostileDebuff = true
	
	tab.filter = {
		--[1459] = true, -- mage: arcane brilliance
		--[21562] = true, -- priest: Power word: fortitude
	}
	
	self.db.tracker = self:CopyTable(tab)
	
	self:AddCallback('VariablesLoaded', 'tracker', function(self)
		if not self.db.tracker then
			self.db.tracker = self:CopyTable(tab)
		else
			self.db.tracker.filter = self:CopyTable(JamPlatesAccessoriesDB[JamPlatesAccessoriesCP].tracker.filter)
		end
	end)
end)


core.auras = {}
core.tracker = {}
core.spells = {}

--upvalue
local select = select
local UnitPlayerControlled = UnitPlayerControlled
local UnitIsDead = UnitIsDead
local UnitAura = UnitAura
local UnitCanAttack = UnitCanAttack
local strfind, ipairs = string.find, ipairs
local rad, ceil = math.rad, math.ceil
local NumberFontNormalYellow = NumberFontNormalYellow
local SystemFont_Shadow_Med1 = SystemFont_Shadow_Med1



-- functions
local function Cooldown_OnUpdate(self, elapsed)
	-- make sure it even needs a timer
	if self.time then
		elapsed = self.time - GetTime()

		-- check if time remaining is greater than a hour, a minute or a second;
		-- hide the timer if none of the above
		if elapsed >= 3600 then
			self.timer:SetFormattedText("%d h", ceil(elapsed / 3600))

		elseif elapsed > 60 then
			self.timer:SetFormattedText("%d m", ceil(elapsed / 60))

		elseif elapsed > 0 then
			self.timer:SetFormattedText("%d s", ceil(elapsed))

		else
			self.timer:SetText("")
			self.time = nil
			self.Parent:Hide()
		end
	end
end

-- font objects
local TIMER_FONT = CreateFont(addonName.. "AuraTimerFont_Shadowed")
TIMER_FONT:SetFont([[Fonts\FRIZQT__.TTF]], 8)
TIMER_FONT:SetTextColor(NumberFontNormalYellow:GetTextColor())
TIMER_FONT:SetShadowColor(0, 0, 0, 1)
TIMER_FONT:SetShadowOffset(SystemFont_Shadow_Med1:GetShadowOffset())

local COUNT_FONT = CreateFont(addonName.. "AuraCountFont")
COUNT_FONT:SetFont([[Fonts\FRIZQT__.TTF]], 8)


-- Being green ain't easy.
local function RecyctableAuras(tab)
	if tab then
		-- put table back into free tables; they may have debuff frames in them so hide them
		for x = 1, #tab do
			local frame = tab[x]
			frame:Hide()
			frame:SetSize(core.db.aura.width, core.db.aura.height)
			frame:SetScale(core.db.aura.scale)

			frame.border:SetSize(core.db.aura.width +3, core.db.aura.height +2)
		end
		core.auras[#core.auras +1] = tab
		return nil

	elseif #core.auras > 0 then
		-- get a table and send it out; there's no need for it to stick around either
		tab = core.auras[#core.auras]
		core.auras[#core.auras] = nil
		return tab

	else
		-- if nothing else just send a fresh table; it should be returned later
		return {visible = 0}
	end
end
local function RecyctableCCs(tab)
	if tab then
		for x = 1, #tab do
			local frame = tab[x]
			frame:Hide()
			frame:SetSize(core.db.tracker.width, core.db.tracker.height)
			frame:SetScale(core.db.tracker.scale)

			frame.border:SetSize(core.db.tracker.width +3, core.db.tracker.height +2)
		end
		core.tracker[#core.tracker +1] = tab
		return nil

	elseif #core.tracker > 0 then
		tab = core.tracker[#core.tracker]
		core.tracker[#core.tracker] = nil
		return tab

	else
		return {}
	end
end


local function Aura_OnHide(self)
	self.spellID = nil
end
local function CreateButton(parent, isCC)
	local db = isCC and core.db.tracker or core.db.aura
	
	local frame = CreateFrame('Frame', parent)
	frame:SetSize(core.db.aura.width, db.height)
	frame:SetScale(db.scale)

	local border = frame:CreateTexture()
	border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
	border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
	border:SetSize(db.width +3, db.height +2)
	border:SetPoint('CENTER', frame, 'CENTER')
	frame.border = border

	local texture = frame:CreateTexture()
	texture:SetAllPoints(frame)
	frame.texture = texture

	local timer = frame:CreateFontString()
	timer:SetPoint('TOP', frame, 'BOTTOM', 0 , -1)
	timer:SetFontObject(TIMER_FONT)
	timer:SetJustifyH('CENTER')
	frame.timer = timer

	-- finally
	local cooldown = CreateFrame('Cooldown', nil, frame, "CooldownFrameTemplate")
	cooldown:SetAllPoints(frame)
	cooldown.noCooldownCount = true -- CooldownCount ignore thing
	cooldown:SetReverse(true)
	cooldown.timer = timer
	cooldown:HookScript('OnUpdate', Cooldown_OnUpdate)
	cooldown.Parent = frame
	frame.cooldown = cooldown

	local count = frame:CreateFontString()
	count:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT')
	count:SetFontObject(COUNT_FONT)
	count:SetJustifyH('RIGHT')
	count:Hide()
	frame.count = count
	
	frame:HookScript('OnHide', Aura_OnHide)

	return frame
end


local function AdjustAuraTraits(frame, spellID, icon, debuffType, duration, expirationTime, count, isCC)
	frame.spellID = spellID

	frame.texture:SetTexture(icon)
	
	frame.debuffType = debuffType
	if isCC and core.db.tracker.ShowBorder or core.db.aura.ShowBorder then
		frame.border:Show()
		local color = DebuffTypeColor[debuffType or 'none']
		frame.border:SetVertexColor(color.r, color.g, color.b)
		
	else
		frame.border:Hide()

	end
	
	if count and count > 1 then
		frame.count:SetText(count)
		frame.count:Show()

	else
		frame.count:Hide()

	end
	
	if duration and ( duration > 0 ) then
		frame.cooldown:Show()
		frame.timer:Show()

		frame.cooldown.time = expirationTime
		frame.cooldown.duration = duration
		frame.cooldown:SetCooldown(expirationTime -duration, duration)

	else
		frame.cooldown:Hide()
		frame.timer:Hide()

		frame.cooldown.time = nil
		frame.cooldown.duration = nil
		--frame.cooldown.inverse = false

	end
end

local Growth = {
	Row = {
		[false] = {
			'BOTTOMLEFT',
			'TOPLEFT'
		},
		[true] = {
			'TOPLEFT',
			'BOTTOMLEFT',
		},
	},
	Column = {
		[false] = {
			'BOTTOMLEFT',
			'BOTTOMRIGHT'
		},
		[true] = {
			'BOTTOMRIGHT',
			'BOTTOMLEFT',
		},
	},
}

local function AddAura(self, nameplate, spellID, icon, debuffType, duration, expirationTime, count)
	local buffs = self.plates[nameplate].auras
	if not buffs then return end
	local index = buffs.visible +1
	buffs.visible = index
	local frame = buffs[index]
	if not frame then
		frame = CreateButton(nameplate)
		self.plates[nameplate].auras[index] = frame
	end
	AdjustAuraTraits(frame, spellID, icon, debuffType, duration, expirationTime, count)

	index = index -1
	frame:ClearAllPoints()
	if not self.db.aura.enabled then
		frame:Hide()
	else
		if index == 0 then
			frame:SetPoint(self.db.aura.anchor, nameplate, self.db.aura.relative, self.db.aura.x, self.db.aura.y)

		else
			local bpr = self.db.aura.BPR
			local growth
			if ceil(index / bpr) == index / bpr then
				growth = self.db.aura.growth
				--frame:SetPoint('BOTTOMLEFT', buffs[index - self.db.aura.BPR + 1], 'TOPLEFT', 0, 14)
				frame:SetPoint(Growth.Row[growth][1], buffs[index - bpr + 1], Growth.Row[growth][2], 0, 14 * (growth and -1 or 1))

			else
				growth = self.db.aura.direction
				frame:SetPoint(Growth.Column[growth][1], buffs[index], Growth.Column[growth][2], BUFF_HORIZ_SPACING  * (growth and 1 or -1), 0)
				
			end
		end
	end
	self.plates[nameplate].auras.visible = buffs.visible
		
	frame:Show()
	return frame
end
local function AddCC(self, nameplate, spellID, icon, debuffType, duration, expirationTime, count)
	local buffs = self.plates[nameplate].tracker
	if not buffs then return end
	local index = buffs.visible +1
	buffs.visible = index
	local frame = buffs[index]
	if not frame then
		frame = CreateButton(nameplate)
		self.plates[nameplate].tracker[index] = frame
	end
	AdjustAuraTraits(frame, spellID, icon, debuffType, duration, expirationTime, count, true)
	frame:SetParent(nameplate)

	index = index -1
	frame:ClearAllPoints()

	if not self.db.tracker.enabled then
		frame:Hide()
	else
		if index == 0 then
			frame:SetPoint(self.db.tracker.anchor, nameplate, self.db.tracker.relative, self.db.tracker.x, self.db.tracker.y)

		else
			local bpr = self.db.tracker.BPR
			local growth
			if ceil(index / bpr) == index / bpr then
				growth = self.db.tracker.growth
				frame:SetPoint(Growth.Row[growth][1], buffs[index - bpr + 1], Growth.Row[growth][2], 0, 14 * (growth and -1 or 1))

			else
				growth = self.db.tracker.direction
				frame:SetPoint(Growth.Column[growth][1], buffs[index], Growth.Column[growth][2], BUFF_HORIZ_SPACING * (growth and 1 or -1), 0)
				
			end
		end
	end
	self.plates[nameplate].tracker.visible = buffs.visible
	
	frame:Show()
	return frame
end
--[[
local function DoseAura(self, nameplate, isCC, spellID, icon, debuffType, duration, expirationTime, count)
	local buffs = self.plates[nameplate].auras
	if isCC then buffs = self.plates[nameplate].tracker end
	local v
	for x = 1, buffs.visible do
		v = buffs[x]
		if v.spellID == spellID then
			if count and count > 1 then
				v.count:SetText(count)
				v.count:Show()
				v.count.value = count

			else
				v.count:Hide()

			end
			break
		end
	end
end
local function RefreshAura(self, nameplate, isCC, spellID, icon, debuffType, duration, expirationTime, count)
	local buffs = self.plates[nameplate].auras
	if isCC then buffs = self.plates[nameplate].tracker end
	for x, v in ipairs(buffs) do
		if v.spellID == spellID then
			if count and count > 1 then
				v.count:SetText(count)
				v.count:Show()

			else
				v.count:Hide()

			end
			v.cooldown.time = expirationTime
			v.cooldown.duration = duration
			break
		end
	end
end
local function RemoveAura(self, nameplate, isCC, spellID)
	local buffs = self.plates[nameplate].auras
	if isCC then buffs = self.plates[nameplate].tracker end
	local frame, v, icon, debuffType, duration, expirationTime, count
	for x=1, buffs.visible do
		v = buffs[x]
		if v.spellID == spellID then
			frame = v
		elseif frame then
			AdjustAuraTraits(frame, v.spellID, v.texture:GetTexture(), v.debuffType, v.cooldown.duration, v.cooldown.time, v.count.value)
		end
	end
	if buffs[buffs.visible] then
		buffs[buffs.visible]:Hide()
	end
	self.plates[nameplate].auras.visible = buffs.visible -1

end
--]]

-- Oh ma gurd... I deleted it, yay!
local function ScanAuras(self, nameplate, token)
	local tab = self.plates[nameplate]
	local aura = self.db.aura
	local trac = self.db.tracker
	
	local auras, frame
	local index, visible = 1

	if tab.auras then tab.auras.visible = 0 end
	if tab.tracker then tab.tracker.visible = 0 end
	
	local filter = 'HARMFUL' or nil
	
	local spellID, icon, count, debuffType, duration, expirationTime, caster = true
	while token and spellID do
		_, _, icon, count, debuffType, duration, expirationTime, caster, _, _, spellID = UnitAura(token, index, filter)
		if spellID then
			local tmp = self.spells[spellID] or {}
			tmp.icon = icon
			tmp.debuffType = debuffType
			tmp.duration = duration
			self.spells[spellID] = tmp
			
			local unitIsAllied = UnitCanAttack('player', token)
			-- Talasonx special honors; I've since improved the code he pointed out I had wrong.
			if (trac.filter[spellID] and trac.enabled) and (
				(trac.showPlayerBuff and not filter and caster == 'player') or
				(trac.showPlayerDebuff and filter and caster == 'player') or
				(trac.showPetBuff and not filter and caster == 'pet') or
				(trac.showPetDebuff and filter and caster == 'pet') or
				
				(trac.showFreindlyBuff and not filter and unitIsAllied) or
				(trac.showFreindlyDebuff and filter and unitIsAllied) or
				
				(trac.showHostileBuff and not filter and not unitIsAllied) or
				(trac.showHostileDebuff and filter and not unitIsAllied)
				) then
				
				AddCC(self, nameplate, spellID, icon, debuffType, duration, expirationTime, count)
				
			elseif (aura.enabled and not aura.filter[spellID]) and (
				(aura.showPlayerBuff and not filter and caster == 'player') or
				(aura.showPlayerDebuff and filter and caster == 'player') or
				(aura.showPetBuff and not filter and caster == 'pet') or
				(aura.showPetDebuff and filter and caster == 'pet') or
				
				(aura.showFreindlyBuff and not filter and unitIsAllied) or
				(aura.showFreindlyDebuff and filter and unitIsAllied) or
				
				(aura.showHostileBuff and not filter and not unitIsAllied) or
				(aura.showHostileDebuff and filter and not unitIsAllied)
				) then
				AddAura(self, nameplate, spellID, icon, debuffType, duration, expirationTime, count)
			end
		end
		
		if filter and not spellID then
			spellID = true
			index = 1
			filter = nil
		else
			index = index + 1
		end

	end
	auras = tab.auras
	if auras then
		for x = auras.visible +1, #auras do
			auras[x]:Hide()
		end
	end
	
	auras = tab.tracker
	if auras then
		for x = auras.visible +1, #auras do
			auras[x]:Hide()
		end
	end
end


local UnitAurasEventFrames = {}
core:AddCallback('NAME_PLATE_CREATED', 'aura', function(self, plate)
	UnitAurasEventFrames[plate] = CreateFrame('Frame', nil, plate)
	UnitAurasEventFrames[plate]:SetScript('OnEvent', function()
		ScanAuras(self, plate, plate.namePlateUnitToken)
	end)
	local visible = self.db.aura.defaultEnabled and main.Show or main.Hide
	if plate.UnitFrame.BuffFrame then visible(plate.UnitFrame.BuffFrame) end
end)

local function HideUnusedFrames(default, aura, tracker)
	local visible = default and main.Show or main.Hide
	for x, v in pairs(core.plates) do
		if x.UnitFrame.BuffFrame then visible(x.UnitFrame.BuffFrame) end
		if not aura and v.auras then
			local list = v.auras
			for y=1, #list do
				list[y]:Hide()
			end
			v.auras = RecyctableCCs(v.auras)
		end
		if not tracker and v.tracker then
			local list = v.tracker
			for y=1, #list do
				list[y]:Hide()
			end
			v.tracker = RecyctableCCs(v.tracker)
		end
	end
end

local function ToggleEvents(self)
	local aura = self.db.aura.enabled
	local track = self.db.tracker.enabled
	local state = aura or track
	HideUnusedFrames(self.db.aura.defaultEnabled, aura, track)
	if state then
		state = 'AddCallback'
	else
		state = 'RemoveCallback'
		for x, v in pairs(UnitAurasEventFrames) do
			v:UnregisterEvent('UNIT_AURA')
		end
	end
	
	self[state](self, 'NAME_PLATE_UNIT_ADDED', 'aura', function(self, plate, token)
		UnitAurasEventFrames[plate]:RegisterUnitEvent('UNIT_AURA', token)
		self.plates[plate].auras = not self.plates[plate].auras and RecyctableAuras()
		self.plates[plate].tracker = not self.plates[plate].tracker and RecyctableCCs()
		ScanAuras(self, plate, token)
	end)
	self[state](self, 'NAME_PLATE_UNIT_REMOVED', 'aura', function(self, plate, token)
		if aura then self.plates[plate].auras = RecyctableAuras(self.plates[plate].auras) end
		if track then self.plates[plate].tracker = RecyctableCCs(self.plates[plate].tracker) end
		UnitAurasEventFrames[plate]:UnregisterEvent('UNIT_AURA')
	end)
end


core:AddCallback('Toggle', 'aura', function(self, ...)
	ToggleEvents(self)
end)

core:AddCallback('Toggle', 'tracker', function(self, ...)
	ToggleEvents(self)
end)
