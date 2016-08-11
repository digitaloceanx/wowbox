﻿-- $Id: localization.tw.lua 151 2016-08-05 07:29:44Z arith $ 

local L = LibStub("AceLocale-3.0"):NewLocale("Accountant_Classic", "zhTW", false)

if not L then return end
L["ACCLOC_TITLE"] = "收支統計"
L["ACCLOC_ABOUT"] = "關於"
L["ACCLOC_AUC"] = "拍賣場"
L["ACCLOC_BUTPOS"] = "小地圖按鈕位置"
L["ACCLOC_CENT"] = "銅"
L["ACCLOC_CHAR"] = "角色"
L["ACCLOC_CHARREMOVEDONE"] = "「%s - %s」角色的個人會計資料已經移除。"
L["ACCLOC_CHARREMOVETEXT"] = [=[即將移除選取的角色。
是否確定要從個人會計的資料庫中移除下列角色?]=]
L["ACCLOC_CHARS"] = "所有角色"
L["ACCLOC_CLEANUPACCOUNTANT"] = [=[您以手動執行了以下函式
|cFF00FF00AccountantClassic_CleanUpAccountantDB()|r 
以清除在 "Accountant" 插件裡衝突的資料。
現在請按下確定按鍵以重新載入遊戲。]=]
L["ACCLOC_CONFLICT"] = [=[偵測到衝突的插件 - |cFFFF0000Accountant|r。
它已被停止啟用，按下確定按鍵以重新載入遊戲。]=]
L["ACCLOC_DATEFORMAT"] = "選擇日期格式："
L["ACCLOC_DATEFORMAT_TIP"] = "在「本週」與「所有角色」頁籤所顯示的日期格式"
L["ACCLOC_DAY"] = "本日"
L["ACCLOC_DESC"] = "追蹤每個角色的所有收入與支出狀況，並可顯示當日小計、當週小計、以及自有記錄起的總計。並可顯示所有角色的總金額。"
L["ACCLOC_DONE"] = "完成"
L["ACCLOC_EXIT"] = "離開"
L["ACCLOC_GOLD"] = "金"
L["ACCLOC_IN"] = "收入"
L["ACCLOC_INTROTIPS"] = "顯示指引提示"
L["ACCLOC_INTROTIPS_TIP"] = "選擇是否在小地圖按鈕或浮動視窗顯示額外的操作提示"
L["ACCLOC_LDBINFOTYPE"] = "在 LDB 支援的顯示列上顯示本次的淨收入/支出而不是總是顯示總金額"
L["ACCLOC_LFG"] = "隨機地城、團隊與事件"
L["ACCLOC_LOADED"] = "個人會計插件已載入"
L["ACCLOC_LOADPROFILE"] = "讀取個人會計資料給%s"
L["ACCLOC_MAIL"] = "郵寄"
L["ACCLOC_MERCH"] = "商人"
L["ACCLOC_MINIBUT"] = "顯示小地圖按鈕"
L["ACCLOC_MINIBUTMONEY"] = "在小地圖按鈕的提示顯示目前現金"
L["ACCLOC_MINIBUTSESSINF"] = "在小地圖按鈕的提示顯示本次收入/支出"
L["ACCLOC_MONEY"] = "金錢"
L["ACCLOC_MONTH"] = "本月"
L["ACCLOC_NET"] = "淨收益/虧損"
L["ACCLOC_NETLOSS"] = "淨虧損"
L["ACCLOC_NETPROF"] = "淨收益"
L["ACCLOC_NEWPROFILE"] = "新的個人會計資料已建立給%s"
L["ACCLOC_ONSCRMONEY"] = "在遊戲畫面顯示目前現金"
L["ACCLOC_OPTBUT"] = "選項"
L["ACCLOC_OPTS"] = "個人會計選項"
L["ACCLOC_OTHER"] = "未知"
L["ACCLOC_OUT"] = "支出"
L["ACCLOC_PRVMON"] = "上一月"
L["ACCLOC_QUEST"] = "任務獎勵"
L["ACCLOC_REMOVECHAR"] = "選擇要移除的角色:"
L["ACCLOC_REMOVECHAR_TIP"] = "被選取的角色的個人會計資料將會被移除。"
L["ACCLOC_REPAIR"] = "修理裝備"
L["ACCLOC_RESET"] = "歸零"
L["ACCLOC_RESET_CONF"] = "是否確定要將「%s」頁籤的資料歸零?"
L["ACCLOC_RSTMNYFRM_TIP"] = "重置畫面上顯示現金的位置"
L["ACCLOC_RSTPOSITION"] = "重置位置"
L["ACCLOC_SESS"] = "本次"
L["ACCLOC_SILVER"] = "銀"
L["ACCLOC_SOURCE"] = "類別"
L["ACCLOC_STARTWEEK"] = "一週的開始日"
L["ACCLOC_SUM"] = "總金額"
L["ACCLOC_TAXI"] = "飛行花費"
L["ACCLOC_TIP"] = [=[左鍵開啟個人會計
右鍵開啟個人會計選項
右鍵並拖曳以移動圖示按鈕位置]=]
L["ACCLOC_TIP2"] = [=[右鍵並拖曳以移動圖示按鈕位置
右鍵開啟個人會計]=]
L["ACCLOC_TITLE"] = "個人會計"
L["ACCLOC_TOTAL"] = "總計"
L["ACCLOC_TOT_IN"] = "總收入"
L["ACCLOC_TOT_OUT"] = "總支出"
L["ACCLOC_TRADE"] = "交易"
L["ACCLOC_TRAIN"] = "訓練費用"
L["ACCLOC_UPDATED"] = "更新"
L["ACCLOC_WEEK"] = "本週"
L["ACCLOC_WEEKSTART"] = "當週首日"
L["BINDING_HEADER_ACCOUNTANT"] = "個人會計"
L["BINDING_NAME_ACCOUNTANTTOG"] = "切換個人會計"
L["ToC/Description"] = "|cff00CC33追蹤每個角色的所有收入與支出狀況，並可顯示當日小計、當週小計、以及自有記錄起的總計，並可顯示所有角色的總金額。|r"
L["ToC/Title"] = "|cFF00FF00[資訊]|r個人會計"


