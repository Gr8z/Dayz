GivePlayerAmount = {
	private ["_amount","_wealth"];
	if ((isNull give_targetP)||(isNil 'give_targetP')) exitWith {
		_msg = "ERROR! Could not find player, please try again.";
		systemChat ("Server: "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
		give_targetP = nil;
	};
	_amount = round(parseNumber _this);
	_wealth = player getVariable["GGCoins",0];
	if (_amount < 1 or _amount > _wealth) exitWith {
		_msg = "You can not give more than you currently have.";
		systemChat ("Server: "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	
	player setVariable["GGCoins",_wealth - _amount, true];
	PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
	PVDZE_procReq_cash = [give_targetP,player,_amount];publicVariableServer "PVDZE_procReq_cash";
	
	_msg = format ["You gave %1 %2 %3.",name give_targetP, _amount, GCoins];
	systemChat ("Server: "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	give_targetP = nil;
};
give_targetP = _this select 3;

if (give_targetP getVariable ["tradingmoney", false]) exitWith {
	cutText ["You can not give to someone who is already trading.", "PLAIN DOWN"];
};

createdialog "GivePlayerDialog";
ctrlSetText [14001, format["%1 %2", (player getVariable ['GGCoins', 0] call BIS_fnc_numberText), GCoins]];
ctrlSetText [14003, name give_targetP];
player setVariable ["tradingmoney", true, true];
[] spawn {
	while {dialog} do {
		if (give_targetP getVariable ["tradingmoney", false]) exitWith {
			closeDialog 0;
		};
		uiSleep 0.25;
	};
};
waitUntil {uiSleep 1; !dialog};
player setVariable ["tradingmoney", false, true];