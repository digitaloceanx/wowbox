GRID_CLICK_SETS_BUTTONS = 5 --max buttons, another 2 more for wheel up & wheel down

local function gn(spellId)
	--return select(1, GetSpellInfo(spellId))
	return spellId;
end

GridClickSets_DefaultSets = {
	PRIEST = {
		["1"] = {
			["shift-"]	= gn(139),--"恢復",
			["ctrl-"]	= gn(527),--"驅散魔法",
			["alt-"]	= gn(2061),--"快速治療",
			["alt-ctrl-"]	= gn(2006),--"復活術",
		},
		["2"] = {
			[""]		= gn(17),--"真言術:盾",
			["shift-"]	= gn(2050),--"治疗术",
			["ctrl-"]	= gn(528),--"驅除疾病", 
			["alt-"]	= gn(2060),--"強效治療術",
			["alt-ctrl-"]	= gn(32546),--"束縛治療",
		},
		["3"] = {
			[""]		= gn(34861),--"治療之環",
			["shift-"]	= gn(33076),--"癒合禱言",
			["alt-"]	= gn(1706),--"漂浮术",
			["alt-ctrl-"]	= gn(21562),--"真言术.韧",
		},
	},
	
	DRUID = {
		["1"] = {
			["shift-"]	= gn(774),--"回春術",
			["ctrl-"]	= gn(2782),--"解除詛咒,毒",
			["alt-"]	= gn(8936),--"癒合",
			["alt-ctrl-"]	= gn(50769),--"復活",
		},
		["2"] = {
			[""]		= gn(48438),--"野性痊癒",
			["shift-"]	= gn(18562),--"迅捷治愈",
			["ctrl-"]	= gn(88423),--"自然治愈",
			["alt-"]	= gn(50464),--"滋補術",
		},
		["3"] = {
			[""]		= gn(33763),--"生命之花",
			["alt-ctrl-"]	= gn(1126),--"野性印记",
		},
	},

	SHAMAN = { 
		["1"] = {
			["alt-"]	= gn(1064),--"治疗链",
			["shift-"]	= gn(77472),--"治疗波",
			["ctrl-"]	= gn(974),--"大地之盾",
			["alt-ctrl-"]	= gn(2008),--"先祖之魂",
		},
		["2"] = {
			[""]		= gn(61295),--"激流",
			["alt-"]	= gn(8004),--"次级治疗波",
			["shift-"]	= gn(77472),--"次级治疗波",
			["ctrl-"]	= gn(51886),--"净化灵魂",
		},
		["3"] = {
			[""]		= gn(1064),--"治疗链",
			["alt-"]	= gn(546),--"水上行走",
			["shift-"]	= gn(131),--"水下呼吸",
		},
	},

	PALADIN = {
		["1"] = {
			["shift-"]	= gn(82326),--"聖光術",
			["alt-"]	= gn(19750),--"聖光閃現",
			["ctrl-"]	= gn(53563),--"圣光信标",
			["alt-ctrl-"]	= gn(212056),--"救贖",
		},
		["2"] = {
			[""]		= gn(20473),--"神聖震擊",
			["shift-"]	= gn(82326),--"Divine Light",
			["ctrl-"]	= gn(213644),--"淨化術",
			["alt-"]	= gn(85673),--"Word of Glory",
			["alt-ctrl-"]	= gn(633),--"聖療術",
		},
		["3"] = {
			[""]		= gn(6940),--正義防護
			["alt-"]	= gn(203538),--王者
			["shift-"]	= gn(203539),--庇護
			["ctrl-"]	= gn(203528),--力量
		},
	},

	WARRIOR = {
		["1"] = {
			["ctrl-"]	= gn(198304),--"戒備守護",
		},
		["2"] = {
			[""]		= gn(198304),--"阻擾",
		},
	},

	MAGE = {
		["1"] = {
			["shift-"]	= gn(157980),--"秘法智力",
			["alt-"]	= gn(157980),--"秘法智力",
			["ctrl-"]	= gn(54646),--"秘法专注",
		},
		["2"] = {
			[""]		= gn(157981),--"解除詛咒",
			["ctrl-"]	= gn(157981),--"解除詛咒",
			["alt-"]	= gn(157981),--"解除詛咒",
			["shift-"]	= gn(157981),--"解除詛咒",
		},
		["3"] = {
			["alt-"]	= gn(130),--"缓落术",
		},
	},

	WARLOCK = {
		["1"] = {
			["ctrl-"]	= gn(20707),--"Dark Indent",
			["alt-"]	= gn(20707),--"Dark Indent",
			["shift-"]	= gn(20707),--"Dark Indent",
		},
		["2"] = {
			[""]		= gn(5697),--"魔息術",
			["ctrl-"]	= gn(5697),--"魔息術",
			["alt-"]	= gn(5697),--"魔息術",
			["shift-"]	= gn(5697),--"魔息術",
		},
	},

	HUNTER = {
		["2"] = {
			[""]		= gn(34477),--"誤導",
		},
	},
	
	ROGUE = {
		["2"] = {
			[""]		= gn(57933),--"偷天換日",
		},
	},

	DEATHKNIGHT = {
		["1"] = {
			["ctrl-"]	= gn(61999),--"复活盟友",
			["alt-"]	= gn(61999),--"复活盟友",
			["shift-"]	= gn(61999),--"复活盟友",
		},
		["2"] = {
			[""]		= gn(108199),--"死亡缠绕",
		},
	},
    DEMONHUNTER = {
        ["2"] = {
            [""] = gn(207810),--虚空联结2
        }
    },
}

GridClickSets_SpellList = {
    PRIEST = {
        (17),	--真言术：盾  3暗影2神圣1戒律
        (200829),	--恳求 buff 194384
        (2006),	--复活术
        (186263),	--暗影愈合 debuff 187464
        (527),	--纯净术
        (1706),	--漂浮术
        (212036),	--群体复活
        (194509),	--真言术：耀
        (33206),	--痛苦压制
        (73325),	--信仰飞跃
        (204263),	--闪光力场
        (152118),	--意志洞悉
        (204065),	--暗影盟约 debuff 219521
        (2050),	--圣言术：静
        (47788),	--守护之魂
        (2061),	--快速治疗
        (139),	--恢复
        (33076),	--愈合祷言
        (2060),	--治疗术
        (596),	--治疗祷言
        (214121),	--身心合一
        (32546),	--联结治疗
        (204883),	--治疗之环
        (213634),	--净化疾病
    },
    DRUID = {
        (50769),   --起死回生 3守护2野性1平衡4恢复
        (2782),    --清除腐蚀
        (5185),	    --治疗之触
        (20484),	--复生
        (29166),	--激活14
        (774),	--回春术
        (8936),	--愈合
        (212040),	--新生
        (33763),	--生命绽放
        (88423),	--自然之愈
        (18562),	--迅捷治愈
        (48438),	--野性成长
        (102342),	--铁木树皮
        (102351),	--塞纳里奥结界
    },
    PALADIN = {
        (19750),    --圣光闪现123 1神圣 2防护 3惩戒
        (7328),	    --救赎123
        (213644),	--清毒术23
        (633),	    --圣疗术123
        (203528),	--强效力量祝福3
        (203538),	--强效王者祝福3
        (203539),	--强效智慧祝福3
        (1022),	    --保护祝福123
        (1044),	    --自由祝福123
        (82326),	    --圣光术1
        (53563),	    --圣光道标1
        (212056),	--宽恕1
        (183998),	--殉道者之光1
        (4987),	    --清洁术1
        (6940),	    --牺牲祝福12
        (20473),	    --神圣震击1
        (223306),	--赋予信仰
        (114165),	--神圣棱镜
        (156910),	--信仰道标
        (200025),	--美德道标
        --(204018),	--破咒祝福
        (213652),	--守护者之手
    },
    MONK = {
        (116694),	--真气贯通 1酒仙2织雾3踏风
        (115178),	--轮回转世 123
        (218164),	--清创生血 13
        (115098),	--真气波
        (116841),	--迅如猛虎
        (116844),	--平心之环
        (116849),	--作茧缚命2
        (115151),	--复苏之雾2
        (212051),	--死而复生2
        (124682),	--氤氲之雾2
        (116670),	--活血术2
        (115450),	--清创生血2
        (124081),	--禅意波
        (197945),	--踏雾而行
    },
    SHAMAN = {
        (8004),	--治疗之涌13 1元素2增强3恢复
        (2008),	--先祖之魂123
        (51886),	--净化灵魂12
        (546),	    --水上行走123
        (188070),	--治疗之涌2
        (212048),	--先祖视界3
        (77130),	--净化灵魂3
        (77472),	--治疗波3
        (1064),	    --治疗链3
        (61295),	--激流3
        (73685),	--生命释放3天赋代替51514妖术
    },
    MAGE = {
        (130),--缓落术123 1奥2火3冰
        (157997),--寒冰新星
        (157980),--超级新星
        (157981),--冲击波
    },
    WARLOCK = {
        (5697),--无尽呼吸
        (20707),--灵魂石
    },
    WARRIOR = {
        (198304),--拦截3 1武器2狂怒3防护
    },
    HUNTER = {
        (34477),--誤導1野兽控制2射击
    },
    ROGUE = {
        (57934),--嫁祸诀窍
    },
    DEATHKNIGHT = {
        (61999),--复活盟友
        (108199),--血魔之握1鲜血
    },
    DEMONHUNTER = {
        (207810),--虚空联结1浩劫2复仇
    },
}

GridClickSets_Titles = {
	"Direct  Click :",
	"Ctrl +  Click :",
	"Alt  +  Click :",
	"Shift + Click :",
	"Ctrl + Alt :",
	"Ctrl + Shift :",
	"Shift + Alt :",
	"C + S + A :",
}

GridClickSets_Modifiers = {
	"",
	"ctrl-",
	"alt-",
	"shift-",
	"alt-ctrl-",
	"ctrl-shift-",
	"alt-shift-",
	"alt-ctrl-shift-",
}

--[[ set format
GridClickSets_Set = {
	["1"] = {
		["shift-"] = { type = "spellId:1001" },
		["ctrl-"] = { type = "TARGET" },
	},
	["3"] = {
		["shift-"] = { type = "SPELL", arg = "治疗波" },
		["shift-"] = { type = "MACRO", arg = "/target ##\n/cast [target=##]治疗波" },
	}
}
]]

--for check deleted spells
function GridClickSets_Check()
	for clz, set in pairs(GridClickSets_SpellList) do
		for _, spellId in pairs(set) do
			if not GetSpellInfo(spellId) then ChatFrame1:AddMessage(spellId); end
		end
	end	
end

function GridClickSets_ConvertDefault(set) 
	if not set then return {} end

	local modi, v
	local conv = {}

	for modi, v in pairs(set) do
		if type(v) == "number" then
			conv[modi] = { type = "spellId:"..v };
		else
			conv[modi] = { type = v.type, arg = v.arg };
		end
	end
	return conv;
end

function GridClickSets_GetBtnDefaultSet(btn)
	local _, c = UnitClass("player")
	if GridClickSets_DefaultSets[c] then
		return GridClickSets_ConvertDefault(GridClickSets_DefaultSets[c][tostring(btn)])
	else
		return {}
	end
end

function GridClickSets_GetDefault()
	local set = {}
	for i=1,5 do
		set[tostring(i)] = GridClickSets_GetBtnDefaultSet(i)
	end
	return set
end

local secureHeader = CreateFrame("Frame", nil, UIParent, "SecureHandlerBaseTemplate")

function GridClickSets_SetAttributes(frame, set)
	set = set or GridClickSets_GetDefault()

	for i=1,GRID_CLICK_SETS_BUTTONS do
		local btn = set[tostring(i)] or {};
		for j=1,8 do
			local modi = GridClickSets_Modifiers[j]
			local set = btn[modi] or {}

			GridClickSets_SetAttribute(frame, i, modi, set.type, set.arg)
		end
	end

	-- for wheel up/down bindings (new on 11.02.22)
	local binded = 0
	local script = "self:ClearBindings()";
	for i=1,2 do
		local btn = set[tostring(GRID_CLICK_SETS_BUTTONS+i)] or {};
		for j=1,8 do
			local modi = GridClickSets_Modifiers[j]
			local set = btn[modi]
			if(set) then 
				binded = binded + 1
				script = script.."self:SetBindingClick(1, \""..modi..(i==1 and "MOUSEWHEELUP" or "MOUSEWHEELDOWN").."\", self, \"Button"..(GRID_CLICK_SETS_BUTTONS+binded).."\")"
				GridClickSets_SetAttribute(frame, GRID_CLICK_SETS_BUTTONS+binded, "", set.type, set.arg)
			end
		end
	end

	secureHeader:UnwrapScript(frame, "OnEnter")
	secureHeader:WrapScript(frame, "OnEnter", script);
	secureHeader:UnwrapScript(frame, "OnLeave")
	secureHeader:WrapScript(frame, "OnLeave", "self:ClearBindings()");
end

function GridClickSets_SetAttribute(frame, button, modi, type, arg)
	--if InCombatLockdown() then return end

	if(type==nil or type=="NONE") then
		frame:SetAttribute(modi.."type"..button, nil)
		frame:SetAttribute(modi.."macrotext"..button, nil)
		frame:SetAttribute(modi.."spell"..button, nil)
		return
	elseif strsub(type, 1, 8) == "spellId:" then
		frame:SetAttribute(modi.."type"..button, "spell")
		frame:SetAttribute(modi.."spell"..button, select(1, GetSpellInfo(strsub(type, 9))))
		return
	end

	frame:SetAttribute(modi.."type"..button, type)
	if type == "spell" then
		frame:SetAttribute(modi.."spell"..button, arg)
	elseif type == "macro" then
		local unit = SecureButton_GetModifiedUnit(frame, modi.."unit"..button)
		if unit and arg then
			arg = string.gsub(arg, "##", unit)
		else
			arg = arg and string.gsub(arg, "##", "@mouseover")
		end
		frame:SetAttribute(modi.."macrotext"..button, arg)
	end
end