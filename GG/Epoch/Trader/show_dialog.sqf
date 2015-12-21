if (DZE_ActionInProgress) exitWith {cutText [(localize "str_epoch_player_97") , "PLAIN DOWN"]};

_trader_data = (_this select 3);

createdialog "AH_traderMenu";
lbClear TraderDialogCatList;
lbClear TraderDialogItemList;
TraderCurrentCatIndex = -1;
TraderItemList = [];
TraderCatList = [];
{
	_index = lbAdd [TraderDialogCatList, _x select 0];
	TraderCatList set [count TraderCatList, _x select 1];
} count _trader_data;
{lbSetData [12710, (lbAdd [ 12710, _x select 0]), _x select 1]} forEach [["Player","plyr"],["Backpack","bp"],["Vehicle","veh"]];
lbSetCurSel [12710,0];
((findDisplay 420420) displayCtrl TradeDialogDescription) ctrlSetStructuredText parseText "<t color='#6fff00'>Green</t> = in inventory<br/><t color='#fdff00'>Yellow</t> = in backpack<br/><t color='#00f9ff'>Blue</t> = in vehicle<br/>";