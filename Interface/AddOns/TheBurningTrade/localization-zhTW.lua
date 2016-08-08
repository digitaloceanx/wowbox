if(GetLocale() == "zhTW") then

-- ===================== Part for TradeFrameEnchanced ==================
TBT_SPELL_RANK_PATTERN = "等級 (%d)";
TBT_UNLOCK_SKILL_NAME="开鎖";
local _;
_,_,TBT_GAMETOOLTIP_MADE_BY=string.find(string.gsub(ITEM_CREATED_BY,"%%s","(.+)"),"(<.+>)"); --TBT_GAMETOOLTIP_MADE_BY="<由(.+)製造>"
TBT_SPELL_TABLE = {
	water = { name = "召喚餐點", rank = nil },
	food = { name = "召喚餐點", rank = nil },
	stone = { name="製造治療石", rank = nil },
}
-- =============== just localizate the above, the addon will function ok ========================= 
TBT_LEFT_BUTTON = {
	water		= "水",
	food		= "食",
	stone		= "糖",
	unlock		= "鎖",
}

TBT_RIGHT_BUTTON = {
	whisper		= "密",
	ask		= "要",
	thank		= "謝",
}

TBT_CANT_CREATE_AUCTION = "無法進行拍賣，拍賣按鈕不可用，可能是插件衝突。"
-- ===================== Part for TradeLog ==================
TRADE_LIST_TOOLTIP = "交易記錄"
TRADE_LOG_MONEY_NAME = {
	gold = "g",
	silver = "s",
	copper = "c",
}

CANCEL_REASON_TEXT = {
	self = "你取消了交易",
	other = "對方取消了交易",
	toofar = "雙方距離過遠",
	selfrunaway = "你超出了距離",
	selfhideui = "你隱藏了界面,交易窗口關閉",
	unknown = "未知原因",
}

CANCEL_REASON_TEXT_ANNOUNCE = {
	self = "我取消了交易",
	other = "對方取消了交易",
	toofar = "雙方距離過遠",
	selfrunaway = "我超出了距離",
	selfhideui = "我隱藏了界面,交易窗口關閉",
	unknown = "未知原因",
}

TRADE_LOG_SUCCESS_NO_EXCHANGE = "與[%t]交易成功, 但是沒有做任何交換。";
TRADE_LOG_SUCCESS = "與[%t]交易成功。";
TRADE_LOG_DETAIL = "詳情";
TRADE_LOG_CANCELLED = "與[%t]交易取消: %r。";
TRADE_LOG_FAILED = "與[%t]交易失敗: %r。";
TRADE_LOG_FAILED_NO_TARGET = "交易失敗: %r。";
TRADE_LOG_HANDOUT = "交出";
TRADE_LOG_RECEIVE = "收到";
TRADE_LOG_ENCHANT = "附魔";
TRADE_LOG_ITEM_NUMBER = "%d件物品";
TRADE_LOG_CHANNELS = {
	whisper = "密語",
	raid = "團隊",
	party = "小隊",
	say = "說",
	yell = "喊",
}
TRADE_LOG_ANNOUNCE = "通告";
TRADE_LOG_ANNOUNCE_TIP = "選中就會將交易信息發送到指定的頻道"

-- ===================== Part for TradeList ==================
TRADE_LIST_CLEAR_HISTORY = "清除記錄"
TRADE_LIST_SCALE = "詳情窗口縮放"
TRADE_LIST_FILTER = "僅列出成功交易"

TRADE_LIST_HEADER_WHEN = "交易時間"
TRADE_LIST_HEADER_WHO = "交易對象"
TRADE_LIST_HEADER_WHERE = "交易地點"
TRADE_LIST_HEADER_SEND = "交出"
TRADE_LIST_HEADER_RECEIVE = "獲得"
TRADE_LIST_HEADER_RESULT = "結果"

TRADE_LIST_RESULT_TEXT_SHORT = { 
	cancelled = "取消", 
	complete = "成功", 
	error = "失敗", 
}

TRADE_LIST_RESULT_TEXT = { 
	cancelled = "交易取消", 
	complete = "交易成功", 
	error = "交易失敗", 
}

TRADE_LIST_MONTH_SUFFIX = "月"
TRADE_LIST_DAY_SUFFIX = "日"

TRADE_LIST_COMPLETE_TOOLTIP = "點擊鼠標左鍵查看交易的詳細信息";

TRADE_LIST_CLEAR_CONFIRM = "今天以外的紀錄都將被清除!";

end