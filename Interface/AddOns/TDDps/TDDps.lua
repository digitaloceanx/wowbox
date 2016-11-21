_TD = _TD or {};

_TD['DPS_Enabled'] 	= 0;
_TD['DPS_OnEnable'] = nil;
_TD['DPS_NextSpell'] = nil;
_TD['DPS_Description'] = '';
_TD['DPS_Mode'] = 1;

DPS_Skill = nil;

-- Name and colors
TDDpsName = 'TDDPS';
_tdInfo = '|cFF1394CC';
_tdError = '|cFFF0563D';
_tdSuccess = '|cFFBCCF02';

local _DPS_time = 0;
-- Globals for time to die
TDDps_TargetGuid = nil;
TD_Hp0, TD_T0, TD_Hpm, TD_Tm = nil, nil, nil, nil;

local Classes = {
	[1] = 'Warrior',
	[2] = 'Paladin',
	[3] = 'Hunter',
	[4] = 'Rogue',
	[5] = 'Priest',
	[6] = 'DeathKnight',
	[7] = 'Shaman',
	[8] = 'Mage',
	[9] = 'Warlock',
	[10] = 'Monk',
	[11] = 'Druid',
	[12] = 'DemonHunter',
}
local TDDps_Frame = CreateFrame('Frame', 'TDDps_Frame');
TDDps_Frame.rotationEnabled = false;

local L = {}
if GetLocale() == 'zhCN' then
	L['Disabling'] = '����'
	L['Enabling'] = '����'
	L['Initialized'] = '��ʼ��'
	L['No addon selected, cannot enable'] = '�޵�ǰְҵ���츳ģ��'
	L['Auto enable on combat!'] = '����ս���Զ�����!'
	L['Invalid player class, please contact author of addon.'] = 'δ֪���ְҵ, ����ϵ����.'
elseif GetLocale() == 'zhTW' then
	L['Disabling'] = '����'
	L['Enabling'] = '����'
	L['Initialized'] = '��ʼ��'
	L['No addon selected, cannot enable'] = '�o��ǰ�I�����xģ�M'
	L['Auto enable on combat!'] = '�M����Y�Ԅӆ���!'
	L['Invalid player class, please contact author of addon.'] = 'δ֪����I, Ո�M����.'
else
	L['Disabling'] = 'Disabling'
	L['Enabling'] = 'Enabling'
	L['Initialized'] = 'Initialized'
	L['No addon selected, cannot enable'] = 'No addon selected, cannot enable'
	L['Auto enable on combat!'] = 'Auto enable on combat!'
	L['Invalid player class, please contact author of addon.'] = 'Invalid player class, please contact author of addon.'
end

function TDDps_Print(color, message)
	if TDDps_Options.disabledInfo then
		return;
	end

	print(color .. TDDpsName .. ': ' .. L[message]);
end

----------------------------------------------
-- Disable dps addon functionality
----------------------------------------------
function TDDps_DisableAddon()
	if _TD['DPS_Enabled'] == 0 then
		return;
	end
	TDButton_DestroyAllOverlays();
	TDDps_Print(_tdInfo, 'Disabling');
	TDDps_Frame:SetScript('OnUpdate', nil);
	DPS_Skill = nil;
	TDDps_Frame.rotationEnabled = false;
	_TD['DPS_Enabled'] = 0;
end

----------------------------------------------
-- Initialize dps addon functionality
----------------------------------------------
function TDDps_InitAddon()
	TDDps_Frame:Show();

	TDDps_Frame:RegisterEvent('PLAYER_TARGET_CHANGED');
	TDDps_Frame:RegisterEvent('PLAYER_TALENT_UPDATE');
	TDDps_Frame:RegisterEvent('ACTIONBAR_SLOT_CHANGED');
	TDDps_Frame:RegisterEvent('PLAYER_REGEN_DISABLED');
	TDDps_Frame:RegisterEvent('PLAYER_ENTERING_WORLD');
--	TDDps_Frame:RegisterEvent('PLAYER_REGEN_ENABLED');

	TDDps_Frame:SetScript('OnEvent', TDDps_OnEvent);

	TDDps_Print(_tdInfo, 'Initialized');
end

----------------------------------------------
-- Enable dps addon functionality
----------------------------------------------
function TDDps_EnableAddon(mode)
	TDDps_Print(_tdInfo, 'Enabling');

	if _TD['DPS_NextSpell'] == nil then
		return;
	end

	if _TD['DPS_Enabled'] == 1 then
		return;
	end

	_TD['DPS_Mode'] = mode;

	TDButton_Fetch();

	if _TD['DPS_OnEnable'] then
		_TD['DPS_OnEnable']();
	end

	TDDps_Frame:SetScript('OnUpdate', TDDps_OnUpdate);

	_TD['DPS_Enabled'] = 1;
	TDDps_Print(_tdSuccess, 'Enabled');
end

----------------------------------------------
-- Event Script, Target Change, Specializaton Change
----------------------------------------------
function TDDps_InvokeNextSpell()
	-- invoke spell check
	local oldSkill = DPS_Skill;

	if _TD['DPS_NextSpell'] == nil then
	--	print(_tdError .. TDDpsName .. L[': No addon selected, cannot enable']);
		return;
	end
	DPS_Skill = _TD['DPS_NextSpell']();

	if (oldSkill ~= DPS_Skill or oldSkill == nil) and DPS_Skill ~= nil then
		TDButton_GlowNextSpellId(DPS_Skill);
	end
	if DPS_Skill == nill and oldSkill ~= nil then
		TDButton_GlowClear();
	end
end

----------------------------------------------
-- Event Script, Target Change, Specializaton Change
----------------------------------------------
function TDDps_OnEvent(self, event)
	if event == 'PLAYER_TALENT_UPDATE' then
		TDDps_DisableAddon();
	elseif event == 'ACTIONBAR_SLOT_CHANGED' then
		--TDDps_DisableAddon();
	elseif event == 'PLAYER_ENTERING_WORLD' then
		TDButton_UpdateButtonGlow();
	end
	if event == 'PLAYER_TARGET_CHANGED' then
		TD_Hp0, TD_T0, TD_Hpm, TD_Tm = nil, nil, nil, nil;

		if UnitExists('target') and not UnitIsFriend('player', 'target') then
			TDDps_TargetGuid = UnitGUID('target');
		else
			TDDps_TargetGuid = nil;
		end
	end
	if TDDps_Frame.rotationEnabled then
		if event == 'PLAYER_TARGET_CHANGED' then
			if (UnitIsFriend('player', 'target')) then
				return;
			else
				TDDps_InvokeNextSpell();
			end
		end
	end
	if event == 'PLAYER_REGEN_DISABLED' and TDDps_Options.onCombatEnter and not TDDps_Frame.rotationEnabled then
		TDDps_Print(_tdSuccess, 'Auto enable on combat!');
		TDDps_Frame.rotationEnabled = true;
		TDDps_LoadModule();
	end
--	if event == 'PLAYER_REGEN_ENABLED' then
--		TDDps_Print(_tdSuccess, 'Auto disable on combat!');
--		TDDps_Frame.rotationEnabled = false;
--		TDDps_DisableAddon();
--	end
end

----------------------------------------------
-- Update script (timer)
----------------------------------------------
function TDDps_OnUpdate(self, elapsed)
	_DPS_time = _DPS_time + elapsed;
	if _DPS_time >= TDDps_Options.interval then
		_DPS_time = 0;
		TDDps_InvokeNextSpell();
	end
end

----------------------------------------------
-- Load appropriate addon for class
----------------------------------------------
function TDDps_LoadModule()
	TDDps_Frame.rotationEnabled = true;

	local _, _, classId = UnitClass('player');
	if Classes[classId] == nil then
		TDDps_Print(_tdError, 'Invalid player class, please contact author of addon.');
		return;
	end

	local module = 'TDDps_' .. Classes[classId];

	if not IsAddOnLoaded(module) then
		LoadAddOn(module);
	end

	if not IsAddOnLoaded(module) then
		TDDps_Print(_tdError, 'Could not find class module.');
		return;
	end

	local mode = GetSpecialization();
	local init = module .. '_EnableAddon';

	_G[init](mode);

	if _TD['DPS_NextSpell'] == nil then
		TDDps_Frame.rotationEnabled = false;
		TDDps_Print(_tdError, 'Specialization is not supported.');
	end
end

TDDps_InitAddon();