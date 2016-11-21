local addonName, at = ...
local core = at.core
local main = CreateFrame("Frame", "JamPlatesAccessoriesConfig")
main.name = "JamPlates Accessories"

	local Profile_OnChange = {}
	

	local SpellListUpdate
	
--optional
--[[
if IsAddOnLoaded('JamPlates') then
	main.parent = "JamPlates"
end

main.okay = function() end
main.cancel = function() end
main.refresh = function() end--]]
main.default = function()
	local guid = core.PLAYER_GUID
	
	core.db = core:CopyTable(core.defaults)
	core.db.name = UnitName('player')
	core.db.id = guid
	
	JamPlatesAccessoriesDB.spells = {}
	JamPlatesAccessoriesDB[guid] = core:CopyTable(core.db)
	JamPlatesAccessoriesCP = guid
	
	for x, v in pairs(Profile_OnChange) do
		v(x)
	end
end

hooksecurefunc('InterfaceOptionsFrame_OpenToCategory', function(name)
	if name == main.name then
		core:Callback('InterfaceOptionsFrame_OpenToCategory', core)
	end
end)

local tooltip = CreateFrame("GameTooltip", addonName .. "Tooltip", nil, "GameTooltipTemplate")

core:AddCallback('VariablesLoaded', 'options', function(self)
	local OptionsScrollFrame = CreateFrame('ScrollFrame', gsub(addonName, " ", "") .. 'OptionsScrollFrame', main, 'UIPanelScrollFrameTemplate')
	OptionsScrollFrame:SetPoint('TOPLEFT', main, 'TOPLEFT', 10, -32)
	OptionsScrollFrame:SetPoint('BOTTOMRIGHT', main, 'BOTTOMRIGHT', -30, 10)
	OptionsScrollFrame:SetClipsChildren(true)
	
	local OptionsScrollChild = CreateFrame('Frame', '$parentChild', OptionsScrollFrame)
	OptionsScrollChild:SetPoint('TOPLEFT', OptionsScrollFrame, 'TOPLEFT')
	OptionsScrollChild:SetSize(580, 750)
	OptionsScrollFrame:SetScrollChild(OptionsScrollChild)


	local Title = main:CreateFontString( nil, "ARTWORK", "GameFontNormalLarge" )
	Title:SetPoint( "TOP", 0, -10 )
	Title:SetText( addonName )

	local function Load_ProfileDropDown_OnSelect( self, id )
		core.db = core:CopyTable(JamPlatesAccessoriesDB[id])
		JamPlatesAccessoriesDB[id] = core:CopyTable(core.db)
		JamPlatesAccessoriesCP = id
		UIDropDownMenu_SetText(self.owner, core.db.name) 
		for x, v in pairs(Profile_OnChange) do
			v(x)
		end
	end
	local function Copy_ProfileDropDown_OnSelect( self, id )
		local name = core.db.name
		core.db = core:CopyTable(JamPlatesAccessoriesDB[id])
		core.db.name = name
		JamPlatesAccessoriesDB[JamPlatesAccessoriesCP] = core:CopyTable(core.db)
		for x, v in pairs(Profile_OnChange) do
			v(x)
		end
	end
	
	local GameTooltip = GameTooltip
	local function Frame_OnEnter(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		local tooltip = self.tooltip
		for x = 1, #tooltip do
			GameTooltip:AddLine(tooltip[x], 1, 1, 1)
		end
		GameTooltip:Show()
	end
	local function Frame_OnLeave(self)
		GameTooltip:Hide()
	end
	
	local prev
	local function CreateContainer( name, func )
		local Container = CreateFrame( "Frame", "$parent".. gsub(name, " ", ""), OptionsScrollChild, "OptionsBoxTemplate" )
		Container:SetPoint("LEFT", OptionsScrollChild, 10, 0)
		Container:SetPoint("RIGHT", OptionsScrollChild, -10, 0)
		if prev then
			Container:SetPoint("TOP", prev, "BOTTOM", 0, -8)
		else
			Container:SetPoint("TOP", OptionsScrollChild, "TOP", 0, -8)
		end
		
		local title = Container:CreateFontString( nil, "ARTWORK", "GameFontNormalLarge" )
		title:SetPoint( 'CENTER', Container, 'TOP', 0, 0 )
		title:SetText( name )
		
		local Background = Container:CreateTexture( nil, "BACKGROUND" )
		Background:SetTexture(0, 0, 0, 0.15)
		Background:SetPoint("TOPLEFT", 5, -5)
		Background:SetPoint("BOTTOMRIGHT", -5, 5)
		
		func( Container, name )
		
		prev = Container
		return Container
	end
	local function TextField_OnEnterPressed(self)
		local text = self:GetText()
		if text:len() > 0 then
			local num =  tonumber(text)
			if num then
				core.db[self.category][self.setting] = num
			end
		end
		self:ClearFocus()
	end
	local function TextField_OnEscapePressed(self)
		self:SetText(core.db[self.category][self.setting])
		self:ClearFocus()
	end
	local function TextField_OnMouseUp(self)
		self:SetFocus()
	end
	local function TextField_OnHide(self)
		self:ClearFocus()
	end
	local function CreateTextField(name, parent, category, setting, tooltip, width, height)
		local TextField = CreateFrame( 'EditBox', "$parent".. gsub(name, " ", ""), parent, 'InputBoxTemplate')
		TextField:SetAutoFocus(false)
		TextField:ClearFocus()
		TextField:SetSize(width, height)
		TextField:SetJustifyH('CENTER')
		
		TextField:Insert(core.db[category][setting])
		TextField:SetCursorPosition(0)
		TextField.category = category
		TextField.setting = setting
		
		if tooltip then
			TextField.tooltip = tooltip
			TextField:HookScript('OnEnter', Frame_OnEnter)
			TextField:HookScript('OnLeave', Frame_OnLeave)
		end
		
		TextField:HookScript('OnEnterPressed', TextField_OnEnterPressed)
		TextField:HookScript('OnEscapePressed', TextField_OnEscapePressed)
		TextField:HookScript('OnEditFocusLost', TextField_OnEscapePressed)
		TextField:HookScript('OnMouseUp', TextField_OnMouseUp)
		TextField:HookScript('OnHide', TextField_OnHide)
		
		local Label = parent:CreateFontString( nil, "ARTWORK", "GameFontNormal" )
		Label:SetText( name .. " : " )
		Label.Field = TextField
		
		Profile_OnChange[#Profile_OnChange +1] = function()
			TextField:SetText(self.db[category][setting])
			TextField:SetCursorPosition(0)
		end
		
		TextField:SetPoint('LEFT', Label, 'RIGHT', 11, 0)
		return Label
	end
	local function Slider_OnValueChanged(self, num)
		core.db[self.category][self.setting] = num
		self.text:SetText( num )
		JamPlatesAccessoriesDB[JamPlatesAccessoriesCP][self.category][self.setting] = num
	end
	local function CreateSlider(name, parent, category, setting, tooltip, width, height)
		local Slider = CreateFrame( "Slider", "$parent".. gsub(name, " ", ""), parent, "OptionsSliderTemplate" );
		Slider:SetMinMaxValues( 0, 2 )
		Slider:SetValue( core.db[category][setting] )
		Slider:HookScript( "OnValueChanged", Slider_OnValueChanged )
		local Text = _G[ Slider:GetName().."Text" ]
		Text:ClearAllPoints();
		Text:SetPoint( "TOP", Slider, "BOTTOM", 0, 0 )
		Text:SetText( core.db[category][setting] )
		Slider.text = Text
		Slider.category = category
		Slider.setting = setting
		
		if tooltip then
			Slider.tooltip = tooltip
			Slider:HookScript('OnEnter', Frame_OnEnter)
			Slider:HookScript('OnLeave', Frame_OnLeave)
		end
		
		local Label = parent:CreateFontString( nil, "ARTWORK", "GameFontNormal" )
		Label:SetText( name .. " : " )
		Label.Slider = Slider
		
		Profile_OnChange[#Profile_OnChange +1] = function()
			Slider:SetValue( core.db[Slider.category][Slider.setting] )
			Text:SetText( core.db[Slider.category][Slider.setting] )
		end
		
		Slider:SetPoint('LEFT', Label, 'RIGHT', 11, 0)
		Slider:SetPoint('RIGHT', parent, 'RIGHT', -11, 0)
		return Label
	end
	local function CheckButton_OnClick(self)
		local enabled = self:GetChecked()
		core.db[self.category][self.setting] = enabled
		JamPlatesAccessoriesDB[JamPlatesAccessoriesCP][self.category][self.setting] = enabled
		PlaySound( enabled and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff" )
	end
	local function CreateCheckButton(name, parent, category, setting, tooltip)
		local Enabled = CreateFrame( "CheckButton", "$parent".. gsub(name, " ", ""), parent, "UICheckButtonTemplate" )
		Enabled:SetSize( 26, 26 )
		Enabled:SetChecked(core.db[category][setting])
		Enabled:SetScript( "OnClick", CheckButton_OnClick )
		Enabled.category = category
		Enabled.setting = setting
		
		if tooltip then
			Enabled.tooltip = tooltip
			Enabled:HookScript('OnEnter', Frame_OnEnter)
			Enabled:HookScript('OnLeave', Frame_OnLeave)
		end
		
		local Label = _G[ Enabled:GetName().."Text" ]
		Label:SetText( name )
		Label.button = Enabled
		Enabled.label = Label
		Enabled:SetHitRectInsets( 4, 4 - Label:GetStringWidth(), 4, 4 )
		
		Profile_OnChange[#Profile_OnChange +1] = function()
			Enabled:SetChecked(core.db[Enabled.category][Enabled.setting])
		end
		
		return Enabled
	end
	local anchors = {
		'CENTER',
		'TOP',
		'BOTTOM',
		'LEFT',
		'RIGHT',
		'TOPLEFT',
		'TOPRIGHT',
		'BOTTOMLEFT',
		'BOTTOMRIGHT',
	}
	local function DropDown_OnSelect( self, item )
		core.db[self.owner.category][self.owner.setting] = item
		Lib_UIDropDownMenu_SetText(self.owner, item)
		JamPlatesAccessoriesDB[JamPlatesAccessoriesCP][self.owner.category][self.owner.setting] = item
	end
	
	local function DropDown_Initialize(self)
		local Info = Lib_UIDropDownMenu_CreateInfo()
		Info.func = DropDown_OnSelect
		for _, anchor in ipairs( anchors ) do
			Info.text, Info.checked = anchor, anchor == core.db[self.category][self.setting];
			Info.arg1 = anchor
			Info.owner = self
			Lib_UIDropDownMenu_AddButton( Info )
		end
		Lib_UIDropDownMenu_SetText(self, core.db[self.category][self.setting]) 
	end
	local function Load_ProfileDropDown_Initialize(self)
		local Info = Lib_UIDropDownMenu_CreateInfo()
		Info.func = Load_ProfileDropDown_OnSelect
		for id, tab in pairs( JamPlatesAccessoriesDB ) do
			if id ~= 'spells' then
				Info.text, Info.checked = tab.name, tab.name == core.db.name;
				Info.arg1 = id
				Info.owner = self
				Lib_UIDropDownMenu_AddButton( Info )
			end
		end
		Lib_UIDropDownMenu_SetText(self, core.db.name) 
	end
	local function Copy_ProfileDropDown_Initialize(self)
		local Info = Lib_UIDropDownMenu_CreateInfo()
		Info.func = Copy_ProfileDropDown_OnSelect
		for id, tab in pairs( JamPlatesAccessoriesDB ) do
			if id ~= 'spells' then
				--Info.text, Info.checked = tab.name, tab.name == at.db.name;
				Info.text = tab.name
				Info.notCheckable = false
				Info.arg1 = id
				Info.owner = self
				Lib_UIDropDownMenu_AddButton( Info )
			end
		end
		Lib_UIDropDownMenu_SetText(self, '') 
	end
	local function CreateDropDownMenu(name, parent, category, setting, tooltip, width, height)
		local ddm = CreateFrame( "Frame", "$parent".. gsub(name, " ", ""), parent, "Lib_UIDropDownMenuTemplate" )
		ddm.OnSelect = {}
		ddm:SetSize(width, height)
		Lib_UIDropDownMenu_JustifyText( ddm, "LEFT" )
		Lib_UIDropDownMenu_SetAnchor( ddm, 0, 0, "TOPRIGHT", ddm, "BOTTOMRIGHT" )
		if setting == 'load profile' then
			Lib_UIDropDownMenu_Initialize(ddm, Load_ProfileDropDown_Initialize)
			
		elseif setting == 'copy profile' then
			Lib_UIDropDownMenu_Initialize(ddm, Copy_ProfileDropDown_Initialize)
			
		else
			ddm.category = category
			ddm.setting = setting
			Lib_UIDropDownMenu_Initialize(ddm, DropDown_Initialize)
		
			Profile_OnChange[#Profile_OnChange +1] = function()
				Lib_UIDropDownMenu_Refresh(ddm, false,1)
				Lib_UIDropDownMenu_SetText(ddm, core.db[category][setting]) 
			end
			
		end
		
		if tooltip then
			ddm.tooltip = tooltip
			ddm:HookScript('OnEnter', Frame_OnEnter)
			ddm:HookScript('OnLeave', Frame_OnLeave)
		end
		
		_G[ ddm:GetName().."Middle" ]:SetPoint( "RIGHT", -16, 0 );
		
		local Label = ddm:CreateFontString( nil, "ARTWORK", "GameFontNormal" )
		Label:SetText(  name .. " : " )
		Label.DropDown = ddm
		
		ddm:SetPoint('TOPLEFT', Label, 'TOPRIGHT', 11, 6)
		return Label
	end
	
	local function GetTableReference(type)
		if type == 'spells' then
			return core.spells
		else
			return core.db[type].filter
		end
	end
	
	
	local function CreateSampleButton(parent, prefix)
		local sampleFrame = CreateFrame('Button', '$parent' .. prefix, parent, 'UIPanelButtonTemplate')
		sampleFrame:SetSize( 32, 32 )
		sampleFrame:Disable()
		sampleFrame.defaultDisabledTexture = sampleFrame:GetDisabledTexture()
		sampleFrame.info = {}
		function sampleFrame:Clear()
			self:SetDisabledTexture(self.defaultDisabledTexture)
			self:SetText('')
			self.info = nil
		end
		sampleFrame:SetMotionScriptsWhileDisabled(true)
		
		sampleFrame:HookScript('OnEnter', function(self)
			if self.info then
				GameTooltip:SetOwner(self, 'ANCHOR_CURSOR')
				GameTooltip:SetSpellByID(self.info.id)
				GameTooltip:Show()
			end
		end)
		sampleFrame:HookScript('OnLeave', function(self)
			GameTooltip:Hide()
		end)
		return sampleFrame
	end
	
	local function CreateRemoveButton(parent, prefix, type)
		local removeButton = CreateFrame('Button', '$parent' .. prefix, parent, 'UIPanelButtonTemplate')
		--removeButton:SetPoint('TOPLEFT', scrollFrame, 'TOPRIGHT', 33, 0)
		removeButton:SetSize( 90, 32 )
		removeButton:SetText( at.L['Remove'] )
		removeButton:Disable()
		removeButton:HookScript('OnClick', function(self)
			core.db[type].filter[parent.selected.id] = nil
			JamPlatesAccessoriesDB[JamPlatesAccessoriesCP][type].filter = core:CopyTable(core.db[type].filter)
			parent.highlight:Hide()
			parent.selected = nil
			parent:Update()
			self:Disable()
		end)
		removeButton:HookScript('OnHide', function(self)
			--parent:Clear()
			self:Disable()
		end)
		parent.OnClickCallback[#parent.OnClickCallback +1] = function(self)
			if parent.selected then
				removeButton:Enable()
			end
		end
		return removeButton
	end
	
	local function CreateSpellIDEditBox(parent, prefix, sampleFrame, type)
		local SpellID_TextField = CreateFrame( 'EditBox', "$parent" .. prefix, parent, 'InputBoxTemplate')
		SpellID_TextField:SetAutoFocus(false)
		SpellID_TextField:ClearFocus()
		SpellID_TextField:SetSize(100, 32)
		SpellID_TextField:SetJustifyH('CENTER')
		local function CleanUpSample(self)
			sampleFrame:Clear()
			self:SetText('')
			self:ClearFocus()
		end
		
		SpellID_TextField:HookScript('OnEnter', function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:AddLine(at.L["Only accepts a spell ID value."], 1, 1, 1)
			GameTooltip:AddLine(at.L["Literally numbers only."], 1, 0, 0)
			GameTooltip:Show()
		end)
		SpellID_TextField:HookScript('OnLeave', function(self)
			GameTooltip:Hide()
		end)
		
		SpellID_TextField:HookScript('OnEnterPressed', function(self)
			local num = tonumber(self:GetText())
			if num and sampleFrame.info and not core.db[type].filter[num] then
				core.db[type].filter[num] = sampleFrame.info
				parent:Update()
				JamPlatesAccessoriesDB[JamPlatesAccessoriesCP][type].filter[num] = sampleFrame.info
			end
			CleanUpSample(self)
		end)
		SpellID_TextField:HookScript('OnMouseUp', function(self)
			self:SetText('')
			self:SetFocus()
		end)
		SpellID_TextField:HookScript('OnEscapePressed', CleanUpSample)
		SpellID_TextField:HookScript('OnEditFocusLost', CleanUpSample)
		SpellID_TextField:HookScript('OnHide', CleanUpSample)
		SpellID_TextField:HookScript('OnTextChanged', function(self, text)
			if not text then return end
			text = self:GetText()
			local num = tonumber(text)
			if num then
				local id = tonumber(self:GetText())
				local link = GetSpellLink(id)
				if link then
					local name, _, icon = GetSpellInfo(id)
					sampleFrame:SetDisabledTexture(icon)
					sampleFrame:SetText(link)
					sampleFrame.info = {
						name = name,
						icon = icon,
						id = id,
						link = link,
					}
				else
					sampleFrame:Clear()
				end
			else
				local pat
				if text:find('%a') then
					pat = '%a'
				elseif text:find('%c') then
					pat = '%c'
				elseif text:find('%p') then
					pat = '%p'
				elseif text:find('%s') then
					pat = '%s'
				end
				text = self:GetText()
				self:SetText(gsub(text, pat, ''))
			end
		end)
		return SpellID_TextField
	end
	
	
	local function CreateList(name, parent, type, width, rows)
		local scrollFrame = CreateFrame('ScrollFrame', '$parent' .. name, parent, 'MinimalScrollFrameTemplate')
		scrollFrame:SetWidth(width)
		scrollFrame.ScrollBar:SetValueStep(1)
		scrollFrame.ScrollBar:SetObeyStepOnDrag(true)
		
		scrollFrame.OnClickCallback = {}
		
		local highlight = CreateFrame('Frame', nil, scrollFrame)
		local texture = highlight:CreateTexture()
		texture:SetTexture('Interface\\BUTTONS\\WHITE8x8')
		texture:SetVertexColor(0.0, 1, 1, 0.5)
		texture:SetAllPoints(highlight)
		scrollFrame.highlight = highlight
		
		local function ListItem_OnClick(self)
			if self.id ~= nil then
				scrollFrame.selected = self
				highlight:ClearAllPoints()
				highlight:SetPoint('TOPLEFT', self, 'TOPLEFT')
				highlight:SetPoint('BOTTOMLEFT', self, 'BOTTOMLEFT')
				highlight:SetWidth(self:GetParent():GetWidth())
				for x = 1, #scrollFrame.OnClickCallback do
					scrollFrame.OnClickCallback[x](self)
				end
			end
		end
		
		
		local buttons = {}
		local prev
		local NUM_ROWS = rows or 11
		for x = 1, NUM_ROWS do
			local frame = CreateFrame('Button', '$parentButton' .. x, scrollFrame)
			frame:SetSize(16, 16)
			frame:SetEnabled(false)
			frame:SetHitRectInsets(0, 16 - scrollFrame:GetWidth(), 0, 0)
			frame:ClearAllPoints()
			if x == 1 then
				frame:SetPoint('TOPLEFT', scrollFrame, 'TOPLEFT', 8)
			else
				frame:SetPoint('TOPLEFT', prev, 'BOTTOMLEFT')
			end
			frame:HookScript('OnClick', ListItem_OnClick)
			
			frame:HookScript('OnEnter', function(self)
				if self.id then
					GameTooltip:SetOwner(frame, 'ANCHOR_LEFT')
					GameTooltip:SetSpellByID(self.id)
					GameTooltip:Show()
				end
			end)
			frame:HookScript('OnLeave', function(self)
				GameTooltip:Hide()
			end)
			
			local fs = frame:CreateFontString(nil, nil, "GameFontHighlightLeft")
			fs:SetPoint('LEFT', frame, 'RIGHT')
			frame.fs = fs
			frame:SetFontString(fs)
			buttons[x] = frame
			prev = frame
		end
		
		local function ScrollFrame_Update(self, value)
			value = value or scrollFrame.ScrollBar:GetValue()
			if not value or value < 1 then
				value = 1
			end
			local offsetMax = value + NUM_ROWS
			local count = 0
			for id, v in pairs(GetTableReference(type)) do
				count = count +1
				if count >= offsetMax then
					break
				elseif count >= value and count < offsetMax then -- and count - value < NUM_ROWS then
					--local name, _, icon = GetSpellInfo(id)
					local link = GetSpellLink(id)
					local button = buttons[count - value +1]
					button.fs:SetText(link .. '  ID: ' .. id)
					button.name = v.name
					button.icon = v.icon
					button.id = id
					button.link = link
					button:SetNormalTexture(v.icon)
					button:SetEnabled(true)
				end
			end
			for x = count +1, NUM_ROWS do
				local button = buttons[x]
				button.fs:SetText('')
				button.name = nil
				button.icon = nil
				button.id = nil
				button.link = nil
				button:SetNormalTexture(nil)
				button:SetEnabled(false)
			end
		end
		scrollFrame.Update = ScrollFrame_Update

		core:AddCallback('InterfaceOptionsFrame_OpenToCategory', nil, function(self)
			local num = self:GetN(GetTableReference(type))
			if num > NUM_ROWS then
				scrollFrame.ScrollBar:SetMinMaxValues(1, num - NUM_ROWS)
			end
			ScrollFrame_Update(scrollFrame.ScrollBar, scrollFrame.ScrollBar:GetValue())
		end)
		scrollFrame.ScrollBar:HookScript("OnValueChanged", ScrollFrame_Update)
		return scrollFrame
	end

	
	local totalHeight = 0
	CreateContainer(at.L['Features'], function(self)
		local function ToggleFeature(self)
			core:CallbackKey('Toggle', self.key)
		end
		
		local EnableDefaultAuras = CreateCheckButton(at.L['Enable Default Auras'], self, 'aura', 'defaultEnabled', {at.L["Display default auras."], at.L["Disables addon auras."]}, 100, 8)
		EnableDefaultAuras:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -16)
		EnableDefaultAuras.key = 'aura'
		EnableDefaultAuras:HookScript('OnClick', ToggleFeature)
		
		--local EnableDefaultTimers = CreateCheckButton(at.L['Enable Default Aura Timers'], self, 'aura', 'defaultTimers', {at.L["Display default aura timers."]}, 100, 8)
		--EnableDefaultTimers:SetPoint('LEFT', EnableDefaultAuras.label, 'RIGHT', 10, 0)
		--EnableDefaultTimers.key = 'aura'
		--EnableDefaultTimers:HookScript('OnClick', ToggleFeature)
		
		local EnableAuras = CreateCheckButton(at.L['Enable Auras'], self, 'aura', 'enabled', {at.L["Display auras."]}, 100, 8)
		EnableAuras:SetPoint('TOPLEFT', EnableDefaultAuras, 'BOTTOMLEFT', 0, -12)
		EnableAuras.key = 'aura'
		EnableAuras:HookScript('OnClick', ToggleFeature)
		--[[
		local mine = false
		EnableDefaultAuras:HookScript('OnClick', function(self)
			if not mine then
				mine = true
				EnableAuras:Click()
				mine = false
			end
		end)
		EnableAuras:HookScript('OnClick', function(self)
			if not mine then
				mine = true
				EnableDefaultAuras:Click()
				mine = false
			end
		end)--]]
		
		
		local EnableTrack = CreateCheckButton(at.L['Enable Aura Watch'], self, 'tracker', 'enabled', {at.L["Enable aura tracking, seperating specified auras from the default display."], at.L["These ignore the inverted setting."]}, 100, 8)
		EnableTrack:SetPoint('TOPLEFT', EnableAuras, 'BOTTOMLEFT', 0, -12)
		EnableTrack.key = 'tracker'
		EnableTrack:HookScript('OnClick', ToggleFeature)
		
		local EnableThreat = CreateCheckButton(at.L['Enable Threat'], self, 'threat', 'enabled', {at.L["Display threat eye indicator."]}, 100, 8)
		EnableThreat:SetPoint('TOPLEFT', EnableTrack, 'BOTTOMLEFT', 0, -12)
		EnableThreat.key = 'threat'
		EnableThreat:HookScript('OnClick', ToggleFeature)
		
		local EnableCombat = CreateCheckButton(at.L['Enable Combat'], self, 'combat', 'enabled', {at.L["Display combat indicator."]}, 100, 8)
		EnableCombat:SetPoint('LEFT', EnableThreat.label, 'RIGHT', 12, 0)
		EnableCombat.key = 'combat'
		EnableCombat:HookScript('OnClick', ToggleFeature)
		
		local EnableResource = CreateCheckButton(at.L['Enable Resource'], self, 'resource', 'enabled', {at.L["Display combat indicator."]}, 100, 8)
		EnableResource:SetPoint('LEFT', EnableCombat.label, 'RIGHT', 12, 0)
		EnableResource.key = 'resource'
		EnableResource:HookScript('OnClick', ToggleFeature)
		
		self:SetHeight(180)
		totalHeight = totalHeight + 180
	end)
	
	local anchorTip = {at.L["The anchor point on the nameplate."]}
	local relativeTip = {at.L["The point ralative to the anchor."]}
	local xTip = {at.L["Distance left/right from the anchor the relative point goes."]}
	local yTip = {at.L["Distance up/down from the anchor the relative point goes."]}
	local L_Anchor = at.L["Anchor"]
	local L_Relative = at.L["Relative"]
	
	CreateContainer(at.L['Aura'], function(self)
		local ShowPlayerBuffs = CreateCheckButton(at.L['Show player buffs'], self, 'aura', 'showPlayerBuff', {at.L["Show player buffs."]})
		ShowPlayerBuffs:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -10)
		local ShowPlayerDebuffs = CreateCheckButton(at.L['Show player debuffs'], self, 'aura', 'showPlayerDebuff', {at.L["Show player debuffs."]})
		ShowPlayerDebuffs:SetPoint('LEFT', ShowPlayerBuffs.label, 'RIGHT', 14, 0)
		
		local ShowPetBuffs = CreateCheckButton(at.L['Show pet buffs'], self, 'aura', 'showPetBuff', {at.L["Show pet buffs."]})
		ShowPetBuffs:SetPoint('TOPLEFT', ShowPlayerBuffs, 'BOTTOMLEFT', 0, -4)
		local ShowPetDebuffs = CreateCheckButton(at.L['Show pet debuffs'], self, 'aura', 'showPetDebuff', {at.L["Show pet debuffs."]})
		ShowPetDebuffs:SetPoint('LEFT', ShowPetBuffs.label, 'RIGHT', 14, 0)
		
		local ShowFriendlyBuffs = CreateCheckButton(at.L['Show friendly buffs'], self, 'aura', 'showFriendlyBuff', {at.L["Show friendly buffs."]})
		ShowFriendlyBuffs:SetPoint('TOPLEFT', ShowPetBuffs, 'BOTTOMLEFT', 0, -4)
		local ShowFriendlyDebuffs = CreateCheckButton(at.L['Show friendly debuffs'], self, 'aura', 'showFriendlyDebuff', {at.L["Show friendly debuffs."]})
		ShowFriendlyDebuffs:SetPoint('LEFT', ShowFriendlyBuffs.label, 'RIGHT', 14, 0)
		
		local ShowHostileBuffs = CreateCheckButton(at.L['Show hostile buffs'], self, 'aura', 'showHostileBuff', {at.L["Show hostile buffs."]})
		ShowHostileBuffs:SetPoint('TOPLEFT', ShowFriendlyBuffs, 'BOTTOMLEFT', 0, -4)
		local ShowHostileDebuffs = CreateCheckButton(at.L['Show hostile debuffs'], self, 'aura', 'showHostileDebuff', {at.L["Show hostile debuffs."]})
		ShowHostileDebuffs:SetPoint('LEFT', ShowHostileBuffs.label, 'RIGHT', 14, 0)
				
		
		local EnableTimer = CreateCheckButton(at.L['Enable timer'], self, 'aura', 'showTime', {at.L["Enable the addons aura timers."]})
		EnableTimer:SetPoint('TOPLEFT', ShowHostileBuffs, 'BOTTOMLEFT', 0, -8)
		
		local EnableDefaultTimer = CreateCheckButton(at.L['Enable default timer'], self, 'aura', 'showDefaultTime', {at.L["Enable the default aura timers."], at.L["You will have to enable the option for actionbar cooldown timers in your Interface Options."]})
		EnableDefaultTimer:SetPoint('LEFT', EnableTimer.label, 'RIGHT', 14, 0)
				
		
		local ChangeGrowth = CreateCheckButton(at.L['Reverse Row Growth'], self, 'aura', 'growth', {at.L["Grow auras down instead of up."]})
		ChangeGrowth:SetPoint('TOPLEFT', EnableTimer, 'BOTTOMLEFT', 0, -8)
		
		local ChangeDirection = CreateCheckButton(at.L['Reverse Column Direction'], self, 'aura', 'direction', {at.L["Grow auras left instead of right."]})
		ChangeDirection:SetPoint('LEFT', ChangeGrowth.label, 'RIGHT', 14, 0)
		
		local PerRow = CreateTextField(at.L['Auras Per Row'], self, 'aura', 'BPR', {at.L["The number of auras per row."]}, 100, 8)
		PerRow:SetPoint('TOPLEFT', ChangeGrowth, 'BOTTOMLEFT', 0, -4)
		
		local ShowBorder = CreateCheckButton(at.L['Show Aura Borders'], self, 'aura', 'ShowBorder', {at.L["Display aura type borders."]})
		ShowBorder:SetPoint('LEFT', PerRow, 'RIGHT', 130, 0)
		
		local Anchor = CreateDropDownMenu(at.L['Anchor'], self, 'aura', 'anchor', anchorTip, 180, 8)
		Anchor:SetPoint('TOPLEFT', PerRow, 'BOTTOMLEFT', 0, -16)
		
		local FrameAnchor = CreateDropDownMenu(at.L['Relative'], self, 'aura', 'relative', relativeTip, 180, 8)
		FrameAnchor:SetPoint('TOPLEFT', Anchor, 'TOPLEFT', 0, -32)
		
		local StartX = CreateTextField('X', self, 'aura', 'x', xTip, 100, 8)
		StartX:SetPoint('TOPLEFT', FrameAnchor, 'TOPLEFT', 0, -32)
		
		local StartY = CreateTextField('Y', self, 'aura', 'y', yTip, 100, 8)
		StartY:SetPoint('LEFT', StartX, 'RIGHT', 136, 0)
		

		local Width = CreateTextField(at.L['Aura Width'], self, 'aura', 'width', {at.L["The aura width."]}, 100, 8)
		Width:SetPoint('TOPLEFT', StartX, 'BOTTOMLEFT', 0, -22)

		local Height = CreateTextField(at.L['Aura Height'], self, 'aura', 'height', {at.L["The aura height."]}, 100, 8)
		Height:SetPoint('LEFT', Width, 'RIGHT', 136, 0)

		local Scale = CreateSlider(at.L['Aura Scale'], self, 'aura', 'scale', {at.L["The aura scale."]})
		Scale:SetPoint('TOPLEFT', Width, 'BOTTOMLEFT', 0, -22)
		
		
		self:SetHeight(380)
		totalHeight = totalHeight + 380
	end)
	
	CreateContainer(at.L['Aura Watch'], function(self) -- I'd have called it Aura Watcher but that sounds lame...
		local ShowPlayerBuffs = CreateCheckButton(at.L['Show player buffs'], self, 'tracker', 'showPlayerBuff', {at.L["Show player buffs."]})
		ShowPlayerBuffs:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -10)
		local ShowPlayerDebuffs = CreateCheckButton(at.L['Show player debuffs'], self, 'tracker', 'showPlayerDebuff', {at.L["Show player debuffs."]})
		ShowPlayerDebuffs:SetPoint('LEFT', ShowPlayerBuffs.label, 'RIGHT', 14, 0)
		
		local ShowPetBuffs = CreateCheckButton(at.L['Show pet buffs'], self, 'tracker', 'showPetBuff', {at.L["Show pet buffs."]})
		ShowPetBuffs:SetPoint('TOPLEFT', ShowPlayerBuffs, 'BOTTOMLEFT', 0, -4)
		local ShowPetDebuffs = CreateCheckButton(at.L['Show pet debuffs'], self, 'tracker', 'showPetDebuff', {at.L["Show pet debuffs."]})
		ShowPetDebuffs:SetPoint('LEFT', ShowPetBuffs.label, 'RIGHT', 14, 0)
		
		local ShowFriendlyBuffs = CreateCheckButton(at.L['Show friendly buffs'], self, 'tracker', 'showFriendlyBuff', {at.L["Show friendly buffs."]})
		ShowFriendlyBuffs:SetPoint('TOPLEFT', ShowPetBuffs, 'BOTTOMLEFT', 0, -4)
		local ShowFriendlyDebuffs = CreateCheckButton(at.L['Show friendly debuffs'], self, 'tracker', 'showFriendlyDebuff', {at.L["Show friendly debuffs."]})
		ShowFriendlyDebuffs:SetPoint('LEFT', ShowFriendlyBuffs.label, 'RIGHT', 14, 0)
		
		local ShowHostileBuffs = CreateCheckButton(at.L['Show hostile buffs'], self, 'tracker', 'showHostileBuff', {at.L["Show hostile buffs."]})
		ShowHostileBuffs:SetPoint('TOPLEFT', ShowFriendlyBuffs, 'BOTTOMLEFT', 0, -4)
		local ShowHostileDebuffs = CreateCheckButton(at.L['Show hostile debuffs'], self, 'tracker', 'showHostileDebuff', {at.L["Show hostile debuffs."]})
		ShowHostileDebuffs:SetPoint('LEFT', ShowHostileBuffs.label, 'RIGHT', 14, 0)
				
		
		local EnableTimer = CreateCheckButton(at.L['Enable timer'], self, 'tracker', 'showTime', {at.L["Enable the addons aura timers."]})
		EnableTimer:SetPoint('TOPLEFT', ShowHostileBuffs, 'BOTTOMLEFT', 0, -8)
		
		local EnableDefaultTimer = CreateCheckButton(at.L['Enable default timer'], self, 'tracker', 'direction', {at.L["Enable the default aura timers."], at.L["You will have to enable the option for actionbar cooldown timers in your Interface Options."]})
		EnableDefaultTimer:SetPoint('LEFT', EnableTimer.label, 'RIGHT', 14, 0)
		
		
		local ChangeGrowth = CreateCheckButton(at.L['Reverse Row Growth'], self, 'tracker', 'growth', {at.L["Grow auras down instead of up."]})
		ChangeGrowth:SetPoint('TOPLEFT', EnableTimer, 'BOTTOMLEFT', 0, -4)
		
		local ChangeDirection = CreateCheckButton(at.L['Reverse Column Direction'], self, 'tracker', 'direction', {at.L["Grow auras left instead of right."]})
		ChangeDirection:SetPoint('LEFT', ChangeGrowth.label, 'RIGHT', 14, 0)
	
		local PerRow = CreateTextField(at.L['Auras Per Row'], self, 'tracker', 'BPR', {at.L["The number of auras per row."]}, 100, 8)
		PerRow:SetPoint('TOPLEFT', ChangeGrowth, 'BOTTOMLEFT', 0, -16)
		
		local ShowBorder = CreateCheckButton(at.L['Show Aura Borders'], self, 'tracker', 'ShowBorder', {at.L["Display aura type borders."]})
		ShowBorder:SetPoint('LEFT', PerRow, 'RIGHT', 130, 0)
		
		local Anchor = CreateDropDownMenu(at.L['Anchor'], self, 'tracker', 'anchor', anchorTip, 180, 8)
		Anchor:SetPoint('TOPLEFT', PerRow, 'BOTTOMLEFT', 0, -16)
		
		local FrameAnchor = CreateDropDownMenu(at.L['Relative'], self, 'tracker', 'relative', relativeTip, 180, 8)
		FrameAnchor:SetPoint('TOPLEFT', Anchor, 'TOPLEFT', 0, -32)
		
		local StartX = CreateTextField('X', self, 'tracker', 'x', xTip, 100, 8)
		StartX:SetPoint('TOPLEFT', FrameAnchor, 'TOPLEFT', 0, -32)
		
		local StartY = CreateTextField('Y', self, 'tracker', 'y', yTip, 100, 8)
		StartY:SetPoint('LEFT', StartX, 'RIGHT', 136, 0)
		

		local Width = CreateTextField(at.L['Aura Width'], self, 'tracker', 'width', {at.L["The aura width."]}, 100, 8)
		Width:SetPoint('TOPLEFT', StartX, 'BOTTOMLEFT', 0, -22)

		local Height = CreateTextField(at.L['Aura Height'], self, 'tracker', 'height', {at.L["The aura height."]}, 100, 8)
		Height:SetPoint('LEFT', Width, 'RIGHT', 136, 0)

		local Scale = CreateSlider(at.L['Aura Scale'], self, 'tracker', 'scale', {at.L["The aura scale."]})
		Scale:SetPoint('TOPLEFT', Width, 'BOTTOMLEFT', 0, -22)
		
		
		self:SetHeight(380)
		totalHeight = totalHeight + 380
	end)
	
	CreateContainer(at.L['Threat'], function(self)
		local Anchor = CreateDropDownMenu(at.L['Anchor'], self, 'threat', 'anchor', anchorTip, 180, 8)
		Anchor:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -16)
		
		local FrameAnchor = CreateDropDownMenu(at.L['Relative'], self, 'threat', 'relative', relativeTip, 180, 8)
		FrameAnchor:SetPoint('TOPLEFT', Anchor, 'TOPLEFT', 0, -32)
		
		local StartX = CreateTextField('X', self, 'threat', 'x', xTip, 100, 8)
		StartX:SetPoint('TOPLEFT', FrameAnchor, 'TOPLEFT', 0, -32)
		
		local StartY = CreateTextField('Y', self, 'threat', 'y', yTip, 100, 8)
		StartY:SetPoint('LEFT', StartX, 'RIGHT', 136, 0)
		

		local Width = CreateTextField(at.L['Threat Width'], self, 'threat', 'width', {at.L["The eye width."]}, 100, 8)
		Width:SetPoint('TOPLEFT', StartX, 'BOTTOMLEFT', 0, -22)

		local Height = CreateTextField(at.L['Threat Height'], self, 'threat', 'height', {at.L["The eye height."]}, 100, 8)
		Height:SetPoint('LEFT', Width, 'RIGHT', 136, 0)

		local Scale = CreateSlider(at.L['Threat Scale'], self, 'threat', 'scale', {at.L["The eye scale."]})
		Scale:SetPoint('TOPLEFT', Width, 'BOTTOMLEFT', 0, -22)
		
		
		self:SetHeight(200)
		totalHeight = totalHeight + 200
	end)
	
	CreateContainer(at.L['Combat'], function(self)
		local Anchor = CreateDropDownMenu(at.L['Anchor'], self, 'combat', 'anchor', anchorTip, 180, 8)
		Anchor:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -16)
		
		local FrameAnchor = CreateDropDownMenu(at.L['Relative'], self, 'combat', 'relative', relativeTip, 180, 8)
		FrameAnchor:SetPoint('TOPLEFT', Anchor, 'TOPLEFT', 0, -32)
		
		local StartX = CreateTextField('X', self, 'combat', 'x', xTip, 100, 8)
		StartX:SetPoint('TOPLEFT', FrameAnchor, 'TOPLEFT', 0, -32)
		
		local StartY = CreateTextField('Y', self, 'combat', 'y', yTip, 100, 8)
		StartY:SetPoint('LEFT', StartX, 'RIGHT', 136, 0)
		

		local Width = CreateTextField(at.L['Combat Indicator Width'], self, 'combat', 'width', {at.L["The indicator width."]}, 100, 8)
		Width:SetPoint('TOPLEFT', StartX, 'BOTTOMLEFT', 0, -22)

		local Height = CreateTextField(at.L['Combat Indicator Height'], self, 'combat', 'height', {at.L["The indicator height."]}, 100, 8)
		Height:SetPoint('TOPLEFT', Width, 'BOTTOMLEFT', 0, -22)

		local Scale = CreateSlider(at.L['Combat Indicator Scale'], self, 'combat', 'scale', {at.L["The indicator scale."]})
		Scale:SetPoint('TOPLEFT', Height, 'BOTTOMLEFT', 0, -22)
		
		
		self:SetHeight(220)
		totalHeight = totalHeight + 220
	end)
	
	CreateContainer(at.L['Resource'], function(self)
		local Anchor = CreateDropDownMenu(at.L['Anchor'], self, 'resource', 'anchor', anchorTip, 180, 8)
		Anchor:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -16)
		
		local FrameAnchor = CreateDropDownMenu(at.L['Relative'], self, 'resource', 'relative', relativeTip, 180, 8)
		FrameAnchor:SetPoint('TOPLEFT', Anchor, 'TOPLEFT', 0, -32)
		
		local StartX = CreateTextField('X', self, 'resource', 'x', xTip, 100, 8)
		StartX:SetPoint('TOPLEFT', FrameAnchor, 'TOPLEFT', 0, -32)
		
		local StartY = CreateTextField('Y', self, 'resource', 'y', yTip, 100, 8)
		StartY:SetPoint('LEFT', StartX, 'RIGHT', 136, 0)
		
		
		self:SetHeight(120)
		totalHeight = totalHeight + 120
	end)
	
	
	CreateContainer(at.L['Profiles'], function(self)
		local ProfileDropDown = CreateDropDownMenu(at.L['Load Profile'], self, 'aura', 'load profile', {at.L["Load a profile from another character."], at.L["Default is not default settings, they are user defined defaults to be used by multiple characters."]}, 180, 8)
		ProfileDropDown:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -16)
		
		local CopyProfileDropDown = CreateDropDownMenu(at.L['Copy Profile'], self, 'aura', 'copy profile', {at.L["Copy a profile from another character."]}, 180, 8)
		CopyProfileDropDown:SetPoint('TOPLEFT', ProfileDropDown, 'BOTTOMLEFT', 0, -16)
		
		self:SetHeight(90)
		totalHeight = totalHeight + 90
	end)
	
	local auraList
	CreateContainer(at.L['Aura List'], function(self)
		
		local scrollFrame = CreateList("AuraScrollList", self, 'spells', 300)
		scrollFrame:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -10)
		scrollFrame:SetPoint('BOTTOMLEFT', self, 'BOTTOMLEFT', 10, 10)
		auraList = scrollFrame
		
		local prev
		function scrollFrame:CreateAddButton(parent, prefix, text, type)
			local addButton = CreateFrame('Button', '$parent' .. prefix, scrollFrame, 'UIPanelButtonTemplate')
			addButton:SetSize( 90, 32 )
			addButton:SetText( text )
			addButton:Disable()
			if not prev then
				addButton:SetPoint('LEFT', scrollFrame, 'RIGHT', 33, 0)
			else
				addButton:SetPoint('TOP', prev, 'BOTTOM', 0, -4)
			end
			prev = addButton
			
			scrollFrame.OnClickCallback[#scrollFrame.OnClickCallback +1] = function(self)
				if scrollFrame.selected then
					addButton:Enable()
				end
			end
			addButton:HookScript('OnClick', function(self)
				local tab = auraList.selected
				core.db[type].filter[tab.id] = {
					name = tab.name,
					icon = tab.icon,
					debuffType = tab.debuffType,
				}
				JamPlatesAccessoriesDB[JamPlatesAccessoriesCP][type].filter = core:CopyTable(core.db[type].filter)
				parent:Update()
				--auraList.highlight:Hide()
				--auraList.selected = nil
				self:Disable()
			end)
			addButton:HookScript('OnHide', function(self)
				self:Disable()
			end)
			return addButton
		end
		
		local warning = scrollFrame:CreateFontString( nil, 'ARTWORK', 'GameFontNormal' )
		warning:SetPoint('TOPLEFT', scrollFrame, 'TOPRIGHT', 32, -16)
		warning:SetVertexColor( 1, 0, 0)
		warning:SetText(at.L['Warning!  List gets long.'])
		
		self:SetHeight(200)
		totalHeight = totalHeight + 200
	end)
	
	CreateContainer(at.L['Spell Filter'], function(self)
		
		local scrollFrame = CreateList("FilterScrollList", self, 'aura', 300)
		scrollFrame:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -10)
		scrollFrame:SetPoint('BOTTOMLEFT', self, 'BOTTOMLEFT', 10, 10)
		
		local sampleFrame = CreateSampleButton(self, 'FilterSample')
		--sampleFrame:SetPoint('TOPLEFT', SpellID_TextField, 'BOTTOMLEFT', 0, -15)
		
		local removeButton = CreateRemoveButton(scrollFrame, 'RemoveFilterListItem', 'aura')
		--removeButton:SetPoint('TOPLEFT', scrollFrame, 'TOPRIGHT', 33, 0)
		
		--local addButton = CreateFrame('Button', '$parentAddFilterListItem', self, 'UIPanelButtonTemplate')
		local addButton = auraList:CreateAddButton(scrollFrame, 'AddFilterListItem', at.L['Filter Aura'], 'aura')

		Profile_OnChange[#Profile_OnChange +1] = function()
			sampleFrame:Clear()
			removeButton:Disable()
			scrollFrame:Update()
		end
		

		
		--local SpellID_TextField = CreateFrame( 'EditBox', "$parentSpellIDTextField", self, 'InputBoxTemplate')
		local SpellID_TextField = CreateSpellIDEditBox(scrollFrame, 'AuraSpellIDEditBox', sampleFrame, 'aura')
		
		
		
		-- Set points
		SpellID_TextField:SetPoint('TOPLEFT', scrollFrame, 'TOPRIGHT', 33, 0)
		SpellID_TextField:SetPoint('RIGHT', self, 'RIGHT', -10, 0)
		sampleFrame:SetPoint('TOPLEFT', SpellID_TextField, 'BOTTOMLEFT', 0, -15)
		sampleFrame:GetFontString():ClearAllPoints()
		sampleFrame:GetFontString():SetPoint('LEFT', sampleFrame, 'RIGHT', 0, 0)
		removeButton:SetPoint('TOPLEFT', sampleFrame, 'BOTTOMLEFT', 0, -15)--]]
		
		self:SetHeight(200)
		totalHeight = totalHeight + 200
	end)
	
	
	CreateContainer(at.L['Aura Watch'], function(self)		
		
		local scrollFrame = CreateList("WatchScrollList", self, 'tracker', 300)
		scrollFrame:SetPoint('TOPLEFT', self, 'TOPLEFT', 10, -10)
		scrollFrame:SetPoint('BOTTOMLEFT', self, 'BOTTOMLEFT', 10, 10)
		
		local sampleFrame = CreateSampleButton(self, 'WatchSample')
		
		local removeButton = CreateRemoveButton(scrollFrame, 'RemoveWatchListItem', 'watch')
		
		
		local addButton = auraList:CreateAddButton(scrollFrame, 'AddWatchListItem', at.L['Watch Aura'], 'aura')
		

		Profile_OnChange[#Profile_OnChange +1] = function()
			sampleFrame:Clear()
			removeButton:Disable()
			scrollFrame:Update()
		end
		

		
		local SpellID_TextField = CreateSpellIDEditBox(scrollFrame, 'WatchSpellIDEditBox', sampleFrame, 'watch')
		
		
		-- Set points
		SpellID_TextField:SetPoint('TOPLEFT', scrollFrame, 'TOPRIGHT', 33, 0)
		SpellID_TextField:SetPoint('RIGHT', self, 'RIGHT', -10, 0)
		sampleFrame:SetPoint('TOPLEFT', SpellID_TextField, 'BOTTOMLEFT', 0, -15)
		sampleFrame:GetFontString():ClearAllPoints()
		sampleFrame:GetFontString():SetPoint('LEFT', sampleFrame, 'RIGHT', 0, 0)
		removeButton:SetPoint('TOPLEFT', sampleFrame, 'BOTTOMLEFT', 0, -15)--]]
		
		
		self:SetHeight(200)
		totalHeight = totalHeight + 200
	end)
	
	OptionsScrollChild:SetHeight(totalHeight)
end)


InterfaceOptions_AddCategory( main )
_G['SLASH_' .. addonName .. 1] = "/jamplates"
SlashCmdList[addonName] = function()
	if InCombatLockdown() then return print(at.L['Commands disabled in combat.']) end
	--   -_-  Blizzard make it more broken... me hit with hammer and make work smarter....
	InterfaceOptionsFrame_OpenToCategory(main.name)
	InterfaceOptionsFrame_OpenToCategory(main.name)
	InterfaceOptionsFrame_OpenToCategory(main.name)
end
