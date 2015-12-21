BankDialogUpdateAmounts = {
	ctrlSetText [13001, format["%1 %2", (player getVariable ['GGCoins', 0] call BIS_fnc_numberText), GCoins]];
	ctrlSetText [13002, format["%1 %2", (player getVariable ['GGBank', 0] call BIS_fnc_numberText), GCoins]];
};
BankDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = round(parseNumber (_this select 0));
	_bank = player getVariable ["GGBank", 0];
	_wealth = player getVariable["GGCoins",0];
	if (_amount > 999999) exitWith {
		_msg = "You can not withdraw more than 999,999 gold coins at once.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	if (_amount < 1 or _amount > _bank) exitWith {
		_msg = "You can not withdraw more than your bank balance.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	player setVariable["GGCoins",(_wealth + _amount),true];
	player setVariable["GGBank",(_bank - _amount),true];
	PVOZ_coinlog = [player,"withdrew",[_amount] call BIS_fnc_numberText,(player getVariable ["GGCoins",0]),(player getVariable ["GGBank",0])];
	publicVariableServer "PVOZ_coinlog";
	PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];publicVariableServer "PVDZE_bank_Save";
	_msg = format ["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, GCoins];
	systemChat ("(ArmA-AH): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
BankDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = round(parseNumber (_this select 0));
	_bank = player getVariable ["GGBank", 0];
	_wealth = player getVariable["GGCoins",0];
	if (_amount > 999999) exitWith {
		_msg = "You can not deposit more than 999,999 gold coins at once.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	if (_amount < 1) exitWith {
		_msg = "You can not deposit less than 1 coin.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	if (_amount > _wealth) exitWith {
		_msg = "You can not deposit more than you have.";
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
		PVDZE_account_Doublecheck = [player];
		publicVariableServer "PVDZE_account_Doublecheck";
	};
	if (DZE_limitbank && ((_bank + _amount) > DZE_maxBank)) then {
		if !(isNil 'MaxDonatorBankMoney') then {
			if ((_bank + _amount) <  MaxDonatorBankMoney) then {
				player setVariable["GGCoins",(_wealth - _amount),true];
				player setVariable["GGBank",(_bank + _amount),true];
				PVOZ_coinlog = [player,"deposited",[_amount] call BIS_fnc_numberText,(player getVariable ["GGCoins",0]),(player getVariable ["GGBank",0])];
				publicVariableServer "PVOZ_coinlog";
				_msg = format ["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, GCoins];
				systemChat ("(ArmA-AH): "+str _msg+"");
				_msg call AH_fnc_dynTextMsg;
			} else {
				_msg = format ["You can only have a max of %1 %2",[MaxDonatorBankMoney] call BIS_fnc_numberText,GCoins];
				systemChat ("(ArmA-AH): "+str _msg+"");
				_msg call AH_fnc_dynTextMsg;
			};
		} else {
			_msg = format ["You can only have a max of %1 %2, donators can have up to 2,000,000!", [DZE_maxBank] call BIS_fnc_numberText,GCoins];
			systemChat ("(ArmA-AH): "+str _msg+"");
			_msg call AH_fnc_dynTextMsg;
		};
	} else {
		player setVariable["GGCoins",(_wealth - _amount),true];
		player setVariable["GGBank",(_bank + _amount),true];
		PVOZ_coinlog = [player,"deposited",[_amount] call BIS_fnc_numberText,(player getVariable ["GGCoins",0]),(player getVariable ["GGBank",0])];
		publicVariableServer "PVOZ_coinlog";
		_msg = format ["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, GCoins];
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
	PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];publicVariableServer "PVDZE_bank_Save";
};
if (isServer) then {
	"PVOZ_tradeshit" addPublicVariableEventHandler {
		_arr 	= (_this select 1);
		_player = _arr select 0;
		_trader = _arr select 1;
		_action = _arr select 2;
		_item 	= _arr select 3;
		_coins 	= _arr select 4;
		
		_action = if (_action == "buy") then {"bought"} else {"sold"};
		
		_log = format ["%1 (%2) %3 %4 at %5 for %6 coins",name _player,getPlayerUID _player,_action,_item,_trader,_coins];
		diag_log ("PLAYER TRADE: "+str _log);
		"TradeLog" callExtension ("PLAYER TRADE: "+str _log);
	};
	"PVOZ_coinlog" addPublicVariableEventHandler {
		_arr 	= (_this select 1);
		_player = (_arr select 0);
		_action = (_arr select 1);
		_amount = (_arr select 2);
		_wallet = (_arr select 3);
		_bank 	= (_arr select 4);
		
		if (isNil '_wallet') then {_wallet = _player getVariable ["GGBank",0]};
		if (isNil '_bank') then {_bank = _player getVariable ["GGCoins",0]};
		
		"CoinLog" callExtension format["PLAYER: %1 (%2) %3 %4 WALLET: %5 BANK: %6 INSTANCE: %7",name _player,getPlayerUID _player,_action,_amount,_wallet,_bank,dayz_instance];
	};
};
"PVDZE_procReq_cash" addPublicVariableEventHandler {
	_arr 		= (_this select 1);
	_receive 	= (_arr select 0);
	_send 		= (_arr select 1);
	_amount 	= (_arr select 2);
	
	if (isServer) then {
		PVOZ_coinlog = [_send,"sent "+name _receive,(_amount call BIS_fnc_numberText),(_send getVariable ["GGCoins",0]),(_send getVariable ["GGBank",0])];
		publicVariableServer "PVOZ_coinlog";
		PVDZE_procReq_cash = [_receive,_send,_amount];
		(owner _receive) publicVariableClient "PVDZE_procReq_cash";
	} else {
		player setVariable["GGCoins",(player getVariable["GGCoins",0]) + _amount, true];
		PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
		_msg = format ["%1 gave you %2 %3.",name _send,_amount,GCoins];
		systemChat ("(ArmA-AH): "+str _msg+"");
		_msg call AH_fnc_dynTextMsg;
	};
};