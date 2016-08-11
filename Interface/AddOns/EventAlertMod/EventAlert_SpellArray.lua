-- Prevent tainting global _.
local _
local _G = _G


local function CopyTable(SrcTable)
	local TarTable = {};
	for sKey, sValue in pairs(SrcTable) do
		if type(sValue) == "table" then
			TarTable[sKey] = {};
			TarTable[sKey] = CopyTable(sValue);
		else
			TarTable[sKey] = sValue;
		end
	end
	return TarTable;
end

function EventAlert_LoadClassSpellArray(ItemType)
	--if EA_Items[EA_playerClass] == nil then EA_Items[EA_playerClass] = {} end;
	--if EA_AltItems[EA_playerClass] == nil then EA_AltItems[EA_playerClass] = {} end;
	--if EA_Items[EA_CLASS_OTHER] == nil then EA_Items[EA_CLASS_OTHER] = {} end;
	--if EA_TarItems[EA_playerClass] == nil then EA_TarItems[EA_playerClass] = {} end;
	--if EA_ScdItems[EA_playerClass] == nil then EA_ScdItems[EA_playerClass] = {} end;
	--if EA_GrpItems[EA_playerClass] == nil then EA_GrpItems[EA_playerClass] = {} end;

	if (ItemType == 1) or (ItemType == 9 and EA_Items[EA_playerClass] == nil) then
		EA_Items[EA_playerClass] = {};
		for i, v in pairsByKeys(EADef_Items[EA_playerClass]["ITEMS"]) do
			i = tonumber(i);
			if EA_Items[EA_playerClass][i] == nil then EA_Items[EA_playerClass][i] = v end;
			if GetSpellInfo(i) == nil then EA_Items[EA_playerClass][i] = nil end;
		end
	end
	if (ItemType == 2) or (ItemType == 9 and EA_AltItems[EA_playerClass] == nil) then
		EA_AltItems[EA_playerClass] = {};
		for i, v in pairsByKeys(EADef_Items[EA_playerClass]["ALTITEMS"]) do
			i = tonumber(i);
			if EA_AltItems[EA_playerClass][i] == nil then EA_AltItems[EA_playerClass][i] = v end;
			if GetSpellInfo(i) == nil then EA_AltItems[EA_playerClass][i] = nil end;
		end
	end
	if (ItemType == 3) or (ItemType == 9 and EA_Items[EA_CLASS_OTHER] == nil) then
		EA_Items[EA_CLASS_OTHER] = {};
		for i, v in pairsByKeys(EADef_Items[EA_CLASS_OTHER]) do
			i = tonumber(i);
			if EA_Items[EA_CLASS_OTHER][i] == nil then EA_Items[EA_CLASS_OTHER][i] = v  end;
			if GetSpellInfo(i) == nil then EA_Items[EA_CLASS_OTHER][i] = nil end;
		end
	end
	if (ItemType == 4) or (ItemType == 9 and EA_TarItems[EA_playerClass] == nil) then
		EA_TarItems[EA_playerClass] = {};
		for i, v in pairsByKeys(EADef_Items[EA_playerClass]["TARITEMS"]) do
			i = tonumber(i);
			if EA_TarItems[EA_playerClass][i] == nil then EA_TarItems[EA_playerClass][i] = v end;
			if GetSpellInfo(i) == nil then EA_TarItems[EA_playerClass][i] = nil end;
		end
	end
	if (ItemType == 5) or (ItemType == 9 and EA_ScdItems[EA_playerClass] == nil) then
		EA_ScdItems[EA_playerClass] = {};
		for i, v in pairsByKeys(EADef_Items[EA_playerClass]["SCDITEMS"]) do
			i = tonumber(i);
			if EA_ScdItems[EA_playerClass][i] == nil then EA_ScdItems[EA_playerClass][i] = v end;
			if GetSpellInfo(i) == nil then EA_ScdItems[EA_playerClass][i] = nil end;
		end
	end
	if (ItemType == 6) or (ItemType == 9 and EA_GrpItems[EA_playerClass] == nil) then
		EA_GrpItems[EA_playerClass] = {};
		local iGroupCnts = 0;
		--if (#EA_GrpItems[EA_playerClass] ~= nil) then iGroupCnts = #EA_GrpItems[EA_playerClass] end;
		for i, v in pairsByKeys(EADef_Items[EA_playerClass]["GRPITEMS"]) do
			i = tonumber(i);
			if EA_GrpItems[EA_playerClass][iGroupCnts+i] == nil then EA_GrpItems[EA_playerClass][iGroupCnts+i] = {} end;
			-- EA_GrpItems[EA_playerClass][iGroupCnts+i] = v;
			EA_GrpItems[EA_playerClass][iGroupCnts+i] = CopyTable(v);
		end
	end
end


function EventAlert_LoadSpellArray()

	EADef_Items = {};
--DH
	EADef_Items[EA_CLASS_DH] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[187827] = {enable=true,},   -- Metamorphosis
			[218256] = {enable=true,},   -- Empower Wards
			[196718] = {enable=true,},   -- Darkness
			[178470] = {enable=true,},   -- Immolation Aura
			[203720] = {enable=true,},   -- Demon Spikes
			[227225] = {enable=true,},   -- Soul Barrier (Talent)
			[196555] = {enable=true,},   -- Netherwalk (Talent)
			[207810] = {enable=true,},   -- Nether Bond (Talent)
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
			[162919] = {enable=true,},   -- Nightmare Fire (Crit, Proc)
			[162913] = {enable=true,},
			[162915] = {enable=true,},
			[162917] = {enable=true,},
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[204598] = {enable=true, self=true,},    -- Sigil of Flame
			[204490] = {enable=true, self=true,},    -- Sigil of Silence
			[207685] = {enable=true, self=true,},    -- Sigil of Misery
			[204843] = {enable=true, self=false},	-- Sigil of Grasp
			[207744] = {enable=true, self=false,},	-- Fiery Brand
			[224509] = {enable=true, self=false,},	-- Frailty (Spirit Bomb Talent)
			[206491] = {enable=true, self=false,},	-- Nemesis (Talent)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[195072] = {enable=false,}, 
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
		},
	}
	
	
--------------------------------------------------------------------------------
-- Death Knight / 死亡騎士
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_DK] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[48707] = {enable=true,},   -- 反魔法護罩
			[48792] = {enable=true,},   -- 冰錮堅韌
			[49039] = {enable=true,},   -- 巫妖之軀
			[49222] = {enable=true,},   -- 骸骨之盾
			[51124] = {enable=true,},   -- Killing  Machine / 殺戮酷刑
			[52424] = {enable=true,},   -- 反擊風暴
			[53386] = {enable=true,},   -- Cinderglacier (Runeforge) /  冰燼
			[57330] = {enable=true,},   -- 凜冬號角
			[59052] = {enable=true,},   -- Rime (Freezing Fog) / 冰封之霧
			[81141] = {enable=true,},   -- 赤血災禍
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
			[56815] = {enable=true,},   -- Rune Strike / 符文打擊
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[55095] = {enable=true, self=true,},    -- 冰霜熱疫
			[55078] = {enable=true, self=true,},    -- 血魄瘟疫
			[81130] = {enable=true, self=true,},    -- 血色熱疫
			[81326] = {enable=true, self=false},	-- 物理易傷
			[115798] = {enable=true, self=false,},	-- 弱化攻擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[43265] = {enable=false,},   -- 死亡凋零
			[45524] = {enable=false,},   -- 冰鍊術
			[47476] = {enable=false,},   -- 絞殺
			[47528] = {enable=false,},   -- 心智冰封
			[48707] = {enable=false,},   -- 反魔法護罩
			[48721] = {enable=false,},   -- 沸血術
			[48792] = {enable=false,},   -- 冰錮堅韌
			[49020] = {enable=false,},   -- 滅寂
			[49576] = {enable=false,},   -- 死亡之握
			[49998] = {enable=false,},   -- 死亡打擊
			[77575] = {enable=false,},   -- 疫病爆發
			[85948] = {enable=false,},   -- 膿瘡潰擊
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				-- ActiveTalentGroup=1,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 57330,	-- 57330 凜冬號角
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {	-- 玩家身上沒有凜風號角、並且凜冬號角不在CD中
										SubCheckAndOp = true,		-- 編號1的邏輯運算可以無視
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "player",		-- 檢測對象，為"玩家"
										CheckAuraNotExist = 57330,	-- 檢測"凜冬號角"Buff是否"不存在"
										CheckCD = 57330,		-- 檢測"凜冬號角"技能是否"CD中"
									},
									[2] = {	-- 並且(true)，身上沒有戰士的力量怒吼(不檢查此技能之CD)
										SubCheckAndOp = true,		-- true:並且, false:或者
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "player",		-- 檢測對象，為"玩家"
										CheckAuraNotExist = 6673, 	-- 檢測"力量怒吼"Buff是否"不存在"
									},
								},
							},
						},
					},
				},
			},
			[2] = {
				enable=false,
				LocX = 80,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=1,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 49222,	-- 49222 駭骨之盾
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_AURA",
										UnitType = "player",
										CheckAuraNotExist = 49222,
										CheckCD = 49222,
									},
								},
							},
						},
					},
				},
			},
		},
	}


--------------------------------------------------------------------------------
-- Druid / 德魯依
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_DRUID] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[16870] = {enable=true,},   -- Omen of Clarity / 清晰預兆
			[16886] = {enable=true,},   -- Nature's Grace / 自然之賜
			[48517] = {enable=true,},   -- Eclipse / 日蝕
			[48518] = {enable=true,},   -- Eclipse / 月蝕
			[50334] = {enable=true,},   -- Berserk / 狂暴
			[52610] = {enable=true,},   -- Savage Roar / 兇蠻咆嘯
			[81192] = {enable=true,},   -- 月沐
			[93400] = {enable=true,},   -- 射星術
			[93622] = {enable=true,},   -- 狂暴(免費割碎)
			[100977] = {enable=true,},  -- 共生
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			--[770] = {enable=true, self=true,},    -- Faerie Fire / 精靈之火
			--[16857] = {enable=true, self=true,},  -- Faerie Fire (Feral) / 精靈之火(野性)
			--[48564] = {enable=true, self=true,},  -- Mangle(Bear) / 割碎(熊形態)
			[99] = {enable=true, self=true,},       -- 挫志咆哮
			[774] = {enable=true, self=true,},      -- 回春術
			[1079] = {enable=true, self=true,},     -- Rip / 撕扯
			[1822] = {enable=true, self=true,},     -- Rake / 掃擊
			[5570] = {enable=true, self=true,},     -- Insect Swarm / 蟲群
			[8921] = {enable=true, self=true,},     -- Moonfire / 月火術
			[33745] = {enable=true, self=true,},    -- Lacerate / 割裂
			[33763] = {enable=true, self=true,},    -- 生命之花
			[33876] = {enable=true, self=true,},    -- Mangle(Cat) / 割碎(獵豹形態)
			[52610] = {enable=true, self=true,},    -- 兇蠻咆哮
			[81326] = {enable=true, self=false},	-- 物理易傷
			[93402] = {enable=true, self=true,},    -- Moonfire / 日炎術
			[115798] = {enable=true, self=false,},	-- 弱化攻擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[17116] = {enable=false,},   -- 自然迅捷
			[18562] = {enable=false,},   -- 迅癒
			[29166] = {enable=false,},   -- 啟動
			[48438] = {enable=false,},   -- 野性痊癒
			[78674] = {enable=false,},   -- 星湧術
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=1,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 5217,	-- 5217 猛虎之怒
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 3,
										PowerType = "ENERGY",
										CheckCD = 5217,
										PowerCompType = 2,
										PowerLessThanValue = 40,
									},
								},
							},
						},
					},
				},
			},
			[2] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 48438,	-- 48438 野性癒合
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 48438,
										PowerCompType = 4,
										PowerLessThanValue = 5000,
									},
								},
							},
						},
					},
				},
			},
			[3] = {
				enable=false,
				LocX = 80,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 29166,	-- 29166 啟動
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 29166,
										PowerCompType = 2,
										PowerLessThanPercent = 80,
									},
								},
							},
						},
					},
				},
			},
			[4] = {
				enable=false,
				LocX = -80,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 18562,	-- 18562 迅愈
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 18562,
										PowerCompType = 4,
										PowerLessThanValue = 1700,
									},
								},
							},
						},
					},
				},
			},
			-- 1.割碎 2.無割裂，補割裂 3.有割裂無粉碎，補粉碎 4.痛擊 5.揮擊
			[5] = {
				enable=false,
				LocX = -80,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=1,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 33878,	-- 割碎
						Checks = {
							[1] = {
								CheckAndOp = true,	-- 可無視
								SubChecks = {
									[1] = {	-- 玩家怒氣滿15以上，並且割碎不在CD中
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_POWER",	-- 事件別，屬於"能量異動類"
										UnitType = "player",		-- 檢測對象，為"玩家"
										PowerTypeNum = 1, 		-- 能量類型編號(1:怒氣)
										PowerType = "RAGE",		-- 能量類型, 可無視
										CheckCD = 33878,		-- 檢測"割碎"技能是否"CD中"
										PowerCompType = 4,		-- 能量, true:小於等於, false:大於等於
										PowerLessThanValue = 15,	-- 15
									},
								},
							},
						},
					},
					[2] = {
						SpellIconID = 33745,	-- 割裂
						Checks = {
							[1] = {
								CheckAndOp = true,	-- 可無視
								SubChecks = {
									[1] = {	-- 玩家怒氣滿15以上，並且割裂不在CD中
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_POWER",       -- 事件別，屬於"能量異動類"
										UnitType = "player",            -- 檢測對象，為"玩家"
										PowerTypeNum = 1,               -- 能量類型編號(1:怒氣)
										PowerType = "RAGE",             -- 能量類型, 可無視
										CheckCD = 33745,                -- 檢測"割裂"技能是否"CD中"
										PowerCompType = 4,          -- 能量, true:小於等於, false:大於等於
										PowerLessThanValue = 15,        -- 15
									},
								},
							},
							[2] = {
								CheckAndOp = true,	-- true:並且, false:或者
								SubChecks = {
									[1] = {	-- 目標身上無割裂
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "target",		-- 檢測對象，為"目標"
										CastByPlayer = true,		-- true:只檢測玩家施放的
										CheckAuraNotExist = 33745,	-- 檢測"割裂"DeBuff是否"不存在"
									},
									[2] = {	-- 或者(false)，目標身上割裂小於等於2層堆疊
										SubCheckAndOp = false,		-- true:並且, false:或者
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "target",		-- 檢測對象，為"目標"
										CheckAuraExist = 33745,		-- 檢測"割裂"DeBuff是否"存在"
										CastByPlayer = true,		-- true:只檢測玩家施放的
										StackCompType = 2,		-- 堆疊層數, true:小於等於, false:大於等於
										StackLessThanValue = 2,		-- 2層
									},
									[3] = {	-- 或者(false)，目標身上割裂剩餘時間，小於等於3秒
										SubCheckAndOp = false,		-- true:並且, false:或者
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "target",		-- 檢測對象，為"目標"
										CheckAuraExist = 33745,		-- 檢測"割裂"DeBuff是否"存在"
										CastByPlayer = true,		-- true:只檢測玩家施放的
										TimeCompType = 2,		-- 剩餘時間, true:小於等於, false:大於等於
										TimeLessThanValue = 3,		-- 3秒
									},
								},
							},
						},
					},
					[3] = {
						SpellIconID = 80313,	-- 粉碎
						Checks = {
							[1] = {
								CheckAndOp = true,	-- 可無視
								SubChecks = {
									[1] = {	-- 玩家怒氣滿15以上，並且粉碎不在CD中
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_POWER",       -- 事件別，屬於"能量異動類"
										UnitType = "player",            -- 檢測對象，為"玩家"
										PowerTypeNum = 1,               -- 能量類型編號(1:怒氣)
										PowerType = "RAGE",             -- 能量類型, 可無視
										CheckCD = 80313,                -- 檢測"割碎"技能是否"CD中"
										PowerCompType = 4,          -- 能量, true:小於等於, false:大於等於
										PowerLessThanValue = 15,        -- 15
									},
									[2] = {	-- 並且(true)，目標身上有玩家施放的割裂Debuff
										SubCheckAndOp = true,		-- true:並且, false:或者
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "target",		-- 檢測對象，為"目標"
										CastByPlayer = true,		-- true:只檢測玩家施放的
										CheckAuraExist = 33745,		-- 檢測"割裂"DeBuff是否"存在"
									},
								},
							},
							[2] = {
								CheckAndOp = true,	-- true:並且, false:或者
								SubChecks = {
									[1] = {	-- 玩家身上的粉碎Buff剩餘時間，小於等於3秒
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "player",		-- 檢測對象，為"玩家"
										CheckAuraExist = 80951,		-- 檢測"粉碎"Buff是否"存在"
										TimeCompType = 2,		-- 剩餘時間, true:小於等於, false:大於等於
										TimeLessThanValue = 3,		-- 3秒
									},
									[2] = {	-- 或者(false)，玩家身上沒有粉碎Buff
										SubCheckAndOp = false,		-- true:並且, false:或者
										EventType = "UNIT_AURA",	-- 事件別，屬於"AURA異動類"
										UnitType = "player",		-- 檢測對象，為"玩家"
										CheckAuraNotExist = 80951,	-- 檢測"粉碎"Buff是否"不存在"
									},
								},
							},
						},
					},
					[4] = {
						SpellIconID = 77758,	-- 痛擊
						Checks = {
							[1] = {
								CheckAndOp = true,	-- 可無視
								SubChecks = {
									[1] = {	-- 玩家怒氣滿25以上，並且痛擊不在CD中
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_POWER",       -- 事件別，屬於"能量異動類"
										UnitType = "player",            -- 檢測對象，為"玩家"
										PowerTypeNum = 1,               -- 能量類型編號(1:怒氣)
										PowerType = "RAGE",             -- 能量類型, 可無視
										CheckCD = 77758,                -- 檢測"痛擊"技能是否"CD中"
										PowerCompType = 4,          -- 能量, true:小於等於, false:大於等於
										PowerLessThanValue = 25,        -- 25
									},
								},
							},
						},
					},
					[5] = {
						SpellIconID = 779,	-- 揮擊
						Checks = {
							[1] = {
								CheckAndOp = true,	-- 可無視
								SubChecks = {
									[1] = {	-- 玩家怒氣滿25以上，並且揮擊不在CD中
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_POWER",       -- 事件別，屬於"能量異動類"
										UnitType = "player",            -- 檢測對象，為"玩家"
										PowerTypeNum = 1,               -- 能量類型編號(1:怒氣)
										PowerType = "RAGE",             -- 能量類型, 可無視
										CheckCD = 779,                  -- 檢測"揮擊"技能是否"CD中"
										PowerCompType = 4,          -- 能量, true:小於等於, false:大於等於
										PowerLessThanValue = 15,        -- 15
									},
								},
							},
						},
					},
				},
			},
		},
	}


--------------------------------------------------------------------------------
-- Hunter / 獵人
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_HUNTER] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[3045] = {enable=true,},    -- 急速射擊
			[34471] = {enable=true,},   -- 獸心
			[34477] = {enable=true,},   -- 誤導
			[35079] = {enable=true,},   -- 誤導
			[53220] = {enable=true,},   -- Improved Stead Shot / 強化穩固射擊
			[53257] = {enable=true,},   -- 眼鏡蛇之擊
			[53434] = {enable=true,},   -- 狂野呼喚
			[56453] = {enable=true,},   -- Lock and Load / 蓄勢待發
			[70728] = {enable=true,},   -- 攻擊弱點
			[82925] = {enable=true,},   -- 準備、就緒、瞄準…
			[82926] = {enable=true,},   -- 射擊!
			[89388] = {enable=true,},   -- 攻擊敵人
			[94007] = {enable=true,},   -- 連殺
			[95712] = {enable=true,},   -- X光瞄準器
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
			[53351] = {enable=true,},   -- Kill Shot / 擊殺射擊
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[1978] = {enable=true, self=true,},     -- 毒蛇釘刺
			[1130] = {enable=true, self=true,},     -- 獵人印記
			[19503] = {enable=true, self=true,},    -- 驅散射擊
			[63468] = {enable=true, self=true,},    -- 穿透射擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[781] = {enable=false,},     -- 逃脫
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
		},
	}


--------------------------------------------------------------------------------
-- Mage / 法師
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_MAGE] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[12042] = {enable=true,},   -- 秘法強化
			[12051] = {enable=true,},   -- 喚醒
			[36032] = {enable=true,},   -- Arcane Blast / 奧衝堆疊
			[44544] = {enable=true,},   -- Fingers of Frost / 冰霜之指
			[48108] = {enable=true,},   -- Hot Streak / 焦炎之痕
			[57761] = {enable=true,},   -- Brain Freeze / 腦部凍結
			[64343] = {enable=true,},   -- 衝擊
			[79683] = {enable=true,},   -- Missile Barrage! / 秘法飛彈!
			[87023] = {enable=true,},   -- 燒灼
			[116257] = {enable=true,},   -- 塑能師之能 (喚醒)
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[12654] = {enable=true, self=true,},    -- 點燃
			[22959] = {enable=true, self=true,},    -- 火焰重擊
			[31589] = {enable=true, self=true,},    -- Slow / 減速術
			[44457] = {enable=true, self=true,},    -- Living Bomb / 活體爆彈
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[122] = {enable=false,},     -- 冰霜新星
			[1953] = {enable=false,},    -- 閃現
			[12042] = {enable=false,},   -- 秘法強化
			[12043] = {enable=false,},   -- 氣定神閒
			[12051] = {enable=false,},   -- 喚醒
			[44572] = {enable=false,},   -- 極度冰凍
			[45438] = {enable=false,},   -- 寒冰屏障
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				-- ActiveTalentGroup=1,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 12051,	-- 12051 喚醒
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 12051,
										PowerCompType = 2,
										PowerLessThanPercent = 40,
									},
								},
							},
						},
					},
				},
			},
		},
	}


--------------------------------------------------------------------------------
-- Paladin / 聖騎士
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_PALADIN] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[498] = {enable=true,},     -- 聖佑術
			[642] = {enable=true,},     -- 聖盾術
			[20925] = {enable=true,},   -- 崇聖護盾
			[31821] = {enable=true,},   -- 虔誠光環
			[31842] = {enable=true,},   -- 神恩術
			[31850] = {enable=true,},   -- 忠誠防衛者
			[31884] = {enable=true,},   -- 復仇之怒
			[53657] = {enable=true,},   -- 純潔審判
			[59578] = {enable=true,},   -- 戰爭藝術
			[84963] = {enable=true,},   -- 異端審問
			[86659] = {enable=true,},   -- 遠古諸王守護者(坦)
			[86698] = {enable=true,},   -- 遠古諸王守護者(DD)
			[90174] = {enable=true,},	-- 神聖意圖
			[105809] = {enable=true,},   -- 神聖復仇者
			[114163] = {enable=true,},	-- 永恆之火
			[114637] = {enable=true,},	-- 榮耀壁壘
			[121467] = {enable=true,},	-- 雪白之盾
			[132403] = {enable=true,},	-- 公正之盾(減傷)
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
			[24275] = {enable=true,},   -- Hammer of Wrath / 憤怒之錘
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[853] = {enable=true, self=true,},      -- 制裁之錘
			[10326] = {enable=true, self=true,},    -- 退邪術
			[20066] = {enable=true, self=true,},    -- 懺悔
			[31803] = {enable=true, self=true,},    -- 譴責
			[81298] = {enable=true, self=true},		-- 奉獻
			[81326] = {enable=true, self=false},	-- 物理易傷
			[110300] = {enable=true, self=true,},	-- 罪之重擔
			[114163] = {enable=true, self=true,},	-- 永恆之火
			[114916] = {enable=true, self=true,},	-- 死刑宣判
			[115798] = {enable=true, self=false,},	-- 弱化攻擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[498] = {enable=false,},     -- 聖佑術
			[853] = {enable=false,},     -- 制裁之鎚
			[20066] = {enable=false,},   -- 懺悔
			[20925] = {enable=false,},   -- 崇聖護盾
			[28730] = {enable=false,},   -- 奧流之術
			[54428] = {enable=false,},   -- 神性祈求
			[96231] = {enable=false,},   -- 責難
			[114157] = {enable=false,},   -- 死刑宣判
			[114158] = {enable=false,},   -- 聖光之錘
			[114165] = {enable=false,},   -- 神聖稜石
			[115750] = {enable=false,},   -- 盲目之光
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 85673,	-- 85673 榮耀聖言
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 9,
										PowerType = "HOLY_POWER",
										CheckCD = 85673,
										PowerCompType = 4,
										PowerLessThanValue = 3,
									},
									[2] = {
										SubCheckAndOp = true,
										EventType = "UNIT_HEALTH",
										UnitType = "target",
										HealthCompType = 2,
										HealthLessThanPercent = 80,
									},
								},
							},
						},
					},
					[2] = {
						SpellIconID = 85222,	-- 85222 黎明曙光(手電筒)
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 9,
										PowerType = "HOLY_POWER",
										CheckCD = 85222,
										PowerCompType = 4,
										PowerLessThanValue = 3,
									},
								},
							},
						},
					},
				},
			},
			[2] = {
				["enable"] = false,
				["LocX"] = 0,
				["LocY"] = -200,
				["IconSize"] = 80,
				["IconAlpha"] = 0.5,
				["IconPoint"] = "Top",
				["IconRelatePoint"] = "Top",
				["ActiveTalentGroup"] = 1,
				["HideOnLostTarget"] = true,
				["Spells"] = {
					[1] = {
						["SpellIconID"] = 24275,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["HealthLessThanPercent"] = 20,
										["UnitType"] = "target",
										["CheckCD"] = 24275,
										["SubCheckResult"] = false,
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_HEALTH",
										["HealthCompType"] = 1,
									}, -- [1]
								},
							}, -- [1]
						},
					}, -- [1]
					[2] = {
						["SpellIconID"] = 879,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckResult"] = false,
										["UnitType"] = "player",
										["SubCheckAndOp"] = true,
										["CheckCD"] = 879,
										["CheckAuraExist"] = 59578,
										["EventType"] = "UNIT_AURA",
									}, -- [1]
								},
							}, -- [1]
						},
					}, -- [2]
					[3] = {
						["SpellIconID"] = 85256,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["PowerType"] = "HOLY_POWER",
										["UnitType"] = "player",
										["PowerLessThanValue"] = 3,
										["CheckCD"] = 85256,
										["PowerTypeNum"] = 9,
										["EventType"] = "UNIT_POWER",
										["PowerCompType"] = 4,
									}, -- [1]
									[2] = {
										["SubCheckResult"] = false,
										["UnitType"] = "player",
										["SubCheckAndOp"] = false,
										["CheckCD"] = 85256,
										["CheckAuraExist"] = 90174,
										["EventType"] = "UNIT_AURA",
									}, -- [2]
								},
							}, -- [1]
						},
					}, -- [3]
					[4] = {
						["SpellIconID"] = 20271,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_POWER",
										["SubCheckResult"] = false,
										["PowerType"] = "MANA",
										["UnitType"] = "player",
										["PowerLessThanValue"] = 90,
										["PowerTypeNum"] = 0,
										["CheckCD"] = 20271,
										["PowerCompType"] = 4,
									}, -- [1]
								},
							}, -- [1]
						},
					}, -- [4]
					[5] = {
						["SpellIconID"] = 35395,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_POWER",
										["SubCheckResult"] = false,
										["PowerType"] = "HOLY_POWER",
										["UnitType"] = "player",
										["PowerLessThanValue"] = 3,
										["PowerTypeNum"] = 9,
										["CheckCD"] = 35395,
										["PowerCompType"] = 1,
									}, -- [1]
									[2] = {
										["SubCheckAndOp"] = false,
										["EventType"] = "UNIT_POWER",
										["SubCheckResult"] = false,
										["PowerType"] = "MANA",
										["UnitType"] = "player",
										["PowerLessThanValue"] = 100,
										["PowerTypeNum"] = 0,
										["CheckCD"] = 35395,
										["PowerCompType"] = 4,
									}, -- [2]
								},
							}, -- [1]
						},
					}, -- [5]
				},
			}, -- [2]
		},
	}


--------------------------------------------------------------------------------
-- Priest / 牧師
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_PRIEST] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[17] = {enable=true,},      -- 真言術:盾
			[6788] = {enable=true,},    -- 虛弱靈魂
			[47585] = {enable=true,},   -- 影散
			[63735] = {enable=true,},   -- 機緣回復
			[77487] = {enable=true,},   -- 暗影寶珠
			[81206] = {enable=true,},   -- 脈輪運轉:庇護
			[81208] = {enable=true,},   -- 脈輪運轉:平靜
			[81209] = {enable=true,},   -- 脈輪運轉:譴責
			[81782] = {enable=true,},   -- 真言術:壁
			[87153] = {enable=true,},   -- 黑天使
			[87160] = {enable=true,},   -- 心靈熔蝕
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[139] = {enable=true, self=true,},      -- 恢復
			[589] = {enable=true, self=true,},      -- Shadow Word: Pain / 暗言術:痛
			[2944] = {enable=true, self=true,},     -- Devouring Plague / 噬靈瘟疫
			[6788] = {enable=true, self=true,},     -- Weakened Soul / 虛弱靈魂
			[34914] = {enable=true, self=true,},    -- Vampiric Touch / 吸血之觸
			[47753] = {enable=true, self=true,},    -- 神禦之盾
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[17] = {enable=false,},      -- 真言術:盾
			[10060] = {enable=false,},   -- 注入能量
			[28730] = {enable=false,},   -- 奧流之術
			[32379] = {enable=false,},   -- 暗言術:死
			[33206] = {enable=false,},   -- 痛苦鎮壓
			[34433] = {enable=false,},   -- 暗影惡魔
			[47540] = {enable=false,},   -- 懺悟
			[47585] = {enable=false,},   -- 影散
			[81700] = {enable=false,},   -- 大天使
			[88684] = {enable=false,},   -- 聖言術:寧
			[89485] = {enable=false,},   -- 心靈專注
			[126172] = {enable=false,},   -- 脈輪運轉
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				-- ActiveTalentGroup=1,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 34433,	-- 34433 暗影惡魔
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 34433,
										PowerCompType = 2,
										PowerLessThanPercent = 70,
									},
								},
							},
						},
					},
				},
			},
			[2] = {
				enable=false,
				LocX = 80,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 32379,	-- 32379 暗言術: 死
						Checks = {
							[1] = {	-- 目標血量小於等於25%、並且暗言術:死不在CD中。
								CheckAndOp = true,
								SubChecks = {
									[1] = {	-- 目標血量小於等於25%、並且暗言術:死不在CD中。
										SubCheckAndOp = true,		-- 可無視
										EventType = "UNIT_HEALTH",	-- 事件別，屬於"血量異動類"
										UnitType = "target",		-- 檢測對象，為"目標"
										CheckCD = 32379,		-- 檢測"暗言術: 死"技能是否"CD中"
										HealthCompType = 2,		-- 血量, true:小於等於, false:大於等於
										HealthLessThanPercent = 25,	-- 25%
									},
								},
							},
						},
					},
				},
			},
			[3] = {
				enable=false,
				LocX = -80,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 8092,	-- 8092 心靈震爆
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {	-- 心爆未CD，且MP夠
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 8092,
										PowerCompType = 4,
										PowerLessThanValue = 3500,
									},
									[2] = {	-- 且 黑球存在
										SubCheckAndOp = true,
										EventType = "UNIT_AURA",
										UnitType = "player",
										CheckAuraExist = 77487,
									},
								},
							},
							[2] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {	-- 紅球剩3秒
										SubCheckAndOp = true,
										EventType = "UNIT_AURA",
										UnitType = "player",
										CheckAuraExist = 95799,
										TimeCompType = 2,
										TimeLessThanValue = 3,
									},
									[2] = {	-- 或 紅球不存在
										SubCheckAndOp = false,
										EventType = "UNIT_AURA",
										UnitType = "player",
										CheckAuraNotExist = 95799,
									},
									[3] = {	-- 或 黑球x3
										SubCheckAndOp = false,
										EventType = "UNIT_AURA",
										UnitType = "player",
										CheckAuraExist = 77487,
										StackCompType = 4,
										StackLessThanValue = 3,
									},
								},
							},
						},
					},
					[2] = {
						SpellIconID = 34914,	-- 34914 吸血之觸
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {	-- 吸血之觸未CD，且MP夠
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 34914,
										PowerCompType = 4,
										PowerLessThanValue = 3300,
									},
								},
							},
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {	-- 吸血之觸剩2秒
										SubCheckAndOp = true,
										EventType = "UNIT_AURA",
										UnitType = "target",
										CastByPlayer = true,
										CheckAuraExist = 34914,
										TimeCompType = 2,
										TimeLessThanValue = 2,
									},
									[2] = {	-- 或 目標身上 無 吸血之觸
										SubCheckAndOp = false,
										EventType = "UNIT_AURA",
										UnitType = "target",
										CastByPlayer = true,
										CheckAuraNotExist = 34914,
									},
								},
							},
						},
					},
					[3] = {
						SpellIconID = 589,	-- 589 暗言術:痛
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 589,
										PowerCompType = 4,
										PowerLessThanValue = 4100,
									},
									[2] = {
										SubCheckAndOp = true,
										EventType = "UNIT_AURA",
										UnitType = "target",
										CastByPlayer = true,
										CheckAuraNotExist = 589,
									},
								},
							},
						},
					},
					[4] = {
						SpellIconID = 2944,	-- 2944 噬靈瘟疫
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 0,
										PowerType = "MANA",
										CheckCD = 2944,
										PowerCompType = 4,
										PowerLessThanValue = 4800,
									},
									[2] = {
										SubCheckAndOp = true,
										EventType = "UNIT_AURA",
										UnitType = "target",
										CastByPlayer = true,
										CheckAuraNotExist = 2944,
									},
								},
							},
						},
					},
				},
			},
		},
	}


--------------------------------------------------------------------------------
-- Rogue / 盜賊
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_ROGUE] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[5171] = {enable=true,},    -- 切割
			[1966] = {enable=true,},    -- 佯攻
			[57934] = {enable=true,},   -- 偷天換日
			[59628] = {enable=true,},   -- 偷天換日
			[58427] = {enable=true,},   -- 極限殺戮
			[84590] = {enable=true,},   -- 致命殺陣
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
			[14251] = {enable=true,},   -- Riposte / 還擊
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[1943] = {enable=true, self=true,},     -- 割裂
			[84617] = {enable=true, self=true,},    -- 揭底之擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[65961] = {enable=false,},   -- 暗影披風
			[79140] = {enable=false,},   -- 宿怨
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				enable=false,
				LocX = 0,
				LocY = -200,
				IconSize = 80,
				IconAlpha = 0.5,
				IconPoint = "Top",
				IconRelatePoint = "Top",
				--ActiveTalentGroup=2,	-- nil for all, 1 for primary, 2 for secondary
				Spells = {
					[1] = {
						SpellIconID = 53,	-- 53 背刺
						Checks = {
							[1] = {
								CheckAndOp = true,
								SubChecks = {
									[1] = {
										SubCheckAndOp = true,
										EventType = "UNIT_POWER",
										UnitType = "player",
										PowerTypeNum = 3,
										PowerType = "ENERGY",
										CheckCD = 53,
										PowerCompType = 4,
										PowerLessThanValue = 40,
									},
									[2] = {
										SubCheckAndOp = true,
										EventType = "UNIT_HEALTH",
										UnitType = "target",
										HealthCompType = 2,
										HealthLessThanPercent = 35,
									},
								},
							},
						},
					},
				},
			},
		},
	}


--------------------------------------------------------------------------------
-- Shaman / 薩滿
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_SHAMAN] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[324] = {enable=true,},		-- 閃電之盾
			[16166] = {enable=true,},	-- 精通元素
			[16188] = {enable=true,},	-- 先祖迅捷
			[30884] = {enable=true,},	-- 自然守護者
			[53390] = {enable=true,},	-- 治療之潮
			[53817] = {enable=true, stack=5,},	-- 氣漩武器
			[73685] = {enable=true,},	-- 釋放大地生命
			[79206] = {enable=true,},	-- 靈行者之賜
			[105763] = {enable=true,},	-- 心靈激勵 (法力之潮)
			[114050] = {enable=true,},	-- 卓越術（元素）
			[114051] = {enable=true,},	-- 卓越術（增強）
			[114052] = {enable=true,},	-- 卓越術（恢復）
			[114893] = {enable=true,},	-- 石之壁壘
			[118522] = {enable=true,},	-- 元素衝擊
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[8050] = {enable=true, self=true,},		-- 烈焰震擊
			[51514] = {enable=true, self=true,},	-- 妖術
			[100955] = {enable=true, self=true,},	-- 雷霆風暴
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[16166] = {enable=false,},	-- 精通元素
			[16188] = {enable=false,},	-- 先祖迅捷
			[16190] = {enable=false,},	-- 法力之潮圖騰
			[51505] = {enable=false,},	-- 熔岩爆發
			[61295] = {enable=false,},	-- 激流
			[73680] = {enable=false,},	-- 釋放元素能量
			[73920] = {enable=false,},	-- 治癒之雨
			[79206] = {enable=false,},	-- 靈行者之賜
			[98008] = {enable=false,},	-- 靈魂連結圖騰
			[108270] = {enable=false,},	-- 石之壁壘圖騰
			[108271] = {enable=false,},	-- 星界轉移
			[108280] = {enable=false,},	-- 療癒之潮圖騰
			[108285] = {enable=false,},	-- 元素呼喚

		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
			[1] = {
				["enable"] = false,
				["LocX"] = 0,
				["LocY"] = -200,
				["IconSize"] = 80,
				["IconAlpha"] = 0.5,
				["IconPoint"] = "Top",
				["IconRelatePoint"] = "Top",
				["ActiveTalentGroup"] = 2,
				["HideOnLeaveCombat"] = true,
				["Spells"] = {
					[1] = {
						["SpellIconID"] = 51505,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_POWER",
										["UnitType"] = "player",
										["PowerTypeNum"] = 0,
										["PowerType"] = "MANA",
										["CheckCD"] = 51505,
										["PowerCompType"] = 4,
										["PowerLessThanValue"] = 380,
									}, -- [1]
								},
							}, -- [1]
						},
					}, -- [1]
					[2] = {
						["SpellIconID"] = 8050,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "target",
										["CheckCD"] = 8050,
										["CheckAuraNotExist"] = 8050,
										["CastByPlayer"] = true,
									}, -- [1]
									[2] = {
										["SubCheckAndOp"] = false,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "target",
										["CastByPlayer"] = true,
										["CheckAuraExist"] = 8050,
										["CheckCD"] = 8050,
										["TimeCompType"] = 2,
										["TimeLessThanValue"] = 5,
									}, -- [2]
								},
							}, -- [1]
						},
					}, -- [2]
					[3] = {
						["SpellIconID"] = 8042,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "target",
										["CheckCD"] = 8042,
										["CastByPlayer"] = true,
										["CheckAuraExist"] = 8050,
										["TimeCompType"] = 5,
										["TimeLessThanValue"] = 5,
									}, -- [1]
									[2] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "player",
										["CheckAuraExist"] = 324,
										["StackCompType"] = 4,
										["StackLessThanValue"] = 9,
									}, -- [2]
								},
							}, -- [1]
							[2] = {
								["CheckAndOp"] = false,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "target",
										["CheckCD"] = 8042,
										["CastByPlayer"] = true,
										["CheckAuraExist"] = 8050,
										["TimeCompType"] = 3,
										["TimeLessThanValue"] = 5,
									}, -- [1]
									[2] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "player",
										["CheckAuraExist"] = 324,
										["StackCompType"] = 4,
										["StackLessThanValue"] = 7,
									}, -- [2]
								},
							}, -- [2]
						},
					}, -- [3]
				},
			}, -- [1]
			[2] = {
				["enable"] = false,
				["LocX"] = 0,
				["LocY"] = -200,
				["IconSize"] = 80,
				["IconAlpha"] = 0.5,
				["IconPoint"] = "Top",
				["IconRelatePoint"] = "Top",
				["ActiveTalentGroup"] = 2,
				["Spells"] = {
					[1] = {
						["SpellIconID"] = 324,
						["Checks"] = {
							[1] = {
								["CheckAndOp"] = true,
								["SubChecks"] = {
									[1] = {
										["SubCheckAndOp"] = true,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "player",
										["CheckCD"] = 324,
										["CheckAuraExist"] = 324,
										["CastByPlayer"] = true,
										["TimeCompType"] = 1,
										["TimeLessThanValue"] = 60,
									}, -- [1]
									[2] = {
										["SubCheckAndOp"] = false,
										["EventType"] = "UNIT_AURA",
										["UnitType"] = "player",
										["CheckAuraNotExist"] = 324,
									}, -- [2]
								},
							}, -- [1]
						},
					}, -- [1]
				},
			}, -- [2]
		},
	}


--------------------------------------------------------------------------------
-- Warlock / 術士
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_WARLOCK] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[18095] = {enable=true,},   -- 夜暮
			[19028] = {enable=true,},   -- 靈魂鏈結
			[34939] = {enable=true,},   -- 反衝
			[47283] = {enable=true,},   -- Empowered Imp / 強力小鬼
			[63158] = {enable=true,},   -- 屠虐
			[63167] = {enable=true,},   -- 屠虐
			[71165] = {enable=true,},   -- 熔火之心
			[85383] = {enable=true,},   -- 強化靈魂之火
			[89937] = {enable=true,},   -- 魔化火光
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[172] = {enable=true, self=true,},      -- Corruption / 腐蝕術
			[348] = {enable=true, self=true,},      -- Immolate / 獻祭
			[686] = {enable=true, self=true,},      -- 末日災厄
			[603] = {enable=true, self=true,},      -- 暗影箭
			[980] = {enable=true, self=true,},      -- 痛苦災厄
			[1490] = {enable=true, self=true,},     -- Curse of the Elements / 元素詛咒
			[29722] = {enable=true, self=true,},    -- 燒盡
			[30108] = {enable=true, self=true,},    -- 痛苦動盪
			[48181] = {enable=true, self=true,},    -- 蝕魂術
			[50796] = {enable=true, self=true,},    -- 混沌箭
			[80240] = {enable=true, self=true,},    -- 浩劫災厄
			[86000] = {enable=true, self=true,},    -- 古爾丹詛咒
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[17962] = {enable=false,},   -- 焚燒
			[59672] = {enable=false,},   -- 惡魔化身
			[71165] = {enable=false,},   -- 熔火之心
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
		},
	}


--------------------------------------------------------------------------------
-- Warrior / 戰士
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_WARRIOR] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[871] = {enable=true,},     -- 盾牆(防禦姿態)
			[1134] = {enable=true,},    -- 心靈之怒
			[2565] = {enable=true,},    -- 盾牌格檔(防禦姿態)
			[12328] = {enable=true,},   -- 橫掃攻擊(戰鬥，狂暴姿態)
			[12964] = {enable=true,},   -- 戰鬥沈思
			[12975] = {enable=true,},   -- 破斧沈舟
			[14202] = {enable=true,},   -- 狂怒(等級 3)
			[16491] = {enable=true,},   -- 血之狂熱
			[20230] = {enable=true,},   -- 反擊風暴(戰鬥姿態)
			[23885] = {enable=true,},   -- 嗜血
			[23920] = {enable=true,},   -- 法術反射(戰鬥，防禦姿態)
			[29841] = {enable=true,},   -- 復甦之風(等級1)
			[32216] = {enable=true,},   -- 勝利
			[46916] = {enable=true,},   -- Bloodsurge (Slam) / 熱血沸騰
			[50227] = {enable=true,},   -- 劍盾合壁
			[52437] = {enable=true,},   -- 驟亡
			[55694] = {enable=true,},   -- 狂怒恢復
			[57516] = {enable=true,},   -- 狂怒(等級 2)
			[57519] = {enable=true,},   -- 狂怒(等級 2)
			[60503] = {enable=true,},   -- 血腥體驗
			[65156] = {enable=true,},   -- 勢不可當
			[82368] = {enable=true,},   -- 勝利
			[84586] = {enable=true,},   -- 屠宰(等級 3)
			[84620] = {enable=true,},   -- 堅守陣線
			[85730] = {enable=true,},   -- 沉著殺機
			[86627] = {enable=true,},   -- 激動
			[87096] = {enable=true,},   -- 雷擊
			[90806] = {enable=true,},   -- 處決者
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[81326] = {enable=true, self=false},	-- 物理易傷
			[94009] = {enable=true, self=true,},    -- 撕裂
			[115798] = {enable=true, self=false,},	-- 弱化攻擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
		},
	}


--------------------------------------------------------------------------------
-- Monk / 武僧
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_MONK] = {
		-- Primary Alert / 本職業提醒區
		["ITEMS"] = {
			[115175] = {enable=true,},   -- 舒和之霧
			[118674] = {enable=true,},   -- 精活迷霧
			[119611] = {enable=true,},   -- 回生迷霧
			[120954] = {enable=true,},   -- 石形絕釀
			[125359] = {enable=true,},   -- 虎威
			[132120] = {enable=true,},   -- 迷霧繚繞
		},
		-- Alternate Alert / 本職業額外提醒區
		["ALTITEMS"] = {
		},
		-- Target Alert / 目標提醒區
		["TARITEMS"] = {
			[81326] = {enable=true, self=false},	-- 物理易傷
			[115078] = {enable=true, self=true,},   -- 點穴
			[115175] = {enable=true, self=true,},   -- 舒和之霧
			[115798] = {enable=true, self=false,},	-- 弱化攻擊
			[119611] = {enable=true, self=true,},   -- 回生迷霧
			[132120] = {enable=true, self=true,},   -- 迷霧繚繞
			[115798] = {enable=true, self=false,},	-- 弱化攻擊
			[117737] = {enable=true, self=false,},	-- 癲狂 (魔古山4王)
			[117756] = {enable=true, self=false,},	-- 怯懦 (魔古山4王)
			[123059] = {enable=true, self=false,},	-- 動搖 (恐懼5王增傷buff)
			[123471] = {enable=true, self=false},	-- 增強 (恐懼之心2王)
			[126958] = {enable=true, self=false,},	-- 納拉卡煞之觸 (魔古山小怪)
			[127372] = {enable=true, self=false,},	-- 不穩定血清
			[131996] = {enable=true, self=false,},	-- 痛擊 (豐泉台4王大招)			
			[132726] = {enable=true, self=false,},	-- 成長
			[136431] = {enable=true, self=false,},	-- 龜殼衝擊 (雷霆4王增傷)
		},
		-- Spell Cooldown Alert / 本職業技能CD區
		["SCDITEMS"] = {
			[101545] = {enable=false,},   -- 翔龍腳
			[109132] = {enable=false,},   -- 迅空翻
			[113656] = {enable=false,},   -- 狂拳連打
			[115008] = {enable=false,},   -- 真氣飛龍穿
			[115078] = {enable=false,},   -- 點穴
			[115080] = {enable=false,},   -- 幽冥掌
			[115098] = {enable=false,},   -- 真氣波
			[115151] = {enable=false,},   -- 回生迷霧
			[115203] = {enable=false,},   -- 石形絕釀
			[115288] = {enable=false,},   -- 凝神絕釀
			[115399] = {enable=false,},   -- 真氣絕釀
			[116705] = {enable=false,},   -- 天矛鎖喉手
			[116847] = {enable=false,},   -- 飛玉疾風
			[119381] = {enable=false,},   -- 掃葉腿
			[119392] = {enable=false,},   -- 鐵牛衝鋒波
			[122278] = {enable=false,},   -- 卸勁訣
			[122470] = {enable=false,},   -- 乾坤挪移
			[122783] = {enable=false,},   -- 祛魔訣
			[123904] = {enable=false,},   -- 召喚白虎雪怒
		},
		-- GroupEvent Alert / 本職業條件技能區
		["GRPITEMS"] = {
		},
	}


--------------------------------------------------------------------------------
-- Other / 跨職業共通區
--------------------------------------------------------------------------------
	EADef_Items[EA_CLASS_OTHER] = {
		[17] = {enable=true,},		-- 牧師 - 真言術:盾
		[7001] = {enable=true,},	-- 牧師 - 光束泉恢復
		[10060] = {enable=true,},	-- 牧師 - 注入能量
		[16191] = {enable=true,},	-- 薩滿 - 法力之潮圖騰
		[29166] = {enable=true,},	-- 德魯依 - 啟動
		[33206] = {enable=true,},	-- 牧師 - 痛苦鎮壓
		[81782] = {enable=true,},	-- 牧師 - 真言術:壁
		[98007] = {enable=true,},	-- 薩滿 - 靈魂連結圖騰

		[32182] = {enable=true,},	-- 薩滿 - 英勇氣概
		[80353] = {enable=true,},	-- 法師 - 時間扭曲
		[90355] = {enable=true,},	-- 獵人 - 上古狂亂

		[104993] = {enable=true,},	-- 玉魂 (附魔)
		[116631] = {enable=true,},	-- 巨像 (附魔)
		[120032] = {enable=true,},	-- 鋼鐵之舞 (附魔)
		[125487] = {enable=true,},	-- 光紋 (附魔)
		[125488] = {enable=true,},	-- 暗輝 (附魔)
		[126266] = {enable=true,},	-- 啟蒙 (空的水果桶)
		[126577] = {enable=true,},	-- 心靈光輝 (宇宙之光)
		[126582] = {enable=true,},	-- 不移之力 (雷神的最後命令)
		[126599] = {enable=true,},	-- 疾速 (翠玉車駕刻像)
		[126640] = {enable=true,},	-- 烈光 (太陽之魂)
		[126646] = {enable=true,},	-- 觸碰不及 (夢魘之物)
		[126657] = {enable=true,},	-- 矯捷 (暗霧旋渦)
		[128984] = {enable=true,},	-- 天神賜福 (雪怒聖物)
		[128985] = {enable=true,},	-- 天神賜福 (赤吉聖物)
		[128986] = {enable=true,},	-- 天神賜福 (雪怒聖物)
		[128987] = {enable=true,},	-- 天神賜福 (玉龍聖物)
		[128988] = {enable=true,},	-- 天神護佑 (怒兆聖物)
		[136087] = {enable=true,},	-- 暖心者 (影潘之襲的堅定咒符)
		[138728] = {enable=true,},	-- 戰略轉進 (影潘之襲的堅定咒符)
	
		[117878] = {enable=true,overgrow=6},	-- 超載 (魔古山寶庫5王-艾拉崗)
		[118091] = {enable=true,overgrow=5},	-- 褻瀆之地 (豐泉台1王)
		[118977] = {enable=true,redsectext=5},	-- 無畏 (豐泉台4王)
		[122752] = {enable=true,},	-- 暗影之息 (豐泉台2王)
		[122768] = {enable=true,overgrow=8},	-- 恐怖陰影 (豐泉台2王)
		[122858] = {enable=true,},	-- 日光籠罩 (豐泉台2王)
		[123081] = {enable=true,},	-- 敏感 (恐懼之心3王)
		[123121] = {enable=true,overgrow=8},	-- 噴濺 (豐泉台3王)
		[123180] = {enable=true,},	-- 疾風步 (恐懼之心2王)
		[123474] = {enable=true,overgrow=2},	-- 壓倒性襲擊 (恐懼之心2王)
		[123707] = {enable=true,overgrow=3},	-- 女皇之眼 (恐懼之心6王)
		[130742] = {enable=true,redsectext=5},	-- 無畏 (豐泉台4王)
		
		[136767] = {enable=true,overgrow=5},	-- 三重穿刺 (雷霆2王)
		[136903] = {enable=true,overgrow=9},	-- 嚴寒之擊 (雷霆3王-霜王)
		[136911] = {enable=true,overgrow=9},	-- 嚴寒之擊 (雷霆3王-霜王)
		[138002] = {enable=true,},	-- 流質效果 (雷霆1王增傷)
		[138349] = {enable=true,},	-- 靜電創傷 (雷霆1王)
		[138389] = {enable=true,},	-- 靜電創傷 (雷霆1王)
		
	}


end