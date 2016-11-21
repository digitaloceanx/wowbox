local GSA = GladiatorlosSA
local gsadb
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("GladiatorlosSA")
local LSM = LibStub("LibSharedMedia-3.0")
local options_created = false -- ***** @

local GSA_OUTPUT = {["MASTER"] = L["Master"],["SFX"] = L["SFX"],["AMBIENCE"] = L["Ambience"],["MUSIC"] = L["Music"]}

function GSA:ShowConfig()
	for i=1,2 do InterfaceOptionsFrame_OpenToCategory(GetAddOnMetadata("GladiatorlosSA", "Title")) end -- ugly fix
end

function GSA:ShowConfig2() -- ***** @
	if options_created == false then
		self:OnOptionCreate()
	end
	AceConfigDialog:Open("GladiatorlosSA")
end

function GSA:ChangeProfile()
	gsadb = self.db1.profile
	for k,v in GladiatorlosSA:IterateModules() do
		if type(v.ChangeProfile) == 'function' then
			v:ChangeProfile()
		end
	end
end

function GSA:AddOption(name, keyName)
	return AceConfigDialog:AddToBlizOptions("GladiatorlosSA", name, "GladiatorlosSA", keyName)
end

local function setOption(info, value)
	local name = info[#info]
	gsadb[name] = value
	if value then
		PlaySoundFile("Interface\\Addons\\"..gsadb.path_menu.."\\"..name..".ogg",gsadb.output_menu);
	end
end

local function getOption(info)
	local name = info[#info]
	return gsadb[name]
end

local function spellOption(order, spellID, ...)
	local spellname, _, icon = GetSpellInfo(spellID)				
	if (spellname ~= nil) then
		return {
			type = 'toggle',
			name = "\124T" .. icon .. ":24\124t" .. spellname,							
			desc = function () 
				GameTooltip:SetHyperlink(GetSpellLink(spellID));
				--GameTooltip:Show();
			end,
			descStyle = "custom",
					order = order,
		}
	else
		GSA.log("spell id: " .. spellID .. " is invalid")
		return {
			type = 'toggle',
			name = "unknown spell, id:" .. spellID,	
			order = order,
		}
	end
end

local function listOption(spellList, listType, ...)
	local args = {}
	for k, v in pairs(spellList) do
		local GSA_SpellName = GSA.spellList[listType][v]
		if GSA_SpellName then
			rawset (args, GSA_SpellName, spellOption(k, v))
		else 
		end
	end
	return args
end

function GSA:MakeCustomOption(key)
	local options = self.options.args.custom.args
	local db = gsadb.custom
	options[key] = {
		type = 'group',
		name = function() return db[key].name end,
		set = function(info, value) local name = info[#info] db[key][name] = value end,
		get = function(info) local name = info[#info] return db[key][name] end,
		order = db[key].order,
		args = {
			name = {
				name = L["name"],
				type = 'input',
				set = function(info, value)
					if db[value] then GSA.log(L["same name already exists"]) return end
					db[value] = db[key]
					db[value].name = value
					db[value].order = #db + 1
					db[value].soundfilepath = "Interface\\AddOns\\GladiatorlosSA\\Voice_Custom\\"..value..".ogg"
					db[key] = nil
					options[value] = options[key]
					options[key] = nil
					key = value
				end,
				order = 10,
			},
			spellid = {
				name = L["spellid"],
				type = 'input',
				order = 20,
				pattern = "%d+$",
			},
			remove = {
				type = 'execute',
				order = 25,
				name = L["Remove"],
				confirm = true,
				confirmText = L["Are you sure?"],
				func = function() 
					db[key] = nil
					options[key] = nil
				end,
			},
			existingsound = {
				name = L["Use existing sound"],
				type = 'toggle',
				order = 41,
			},
			soundfilepath = {
				name = L["file path"],
				type = 'input',
				width = 'double',
				order = 26,
				disabled = function() return db[key].existingsound end,
			},
			test = {
				type = 'execute',
				order = 28,
				name = L["Test"],
				disabled = function() return db[key].existingsound end,
				func = function() PlaySoundFile(db[key].soundfilepath, "Master") end,
			},
			NewLinetest = {
					type= 'description',
					order = 29,
					name= '',
			},
			existinglist = {
				name = L["choose a sound"],
				type = 'select',
				dialogControl = 'LSM30_Sound',
				values =  LSM:HashTable("sound"),
				disabled = function() return not db[key].existingsound end,
				order = 40,
			},
			NewLine3 = {
				type= 'description',
				order = 45,
				name= '',
			},
			eventtype = {
				type = 'multiselect',
				order = 50,
				name = L["event type"],
				values = self.GSA_EVENT,
				get = function(info, k) return db[key].eventtype[k] end,
				set = function(info, k, v) db[key].eventtype[k] = v end,
			},
			sourcetypefilter = {
				type = 'select',
				order = 59,
				name = L["Source type"],
				values = self.GSA_TYPE,
			},
			desttypefilter = {
				type = 'select',
				order = 60,
				name = L["Dest type"],
				values = self.GSA_TYPE,
			},
			sourceuidfilter = {
				type = 'select',
				order = 61,
				name = L["Source unit"],
				values = self.GSA_UNIT,
			},
			sourcecustomname = {
				type= 'input',
				order = 62,
				name= L["Custom unit name"],
				disabled = function() return not (db[key].sourceuidfilter == "custom") end,
			},
			destuidfilter = {
				type = 'select',
				order = 65,
				name = L["Dest unit"],
				values = self.GSA_UNIT,
			},
			destcustomname = {
				type= 'input',
				order = 68,
				name = L["Custom unit name"],
				disabled = function() return not (db[key].destuidfilter == "custom") end,
			},
			--[[NewLine5 = {
				type = 'header',
				order = 69,
				name = "",
			},]]
		}
	}
end
	
function GSA:OnOptionCreate()
	gsadb = self.db1.profile
	options_created = true -- ***** @
	self.options = {
		type = "group",
		name = GetAddOnMetadata("GladiatorlosSA", "Title"),
		args = {
			general = {
				type = 'group',
				name = L["General"],
				desc = L["General options"],
				set = setOption,
				get = getOption,
				order = 1,
				args = {
					enableArea = {
						type = 'group',
						inline = true,
						name = L["Enable area"],
						order = 1,
						args = {
							all = {
								type = 'toggle',
								name = L["Anywhere"],
								desc = L["Alert works anywhere"],
								order = 1,
							},
							arena = {
								type = 'toggle',
								name = L["Arena"],
								desc = L["Alert only works in arena"],
								disabled = function() return gsadb.all end,
								order = 2,
							},
							NewLine1 = {
								type= 'description',
								order = 3,
								name= '',
							},
							battleground = {
								type = 'toggle',
								name = L["Battleground"],
								desc = L["Alert only works in BG"],
								disabled = function() return gsadb.all end,
								order = 4,
							},
							field = {
								type = 'toggle',
								name = L["World"],
								desc = L["Alert works anywhere else then anena, BG, dungeon instance"],
								disabled = function() return gsadb.all end,
								order = 5,
							}
						},
					},
					voice = {
						type = 'group',
						inline = true,
						name = L["Voice config"],
						order = 2,
						args = {
							path = {
								type = 'select',
								name = L["Default / Female voice"], -- added to 2.3
								desc = L["Select the default voice pack of the alert"], -- added to 2.3
								values = self.GSA_LANGUAGE,
								order = 1,
							},
							volumn = {
								type = 'range',
								max = 1,
								min = 0,
								step = 0.1,
								name = L["Master Volume"],
								desc = L["adjusting the voice volume(the same as adjusting the system master sound volume)"],
								set = function (info, value) SetCVar ("Sound_MasterVolume",tostring (value)) end,
								get = function () return tonumber (GetCVar ("Sound_MasterVolume")) end,
								order = 6,
							},
						},
					},
					advance = {
						type = 'group',
						inline = true,
						name = L["Advance options"],
						order = 3,
						args = {
							smartDisable = {
								type = 'toggle',
								name = L["Smart disable"],
								desc = L["Disable addon for a moment while too many alerts comes"],
								order = 1,
							},
							throttle = {
								type = 'range',
								max = 5,
								min = 0,
								step = 0.1,
								name = L["Throttle"],
								desc = L["The minimum interval of each alert"],
								disabled = function() return not gsadb.smartDisable end,
								order = 2,
							},
							NewLineOutput = {
								type= 'description',
								order = 3,
								name= '',
							},
							outputUnlock = {
								type = 'toggle',
								name = L["Change Output"],
								desc = L["Unlock the output options"],
								order = 8,
								confirm = true,
								confirmText = L["Are you sure?"],
							},
							output_menu = {
								type = 'select',
								name = L["Output"],
								desc = L["Select the default output"],
								values = GSA_OUTPUT,
								order = 10,
								disabled = function() return not gsadb.outputUnlock end,
							},
						},
					},
				},
			},
			spells = {
				type = 'group',
				name = L["Abilities"],
				desc = L["Abilities options"],
				set = setOption,
				get = getOption,
				childGroups = "tab",
				order = -2,
				args = {
				menu_voice = {
						type = 'group',
						inline = true,
						name = L["Voice menu config"], 
						order = -2,
						args = {
							path_menu = {
								type = 'select',
								name = L["Choose a test voice pack"],
								desc = L["Select the menu voice pack alert"], 
								values = self.GSA_LANGUAGE,
								order = 1,
							},

						},
				},
				spellGeneral = {
						type = 'group',
						name = L["Disable options"],
						desc = L["Disable abilities by type"],
						inline = true,
						order = -1,
						args = {
							aruaApplied = {
								type = 'toggle',
								name = L["Disable Buff Applied"],
								desc = L["Check this will disable alert for buff applied to hostile targets"],
								order = 1,
							},
							aruaRemoved = {
								type = 'toggle',
								name = L["Disable Buff Down"],
								desc = L["Check this will disable alert for buff removed from hostile targets"],
								order = 2,
							},
							castStart = {
								type = 'toggle',
								name = L["Disable Spell Casting"],
								desc = L["Chech this will disable alert for spell being casted to friendly targets"],
								order = 3,
							},
							castSuccess = {
								type = 'toggle',
								name = L["Disable special abilities"],
								desc = L["Check this will disable alert for instant-cast important abilities"],
								order = 4,
							},
							interrupt = {
								type = 'toggle',
								name = L["Disable friendly interrupt"],
								desc = L["Check this will disable alert for successfully-landed friendly interrupting abilities"],
								order = 6,
							},
--							worldquest = {
--								type = 'toggle',
--								disabled = true, --Remove later
--								name = L["DisablePvPWorldQuests"],
--								desc = L["DisablePvPWorldQuestsDesc"],
--								order = 5,
--							},
						},
					},
					spellAuraApplied = {
						type = 'group',
						--inline = true,
						name = L["Buff Applied"],
						disabled = function() return gsadb.aruaApplied end,
						order = 1,
						args = {
							aonlyTF = {
								type = 'toggle',
								name = L["Target and Focus Only"],
								desc = L["Alert works only when your current target or focus gains the buff effect or use the ability"],
								order = 1,
							},
							drinking = { 
								type = 'toggle',
								name = L["Alert Drinking"],
								desc = L["In arena, alert when enemy is drinking"],
								order = 3,
							},
							--general = {
							--	type = 'group',
							--	inline = true,
							--	name = L["General Abilities"],
							--	order = 4,
							--	args = listOption({42292,20594,7744},"auraApplied"),
							--},
							dk	= {
								type = 'group',
								inline = true,
								name = L["|cffC41F3BDeath Knight|r"],
								order = 5,
								args = listOption({49039,48792,55233,51271,48707,115989,152279,219809,194679,194844,206977,207256,207319,114556},"auraApplied"),
							},
							demonhunter = {
								type = 'group',
								inline = true,
								name = L["|cffA330C9Demon Hunter|r"],
								order = 6,
								args = listOption({198589,196718,162264,187827,188501,196555,207810},"auraApplied"),
							},
							druid = {
								type = 'group',
								inline = true,
								name = L["|cffFF7D0ADruid|r"],
								order = 7,
								args = listOption({61336,22812,22842,1850,69369,124974,102342,102351,155835,29166,194223,200851},"auraApplied"),
							},
							hunter = {
								type = 'group',
								inline = true,
								name = L["|cffABD473Hunter|r"],
								order = 8,
								args = listOption({19263,54216,53480,186265,186257,212640,193526,186289},"auraApplied"), 
							},
							mage = {
								type = 'group',
								inline = true,
								name = L["|cff69CCF0Mage|r"],
								order = 9,
								args = listOption({45438,12042,12472,108839,110909,198111,198144,86949},"auraApplied"),
							},
							monk = {
								type = 'group',
								inline = true,
								name = L["|cFF00FF96Monk|r"],
								order = 10,
								args = listOption({201318,115203,122278,122783,115176,201325,116849,152175,152173,122470,216113},"auraApplied"),
							},
							paladin = {
								type = 'group',
								inline = true,
								name = L["|cffF58CBAPaladin|r"],
								order = 11,
								args = listOption({1022,1044,642,6940,31884,105809,31842,152262,204150,31850,205191,184662,224668,86659,228049},"auraApplied"), 
							},
							preist	= {
								type = 'group',
								inline = true,
								name = L["|cffFFFFFFPriest|r"],
								order = 12,
								args = listOption({10060,33206,47585,47788,109964,17,197862,197871,200183,197268,193223},"auraApplied"),
							},
							rogue = {
								type = 'group',
								inline = true,
								name = L["|cffFFF569Rogue|r"],
								order = 13,
								args = listOption({2983,31224,13750,5277,74001,152151,51690,121471,185313,199754,31230,202665},"auraApplied"), 
							},
							shaman	= {
								type = 'group',
								inline = true,
								name = L["|cff0070daShaman|r"],
								order = 14,
								args = listOption({108271,79206,16166,114050,114051,114052,210918,204293},"auraApplied"), 
							},
							warlock	= {
								type = 'group',
								inline = true,
								name = L["|cff9482C9Warlock|r"],
								order = 15,
								args = listOption({108416,108503,104773,196098,212295},"auraApplied"),
							},
							warrior	= {
								type = 'group',
								inline = true,
								name = L["|cffC79C6EWarrior|r"],
								order = 16,
								args = listOption({871,18499,23920,46924,12292,1719,107574,114030,118038,198817,197690},"auraApplied"), 
							},
						},
					},
					spellAuraRemoved = {
						type = 'group',
						--inline = true,
						name = L["Buff Down"],
						disabled = function() return gsadb.aruaRemoved end,
						order = 2,
						args = {
							ronlyTF = {
								type = 'toggle',
								name = L["Target and Focus Only"],
								desc = L["Alert works only when your current target or focus gains the buff effect or use the ability"],
								order = 1,
							},
							dk = {
								type = 'group',
								inline = true,
								name = L["|cffC41F3BDeath Knight|r"],
								order = 4,
								args = listOption({48792,49039,48707,219809,206977,207319},"auraRemoved"),
							},
							demonhunter = {
								type = 'group',
								inline = true,
								name = L["|cffA330C9Demon Hunter|r"],
								order = 5,
								args = listOption({198589,196718,162264,187827,188501,196555,207810},"auraRemoved"),
							},
							druid = {
								type = 'group',
								inline = true,
								name = L["|cffFF7D0ADruid|r"],
								order = 6,
								args = listOption({117679,200851},"auraRemoved"), 
							},
							hunter = {
								type = 'group',
								inline = true,
								name = L["|cffABD473Hunter|r"],
								order = 7,
								args = listOption({19263,186265,193526},"auraRemoved"),
							},
							mage = {
								type = 'group',
								inline = true,
								name = L["|cff69CCF0Mage|r"],
								order = 8,
								args = listOption({45438,198111,198144},"auraRemoved"),
							},
							monk = {
								type = 'group',
								inline = true,
								name = L["|cFF00FF96Monk|r"],
								order = 9,
								args = listOption({201318,115203,115176,201325,122470,216113,116849},"auraRemoved"),
							},
							paladin = {
								type = 'group',
								inline = true,
								name = L["|cffF58CBAPaladin|r"],
								order = 10,
								args = listOption({1022,642,31850,205191,184662,86659,228049},"auraRemoved"),
							},
							preist	= {
								type = 'group',
								inline = true,
								name = L["|cffFFFFFFPriest|r"],
								order = 11,
								args = listOption({33206,47585,109964,197268,193223},"auraRemoved"),
							},
							rogue = {
								type = 'group',
								inline = true,
								name = L["|cffFFF569Rogue|r"],
								order = 12,
								args = listOption({31224,5277,74001,51690,199754,202665},"auraRemoved"),
							},
							shaman	= {
								type = 'group',
								inline = true,
								name = L["|cff0070daShaman|r"],
								order = 13,
								args = listOption({108271,210918,204293},"auraRemoved"),
							},
							warlock = {
								type = 'group',
								inline = true,
								name = L["|cff9482C9Warlock|r"],
								order = 14,
								args = listOption({212295},"auraRemoved"),
							},
							warrior	= {
								type = 'group',
								inline = true,
								name = L["|cffC79C6EWarrior|r"],
								order = 15,
								args = listOption({871,114030,118038,197690},"auraRemoved"), 
							},
						},
					},
					spellCastStart = {
						type = 'group',
						--inline = true,
						name = L["Spell Casting"],
						disabled = function() return gsadb.castStart end,
						order = 2,
						args = {
							conlyTF = {
								type = 'toggle',
								name = L["Target and Focus Only"],
								desc = L["Alert works only when your current target or focus gains the buff effect or use the ability"],
								order = 1,
							},
							resurrection = {
								type = 'toggle',
								name = L["Resurrection"],
								desc = L["Resurrection, Redemption, Ancestral Spirit, Revive, Resuscitate"],
								order = 20,
							},
							bigHeal = {
								type = 'toggle',
								name = L["Big Heals"],
								desc = L["Greater Heal, Divine Light, Greater Healing Wave, Healing Touch, Enveloping Mist"],
								order = 30,
							},
							--dk	= {
							--	type = 'group',
							--	inline = true,
							--	name = L["|cffC41F3BDeath Knight|r"],
							--	order = 40,
							--	args = listOption({},"castStart"),
							--},	
							--demonhunter = {
							--	type = 'group',
							--	inline = true,
							--	name = L["|cffA330C9Demon Hunter|r"],
							--	order = 50,
							--	args = listOption({},"auraApplied"),
							--},
							druid = {
								type = 'group',
								inline = true,
								name = L["|cffFF7D0ADruid|r"],
								order = 60,
								args = listOption({33786,209753,339,202767,202768,202771},"castStart"),
							},
							hunter = {
								type = 'group',
								inline = true,
								name = L["|cffABD473Hunter|r"],
								order = 70,
								args = listOption({982,120360,19386},"castStart"), -- 19386 moved from cast-success 2.3.4
							},
							mage = {
								type = 'group',
								inline = true,
								name = L["|cff69CCF0Mage|r"],
								order = 80,
								args = listOption({28271,28272,61305,61721,61025,61780,161372,161355,161353,161354,126819,118,205021,31687,203286},"castStart"),
							},
							--monk = {
							--	type = 'group',
							--	inline = true,
							--	name = L["|cFF00FF96Monk|r"],
							--	order = 90,
							--	args = listOption({},"castStart"),
							--},
							paladin = {
								type = 'group',
								inline = true,
								name = L["|cffF58CBAPaladin|r"],
								order = 100,
								args = listOption({20066},"castStart"),
							},
							preist	= {
								type = 'group',
								inline = true,
								name = L["|cffFFFFFFPriest|r"],
								order = 110,
								args = listOption({9484,605,32375},"castStart"),
							},
							--rogue = {
							--	type = 'group',
							--	inline = true,
							--	name = L["|cffFFF569Rogue|r"],
							--	order = 120,
							--	args = listOption({},"castStart"),
							--},
							shaman	= {
								type = 'group',
								inline = true,
								name = L["|cff0070daShaman|r"],
								order = 130,
								args = listOption({210873,211004,211015,211010,51514},"castStart"),
							},
							warlock	= {
								type = 'group',
								inline = true,
								name = L["|cff9482C9Warlock|r"],
								order = 140,
								args = listOption({5782,710,152108,691,712,697,688,112866,112867,112870,112868,112869,104316,6358,30283,115268},"castStart"), -- [691,712,697,688,112866,112867,112870,112868,112869 summ' demon]
							},
							--warrior = {
							--	type = 'group',
							--	inline = true,
							--	name = L["|cffC79C6EWarrior|r"],
							--	order = 150,
							--	args = listOption({},"castStart"),
							--},
						},
					},
					spellCastSuccess = {
						type = 'group',
						--inline = true,
						name = L["Special Abilities"],
						disabled = function() return gsadb.castSuccess end,
						order = 3,
						args = {
							sonlyTF = {
								type = 'toggle',
								name = L["Target and Focus Only"],
								desc = L["Alert works only when your current target or focus gains the buff effect or use the ability"],
								order = 10,
							},
							class = {
								type = 'toggle',
								name = L["PvP Trinketed Class"],
								desc = L["Also announce class name with trinket alert when hostile targets use PvP trinket in arena"],
								--disabled = function() return not gsadb.trinket end, -- Not sure where this came from?
								order = 20,
							},
							general = {
								type = 'group',
								inline = true,
								name = L["General Abilities"],
								order = 30,
								args = listOption({178207,2825,80353,90355,160452,32182,28730,25046,50613,69179,155145,129597,202719,80483,107079,20549,58984,20594,7744,59752,42292,214027,208683,195710},"castSuccess"),
							},
							enemyInterrupts = {
								type = 'group',
								inline = true,
								name = L["EnemyInterrupts"],
								order = 35,
								args = listOption({47528,183752,78675,106839,147362,187707,2139,116705,96231,1766,57994,19647,171140,171138,212619,119910,6552},"castSuccess"),
							},
							dk	= {
								type = 'group',
								inline = true,
								name = L["|cffC41F3BDeath Knight|r"],
								order = 40,
								args = listOption({47476,47568,49206,77606,108194,108199,108201,152280,207167,204160,130736,207349,190778},"castSuccess"),
							},
							demonhunter = {
								type = 'group',
								inline = true,
								name = L["|cffA330C9Demon Hunter|r"],
								order = 50,
								args = listOption({179057,206649,205604,206803,205629,205630,202138,207684,202137,211881,203704},"castSuccess"),
							},
							druid = {
								type = 'group',
								inline = true,
								name = L["|cffFF7D0ADruid|r"],
								order = 70,
								args = listOption({102280,740,108238,99,5211,102560,102543,102558,33891,102359,102417,102383,49376,16979,102416,102401,203651,201664},"castSuccess"), -- add 106839 to 2.2.2 / [102417,102383,49376,16979,102416,102401 wildcharge]
							},
							hunter = {
								type = 'group',
								inline = true,
								name = L["|cffABD473Hunter|r"],
								order = 80,
								args = listOption({109248,109304,131894,126216,126215,126214,126213,122811,122809,122807,122806,122804,122802,121118,202914,208652,205691,201430,213691,209789,187650,191241,201078,186387},"castSuccess"), -- 19801 added to 2.2.2 [126215,126216,126214,126213,122811,122809,122807,122806,122804,122802,121118 Dire beast]
							},
							mage = {
								type = 'group',
								inline = true,
								name = L["|cff69CCF0Mage|r"],
								order = 90,
								args = listOption({66,12051,113724,110959,153595,153561,198158,190319,30449},"castSuccess"),
							},
							monk = {
								type = 'group',
								inline = true,
								name = L["|cFF00FF96Monk|r"],
								order = 100,
								args = listOption({116841,115399,119381,116847,123904,115078,119996,137639,115310,198898,132578,198664,214326,115080},"castSuccess"), --@ 122470 moved to SpellAuraApplied
							},
							paladin = {
								type = 'group',
								inline = true,
								name = L["|cffF58CBAPaladin|r"],
								order = 110,
								args = listOption({31821,853,85499,205656,190784,115750,210220,210256,633},"castSuccess"),
							},
							preist	= {
								type = 'group',
								inline = true,
								name = L["|cffFFFFFFPriest|r"],
								order = 120,
								args = listOption({8122,34433,64044,15487,64843,19236,123040,204263,2050,88625,205369,211522,108968,528,208065,62618},"castSuccess"),
							},
							rogue = {
								type = 'group',
								inline = true,
								name = L["|cffFFF569Rogue|r"],
								order = 130,
								args = listOption({2094,1856,76577,79140,207777,207736,200806,198529,1833,199804,408,185767,1330,193316},"castSuccess"),
							},
							shaman	= {
								type = 'group',
								inline = true,
								name = L["|cff0070daShaman|r"],
								order = 140,
								args = listOption({98008,108270,51485,2484,108273,108280,108281,118345,370,198067,198103,192058,192077,196932,192249,192222,204330,204331,204332,204437,207399,198838,204336},"castSuccess"), -- 370 added to 2.2.2
							},
							warlock = {
								type = 'group',
								inline = true,
								name = L["|cff9482C9Warlock|r"],
								order = 150,
								args = listOption({108359,6789,5484,48020,111859,111895,111896,111897,111898,196277},"castSuccess"),
							},
							warrior	= {
								type = 'group',
								inline = true,
								name = L["|cffC79C6EWarrior|r"],
								order = 160,
								args = listOption({97462,5246,107566,46968,118000,107570,114028,152277,176289,114028,1160},"castSuccess"),
							},
						},
					},
--					spellInterrupt = { -- Now hidden as it was a redundant option.
--						type = 'group',
--						--inline = true,
--						name = L["Friendly Interrupt"],
--						disabled = function() return gsadb.interrupt end,
--						order = 4,
--						args = {
--							lockout = {
--								type = 'toggle',
--								name = L["Friendly Interrupt"],
--								desc = L["Spell Lock, Counterspell, Kick, Pummel, Mind Freeze, Skull Bash, Rebuke, Solar Beam, Spear Hand Strike, Wind Shear, Consume Magic"],
--								order = 1,
--							},
--						}
--					},
--					pvpWorldQuests = { -- Placeholder for possible PvP World Quest announcements. May not be necessary.
--						type = 'group',
--							--inline = true,
--						name = L["PvPWorldQuests"],
	--					disabled = function() return gsadb.worldquest end,
--						disabled = true,
--						order = 5,
--						args = {
--							murlocFreedom = {
--								type = 'group',
--								inline = true,
--								name = L["OperationMurlocFreedom"],
--								order = 1,
--								args = listOption({}),
--							},
--						},
--					}
				},
			},
			custom = {
				type = 'group',
				name = L["Custom"],
				desc = L["Custom Spell"],
				--set = function(info, value) local name = info[#info] gsadb.custom[name] = value end,
				--get = function(info) local name = info[#info]	return gsadb.custom[name] end,
				order = 4,
				args = {
					newalert = {
						type = 'execute',
						name = L["New Sound Alert"],
						order = -1,
						--[[args = {
							newname = {
								type = 'input',
								name = "name",
								set = function(info, value) local name = info[#info] if gsadb.custom[vlaue] then log("name already exists") return end gsadb.custom[vlaue]={} end,			
							}]]
						func = function()
							gsadb.custom[L["New Sound Alert"]] = {
								name = L["New Sound Alert"],
								soundfilepath = "Interface\\AddOns\\GladiatorlosSA\\Voice_Custom\\Will-Demo.ogg",--"..L["New Sound Alert"]..".ogg",
								sourceuidfilter = "any",
								destuidfilter = "any",
								eventtype = {
									SPELL_CAST_SUCCESS = true,
									SPELL_CAST_START = false,
									SPELL_AURA_APPLIED = false,
									SPELL_AURA_REMOVED = false,
									SPELL_INTERRUPT = false,
								},
								sourcetypefilter = COMBATLOG_FILTER_EVERYTHING,
								desttypefilter = COMBATLOG_FILTER_EVERYTHING,
								order = 0,
							}
							self:MakeCustomOption(L["New Sound Alert"])
						end,
						disabled = function()
							if gsadb.custom[L["New Sound Alert"]] then
								return true
							else
								return false
							end
						end,
					}
				}
			}
		}
	}

	for k, v in pairs(gsadb.custom) do
		self:MakeCustomOption(k)
	end	
	AceConfig:RegisterOptionsTable("GladiatorlosSA", self.options)
	self:AddOption(L["General"], "general")
	self.options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db1)
	self.options.args.profiles.order = -1
	
	self:AddOption(L["Abilities"], "spells")
	self:AddOption(L["Custom"], "custom")
	self:AddOption(L["Profiles"], "profiles")
end