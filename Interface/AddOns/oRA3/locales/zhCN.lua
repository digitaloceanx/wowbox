
if GetLocale() ~= "zhCN" then return end
local _, tbl = ...
local L = tbl.locale

L["add"] = "增加"
L["align"] = "对齐"
L["allSpells"] = "所有选择的法术"
L["autoLootMethod"] = "加入团队时自动设定拾取模式"
L["autoLootMethodDesc"] = "当进入队伍或团队，让oRA3自动设定拾取模式，从下面指定。"
L["average"] = "平均"
L["backgroundColor"] = "背景颜色"
L["barDisplay"] = "条"
L["barDisplayDesc"] = "简易条形显示。"
L["barSettings"] = "计时条设定"
L["battleResHeader"] = "只有当你在团队中并且在副本中监视器才会显示。"
L["battleResLockDesc"] = "切换锁定监视器。这会隐藏标题文字、背景并防止移动。"
L["battleResShowDesc"] = "切换显示或隐藏监视器。"
L["battleResTitle"] = "战斗复活监视器"
L["blizzMainTank"] = "内建主坦克"
L["broken"] = "损坏"
L["buffs"] = "增益"
L["byGuildRank"] = "根据公会阶级"
L["center"] = "中"
L["checkBuffs"] = "检查增益"
L["checkBuffsDesc"] = "检查增益包含团队增益。"
L["checkFlaskDesc"] = "检查增益包含精炼。"
L["checkFoodDesc"] = "检查增益包含食物增益。"
L["checkReadyCheck"] = "准备确认时检查"
L["checkReadyCheckDesc"] = "当准备确认执行时检查增益，随机副本队伍例外。"
L["checkRuneDesc"] = "检查增益包含增强符文。"
L["checks"] = "检查"
L["classColorBorder"] = "职业颜色外框"
L["clear"] = "清除"
L["consumables"] = "食物药水检查"
L["cooldowns"] = "冷却"
L["cooldownsEnableDesc"] = "当在团队中停用此模块将会防止它使用任何资源来追踪冷却。"
L["copyDisplay"] = "|cff02ff02复制 %s|r"
L["createNewDisplay"] = "|cff02ff02创建新显示|r"
L["customColor"] = "自定义颜色"
L["dead"] = "死亡"
L["deleteButtonHelp"] = "从坦克名单移除。请注意，一旦移除这次将不会重新新增到其她坦克直到你手动新增坦克。"
L["deleteDisplay"] = "|cffff0202删除 %s|r"
L["demoteEveryone"] = "降级所有人"
L["demoteEveryoneDesc"] = "降级在目前队伍的所有人。"
L["direction"] = "方向"
L["directionThen"] = "%s 然后 %s"
L["disabledAlpha"] = "停用条透明度"
L["disbandGroup"] = "解散团队"
L["disbandGroupDesc"] = [=[解散你现在的队伍或团队，从团队中逐一踢除每一个人，直到剩下你一个。

由于这非常具有破坏性，你会看到一个确认对话框。按住控制隐藏此对话框。]=]
L["disbandGroupWarning"] = "你确定要解散团队?"
L["disbandingGroupChatMsg"] = "解散团队中。"
L["displayTypes"] = "显示类型"
L["down"] = "下"
L["durability"] = "耐久度"
L["duration"] = "持续时间"
L["durationTextSettings"] = "持续时间文字设定"
L["ensureRepair"] = "保证在团队中目前所有阶级启用公会修装。"
L["ensureRepairDesc"] = "如果你是公会会长，任何时候你加入到团队且是队长或是被提升，你可以启用公会修装直到团队结束(最多300g)。万一你离开团队，设定就会被还原到原始状态|cffff4411预防你在团队期间不会破产。|r"
L["fill"] = "填满条"
L["filtersDesc"] = "设置你想要从显示中排除的项目。"
L["flask"] = "精炼"
L["flaskExpires"] = "您的精炼剩余时间少于10分钟"
L["font"] = "字型"
L["fontSize"] = "字号"
L["food"] = "食物"
L["gap"] = "条间距"
L["gear"] = "装备"
L["group"] = "小队"
L["groupSpells"] = "让法术保持职业排序"
L["growUpwards"] = "向上递增"
L["guildKeyword"] = "公会关键词"
L["guildKeywordDesc"] = "任何公会成员密你关键词将会自动邀请到团队。"
L["guildRankInvites"] = "公会阶级邀请"
L["guildRankInvitesDesc"] = "点击任何按钮将自动邀请阶级高于等于所选等级的公会成员，除非你同时按住Shift，所以按下第三的按钮将邀请任何阶级1,2或3的成员，或是按下第三按钮同时按住Shift将只邀请阶级3的成员。按下该按钮会自动在公会和干部频道发送要求10秒内离队待组的消息，10秒后自动开始组人。"
L["guildRepairs"] = "公会修理"
L["height"] = "高"
L["hideDead"] = "隐藏死亡"
L["hideGroupDesc"] = "隐藏在此队伍玩家的冷却。"
L["hideInCombat"] = "战斗中隐藏"
L["hideInCombatDesc"] = "进入战斗时自动隐藏准备窗口。"
L["hideInInstanceDesc"] = "在此副本类型隐藏冷却。"
L["hideOffline"] = "隐藏脱机"
L["hideOutOfCombat"] = "战斗外隐藏"
L["hideOutOfRange"] = "距离外隐藏"
L["hideReadyPlayers"] = "隐藏已经准备好的玩家"
L["hideReadyPlayersDesc"] = "从窗口中隐藏已经准备好的玩家。"
L["hideRolesDesc"] = "隐藏此角色类型玩家的冷却。"
L["hideWhenDone"] = "完成时隐藏"
L["hideWhenDoneDesc"] = "当准备确认完成时自动隐藏。"
L["home"] = "家"
L["icon"] = "图示"
L["iconDisplay"] = "图标"
L["iconDisplayDesc"] = "简易图标显示。"
L["iconGroupDisplay"] = "图标群组"
L["iconGroupDisplayDesc"] = "将所有可施放的法术合并显示为一个图标。"
L["individualPromotions"] = "个别晋升"
L["individualPromotionsDesc"] = "注意，玩家名字区分大小写。要新增玩家,在输入框输入玩家名称按下Enter或是点击弹出的按钮。在下拉列表中选中一个玩家就可以删除该玩家的自动晋升。"
L["invite"] = "邀请"
L["inviteDesc"] = "当玩家密你关键词，将会自动邀请到队伍。如果你在队伍而满了，将会转成团队。当组满40人关键词将会失效。没设定关键词时禁用。"
L["inviteGuild"] = "公会邀请"
L["inviteGuildDesc"] = "邀请公会中满等的玩家。"
L["inviteGuildRankDesc"] = "邀请公会中所有阶级在%s以上的玩家。Shift-点击只邀请此阶级的会员。"
L["inviteInRaidOnly"] = "如果在团队队伍只使用关键词邀请"
--L.inviteGroupIsFull = "The group is currently full."
L["invitePrintMaxLevel"] = "公告：公会中所有满等玩家会被在10秒内被邀请，请离开你的队伍！"
L["invitePrintRank"] = "公告：公会中所有阶级在%s以上的玩家会被在10秒内被邀请，请离开你的队伍！"
L["invitePrintRankOnly"] = "所有等级 %s 的角色将在10秒内邀请至团队。请离开你现在的队伍。"
L["invitePrintZone"] = "公告：公会中所有角色在%s的玩家会被在10秒内被邀请，请离开你的队伍！"
L["inviteZone"] = "区域邀请"
L["inviteZoneDesc"] = "邀请在相同区域的公会成员。"
L["itemLevel"] = "物品等级"
L["keyword"] = "关键词"
L["keywordDesc"] = "当玩家密语你关键词，将会自动邀请到队伍。"
L["keywordMultiDesc"] = "你可以使用多重关键词只要使用 ; (分号)隔开。"
L["labelTextSettings"] = "卷标文字设定"
L["latency"] = "延迟"
L["left"] = "左"
L["lockMonitor"] = "锁定监视器"
L["lockMonitorDesc"] = "锁定后将隐藏监视器的标题并将无法拖曳、设定大小、打开设定。"
L["logDisplay"] = "纪录"
L["logDisplayDesc"] = "一个简易的框架用来发送讯息当法术使用时。"
L["makeLootMaster"] = "保留空白让你分配战利品。"
L["massPromotion"] = "大量晋升"
L["minimum"] = "最少"
L["missingBuffs"] = "缺少增益"
L["missingEnchants"] = "缺少附魔"
L["missingGems"] = "缺少宝石"
L["moveTankUp"] = "点击往上移动坦克。"
L["name"] = "名称"
L["neverShowOwnSpells"] = "不显示我的法术"
L["neverShowOwnSpellsDesc"] = "是否显示你的法术冷却。例如：你使用其它插件来显示你的冷却。"
L["noFlask"] = "无精炼"
L["noFood"] = "无食物增益"
L["noResponse"] = "未回应"
L["noRune"] = "无增强符文"
L["noSpells"] = "没有选择法术"
L["notBestBuff"] = "并非使用最佳属性的食物药水"
L["notInRaid"] = "你不在一个团队副本。"
L["notReady"] = "未准备好"
L["offline"] = "脱机"
L["onlyMyOwnSpells"] = "只显示我的法术"
L["onlyMyOwnSpellsDesc"] = "是否只显示你自己施放的法术的冷却，这将是一个普通的法术冷却插件。"
L["options"] = "设定"
L["outline"] = "轮廓"
L["outOfRange"] = "超出距离玩家"
L["output"] = "输出"
L["outputDesc"] = "在团体频道显示结果，其他时候结果是发送到您预设的聊天框。"
L["outputMissing"] = "输出缺少的"
L["playersNotReady"] = "以下的玩家尚未准备好：%s"
L["playerStatus"] = "玩家状态"
L["popupConvertDisplay"] = "改变显示类型将会重设显示特定的设置！"
L["popupDeleteDisplay"] = "删除显示'%s'？"
L["popupNameError"] = [=[有已存在的显示名称 '%s'。
请选择其他名称。]=]
L["popupNewDisplay"] = "输入新显示的名称"
L["printToRaid"] = "发送准备结果到团队频道"
L["printToRaidDesc"] = "如果你被提升，发送准备结果到团队频道，让团队成员看见有什么阻塞。请自行确认只有一个人启用。"
L["profile"] = "配置文件"
L["promote"] = "晋升"
L["promoteEveryone"] = "所有人"
L["promoteEveryoneDesc"] = "自动晋升所有人"
L["promoteGuild"] = "公会"
L["promoteGuildDesc"] = "自动晋升所有公会成员。"
L["raidBuffs"] = "团队增益"
L["raidCheck"] = "准备确认"
L["range"] = "距离"
L["ready"] = "准备好"
L["readyByGroup"] = "依据团队难度替换准备确认结果"
L["readyByGroupDesc"] = "忽略超出副本难度人数上限的小队玩家，例如，在传奇模式团队中忽略5-8小队。当相关小队所有玩家准备好后准备确认就结束了。"
L["readyCheckSeconds"] = "准备确认(%d秒)"
L["readyCheckSound"] = "当准备确认进行中时使用主要声音频道播放准备确认音效。即使\"音效\"被禁用也会也会拨放。"
L["remove"] = "移除"
L["repairAmount"] = "修理限制"
L["repairAmountDesc"] = "每个玩家允许修理的最大金额。"
L["repairEnabled"] = "启用%s公会修装直到团队结束。"
L["reportAlways"] = "总是报告"
L["reportIfYou"] = "如果由你发起则报告"
L["right"] = "右"
L["rightClick"] = "右键点击设定"
L["rune"] = "符文"
L["save"] = "储存"
L["saveButtonHelp"] = "储存坦克在你个人名单。只要你在团队里面有这玩家，他就会被编排作为个人坦克。"
L["scale"] = "缩放"
L["selectClass"] = "选择职业"
L["selectClassDesc"] = "通过下拉列表选择你想要监视的技能冷却。每个职业都有一套可用的监视的技能冷却列表，根据需要取舍。"
L["self"] = "自己"
L["shortSpellName"] = "简短技能名称"
L["show"] = "显示"
L["showBuffs"] = "显示增益"
L["showBuffsDesc"] = [=[在准备确认框架的下方显示每个玩家缺少的团队增益以及食物、精炼、符文的图标与文字。

|cffffff33显示缺少增益|r 如果玩家缺少增益只会显示图标。

|cffffff33显示当前增益|r 如果玩家有此增益只会显示图标。]=]
L["showButtonHelp"] = "在你个人的坦克排列中显示这个坦克. 此项只对本地有效，不会影响团队中其他人的设定。"
L["showCooldownText"] = "显示冷却文字"
L["showCooldownTextDesc"] = "显示暴雪冷却文字"
L["showCurrentBuffs"] = "显示目前增益"
L["showHelpTexts"] = "显示帮助接口"
L["showHelpTextsDesc"] = "oRA3接口充满帮助性的文字来引导将要做什么做更好的描述以及不同的接口组成事实上在做什么。禁用这设定将会移除，限制在各面板杂乱的讯息，|cffff4411在某些面板需要重载接口。|r"
L["showMissingBuffs"] = "显示缺少增益"
L["showMissingMaxStat"] = "显示低等的消耗品为缺少"
L["showMissingMaxStatDesc"] = "非最佳属性的食物与精炼显示不同颜色的图标来表示"
L["showMissingRunes"] = "显示增强符文"
L["showMissingRunesDesc"] = "包含显示增强符文的图标。"
L["showMonitor"] = "显示监视器"
L["showMonitorDesc"] = "在游戏世界里显示或隐藏冷却条显示。"
L["showOffCooldown"] = "显示冷却的法术"
L["showRoleIcons"] = "在团队面板显示角色图标"
L["showRoleIconsDesc"] = "显示角色图标与各角色总数在内建团队面板。你需要重新开起团队面板来让设定生效。"
L["showWindow"] = "显示窗口"
L["showWindowDesc"] = "当准备确认执行显示窗口。"
L["skin"] = "Masque皮肤"
L["slashCommands"] = [=[oRA3提供一系列指令在快节奏的团队中来帮助你。假如你不再徘回在旧的CTRA日子，这里有一些参考。所有/指令有各种速记也有长的，为了方便，更多描述在某些情况会被取代。

|cff44ff44/racd|r - 开启冷却时间设置。
|cff44ff44/rabuffs|r - 开启增益列表与输出结果。
|cff44ff44/radur|r - 开启耐久度列表。
|cff44ff44/ragear|r - 开启装备检查列表。
|cff44ff44/ralag|r - 开始延迟列表。
|cff44ff44/razone|r - 开启区域列表。
|cff44ff44/radisband|r - 立刻解散团队，不经过确认。
|cff44ff44/raready|r - 执行准备确认。
|cff44ff44/rainv|r - 邀请所有公会成员。
|cff44ff44/razinv|r - 邀请在相同区域的公会成员。
|cff44ff44/rarinv <阶级名称>|r - 邀请你输入的公会阶级成员。]=]
L["slashCommandsHeader"] = "指令"
L["sort"] = "排序"
L["spacing"] = "间距"
L["spellName"] = "技能名称"
L["spellTooltip"] = "显示法术提示"
-- L["statusColor"] = "Status color"
L["style"] = "条类型"
L["tankButtonHelp"] = "切换是否这坦克应该为内建主坦克。"
L["tankHelp"] = [=[在置顶名单的人是你个人排序的坦克。他们并不分享给团队，并且任何人可以拥有不同的个人坦克名单。在置底名单点选一个名称增加他们到你个人坦克名单。

在盾图示上点击就会让那人成为内建主坦克。内建坦克是团队所有人中所共享并且你必须被晋升来做切换。

在名单出现的坦克基于某些人让他们成为内建坦克，当他们不再是内建主坦克就会从名单移除。

在这期间使用检查标记来储存。下一次团队里有那人，他会自动的被设定为个人坦克。]=]
L["tanks"] = "坦克"
L["tankTabTopText"] = "点击下方列表将其设为坦克。将鼠标移动到按钮上可看到操作提示。"
L["test"] = "测试"
L["texture"] = "材质"
L["thick"] = "粗"
L["thin"] = "细"
L["timestamp"] = "显示时间戳"
L["timeVisible"] = "可见时间 (0=永远可见)"
L["toggleMonitor"] = "切换监视器"
L["togglePane"] = "切换oRA3面板"
L["toggleWithRaid"] = "随着团队面板开启"
L["toggleWithRaidDesc"] = "一起随着内建团队面板自动开启和关闭。如果你禁用这设定，你扔然可以用按键绑定或是/命令来开启oRA3面板,列如|cff44ff44/radur|r。"
L["unitName"] = "单位名称"
L["unknown"] = "未知"
L["up"] = "上"
L["useClassColor"] = "使用职业颜色"
L["useStatusColor"] = "使用状态颜色"
L["useStatusColorDesc"] = "改变状态条颜色当玩家超出距离、死亡或离线."
L["whatIsThis"] = "到底怎么回事?"
L["whisperMissing"] = "密语缺少者"
L["whisperMissingDesc"] = "密语缺少增益的玩家。"
L["world"] = "世界"
L["zone"] = "区域"

