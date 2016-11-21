-- $Id: localization.en.lua 150 2016-08-04 16:54:18Z arith $ 

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Accountant_Classic", "enUS", true, is_silent);

if not L then return end

L["ACCLOC_ABOUT"] = "About"
L["ACCLOC_AUC"] = "Auction House"
L["ACCLOC_BUTPOS"] = "Minimap Button Position"
L["ACCLOC_CENT"] = "c"
L["ACCLOC_CHAR"] = "Character"
L["ACCLOC_CHARREMOVEDONE"] = "\"%s - %s\" character's Accountant Classic data has been removed."
L["ACCLOC_CHARREMOVETEXT"] = [=[The selected character is about to be removed.
Are you sure you want to remove the following character from Accountant Classic?]=]
L["ACCLOC_CHARS"] = "All Chars"
L["ACCLOC_CLEANUPACCOUNTANT"] = [=[You have manually called the function 
|cFF00FF00AccountantClassic_CleanUpAccountantDB()|r 
to clean up conflicted data existed in "Accountant". 
Now click Okay button to reload the game.]=]
L["ACCLOC_CONFLICT"] = [=[Detected the conflicted addon - "|cFFFF0000Accountant|r" exists and loaded.
It has been disabled, click Okay button to reload the game.]=]
L["ACCLOC_DATEFORMAT"] = "Select the date format:"
L["ACCLOC_DATEFORMAT_TIP"] = "Date format showing in \"All Chars\" and \"Week\" tabs"
L["ACCLOC_DAY"] = "Day"
L["ACCLOC_DESC"] = "A basic tool to track your monetary incomings and outgoings within WoW."
L["ACCLOC_DONE"] = "Done"
L["ACCLOC_EXIT"] = "Exit"
L["ACCLOC_GOLD"] = "g "
L["ACCLOC_IN"] = "Incomings"
L["ACCLOC_INTROTIPS"] = "Display Instruction Tips"
L["ACCLOC_INTROTIPS_TIP"] = "Toggle whether to display minimap button or floating money frame's operation tips."
L["ACCLOC_LDBINFOTYPE"] = "Show current session's net income / expanse instead of total money on LDB"
L["ACCLOC_LFG"] = "LFD, LFR and Scen."
L["ACCLOC_LOADED"] = "Accountant Classic loaded."
L["ACCLOC_LOADPROFILE"] = "Loaded Accountant Classic profile for %s"
L["ACCLOC_MAIL"] = "Mail"
L["ACCLOC_MERCH"] = "Merchants"
L["ACCLOC_MINIBUT"] = "Show minimap button"
L["ACCLOC_MINIBUTMONEY"] = "Show money on minimap button's tooltip"
L["ACCLOC_MINIBUTSESSINF"] = "Show session info on minimap button's tooltip"
L["ACCLOC_MONEY"] = "Money"
L["ACCLOC_MONTH"] = "Month"
L["ACCLOC_NET"] = "Net Profit / Loss"
L["ACCLOC_NETLOSS"] = "Net Loss"
L["ACCLOC_NETPROF"] = "Net Profit"
L["ACCLOC_NEWPROFILE"] = "New Accountant Classic profile created for %s"
L["ACCLOC_ONSCRMONEY"] = "Show money on screen"
L["ACCLOC_OPTBUT"] = "Options"
L["ACCLOC_OPTS"] = "Accountant Classic Options"
L["ACCLOC_OTHER"] = "Unknown"
L["ACCLOC_OUT"] = "Outgoings"
L["ACCLOC_PRVMON"] = "Prv. Month"
L["ACCLOC_QUEST"] = "Quest Rewards"
L["ACCLOC_REMOVECHAR"] = "Select the character to be removed:"
L["ACCLOC_REMOVECHAR_TIP"] = "The selected character's Accountant Classic data will be removed."
L["ACCLOC_REPAIR"] = "Repair Costs"
L["ACCLOC_RESET"] = "Reset"
L["ACCLOC_RESET_CONF"] = "Are you sure you want to reset the \"%s\" data?"
L["ACCLOC_RSTMNYFRM_TIP"] = "Reset money frame's position"
L["ACCLOC_RSTPOSITION"] = "Reset position"
L["ACCLOC_SESS"] = "Session"
L["ACCLOC_SILVER"] = "s "
L["ACCLOC_SOURCE"] = "Source"
L["ACCLOC_STARTWEEK"] = "Start of Week"
L["ACCLOC_SUM"] = "Sum Total"
L["ACCLOC_TAXI"] = "Taxi Fares"
L["ACCLOC_TIP"] = [=[Left-Click to open Accountant Classic.
Right-Click for Accountant Classic options.
Left-click and drag to move this button.]=]
L["ACCLOC_TIP2"] = [=[Left-click and drag to move this button.
Right-Click to open Accountant Classic.]=]
L["ACCLOC_TITLE"] = "Accountant Classic"
L["ACCLOC_TOTAL"] = "Total"
L["ACCLOC_TOT_IN"] = "Total Incomings"
L["ACCLOC_TOT_OUT"] = "Total Outgoings"
L["ACCLOC_TRADE"] = "Trade Window"
L["ACCLOC_TRAIN"] = "Training Costs"
L["ACCLOC_UPDATED"] = "Updated"
L["ACCLOC_WEEK"] = "Week"
L["ACCLOC_WEEKSTART"] = "Week Start"
L["BINDING_HEADER_ACCOUNTANT"] = "Accountant Classic"
L["BINDING_NAME_ACCOUNTANTTOG"] = "Toggle Accountant Classic"
L["ToC/Description"] = "A basic tool to track your monetary incomings and outgoings within WoW."
L["ToC/Title"] = "Accountant Classic"

