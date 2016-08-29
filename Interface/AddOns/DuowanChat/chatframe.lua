local DWChat = LibStub('AceAddon-3.0'):GetAddon('DuowanChat')
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanChat")
local MODNAME = "CHATFRAME" 
local DWChatFrame = DWChat:NewModule(MODNAME, "AceEvent-3.0") 
local DWC_NUM_TAB=7
local chatchannelframe={} 
local buttonTemplate 
local db 
local prvBtn
local defaults = { 
	profile = { 
		enablechatchannel=false, 
		enablechatchannelmove=false 
	} 
}

local function DWC_ChannelShortText(index)
	local channelNum, channelName = GetChannelName(index);

	if (channelNum ~= 0) then
		if (strfind(channelName, L["General"])) then
			return L["GeneralShort"];
		elseif (strfind(channelName, L["Trade"])) then
			return L["TradeShort"];
		elseif (strfind(channelName, L["LFG"])) then
			return L["ShortLFG"];
		elseif (strfind(channelName, L["GuildRecruit"])) then
			return L["GuildRecruitShort"];
		elseif (strfind(channelName, L["BigFootChannel"])) then
			return L["BigFootShort"];
		elseif (strfind(channelName, "LFGForwarder") or strfind(channelName, "DWLFG")) then
			return L["DWLFG"];
		else
			return string.utf8sub(channelName, 1, 1);	-- strsub(channelName,1,3);
		end
	end
end
local short = DWC_ChannelShortText;

local function DWC_ShowChannel(index)
	local channelNum, channelName = GetChannelName(index);	
	if (channelNum ~= 0 and (not (strfind(channelName, L["LocalDefense"]) or strfind(channelName, "^QuestHelperLite") or strfind(channelName, "MoguChannel")))--[[ and not strfind(channelName, "LFGForwarder"))]]) then
		return true;
	end	
	--[[
	if (channelNum ~= 0 and (strfind(channelName, L["General"]) or strfind(channelName, L["Trade"]) or strfind(channelName, L["LFG"]))) then
		return true;
	else
		return false;
	end
	]]
end

local DWC_TABS={ 
	{text=function() return short(1) end, chatType="CHANNEL1", show=function() return DWC_ShowChannel(1) end, index=1}, 
	{text=function() return short(2) end, chatType="CHANNEL2", show=function() return DWC_ShowChannel(2) end, index=2}, 
	{text=function() return short(3) end, chatType="CHANNEL3", show=function() return DWC_ShowChannel(3) end,  index=3}, 
	{text=function() return short(4) end, chatType="CHANNEL4", show=function() return DWC_ShowChannel(4) end,  index=4}, 
	{text=function() return short(5) end, chatType="CHANNEL5", show=function() return DWC_ShowChannel(5) end,  index=5}, 
	{text=function() return short(6) end, chatType="CHANNEL6", show=function() return DWC_ShowChannel(6) end,  index=6}, 
	{text=function() return short(7) end, chatType="CHANNEL7", show=function() return DWC_ShowChannel(7) end,  index=7}, 
	{text=function() return short(8) end, chatType="CHANNEL8", show=function() return DWC_ShowChannel(8) end,  index=8}, 
	{text=function() return short(9) end, chatType="CHANNEL9", show=function() return DWC_ShowChannel(9) end,  index=9}, 
	{text=function() return short(10) end, chatType="CHANNEL10", show=function() return DWC_ShowChannel(10) end,  index=10}, 
	{text=function() return L["Say"] end, chatType="SAY", show=function() return true end,  index=0}, 
	{text=function() return L["PartyShort"] end, chatType="PARTY", show=function() return true end,  index=0}, 
	{text=function() return L["RaidShort"] end, chatType="RAID", show=function() return true end,  index=0},
	{text=function() return L["InstanceShort"] end, chatType="INSTANCE_CHAT", show=function() return IsInInstance() end,  index=0},	
	--{text=function() return L["BattleGroundShort"] end, chatType="BATTLEGROUND", show=function() return true end,  index=0},
	{text=function() return L["GuildShort"] end, chatType="GUILD", show=function() return IsInGuild() end,  index=0}, 
	{text=function() return L["YellShort"] end, chatType="YELL", show=function() return true end,  index=0}, 
	{text=function() return L["WhisperToShort"] end, chatType="WHISPER", show=function() return true end,  index=0},
	{text=function() return L["OfficerShort"] end, chatType="OFFICER", show=function() return CanEditOfficerNote() end,  index=0}, 
} 

local Artifact_Table = {
	["WARRIOR"] = {
		{
			name = "斯多姆卡，灭战者",
			link = "\124cffe5cc80\124Hitem:128910\124h[斯多姆卡，灭战者]\124h\124r",
		},
		{
			name = "瓦拉加尔战剑",
			link = "\124cffe5cc80\124Hitem:128908\124h[瓦拉加尔战剑]\124h\124r",
		},
		{
			name = "大地守护者之鳞",
			link = "\124cffe5cc80\124Hitem:128289\124h[大地守护者之鳞]\124h\124r",
		},
	},
	["PALADIN"] = {
		{
			name = "白银之手",
			link = "\124cffe5cc80\124Hitem:128823\124h[白银之手]\124h\124r",
		},
		{
			name = "真理守护者",
			link = "\124cffe5cc80\124Hitem:128866\124h[真理守护者]\124h\124r",
		},
		{
			name = "灰烬使者",
			link = "\124cffe5cc80\124Hitem:120978\124h[灰烬使者]\124h\124r",
		},
	},
	["DEATHKNIGHT"] = {
		{
			name = "诅咒之喉",
			link = "\124cffe5cc80\124Hitem:128402\124h[诅咒之喉]\124h\124r",
		},
		{
			name = "堕落王子之剑",
			link = "\124cffe5cc80\124Hitem:128292\124h[堕落王子之剑]\124h\124r",
		},
		{
			name = "天启",
			link = "\124cffe5cc80\124Hitem:128403\124h[天启]\124h\124r",
		},
	},
	["HUNTER"] = {
		{
			name = "泰坦之击",
			link = "\124cffe5cc80\124Hitem:128861\124h[泰坦之击]\124h\124r",
		},
		{
			name = "雄鹰之爪",
			link = "\124cffe5cc80\124Hitem:128808\124h[雄鹰之爪]\124h\124r",
		},
		{
			name = "萨斯多拉，风行者的遗产",
			link = "\124cffe5cc80\124Hitem:128826\124h[萨斯多拉，风行者的遗产]\124h\124r",
		},
	},
	["SHAMAN"] = {
		{
			name = "莱登之拳",
			link = "\124cffe5cc80\124Hitem:128935\124h[莱登之拳]\124h\124r",
		},
		{
			name = "毁灭之锤",
			link = "\124cffe5cc80\124Hitem:128819\124h[毁灭之锤]\124h\124r",
		},
		{
			name = "莎拉达尔，潮汐权杖",
			link = "\124cffe5cc80\124Hitem:128911\124h[莎拉达尔，潮汐权杖]\124h\124r",
		},
	},
	["ROGUE"] = {
		{
			name = "弑君者",
			link = "\124cffe5cc80\124Hitem:128870\124h[弑君者]\124h\124r",
		},
		{
			name = "恐惧之刃",
			link = "\124cffe5cc80\124Hitem:128872\124h[恐惧之刃]\124h\124r",
		},
		{
			name = "吞噬者之牙",
			link = "\124cffe5cc80\124Hitem:128476\124h[吞噬者之牙]\124h\124r",
		},
	},
	["DRUID"] = {
		{
			name = "月神镰刀",
			link = "\124cffe5cc80\124Hitem:128858\124h[月神镰刀]\124h\124r",
		},
		{
			name = "阿莎曼之牙",
			link = "\124cffe5cc80\124Hitem:128860\124h[阿莎曼之牙]\124h\124r",
		},
		{
			name = "乌索克之爪",
			link = "\124cffe5cc80\124Hitem:128821\124h[乌索克之爪]\124h\124r",
		},
		{
			name = "加尼尔，母亲之树",
			link = "\124cffe5cc80\124Hitem:128306\124h[加尼尔，母亲之树]\124h\124r",
		},
	},
	["MONK"] = {
		{
			name = "福枬，云游者之友",
			link = "\124cffe5cc80\124Hitem:128938\124h[福枬，云游者之友]\124h\124r",
		},
		{
			name = "神龙，迷雾之杖",
			link = "\124cffe5cc80\124Hitem:128937\124h[神龙，迷雾之杖]\124h\124r",
		},
		{
			name = "诸天之拳",
			link = "\124cffe5cc80\124Hitem:128940\124h[诸天之拳]\124h\124r",
		},
	},
	["DEMONHUNTER"] = {
		{
			name = "欺诈者的双刃",
			link = "\124cffe5cc80\124Hitem:127829\124h[欺诈者的双刃]\124h\124r",
		},
		{
			name = "奥达奇战刃",
			link = "\124cffe5cc80\124Hitem:128832\124h[奥达奇战刃]\124h\124r",
		},
	},
	["MAGE"] = {
		{
			name = "艾露尼斯",
			link = "\124cffe5cc80\124Hitem:127857\124h[艾露尼斯]\124h\124r",
		},
		{
			name = "烈焰之击",
			link = "\124cffe5cc80\124Hitem:128820\124h[烈焰之击]\124h\124r",
		},
		{
			name = "黑檀之寒",
			link = "\124cffe5cc80\124Hitem:128862\124h[黑檀之寒]\124h\124r",
		},
	},
	["PRIEST"] = {
		{
			name = "圣光之怒",
			link = "\124cffe5cc80\124Hitem:128868\124h[圣光之怒]\124h\124r",
		},
		{
			name = "图雷，纳鲁道标",
			link = "\124cffe5cc80\124Hitem:128825\124h[图雷，纳鲁道标]\124h\124r",
		},
		{
			name = "萨拉塔斯，黑暗帝国之刃",
			link = "\124cffe5cc80\124Hitem:128827\124h[萨拉塔斯，黑暗帝国之刃]\124h\124r",
		},
	},
	["WARLOCK"] = {
		{
			name = "乌萨勒斯，逆风收割者",
			link = "\124cffe5cc80\124Hitem:128942\124h[乌萨勒斯，逆风收割者]\124h\124r",
		},
		{
			name = "堕落者之颅",
			link = "\124cffe5cc80\124Hitem:128943\124h[堕落者之颅]\124h\124r",
		},
		{
			name = "萨格拉斯权杖",
			link = "\124cffe5cc80\124Hitem:128941\124h[萨格拉斯权杖]\124h\124r",
		},
	},
}

local function SendLengedItemToChatframe(class)
	for k, v in pairs(Artifact_Table[class]) do
		DEFAULT_CHAT_FRAME:AddMessage(v.link)
	end
end

local menuList = {
	{text = L.Warrior,
	func = function() SendLengedItemToChatframe("WARRIOR") end},
	{text = L.Paladin,
	func = function() SendLengedItemToChatframe("PALADIN") end},
	{text = L.DeathKnight,
	func = function() SendLengedItemToChatframe("DEATHKNIGHT") end},
	{text = L.Hunter,
	func = function() SendLengedItemToChatframe("HUNTER") end},
	{text = L.Shaman,
	func = function() SendLengedItemToChatframe("SHAMAN") end},
	{text = L.Rogue,
	func = function() SendLengedItemToChatframe("ROGUE") end},
	{text = L.Druid,
	func = function() SendLengedItemToChatframe("DRUID") end},
	{text = L.Monk,
	func = function() SendLengedItemToChatframe("MONK") end},
	{text = L.Demonhunter,
	func = function() SendLengedItemToChatframe("DEMONHUNTER") end},
	{text = L.Mage,
	func = function() SendLengedItemToChatframe("MAGE") end},
	{text = L.Priest,
	func = function() SendLengedItemToChatframe("PRIEST") end},
	{text = L.Warlock,
	func = function() SendLengedItemToChatframe("WARLOCK") end},
}

local optGetter, optSetter 
do 
	local mod = DWChatFrame 
	function optGetter(info)
		local key = info[#info] 
		return db[key] 
	end 
	function optSetter(info, value)
		local key = info[#info] db[key] = value 
		mod:Refresh() 
	end 
end

local options 
local getOptions=function() 
	if not options then 
		options={
			type = "group", 
			name = L["ChatFrame"], 
			arg = MODNAME, 
			get = optGetter, 
			set = optSetter, 
			args = {
				intro = { 
					order = 1, 
					type = "description", 
					name = L["Fast chat channel provides you easy access to different channels"], 
				}, 
				enablechatchannel = { 
					order = 2, 
					type = "toggle", 
					name = L["Enable channel buttons"],
					get = function() 
						return DWChat:GetModuleEnabled(MODNAME) 
					end, 
					set = function(info, value) 
						DWChat:SetModuleEnabled(MODNAME, value) 
					end,
					width = full,
				}, 
			},
		}
	end
	return options
end 

function DWC_SetChatType(chatType, index) 
	local chatFrame = --[[SELECTED_DOCK_FRAME or ]]DEFAULT_CHAT_FRAME;
	local text = "";
	if (string.find(chatType, "CHANNEL")) then
		chatFrame.editBox:Show();
		if (chatFrame.editBox:GetAttribute("chatType") == "CHANNEL") and (chatFrame.editBox:GetAttribute("channelTarget") == index) then
			ChatFrame_OpenChat("", chatFrame);
		else
			chatFrame.editBox:SetAttribute("chatType", "CHANNEL");
			chatFrame.editBox:SetAttribute("channelTarget", index);
			ChatEdit_UpdateHeader(chatFrame.editBox);
		end
	else
		if (chatType == "WHISPER") then
			text = "/w ";
			ChatFrame_ReplyTell(chatFrame);
			if (UnitExists("target") and UnitIsFriend("target", "player") and UnitIsPlayer("target")) then
				text = text .. UnitName("target");
			end
			
			ChatFrame_OpenChat(text, chatFrame);
		else
			if (not chatFrame.editBox:IsVisible()) then
				ChatFrame_OpenChat("", chatFrame);
			end
			-- ChatFrame_OpenChat("", chatFrame);
			text = chatFrame.editBox:GetText();
			text = string.gsub(text, "^/[Ww] ", "");		
			chatFrame.editBox:SetText(text);
			chatFrame.editBox:SetAttribute("chatType", chatType);
			ChatEdit_UpdateHeader(chatFrame.editBox);
		end
	end
	chatFrame.editBox:SetFocus();
end 

local function createChatTab(texfunc, chatType, showfunc, index, id)
	local chatTab=_G["DWCChatTab"..id] 
	if not chatTab then 
		chatTab=CreateFrame("Button","DWCChatTab"..id,UIParent,"DWCChatTabTemplate") 		
	end
	chatTab.chatType = chatType 		
	chatTab.text= texfunc()
	chatTab.index = index
	_G[chatTab:GetName().."Text"]:SetText(chatTab.text) 
	if (showfunc()) then
		if (not prvBtn) then
			chatTab:SetPoint("LEFT",_G.DWCIconFrameCalloutButton,"RIGHT",1,0) 
		else 
			chatTab:SetPoint("LEFT",prvBtn,"RIGHT",1,0) 
		end 
		prvBtn = chatTab
		chatTab:Show()
		return chatTab 
	else
		chatTab:Hide()
		return false
	end	
end

function DWChatFrame:OnInitialize() 
	self.db = DWChat.db:RegisterNamespace(MODNAME, defaults);
	db = self.db.profile;
	self:SetEnabledState(DWChat:GetModuleEnabled(MODNAME));
	DWChat:RegisterModuleOptions(MODNAME, getOptions, L["ChatFrame"]);
end

function DWChatFrame:Refresh() 
	chatchannelframe={} 	
	prvBtn = nil;
	for i, v in ipairs(DWC_TABS) do
		local tab = createChatTab( v.text, v.chatType, v.show, v.index, i);
		if (tab) then
			tinsert(chatchannelframe, tab);
		end
	end

	DWCReportStatButton:ClearAllPoints();
	DWCReportStatButton:SetPoint("LEFT", prvBtn,"RIGHT",1,0);
	DWCRandomButton:ClearAllPoints();
	DWCRandomButton:SetPoint("LEFT", DWCReportStatButton,"RIGHT",1,0);
	DWCDungeonListButton:ClearAllPoints();
	DWCDungeonListButton:SetPoint("LEFT", DWCRandomButton,"RIGHT",1,0);
end 

function DWCReportStatButton_OnClick(self, button)
	local DuowanStat = DWChat:GetModule("DUOWANSTAT");
	--if (button == "LeftButton") then
	--	DuowanStat:InsertStat();
	--else
		DuowanStat:InsertStat(1);
	--end	
end

function DWChatFrame:UpdateChatBar(event)	
	self:Refresh() 
end

function DW_ArtifactMenu_OnLoad(self)
	self.chatFrame = DEFAULT_CHAT_FRAME;
	UIMenu_Initialize(self);
	for _, t in pairs(menuList) do
		UIMenu_AddButton(self, t.text, nil, t.func);
	end
	UIMenu_AutoSize(self);
end

function DW_ArtifactMenu_Show(self)
	UIMenu_OnShow(self);
	self:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	self:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b);
end

function DWChatFrame:OnEnable() 
	self:Refresh()
	self:RegisterEvent("UPDATE_WORLD_STATES", "UpdateChatBar");
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE", "UpdateChatBar");
	self:RegisterEvent("PLAYER_GUILD_UPDATE", "UpdateChatBar");
	for i=1, 10 do	
		local _point,rel,relp,xo,yo=_G["ChatFrame"..i.."EditBox"]:GetPoint() 
		_G["ChatFrame"..i.."EditBox"]:SetPoint(_point,rel,relp,xo-28,yo-28) 
	end

	_G[DWCLegendButton:GetName().."Text"]:SetText("神")
	DWCLegendButton:SetScript("OnClick", function(self)
		if DW_ArtifactMenu:IsShown() then
			DW_ArtifactMenu:Hide()
		else
			DW_ArtifactMenu:Show()
		end
	end)
	DWCChatFrame:Show() 
end 

function DWChatFrame:OnDisable()
	self:UnregisterEvent("UPDATE_WORLD_STATES");
	self:UnregisterEvent("CHAT_MSG_CHANNEL_NOTICE");
	self:UnregisterEvent("PLAYER_GUILD_UPDATE");
	for i=1, 10 do	
		local _point,rel,relp,xo,yo=_G["ChatFrame"..i.."EditBox"]:GetPoint()
		_G["ChatFrame"..i.."EditBox"]:SetPoint(_point,rel,relp,xo+28,yo+28) 
	end
	
	for k, v in pairs(chatchannelframe) do
		 v:ClearAllPoints() 
		 v:Hide()
	end
	--DWCYYChatCalloutButton:Hide();
end 