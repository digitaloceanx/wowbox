if (GetLocale() == "zhCN") then
	-- 简体中文
	WHISPERPOP_LOCALE = {
		["title"] = "密语聊天",
		["no new messages"] = "没有未阅读消息",
		["new messages from"] = "未阅读消息来自: ",
		["receive only"] = "仅显示接收到的消息",
		["sound notifying"] = "声音提示",
		["square minimap"] = "方形小地图",
		["class icon"] = "显示职业图标",
		["level"] = "显示人物等级",
		["time"] = "显示时间标签",
		["requires playerdb"] = "依赖功能缺失: PlayerDB 1.0",
		["receive only tooltip"] = "如果选中，外发的消息将不会显示在列表中。",
		["sound notifying tooltip"] = "如果选中，每次接收到新消息时将发出声音提示。",
		["square minimap tooltip"] = "如果选中，小地图按钮将被定位为方形定位模式。",
		["disabled by SexyMap"] = "已被SexyMap禁止",
		["class icon tooltip"] = "如果选中，人物的职业图标将被显示在消息列表中。需要PlayerDB 1.0或更高版本。",
		["level tooltip"] = "如果选中，人物的等级数字将被显示在消息列表中。需要PlayerDB 1.0或更高版本。",
		["time tooltip"] = "如果选中，时间标签将被添加到每一行消息文字前面。",
		["hide minimap button"] = "隐藏小地图按钮",
		["hide minimap button tooltip"] = "如果选中，此插件的小地图按钮将被隐藏。",
		["delete message"] = "|cff00ff00点击:|r 删除所有收发于 %s 的消息",
		["toggle frame"] = "打开/关闭WhisperPop框体",
		["help tip"] = "操作提示",
		["show help tip"] = "显示操作提示",
		["show help tip tooltip"] = "如果选中，当鼠标移动到某个玩家按钮或消息文本行时，一个|cffffd200操作提示|r标签会显示出来。",
		["player help tip text 1"] = "|cff00ff00点击:|r 打开与 %s 的密聊通话",
		["player help tip text 2"] = "|cff00ff00Shift-点击:|r 查询 %s 的角色信息",
		["player help tip text 3"] = "|cff00ff00Alt-点击:|r 邀请 %s 加入你的队伍",
		["player help tip text 4"] = "|cff00ff00右键点击:|r 打开 %s 的角色菜单",
		["message help tip text"] = "|cff00ff00Ctrl-点击:|r 复制这条信息到聊天输入框",
		["link tip text1"] = "|cff00ff00点击:|r 打开/关闭链接标签",
		["link tip text2"] = "|cff00ff00Shift-点击:|r 转贴这条链接",
		["detach minimap button"] = "小地图按钮脱离",
		["detach minimap button tooltip"] = "如果选中，此插件的小地图按钮将脱离小地图并可以用鼠标自由拖动到任意位置。",
	};
	WHISPER_POP_LABEL = "密语聊天"
	WHISPER_POP_DESC = "记录玩家密语聊天信息"
end