private ["_dialog"];
GivePlayerTarget = _this select 3;

if (GivePlayerTarget getVariable ["tradingmoney", false]) exitWith {
	cutText ["You can not give to someone who is already trading.", "PLAIN DOWN"];
};

_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;
player setVariable ["tradingmoney", true, true];
[] spawn {
	while {dialog} do {
		if (GivePlayerTarget getVariable ["tradingmoney", false]) exitWith {
			closeDialog 0;
		};
		uiSleep 0.25;
	};
};
waitUntil {uiSleep 1; !dialog};
player setVariable ["tradingmoney", false, true];