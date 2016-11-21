local addonName, at = ...
local core = at.core

at.L = {}

-- literally insert a table directly into the locale... I was wrong about some stuff
-- this allows personal addons to "plug-in" the addon.
-- 	should work so long as this is called before PLAYER_ENTERING_WORLD
local function IndexFunc(L, key)
		return key
end
function JamPlatesAcessories_SetLocale(locale)
	local tab
	if type(locale) == 'table' then
		tab = locale
	else
			
		-- I'm confident that anyone who would translate this would know how but there are some basic instructions included
		-- just change enGB to whatever locale you need, copy/paste, change translations, and you should be good
		if locale == 'enGB' then
			tab = {
				-- example... for the most part
					--['used in code'] = 'translated value'
					['Features'] = 'Features',
					
					['Enable Auras'] = 'Enable Auras',
					['Display Auras'] = 'Display Auras',
					
					['Enable Aura Watch'] = 'Enable Aura Watcher',
					["Enable aura tracking, seperating specified auras from the default display."] = "Enable aura tracking, seperating specified auras from the default display.",
					["These ignore the inverted setting."] = "These ignore the inverted setting.",
					
					['Enable Combo Points'] = 'Enable Combo Points',
					["Display combo points."] = "Display combo points.",
					
					['Enable Threat'] = 'Enable Threat',
					["Display threat eye indicator."] = "Display threat eye indicator.",
					
					['Enable Combat'] = 'Enable Combat',
					["Display combat indicator."] = "Display combat indicator.",
					
					["The anchor point on the nameplate."] =	"The anchor point on the nameplate.",
					["The point ralative to the anchor."] =	"The point ralative to the anchor.",
					["Distance left/right from the anchor the relative point goes."] =	"Distance left/right from the anchor the relative point goes.",
					["Distance up/down from the anchor the relative point goes."] = "Distance up/down from the anchor the relative point goes.",
					['Anchor'] = 'Anchor',
					['Relative'] = 'Relative',
					
					['Aura'] = 'Aura',
					['Invert Auras'] = 'Invert Auras',
					["Enemy: Show buffs instead of debuffs."] = "Enemy: Show buffs instead of debuffs.",
					["Ally: Show debuffs instead of buffs."] = "Ally: Show debuffs instead of buffs.",
					['Auras Per Row'] = 'Auras Per Row',
					["The number of auras per row."] = "The number of auras per row.",
					['Show Pet Auras'] = 'Show Pet Auras',
					['Show Aura Borders'] = 'Show Aura Borders',
					['Reverse Row Growth'] = 'Reverse Row Growth',
					["Grow auras down instead of up."] = "Grow auras down instead of up.",
					['Reverse Column Direction'] = 'Reverse Column Direction',
					["Grow auras left instead of right."] = "Grow auras left instead of right.",
					
					['Aura Width'] = 'Aura Width',
					["The aura width."] = "The aura width.",
					['Aura Height'] = 'Aura Height',
					["The aura height."] = "The aura height.",
					['Aura Scale'] = 'Aura Scale',
					["The aura scale."] = "The aura scale.",
					
					['Aura Watch'] = 'Aura Watch',
					-- it's the same as the ones for Aura
					
					['Threat'] = 'Threat',
					['Threat Width'] = 'Threat Width',
					["The threat width."] = "The threat width.",
					['Threat Height'] = 'Threat Height',
					["The threat height."] = "The threat height.",
					['Threat Scale'] = 'Threat Scale',
					["The threat scale."] = "The threat scale.",
					
					['Combat'] = 'Combat',
					['Combat Indicator Width'] = 'Combat Indicator Width',
					["The indicator width."] = "The indicator width.",
					['Combat Indicator Height'] = 'Combat Indicator Height',
					["The indicator height."] = "The indicator height.",
					['Combat Indicator Scale'] = 'Combat Indicator Scale',
					["The indicator scale."] = "The indicator scale.",
					
					-- hmmmm?
					["Enable Resource"] = 'Enable Resource',
					['Combo Point'] = 'Combo Point',
					['Point Width'] = 'Combo Point Width',
					["Combo point width."] = "Combo point width.",
					['Point Height'] = 'Combo Point Height',
					["Combo point height."] = "Combo point height.",
					['Point Scale'] = 'Combo Point Scale',
					["Combo point scale."] = "Combo point scale.",
					
					['Profiles'] = 'Profiles',
					['Load Profile'] = 'Load Profile',
					["Load a profile from another character."] = "Load a profile from another character.",
					["Default is not default settings, they are user defined defaults to be used by multiple characters."] = "Default is not default settings, they are user defined defaults to be used by multiple characters.",
					['Copy Profile'] = 'Copy Profile',
					["Copy a profile from another character."] = "Copy a profile from another character.",
					
					['Aura List'] = 'Aura List',
					['Warning!  List gets long.'] = 'Warning!  List gets long.',
					
					["Spell ID:  "] = "Spell ID:  ",
					
					['Spell Filter'] = 'Spell Filter',
					
					['Remove'] = 'Remove',
					
					["Only accepts a spell ID value."] = "Only accepts a spell ID value.",
					["Literally numbers only."] = "Literally numbers only.",
					
					['Commands disabled in combat.'] = 'Commands disabled in combat.',
			}
		
		elseif locale == 'deDE' then
			tab = {
				["Ally: Show debuffs instead of buffs."] = "Verbündete: Zeige Debuffs statt Buffs.", -- Needs review
				Anchor = "Ankerpunkt",
				Aura = "Aura",
				["Aura Height"] = "Aurahöhe",
				["Aura List"] = "Aurenliste", -- Needs review
				["Aura Scale"] = "Auraskalierung",
				["Auras Per Row"] = "Auren pro Reihe",
				-- ["Aura Watch"] = "",
				["Aura Width"] = "Aurabreite",
				Combat = "Kampf",
				-- ["Combat Indicator Height"] = "",
				-- ["Combat Indicator Scale"] = "",
				-- ["Combat Indicator Width"] = "",
				["Combo Point"] = "Combopunkt",
				["Combo point height."] = "Combopunkthöhe.",
				["Combo point scale."] = "Combopunktskalierung.",
				["Combo point width."] = "Combopunktbreite.", -- Needs review
				-- ["Commands disabled in combat."] = "",
				["Copy a profile from another character."] = "Kopiere das Profil eines anderen Charakters.",
				["Copy Profile"] = "Profil kopieren",
				-- ["Default is not default settings, they are user defined defaults to be used by multiple characters."] = "",
				-- ["Display Auras"] = "",
				-- ["Display combat indicator."] = "",
				["Display combo points."] = "Zeige Kombopunkte an.",
				["Display threat eye indicator."] = "Zeige Bedrohungsindikator an.",
				-- ["Distance left/right from the anchor the relative point goes."] = "",
				-- ["Distance up/down from the anchor the relative point goes."] = "",
				["Enable Auras"] = "Auren aktivieren", -- Needs review
				-- ["Enable aura tracking, seperating specified auras from the default display."] = "",
				-- ["Enable Aura Watch"] = "",
				-- ["Enable Combat"] = "",
				["Enable Combo Points"] = "Combopunkte aktivieren", -- Needs review
				["Enable Threat"] = "Bedrohung aktivieren", -- Needs review
				["Enemy: Show buffs instead of debuffs."] = "Feind: Zeige Buffs statt Debuffs.", -- Needs review
				-- Features = "",
				["Grow auras down instead of up."] = "Auren nach unten statt oben wachsen lassen.", -- Needs review
				["Grow auras left instead of right."] = "Auren nach links statt rechts wachsen lassen.", -- Needs review
				["Invert Auras"] = "Auren invertieren",
				-- ["Literally numbers only."] = "",
				-- ["Load a profile from another character."] = "",
				["Load Profile"] = "Profil laden",
				-- ["Only accepts a spell ID value."] = "",
				-- ["Point Height"] = "",
				-- ["Point Scale"] = "",
				-- ["Point Width"] = "",
				Profiles = "Profile",
				-- Relative = "",
				Remove = "Entfernen",
				-- ["Reverse Column Direction"] = "",
				-- ["Reverse Row Growth"] = "",
				-- ["Show Aura Borders"] = "",
				["Show Pet Auras"] = "Zeige Begleiterauren",
				-- ["Spell Filter"] = "",
				["Spell ID:  "] = "Zauber-ID:",
				-- ["The anchor point on the nameplate."] = "",
				["The aura height."] = "Die Aurahöhe.", -- Needs review
				["The aura scale."] = "Die Auraskalierung.", -- Needs review
				["The aura width."] = "Die Aurabreite.", -- Needs review
				["The indicator height."] = "Die Indikatorhöhe.",
				["The indicator scale."] = "Die Indikatorskalierung.",
				["The indicator width."] = "Die Indikatorbreite.",
				["The number of auras per row."] = "Anzahl der Auren pro Reihe.",
				-- ["The point ralative to the anchor."] = "",
				-- ["These ignore the inverted setting."] = "",
				["The threat height."] = "Bedrohungshöhe.", -- Needs review
				["The threat scale."] = "Bedrohungsskalierung.", -- Needs review
				-- ["The threat width."] = "",
				Threat = "Bedrohung",
				["Threat Height"] = "Bedrohungshöhe", -- Needs review
				["Threat Scale"] = "Bedrohungsskalierung", -- Needs review
				["Threat Width"] = "Bedrohungsbreite", -- Needs review
				["Warning!  List gets long."] = "Warnung! Liste wird zu lang.", -- Needs review
			}
		
		elseif locale == 'zhCN' then
			tab = {
				-- example... for the most part
					--['used in code'] = 'translated value'
					['Features'] = '特征',
					
					['Enable Auras'] = '启用光环',
					['Display Auras'] = '禁用光环',
					
					['Enable Aura Watch'] = '启用光环监视',
					["Enable aura tracking, seperating specified auras from the default display."] = "启用光环追踪,分离特定的光环来显示.",
					["These ignore the inverted setting."] = "将忽略反转设置.",
					
					['Enable Combo Points'] = '启用连击点',
					["Display combo points."] = "显示连击点.",
					
					['Enable Threat'] = '启用仇恨',
					["Display threat eye indicator."] = "显示仇恨眼睛指示.",
					
					['Enable Combat'] = '启用战斗',
					["Display combat indicator."] = "显示战斗指示.",
					
					["The anchor point on the nameplate."] = "在姓名版上的锚点.",
					["The point ralative to the anchor."] =	"这一点相对与锚点.",
					["Distance left/right from the anchor the relative point goes."] =	"距离锚点 左/右 的相对距离.",
					["Distance up/down from the anchor the relative point goes."] = "距离锚点 上/下 的相对距离.",
					['Anchor'] = '锚点',
					['Relative'] = '相对',
					
					['Aura'] = '光环',
					['Invert Auras'] = '反转光环',
					["Enemy: Show buffs instead of debuffs."] = "敌对: 显示 buffs 而不是 debuffs.",
					["Ally: Show debuffs instead of buffs."] = "友方: 显示 debuffs 而不是 buffs.",
					['Auras Per Row'] = '光环每行的数量',
					["The number of auras per row."] = "光环每行的数量.",
					['Show Pet Auras'] = '显示宠物的光环',
					['Show Aura Borders'] = '显示光环边框',
					['Reverse Row Growth'] = '反转每列增长的方向',
					["Grow auras down instead of up."] = "光环从下而上生长.",
					['Reverse Column Direction'] = '反转列的方向',
					["Grow auras left instead of right."] = "光环从左至右增长.",
					
					['Aura Width'] = '光环宽度',
					["The aura width."] = "光环的宽度.",
					['Aura Height'] = '光环高度',
					["The aura height."] = "光环的高度.",
					['Aura Scale'] = '光环比例',
					["The aura scale."] = "光环的比例.",
					
					['Aura Watch'] = '光环监视',
					-- it's the same as the ones for Aura
					
					['Threat'] = '仇恨',
					['Threat Width'] = '仇恨宽度',
					["The threat width."] = "仇恨的宽度.",
					['Threat Height'] = '仇恨高度',
					["The threat height."] = "仇恨的高度.",
					['Threat Scale'] = '仇恨比例',
					["The threat scale."] = "仇恨的比例",
					
					['Enable Resource'] = '启用职业资源',
					['Combat'] = '战斗标记',
					['Combat Indicator Width'] = '战斗标记宽度',
					["The indicator width."] = "标记的宽度.",
					['Combat Indicator Height'] = '战斗标记高度',
					["The indicator height."] = "标记的高度.",
					['Combat Indicator Scale'] = '战斗标记比例',
					["The indicator scale."] = "标记的比例.",
					
					-- hmmmm?
					['Combo Point'] = '连击点',
					['Point Width'] = '连击点宽度',
					["Combo point width."] = "连击点的宽度.",
					['Point Height'] = '连击点高度',
					["Combo point height."] = "连击点的高度.",
					['Point Scale'] = '连击点比例',
					["Combo point scale."] = "连击点的比例.",
					
					['Profiles'] = '配置',
					['Load Profile'] = '载入配置',
					["Load a profile from another character."] = "从其它角色载入配置.",
					["Default is not default settings, they are user defined defaults to be used by multiple characters."] = "Default is not default settings, they are user defined defaults to be used by multiple characters.",
					['Copy Profile'] = '复制配置',
					["Copy a profile from another character."] = "从其它角色复制一个配置.",
					
					['Aura List'] = '光环列表',
					['Warning!  List gets long.'] = '警告!  列表太长.',
					
					["Spell ID:  "] = "技能 ID:  ",
					
					['Spell Filter'] = '技能过滤',
					
					['Remove'] = '移除',
					
					["Only accepts a spell ID value."] = "只接受一个技能ID值.",
					["Literally numbers only."] = "只能是数字.",
					
					['Commands disabled in combat.'] = '战斗中命令禁用.',
			}
		elseif locale == 'zhTW' then
			tab = {
				-- example... for the most part
					--['used in code'] = 'translated value'
					['Features'] = '特徵',
					
					['Enable Auras'] = '啟用光環',
					['Display Auras'] = '禁用光環',
					
					['Enable Aura Watch'] = '啟用光環監視',
					["Enable aura tracking, seperating specified auras from the default display."] = "啟用光環追蹤,分離特定的光環來顯示.",
					["These ignore the inverted setting."] = "將忽略反轉設置.",
					
					['Enable Combo Points'] = '啟用連擊點',
					["Display combo points."] = "顯示連擊點.",
					
					['Enable Threat'] = '啟用仇恨',
					["Display threat eye indicator."] = "顯示仇恨眼睛指示.",
					
					['Enable Combat'] = '啟用戰鬥',
					["Display combat indicator."] = "顯示戰鬥指示.",
					
					["The anchor point on the nameplate."] = "在姓名版上的錨點.",
					["The point ralative to the anchor."] =	"這一點相對與錨點.",
					["Distance left/right from the anchor the relative point goes."] =	"距離錨點 左/右 的相對距離.",
					["Distance up/down from the anchor the relative point goes."] = "距離錨點 上/下 的相對距離.",
					['Anchor'] = '錨點',
					['Relative'] = '相對',
					
					['Aura'] = '光環',
					['Invert Auras'] = '反轉光環',
					["Enemy: Show buffs instead of debuffs."] = "敵對: 顯示 buffs 而不是 debuffs.",
					["Ally: Show debuffs instead of buffs."] = "友方: 顯示 debuffs 而不是 buffs.",
					['Auras Per Row'] = '光環每行的數量',
					["The number of auras per row."] = "光環每行的數量.",
					['Show Pet Auras'] = '顯示寵物的光環',
					['Show Aura Borders'] = '顯示光環邊框',
					['Reverse Row Growth'] = '反轉每列增長的方向',
					["Grow auras down instead of up."] = "光環從下而上生長.",
					['Reverse Column Direction'] = '反轉列的方向',
					["Grow auras left instead of right."] = "光環從左至右增長.",
					
					['Aura Width'] = '光環寬度',
					["The aura width."] = "光環的寬度.",
					['Aura Height'] = '光環高度',
					["The aura height."] = "光環的高度.",
					['Aura Scale'] = '光環比例',
					["The aura scale."] = "光環的比例.",
					
					['Aura Watch'] = '光環監視',
					-- it's the same as the ones for Aura
					
					['Threat'] = '仇恨',
					['Threat Width'] = '仇恨寬度',
					["The threat width."] = "仇恨的寬度.",
					['Threat Height'] = '仇恨高度',
					["The threat height."] = "仇恨的高度.",
					['Threat Scale'] = '仇恨比例',
					["The threat scale."] = "仇恨的比例",
					
					['Combat'] = '戰鬥標記',
					['Combat Indicator Width'] = '戰鬥標記寬度',
					["The indicator width."] = "標記的寬度.",
					['Combat Indicator Height'] = '戰鬥標記高度',
					["The indicator height."] = "標記的高度.",
					['Combat Indicator Scale'] = '戰鬥標記比例',
					["The indicator scale."] = "標記的比例.",
					
					-- hmmmm?
					['Combo Point'] = '連擊點',
					['Point Width'] = '連擊點寬度',
					["Combo point width."] = "連擊點的寬度.",
					['Point Height'] = '連擊點高度',
					["Combo point height."] = "連擊點的高度.",
					['Point Scale'] = '連擊點比例',
					["Combo point scale."] = "連擊點的比例.",
					
					['Profiles'] = '配置',
					['Load Profile'] = '載入配置',
					["Load a profile from another character."] = "從其它角色載入配置.",
					["Default is not default settings, they are user defined defaults to be used by multiple characters."] = "Default is not default settings, they are user defined defaults to be used by multiple characters.",
					['Copy Profile'] = '複製配置',
					["Copy a profile from another character."] = "從其它角色複製一個配置.",
					
					['Aura List'] = '光環列表',
					['Warning!  List gets long.'] = '警告!  列表太長.',
					
					["Spell ID:  "] = "技能 ID:  ",
					
					['Spell Filter'] = '技能過濾',
					
					['Remove'] = '移除',
					
					["Only accepts a spell ID value."] = "只接受一個技能ID值.",
					["Literally numbers only."] = "只能是數字.",
					
					['Commands disabled in combat.'] = '戰鬥中命令禁用.',
			}
		else--if locale == 'enUS' then
			-- the value, or key, is already in this locale.
			-- default to English
			tab = {}
		end
	end
	setmetatable(tab, {__index = IndexFunc})
	at.L = tab
end

JamPlatesAcessories_SetLocale(GetLocale())
