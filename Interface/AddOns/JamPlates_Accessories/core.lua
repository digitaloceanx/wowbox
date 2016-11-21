local addonName, at = ...


local core = CreateFrame('Frame', nil, UIParent)
	core:SetScript("OnEvent", function(self, event, ...)
		self[event](self, ...)
	end)
at.core = core

local type, pairs = type, pairs

core.callbacks = {}
function core:Callback(name, ...)
	local tab = self.callbacks[name]
	if tab then
		for x, v in pairs(tab) do
			v(self, ...)
		end
	end
end
function core:CallbackKey(name, key, ...)
	local tab = self.callbacks[name]
	if tab[key] then
		tab[key](self, ...)
	end
end
function core:AddCallback(name, key, func)
	local tab = self.callbacks[name] or {}
	tab[key or #tab +1] = func
	self.callbacks[name] = tab
end
function core:RemoveCallback(name, key)
	if self.callbacks[name] then
		self.callbacks[name][key] = nil
	end
end
function core:CallOnce(name, ...)
	local tab = self.callbacks[name]
	for key, v in pairs(tab) do
		v(self, ...)
	end
	self.callbacks[name] = nil
end

function core:CopyTable(t, t2)
	if not t then return {} end
	local t3 = {}
	if t2 then
		for k,v in pairs(t2) do
			if type(v) == 'table' then
				v = self:CopyTable(v, t3[k])
			end
			t3[k] = v
		end
		for k,v in pairs(t) do
			if type(v) == 'table' then
				v = self:CopyTable(v, t3[k])
			end
			t3[k] = v
		end
		return t3
	else
		for k,v in pairs(t) do
			if type(v) == 'table' then
				v = self:CopyTable(v)
			end
			t3[k] = v
		end
		return t3
	end
end

function core:GetN(t)
  local count = 0
  for _ in pairs(t) do count = count +1 end
  return count
end


--tables
core.plates = {} -- keeps track of namplates



--upvalue
local select = select
local WorldFrame = WorldFrame
local UnitPlayerControlled = UnitPlayerControlled
local UnitIsDead = UnitIsDead
local UnitGUID = UnitGUID
local UnitCanAttack = UnitCanAttack
local strfind, ipairs = string.find, ipairs
local rad, ceil = math.rad, math.ceil



--vars
local visible = 0
local hastarget
local targetUpdate = false
local updateMouseover = false
core.PLAYER_GUID = UnitGUID('player')
core.TARGET_GUID = UnitGUID('target')
core.PET_GUID = UnitGUID('pet')
core.MOUSEOVER_GUID = nil



core.VariableLoadCount = 0
function core:LoadVariables()
	-- this will run for each event that loads some form of variable; only doing anything once they've all loaded.
	self.VariableLoadCount = self.VariableLoadCount +1
	if self.VariableLoadCount > 2 then
		self.PLAYER_GUID = UnitGUID('player')
		self.PET_GUID = UnitGUID('pet')

		JamPlatesAccessoriesDB = self:CopyTable(JamPlatesAccessoriesDB or {default = self.defaults, spells = {}})

		JamPlatesAccessoriesCP = JamPlatesAccessoriesCP or self.PLAYER_GUID
		self.db = self:CopyTable(JamPlatesAccessoriesDB[JamPlatesAccessoriesCP] or self.db, self.db)
		--self.spells = self:CopyTable(JamPlatesAccessoriesDB.spells or {})
		
		
		if core.db.name == 'default' and JamPlatesAccessoriesCP == self.PLAYER_GUID then
			self.db.name = UnitName('player')
			self.db.id = self.PLAYER_GUID
			JamPlatesAccessoriesDB[core.PLAYER_GUID] = self:CopyTable(self.db)
		end
		
		self:RegisterEvent('NAME_PLATE_CREATED')
		function self:NAME_PLATE_CREATED(...)
			local frame = ...
			local unitFrame = frame.UnitFrame
			local tab = {}
			--local overlay = unitFrame.Highlight
			--local threat = unitFrame.aggroHighlight
			local name = unitFrame.name
			local hp = unitFrame.healthBar
			--tab.overlay = overlay
			tab.threat = threat
			tab.name = name
			tab.hp = hp
			
			self.plates[frame] = tab
			self:Callback('NAME_PLATE_CREATED', frame, hp, threat, overlay, name)
		end
		
		self:RegisterEvent('NAME_PLATE_UNIT_ADDED')
		function self:NAME_PLATE_UNIT_ADDED(...)
			local namePlateUnitToken = ...
			local plate = C_NamePlate.GetNamePlateForUnit(namePlateUnitToken)
			self.plates[plate].isPlayer = UnitPlayerControlled(namePlateUnitToken)
			self.plates[plate].canAttack = UnitCanAttack('player', namePlateUnitToken)
			self:Callback('NAME_PLATE_UNIT_ADDED', plate, namePlateUnitToken)
		end
		
		self:RegisterEvent('NAME_PLATE_UNIT_REMOVED')
		function self:NAME_PLATE_UNIT_REMOVED(...)
			local namePlateUnitToken = ...
			local plate = C_NamePlate.GetNamePlateForUnit(namePlateUnitToken)
			self:Callback('NAME_PLATE_UNIT_REMOVED', plate, namePlateUnitToken)
		end

		self:CallOnce('VariablesLoaded')
		self:Callback('Toggle')
		self:UnregisterEvent('ADDON_LOADED')
		self:UnregisterEvent('VARIABLES_LOADED')
	end
end

-- these 3 events WoW uses to tell addons that certain variables are loaded
core:RegisterEvent('PLAYER_ENTERING_WORLD')
function core:PLAYER_ENTERING_WORLD()
	
	self.db = {}
	self.db.name = 'default'
	self.db.id = 'default'
	
	self:CallOnce('Initialize')

	self.defaults = self:CopyTable(self.db)

	function self:Reset()
		self.db = self:CopyTable(self.defaults)
	end


	self:LoadVariables()
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')
end

core:RegisterEvent('ADDON_LOADED')
function core:ADDON_LOADED(addon, ...)
	if addon == addonName then
		self:LoadVariables()
	end
end

core:RegisterEvent('VARIABLES_LOADED')
function core:VARIABLES_LOADED()
	self:LoadVariables()
end


-- save variables on logout
core:RegisterEvent('PLAYER_LOGOUT')
function core:PLAYER_LOGOUT()
	if JamPlatesAccessoriesDB then
		JamPlatesAccessoriesDB.spells = self.spells
		JamPlatesAccessoriesDB[JamPlatesAccessoriesCP] = self.db
	end
end

function JamPlatesAccessories_Toggle(toggle) --by eui.cc
	if toggle == 0 then
		toggle = false
	else
		toggle = true
	end

	core.db.aura.enabled = toggle
	core.db.tracker.enabled = toggle
	core.db.threat.enabled = toggle
--	core.db.cp.enabled = toggle
	core.db.combat.enabled = toggle
	core.db.resource.enabled = toggle

	core:CallbackKey('Toggle', 'aura')
	core:CallbackKey('Toggle', 'tracker')
--	core:CallbackKey('Toggle', 'cp')
	core:CallbackKey('Toggle', 'threat')
	core:CallbackKey('Toggle', 'combat')
	core:CallbackKey('Toggle', 'resource')
end

function JamPlatesAccessories_ToggleRes()
	core.db.resource.enabled = not core.db.resource.enabled
	core:CallbackKey('Toggle', 'resource')
end
