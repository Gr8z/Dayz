GivePlayerAmount = {
	private ["_amount","_wealth"];
	if ((isNull give_targetP)||(isNil 'give_targetP')) exitWith {
		_msg = "ERROR! Could not find player, please try again.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
		give_targetP = nil;
	};
	_amount = round(parseNumber _this);
	_wealth = player getVariable["GGCoins",0];
	if (_amount < 1 or _amount > _wealth) exitWith {
		_msg = "You can not give more than you currently have.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	
	player setVariable["GGCoins",_wealth - _amount, true];
	PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
	PVDZE_procReq_cash = [give_targetP,player,_amount];publicVariableServer "PVDZE_procReq_cash";
	
	_msg = format ["You gave %1 %2 %3.",name give_targetP, _amount, GCoins];
	systemChat ("(ArmA-AH): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	give_targetP = nil;
};
give_targetP = _this select 3;
createdialog "GivePlayerDialog";
ctrlSetText [14001, format["%1 %2", (player getVariable ['GGCoins', 0] call BIS_fnc_numberText), GCoins]];
ctrlSetText [14003, name give_targetP];