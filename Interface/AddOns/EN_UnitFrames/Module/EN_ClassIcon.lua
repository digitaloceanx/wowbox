local EUF_CLASS_ICON = {
    ["WARRIOR"] = {0, 0.25, 0, 0.25},
    ["MAGE"] = {0.25, 0.49609375, 0, 0.25},
    ["ROGUE"] = {0.49609375, 0.7421875, 0, 0.25},
    ["DRUID"] = {0.7421875, 0.98828125, 0, 0.25},
    ["HUNTER"] = {0, 0.25, 0.25, 0.5},
    ["SHAMAN"] = {0.25, 0.49609375, 0.25, 0.5},
    ["PRIEST"] = {0.49609375, 0.7421875, 0.25, 0.5},
    ["WARLOCK"] = {0.7421875, 0.98828125, 0.25, 0.5},
    ["PALADIN"] = {0, 0.25, 0.5, 0.75},
    ["DEATHKNIGHT"] = {0.25, 0.49609375, 0.5, 0.75},
	["MONK"] = {0.49609375, 0.7421875, 0.5, 0.75},
	["DEMONHUNTER"] = {0.7421875, 0.98828125, 0.5, 0.75}
}

function EUF_SetClass(portrait, unit)
	-- Set 8 class icon
	local class, category, categoryId;
	if (unit ~= "player" and unit ~= "target" and not string.find(unit, "^party(%d)$")) then
		return;
	end
	if unit == "player" then
		category = "Player";
		categoryId = "";
	end
	if unit == "target" then
		category = "Target";
		categoryId = "";
	end
	local partyexists = string.find(unit, "^party");
	if partyexists then
		category = "Party";
		categoryId = strmatch(unit, "(%d)");
	end

	portrait:SetTexCoord(0, 1, 0, 1);
	local classLoc, class = UnitClass(unit);
	
	if classLoc then
		if (EUF_CurrentOptions) then
			if EUF_CurrentOptions[string.upper(category) .. "CLASSICONSMALL"] == 1 then
				if class and UnitIsPlayer(unit) then
					EUF_SetPortraitTexture(getglobal("EUF_" .. category .. "Frame" .. categoryId .. "PortraitIcon"), class);
					getglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Show();
				else
					getglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Hide();
				end
			end
		end
	end
end

function EUF_SetPortraitTexture(portrait, class)
	-- Set 8 class icon
	portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles");
	local Coord = EUF_CLASS_ICON[class];	

	portrait:SetTexCoord(Coord[1],Coord[2],Coord[3],Coord[4]);
end

function EUF_ClassIcon_Update(unit, iconType, value)
	if unit=="player" then
		if iconType=="Big" then			
		else
			if value == 0 then
				EUF_PlayerFramePortrait:Hide();
			else
				EUF_SetClass(PlayerPortrait, "player");
			end
		end
	elseif unit=="target" then
		if iconType=="Big" then			
		else
			if value == 0 then
				EUF_TargetFramePortrait:Hide();
			else
				EUF_SetClass(TargetFramePortrait, "target")
			end
		end
	elseif unit=="party" then
		local i;
		if iconType=="Big" then		
		else
			for i = 1, 4, 1 do
				if (GetNumSubgroupMembers(i)) then
					if (value == 0) then
						getglobal("EUF_PartyFrame" .. i .. "Portrait"):Hide();
					else
						EUF_SetClass(getglobal("PartyMemberFrame" .. i .. "Portrait"), "party"..i);
					end
				end
			end
		end
	end
end

function EUF_FrameClassIcon_Update()	
	EUF_ClassIcon_Update("player", "Small", EUF_CurrentOptions["PLAYERCLASSICONSMALL"]);	
	EUF_ClassIcon_Update("target", "Small", EUF_CurrentOptions["PLAYERCLASSICONSMALL"]);	
	EUF_ClassIcon_Update("party", "Small", EUF_CurrentOptions["PARTYCLASSICONSMALL"]);
end

function EUF_UnitFrame_OnEvent(self, event, ...)
	if ((event == "UNIT_PORTRAIT_UPDATE") and (arg1 == self.unit)) then
		EUF_SetClass(self.portrait, self.unit)
	end	
end

function EUF_UnitFrame_Update(self)
	EUF_SetClass(self.portrait, self.unit)
	return;
end

hooksecurefunc("UnitFrame_OnEvent", EUF_UnitFrame_OnEvent)
hooksecurefunc("UnitFrame_Update", EUF_UnitFrame_Update)
