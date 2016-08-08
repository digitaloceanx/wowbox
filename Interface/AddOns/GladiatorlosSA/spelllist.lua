function GladiatorlosSA:GetSpellList ()
	return {
		auraApplied ={					-- aura applied [spellid] = ".mp3 file name",

		--general

			--demon hunter
			[198589] = "blur",
			[196718] = "darkness",
			[162264] = "metamorphosis",
			[187827] = "metamorphosis",
			[188501] = "spectralSight",
			[196555] = "netherwalk",
			[207810] = "netherBond",
		
			--druid
				-- OLD
			[61336] = "survivalInstincts", -- 求生本能
			[22812] = "barkskin", -- 樹皮術
			[132158] = "naturesSwiftness", -- 自然迅捷
			[22842] = "frenziedRegeneration", -- 狂暴恢復
			[1850] = "dash", -- 疾奔
			[50334] = "berserk", -- 狂暴
			[69369] = "predatorSwiftness", -- PredatorSwiftness 猛獸迅捷
				-- Mist of Pandaria
			[124974] = "natureVigil",
			[112071] = "celestialAlignment", -- Replaced in legion
			[102342] = "ironBark",
			[102351] = "canarionWard",
				-- WoD
			[155835] = "BristlingFur",
				-- Legion
			[29166] = "innervate",
			[194223] = "celestialAlignment",
			

			--paladin
				-- OLD
			[1022] = "handOfProtection", -- 保護
			[1044] = "handOfFreedom", -- 自由
			[642] = "divineShield", -- 無敵
			[6940] = "sacrifice", -- 犧牲祝福
			[31884] = "avengingWrath",
			[31842] = "avengingWrath",
				-- Mist of pandaria
			[114039] = "handOfPurity",
			[105809] = "holyAvenger",
			[114917] = "healingExecution",
				-- WoD
			[152262] = "Seraphim",
			[204150] = "lightAegis",
			[31850] = "ardentDefender",
			[205191] = "eyeForAnEye",
			[184662] = "vengeanceShield",
			[224668] = "crusade",
			[86659] = "ancientKings",
			[228049] = "forgottenQueens",

			--rogue
				-- OLD
			[51713] = "shadowDance", -- 暗影之舞
			[2983] = "sprint", -- 疾跑
			[31224] = "cloakOfShadows", -- 斗篷
			[13750] = "adrenalineRush", -- 衝動
			[5277] = "evasion", -- 閃避
			[74001] = "combatReadiness", -- 戰鬥就緒
			[51690] = "killingSpree", -- added to 2.2.2
				-- Mist of pandaria
			[114018] = "shroudOfConcealment",
				-- WoD
			[152151] = "ShadowReflection",
			[84747] = "deepInsight",
			[84746] = "moderateInsight",
				-- Legion
			[121471] = "shadowBlades",

			--warrior
				-- OLD
			[55694] = "enragedRegeneration", -- 狂怒恢復
			[871] = "shieldWall", --盾墻
			[18499] = "berserkerRage", -- 狂暴之怒
			[23920] = "spellReflection", -- 盾反
			[12328] = "sweepingStrikes", -- 橫掃攻擊
			[46924] = "bladestorm", -- 劍刃風暴
			[1719] = "recklessness", -- 魯莽
			[118038] = "dieByTheSword", -- add 2.3.6
				-- Mist of pandaria
			[114029] = "safeguard",
			[114030] = "vigilance",
			[107574] = "avatar",
			[12292] = "bloodbath", -- old death wish
				-- Legion
			[198817] = "sharpenBlade",
			[197690] = "defensestance",

			--priest
				-- OLD
			[81700] = "Archangel", -- add 2.2.2
			[33206] = "painSuppression", -- 痛苦壓制
			[6346] = "fearWard", -- 反恐
			[47585] = "dispersion", -- 消散
			[47788] = "guardianSpirit",
			[109964] = "spiritShell",
			[17] = "powerWordShield", -- added to 2.2.2
				-- Mist of pandaria
			[10060] = "powerInfusion",
				-- Legion
			[197862] = "archangelHealing",
			[197871] = "archangelDamage",
			[200183] = "apotheosis",
			[213610] = "holyWard",
			[197268] = "rayOfHope",
			[193223] = "surrenderToMadness",

			--shaman
				-- OLD
			[52127] = "waterShield", -- 水盾
			[30823] = "shamanisticRage", -- 薩滿之怒
			[974] = "earthShield", -- 大地之盾
			[16188] = "ancestralSwiftness", -- 自然迅捷
			[79206] = "spiritwalkersGrace",
			[16166] = "elementalMastery",
				-- Mist of pandaria
			[114050] = "ascendance",
			[114051] = "ascendance",
			[114052] = "ascendance",
			[118350] = "empower", -- moved from castsucces
			[118347] = "reinforce", -- moved from castsuccess
				-- Legion
			[210918] = "etherealForm",

			--mage
				-- OLD
			[45438] = "iceBlock", -- 寒冰屏障
			[12042] = "arcanePower", -- 秘法強化
			[12472] = "icyVeins", --冰脈
				-- Mist of pandaria
			[12043] = "presenceOfMind",
			[108839] = "iceFloes",
			[110909] = "alterTime",
				-- Legion
			[198111] = "temporalShield",
			[198144] = "iceForm",

			--dk
				-- OLD
			[49039] = "lichborne", -- 巫妖之軀
			[48792] = "iceboundFortitude", -- 冰固
			[55233] = "vampiricBlood", -- 血族之裔
			[51271] = "pillarofFrost",
			[48707] = "antiMagicShell",
				-- Mist of pandaria
			[115989] = "unholyBlight",
				-- WoD
			[152279] = "BreathOfSindragosa",
				-- Legion
			[219809] = "tombstone",
			[194679] = "runetap",
			[194844] = "bonestorm",
			[206977] = "bloodmirror",
			[207256] = "obliteration",
			[207319] = "corpseShield",

			--hunter
				-- OLD
			[19263] = "deterrence", -- 威懾
			[3045] = "rapidFire",
			[54216] = "mastersCall",
			[53480] = "roarOfSacrifice", -- pet skill
				-- Mist of pandaria
				-- Legion
			[186265] = "deterrence", -- Aspect of the Turtle
			[186257] = "cheetah",
			[212640] = "mendingBandage",

			--lock
				-- Mist of pandaria
			[108416] = "sacrificialPact",
			[108503] = "grimoireOfSacrifice",
			[113858] = "darkSoul",
			[113861] = "darkSoul",
			[113860] = "darkSoul",
			[104773] = "unendingResolve",
				-- Legion
			[196098] = "darkSoul", -- Updated for Legion
			[212295] = "netherWard",

			--monk
				-- Mist of pandaria
			[122278] = "dampenHarm",
			[122783] = "diffuseMagic",
			[120954] = "fortifyingBrew",
			[115176] = "zenMeditation",
			[116849] = "lifeCocoon",
			[122470] = "touchOfKarma",
				-- WoD
			[152175] = "HurricaneStrike",
			[152173] = "Serenity",
			[216113] = "fistweaving",
		},
		auraRemoved = {					-- aura removed [spellid] = ".mp3 file name",
				-- OLD
			[642] = "bubbleDown", -- 無敵結束
			[47585] = "dispersionDown", -- 消散結束
			[1022] = "protectionDown", -- 保護結束
			[31224] = "cloakDown", -- 斗篷結束
			[74001] = "combatReadinessDown", -- 戰鬥就緒結束
			[871] = "shieldWallDown", -- 盾墻結束
			[112048] = "shieldBarrierDown", -- Added
			[174926] = "shieldBarrierDown", -- Added
			[33206] = "PSDown", -- 壓制結束
			[5277] = "evasionDown", -- 閃避結束
			[45438] = "iceBlockDown", -- 冰箱結束
			[49039] = "lichborneDown", -- 巫妖之軀結束
			[48792] = "iceboundFortitudeDown", -- 冰固結束
			[19263] = "deterrenceDown", -- 威懾結束
			[48707] = "AntiMagicShellDown", -- Added
			[51690] = "killingSpreeDown", -- added to 2.2.2
			[114030] = "vigilanceDown",
			[84747] = "deepInsightDown",
			[118038] = "dieByTheSwordDown", -- add 2.3.6
				-- Mist of pandaria
			[108271] = "astralShiftDown",
			[120954] = "fortifyingBrewDown",
			[115176] = "zenMeditationDown",
			[122470] = "karmaDown", -- Added
			[118347] = "reinforceDown", -- Added
			[118350] = "empowerDown", -- Added
			[109964] = "spiritShellDown", -- Added
				-- Legion
			[219809] = "tombstoneDown",
			[206977] = "mirrorDown",
			[207319] = "corpseDown",
			[198589] = "blurDown",
			[196718] = "darknessDown",
			[162264] = "metamorphDown",
			[187827] = "metamorphDown",
			[188501] = "sightsDown",
			[196555] = "netherwalkDown",
			[207810] = "bondageDown",
			[186265] = "deterrenceDown",
			[198111] = "temporalDown",
			[198144] = "iceFormDown",
			[216113] = "fistingDown",
			[31850] = "defenderDown",
			[205191] = "eyeDown",
			[184662] = "vengeanceShieldDown",
			[213610] = "wardDown",
			[197268] = "hopeDown",
			[193223] = "madnessDown",
			[210918] = "etherealDown",
			[212295] = "netherWardDown",
			[86659] = "kingsDown",
			[228049] = "queensDown",
			[116849] = "lifeCocoonDown",
			--[102560] = "incarnationDown",
			--[102543] = "incarnationDown",
			--[102558] = "incarnationDown",
			--[33891] = "incarnationDown",
			[117679] = "incarnationDown",
			[197690] = "damageStance",
			},
		castStart = {					-- cast start [spellid] = ".mp3 file name",
			--general
			[2060] = "bigHeal", -- Heal (Holy Priest)
			[82326] = "bigHeal", -- Holy Light (Paladin)
			[77472] = "bigHeal", -- Healing Wave (Shaman)
			[5185] = "bigHeal", -- Healing Touch (Druid)
			[186263] = "bigHeal", -- Shadow Mend (Discipline/Shadow Priest)
			[116670] = "bigHeal", -- Vivify (MistweaveR)
			--[116694] = "bigHeal", -- Effuse (Mistweaver)
			--[124682] = "bigHeal", -- Enveloping Mists (Mistweaver)
			[2006] = "resurrection",
			[7328] = "resurrection",
			[2008] = "resurrection",
			[115178] = "resurrection",
			[50769] = "resurrection", -- 復活術 救贖 先祖之魂 復活
			[212040] = "resurrection", -- Druid Healer Legion
			[212051] = "resurrection", -- Monk Healer Legion
			[212036] = "resurrection", -- Priest Healer Legion
			[212056] = "resurrection", -- Paladin Healer Legion
			[212048] = "resurrection", -- Shaman Healer Legion

			--druid
				-- OLD
			[33786] = "cyclone", -- 吹風
				-- Mist of pandaria
			[339] = "entanglingRoots",

			--paladin
				-- Mist of pandaria
			[20066] = "repentance", -- 懺悔
			[115750] = "blindingLight",

			--rogue

			--warrior

			--priest
				-- OLD
			[9484] = "shackleUndead", -- 束縛亡靈
			[605] = "dominateMind", -- 精神控制
				-- Mist of pandaria
			[32375] = "massDispell",

			--shaman
			[51514] = "hex", -- 妖術

			--mage
				-- OLD
			[118] = "polymorph",
			[28272] = "polymorph",
			[61305] = "polymorph",
			[61721] = "polymorph",
			[61025] = "polymorph",
			[61780] = "polymorph",
			[28271] = "polymorph", -- 變形術 羊豬貓兔蛇雞龜
				-- Mist of pandaria
			[102051] = "frostjaw",

			--dk

			--hunter
			[982] = "revivePet", -- 復活寵物
			[120360] = "barrage", -- add 2.2.2
			[109259] = "powerShot", -- add 2.2.2
			[19386] = "wyvernSting", -- moved from cast_succes 2.3.4

			--warlock
				-- OLD
			[710] = "banish", -- 放逐術
			[5782] = "fear", -- 恐懼
			[691] = "summonDemon",
			[712] = "summonDemon",
			[697] = "summonDemon",
			[688] = "summonDemon",
				-- Mist of pandaria
			[112866] = "summonDemon", -- Fel Imp
			[112867] = "summonDemon", -- Void Lord
			[112870] = "summonDemon", -- Wrathguard
			[112868] = "summonDemon", -- Shivarra
			[112869] = "summonDemon", -- Observer
				-- WoD
			[152108] = "Cataclysm",
				-- Legion
			[157695] = "demonBolt",

			-- monk
		},
		castSuccess = {					--cast success [spellid] = ".mp3 file name",
			--general
			[58984] = "shadowmeld", -- 影遁
			[20594] = "stoneform", -- 石像形態
			[7744] = "willOfTheForsaken", -- 亡靈意志
			[42292] = "trinket2",
			[59752] = "everyMan", -- Updated with the racial change in Legion.
--			[214027] = "trinket1", -- Adaptation Legion
--			[195756] = "trinket1", -- Adaptation Legion
--			[195885] = "trinket1", -- Adaptation Legion
--			[195895] = "trinket1", -- Adaptation Legion
--			[195845] = "trinket1", -- Adaptation Legion
			[208683] = "trinket2", -- Gladiator's Medallion Legion
			[195710] = "trinket3", -- Honorable Medallion Legion
			
			--demonhunter
			[183752] = "consumeMagic",
			[179057] = "chaosNova",
			[206649] = "leotherasEye",
			[205604] = "reverseMagic",
			[206803] = "rainFromAbove",
			[205629] = "trample",
			[205630] = "illidansGrasp",
			[202138] = "gripSigil",
			[207684] = "fearSigil",
			[202137] = "silenceSigil",

			--druid
				-- OLD
			[740] = "tranquility",
			[78675] = "solarBeam", -- 太陽光束
				-- Mist of pandaria
			[102280] = "displacerBeast",
			[108238] = "renewal",
			[102359] = "massEntanglement",
			[33831] = "fNatureRoot",
			[102703] = "fNatureStun",
			[102693] = "fNatureHealing",
			[102706] = "fNatureProtect",
			[99] = "disorientingRoar",
			[5211] = "mightyBash",
			[102560] = "incarnationElune",
			[102543] = "incarnationKitty",
			[102558] = "incarnationUrsoc",
			[33891] = "incarnationTree",
			[102417] = "wildCharge",
			[102383] = "wildCharge",
			[49376] = "wildCharge",
			[16979] = "wildCharge",
			[102416] = "wildCharge",
			[102401] = "wildCharge",
			[106839] = "skullBash", -- added to 2.2.2
				-- Legion
			[203651] = "overgrowth",
			[201664] = "demoRoar",
			
			--paladin
				-- OLD
			[96231] = "rebuke", -- 責難
			[853] = "hammerofjustice", -- 制裁			
			[31821] = "auraMastery", -- 光環精通
				-- Mist of pandaria
			[105593] = "fistOfJustice",
			[85499] = "speedOfLight",
				-- Legion
			[205656] = "pony",
			[190784] = "pony",
			[115750] = "blindingLight",
			[210220] = "holyWrath",
			[210256] = "sanctuary",

			--rogue
				-- OLD
			[2094] = "blind", -- 致盲
			[1766] = "kick", -- 腳踢
			[14185] = "preparation", -- 準備就緒
			[1856] = "vanish", -- 消失
			[76577] = "smokeBomb", -- 煙霧彈
			[79140] = "vendetta",
				-- LEGION
			[207777] = "dismantle",
			[207736] = "shadowyDuel",

			--warrior
				-- OLD
			[114028] = "massSpellReflection", -- moved from SpellAuraApplied
			[97462] = "rallyingCry", -- 集結怒吼
			[5246] = "fear3", -- 破膽怒吼
			[6552] = "pummel", -- 拳擊
			[107566] = "staggeringShout",
			[2457] = "battlestance", -- 戰鬥姿態
			[71] = "defensestance", -- 防禦姿態
				-- Mist of pandaria				
			[102060] = "disruptingShout",
			[46968] = "shockwave",
			[118000] = "dragonRoar",
			[107570] = "stormBolt",
			[114192] = "mockingBanner",
				-- WoD
			[152277] = "Ravager",
			[176289] = "SiegeBreaker", -- Maybe useless
			[174926] = "shieldBarrier", -- Added
			[112048] = "shieldBarrier", -- Added
				-- Legion
			[1160] = "demoShout",

			--priest
				-- old
			[8122] = "fear4", -- 心靈尖嘯
			[34433] = "shadowFiend", -- 暗影惡魔
			[64044] = "disarm3", -- 心靈驚駭
			[15487] = "silence", -- 沉默
			[64843] = "divineHymn",
			[19236] = "desperatePrayer",
				-- Mist of pandaria
			[112833] = "spectralGuise",
			[108920] = "voidTendrils",
			[123040] = "mindbender",
			[121135] = "cascade",		

			[81209] = "chakraChastise",
			[81206] = "chakraSanctuary",
			[81208] = "chakraSerenity",
				-- Legion
			[204263] = "shiningForce",
			[2050] = "holySerenity",
			[88625] = "chastise",
			[205369] = "mindBomb",
			[211522] = "psyfiend",
			[108968] = "voidshift",

			--shaman
				-- old
			[8177] = "grounding", -- 根基圖騰
			[8143] = "tremorTotem", -- 戰慄圖騰
			[98008] = "spiritlinktotem", -- 靈魂鏈接圖騰
			[370] = "purge", -- added to 2.2.2
				-- Mist of pandaria
			[108270] = "stoneBulwark",
			[51485] = "earthgrab",
			[2484] = "earthbind",
			[108273] = "windwalk",
			[108285] = "callOfTheElements",
			[108287] = "totemicProjection",
			[108280] = "healingTide",
			[108281] = "ancestralGuidance",
			[118345] = "pulverize",
			[2894] = "fireElemental",
			[2062] = "earthElemental",
			[108269] = "capacitor",
			[108271] = "astralShift",
			[57994] = "windShear",
				-- WoD
			[152256] = "StormElementalTotem",
			[152255] = "LiquidMagma",	-- Maybe useless
				-- Legion
			[198067] = "fireElemental", -- Updated for Legion
			[198103] = "earthElemental", -- Updated for Legion
			[192058] = "capacitor", -- Updated for Legion
			[192077] = "windRushTotem",
			[196932] = "hexTotem",
			[192249] = "StormElementalTotem", -- Updated for Legion
			[192222] = "LiquidMagma", -- Updated for Legion
			[204330] = "pvpTotem",
			[204331] = "pvpTotem",
			[204332] = "pvpTotem",
			[204437] = "lightningLasso",
			[207399] = "reincarnationTotem",
			[198838] = "protectionTotem",
			[204336] = "grounding", -- Updated for Legion

			--mage
				-- old
			[11129] = "Combustion", -- 燃火
			[11958] = "coldSnap", -- 急速冷卻
			[44572] = "deepFreeze", -- 深結
			[2139] = "counterspell", -- 法術反制
			[66] = "invisibility", -- 隐形术
			[113724] = "ringOfFrost", -- 霜之環
			[12051] = "evocation",
				-- Mist of pandaria
			[110959] = "greaterInvisibility",
				-- WoD
			[152087] = "PrismaticCrystal",
			[153595] = "CometStorm", -- Maybe useless
			[153561] = "Meteor",
				-- Legion
			[198158] = "massInvis",
			[190319] = "Combustion", -- Legion Combustion

			--dk
				-- old
			[47528] = "mindFreeze", -- 心智冰封
			[47476] = "strangulate", -- 絞殺
			[47568] = "runeWeapon", -- 強力符文武器
			[49206] = "gargoyle", -- 召喚石像鬼
			[77606] = "darkSimulacrum", -- 黑暗幻象
			[51052] = "antiMagicZone",
				-- Mist of pandaria
			[108194] = "asphyxiate",
			[108199] = "gorefiendGrasp",
			[108201] = "desacratedGround",
			[108200] = "remorselessWinter",
				-- WoD
			[152280] = "Defile",
				-- Legion
			[207167] = "blindingSleet",
			[204160] = "chillStreak",
			--[190778] = "sindragosaFury",
			[130736] = "soulReaper",
			[207349] = "arbiterGargoyle",

			--hunter
				-- old
			[147362] = "counterShot", -- 反制射击 
			[1499] = "freezingTrap",
			[60192] = "freezingTrap2",
			[19801] = "tranquilizingShot", -- added to 2.2.2
				-- Mist of pandaria
			[109248] = "bindingShot",
			[109304] = "Exhilaration",
			[131894] = "murderOfCrows",
			[126216] = "direBeast",
			[126215] = "direBeast",
			[126214] = "direBeast",
			[126213] = "direBeast",
			[122811] = "direBeast",
			[122809] = "direBeast",
			[122807] = "direBeast",
			[122806] = "direBeast",
			[122804] = "direBeast",
			[122802] = "direBeast",
			[121118] = "direBeast",
			[120697] = "lynxRush",
			[121818] = "stampede", -- Updated in Legion
				-- Legion
			[202914] = "spiderSting",
			[208652] = "direHawk",
			[205691] = "direBasilisk",
			[201430] = "stampede",
			[187707] = "muzzle",
			[187650] = "freezingTrap2",
			[191241] = "stickyBomb",
			[213691] = "scatterShot",
			[209789] = "freezingArrow",

			--warlock
				-- old
			[6789] = "mortalCoil", -- aka Death Coil 死亡纏繞
			[5484] = "terrorHowl", -- 恐懼嚎叫 Howl of Terror - was fear2 2.2.3 -- Updated for Legion
			[19647] = "spellLock", -- 法術封鎖
			[48020] = "demonicCircleTeleport", -- 惡魔法陣:傳送
			[30283] = "shadowfury",
				-- Mist of pandaria
			[108359] = "darkRegeneration",
			[111397] = "bloodFear",
			[108482] = "unboundWill",
			--[108505] = "archimondesVengeance",
			[104316] = "dreadstalkers",
			[110913] = "darkBargain",
			[111859] = "grimoireOfService",
			[111895] = "grimoireOfService",
			[111896] = "grimoireOfService",
			[111897] = "grimoireOfService",
			[111898] = "grimoireOfService",
				-- Legion
			[212619] = "callFelPuppy",

			-- monk
				-- Mist of pandaria
			[116841] = "tigersLust",
			[115399] = "chiBrew",
			[119392] = "chargingOxWave",
			[119381] = "legSweep",
			[116847] = "rushingJadeWind",
			[123904] = "invokeXuen",
			[115078] = "paralysis",
		--	[115315] = "oxStatue", Disabled due to low value
		--	[115313] = "serpentStatue", Disabled due to low value
			[116705] = "spearStrike",
			[123761] = "manatea",
			[119996] = "transfer",
				-- WoD
			[157535] = "BreathOfTheSerpent", -- maybe useless
				-- Legion
			[137639] = "stormEarthFire",
			[115310] = "revival",
			[198898] = "craneSong",
			[132578] = "invokeOx",
			[198664] = "invokeCrane",
		},
		friendlyInterrupt = {			--friendly interrupt [spellid] = ".mp3 file name",
			[19647] = "lockout", -- Spell Lock
			[2139] = "lockout", -- Counter Spell
			[1766] = "lockout", -- Kick
			[6552] = "lockout", -- Pummel
			[47528] = "lockout", -- Mind Freeze
			[96231] = "lockout", -- Rebuke
			[93985] = "lockout", -- Skull Bash
			[97547] = "lockout", -- Solar Beam
			[57994] = "lockout", -- Wind Shear
			[116705] = "lockout", -- Spear Hand Strike
			[147362] = "lockout", -- Counter Shot
			[183752] = "lockout", -- Consume Magic (Demon Hunter)
			[187707] = "lockout", -- Muzzle (Survival Hunter)
		},
	}
end

