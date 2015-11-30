BankDialogTransferAmount 		= 13000;
BankDialogPlayerBalance 		= 13001;
BankDialogBankBalance 			= 13002;
BankDialogMaxAmount 			= 13003;

SCTraderDialogCatList 			= 32000;
SCTraderDialogItemList 			= 32001;
SCTraderDialogBuyPrice 			= 32002;
SCTraderDialogSellPrice 		= 32003;

GivePlayerDialogTransferAmount 	= 14000;
GivePlayerDialogPlayerBalance 	= 14001;
GivePlayerDialogTargetBalance 	= 14002;

SafeDialogPlayerBalance 		= 13021;
SafeDialogBankBalance 			= 13022;
SafeDialogMaxAmount 			= 13023;

BankDialogUpdateAmounts = {
	ctrlSetText [BankDialogPlayerBalance, format["%1 %2", (player getVariable ['GGCoins', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [BankDialogBankBalance, format["%1 %2", (player getVariable ['GGBank', 0] call BIS_fnc_numberText), CurrencyName]];
	if (getPlayerUID player in BankDonator) then {ctrlSetText [BankDialogMaxAmount, format["Max: %1 %2", [MaxDonatorBankMoney] call BIS_fnc_numberText, CurrencyName]];} else 
	{ctrlSetText [BankDialogMaxAmount, format["Max: %1 %2", [MaxBankMoney] call BIS_fnc_numberText, CurrencyName]];};
};

GivePlayerDialogAmounts = {
	ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", (player getVariable ['GGCoins', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [GivePlayerDialogTargetBalance, format["%1 %2", (cursorTarget getVariable ['GGCoins', 0] call BIS_fnc_numberText), CurrencyName]];
	ctrlSetText [14003, format["%1", (name cursorTarget)]];
};

BankDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = parseNumber (_this select 0);	
	_bank = player getVariable ["GGBank", 0];
	_wealth = player getVariable["GGCoins",0];
	
	if(_amount > 999999) exitWith { cutText ["You can not withdraw more then 999,999 gold coins at once.", "PLAIN DOWN"]; };
	if(_amount < 1 or _amount > _bank) exitWith { cutText ["You can not withdraw more than is in your bank.", "PLAIN DOWN"]; };
	
	player setVariable["GGCoins",(_wealth + _amount),true];
	player setVariable["GGBank",(_bank - _amount),true];
	
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];
	publicVariableServer "PVDZE_bank_Save";

	cutText [format["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
};

BankDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];
	_amount = parseNumber (_this select 0);
	_bank = player getVariable ["GGBank", 0];
	_wealth = player getVariable["GGCoins",0];
	
	if(_amount > 999999) exitWith { cutText ["You can not deposit more then 999,999 gold coins at once.", "PLAIN DOWN"]; };
	if (_amount < 1 or _amount > _wealth) exitWith { cutText ["You can not deposit more than you have.", "PLAIN DOWN"]; };

	PVDZE_account_Doublecheck = [player];
	publicVariableServer "PVDZE_account_Doublecheck";
	
	if(   LimitOnBank  && ((_bank + _amount ) >  MaxBankMoney)) then{
		if(   (getPlayerUID player in BankDonator )  && ((_bank + _amount ) <  MaxDonatorBankMoney)) then{ 
			player setVariable["GGCoins",(_wealth - _amount),true];
			player setVariable["GGBank",(_bank + _amount),true];		
			cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];			
		}else{
			cutText [format["You can only have a max of %1 %3, donators %2. If you want this donor perk, please contact an admin", [MaxBankMoney] call BIS_fnc_numberText,[MaxDonatorBankMoney] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
		};
	}else{	
		player setVariable["GGCoins",(_wealth - _amount),true];
		player setVariable["GGBank",(_bank + _amount),true];
			
		cutText [format["You have deposited %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
	};

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_bank_Save = [player];
	publicVariableServer "PVDZE_bank_Save";
};

SafeDialogUpdateAmounts = {
	ctrlSetText [SafeDialogPlayerBalance, format["%1 %2", [(player getVariable ['GGCoins', 0])] call BIS_fnc_numberText, CurrencyName]];
	ctrlSetText [SafeDialogBankBalance, format["%1 %2", [(TargetSafe getVariable ['safeMoney', 0])] call BIS_fnc_numberText, CurrencyName]];
	ctrlSetText [SafeDialogMaxAmount, format["Max: %1 %2", [SafeMaxDeposit] call BIS_fnc_numberText, CurrencyName]];
};

SafeDialogWithdrawAmount = {
	private ["_amount","_safe","_wealth"];
	
	_amount = parseNumber (_this select 0);	
	_safe = SafeStorage getVariable ["safeMoney", 0];
	_wealth = player getVariable["GGCoins",0];
	_displayName = "Safe";		
	
	if (!isNull SafeStorage) then {
	
	if (_amount < 1 or _amount > _safe) exitWith {
		cutText [format["You can not withdraw more than is in the %1.",_displayName], "PLAIN DOWN"];
	};

	player setVariable["GGCoins",(_wealth + _amount),true];
	SafeStorage setVariable["safeMoney",(_safe - _amount),true];

	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	
	PVDZE_veh_Update = [SafeStorage,"gear"];
	publicVariableServer "PVDZE_veh_Update";

	cutText [format["You have withdrawn %1 %2 out of the %3", [_amount] call BIS_fnc_numberText, CurrencyName,_displayName], "PLAIN DOWN"];
	
	}else{
		cutText ["Unable to access Coins. Please try again.", "PLAIN DOWN"];
	};
};

SafeDialogDepositAmount = {
	private ["_amount","_safe","_wealth"];	
	_maxCap = 0;	

	_amount = parseNumber (_this select 0);
	_safe = SafeStorage getVariable ["safeMoney", 0];
	_wealth = player getVariable["GGCoins",0];
	
	if (!isNull SafeStorage) then {
	
		if (_amount < 1 or _amount > _wealth) exitWith {
			cutText ["You can not deposit more than you have.", "PLAIN DOWN"];
		};

		if ((_safe + _amount ) >  SafeMaxDeposit) then{
				cutText [format["You can only store a max of %1 %2 in this Safe.", [SafeMaxDeposit] call BIS_fnc_numberText,CurrencyName], "PLAIN DOWN"];
		}else{	
			player setVariable["GGCoins",(_wealth - _amount),true];
			SafeStorage setVariable["safeMoney",(_safe + _amount),true];
			cutText [format["You have deposited %1 %2 in the Safe.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];
		};
		PVDZE_plr_Save = [player,(magazines player),true,true] ;
		publicVariableServer "PVDZE_plr_Save";
		
		PVDZE_veh_Update = [SafeStorage,"gear"];
		publicVariableServer "PVDZE_veh_Update";
	}else{
		cutText ["Unable to access Coins. Please try again.", "PLAIN DOWN"];
	};
};

GivePlayerAmount = {
	private ["_amount","_target","_wealth"];
	_amount = parseNumber (_this select 0);
	_target = cursorTarget;
	_wealth = player getVariable["GGCoins",0];
	_twealth = _target getVariable["GGCoins",0];
	_isMan = _target isKindOf "Man";
	
	if (_target getVariable ["tradingmoney", false]) exitWith {
		cutText ["You can not give to someone who is already trading.", "PLAIN DOWN"];
	};
	if (_amount < 1 or _amount > _wealth) exitWith {
		cutText ["You can not give more than you currently have.", "PLAIN DOWN"];
	};
	if (!_isMan) exitWith {
		cutText ["You are not looking correctly at a player", "PLAIN DOWN"];
	};
	if (_InTrd == 1) exitWith {
        cutText ["Other Player is busy, please wait.", "PLAIN DOWN"];
    };
	PVDZE_account_Doublecheck = [player];
	publicVariableServer "PVDZE_account_Doublecheck";
	player setVariable["GGCoins",_wealth - _amount, true];
	_target setVariable["GGCoins",_twealth + _amount, true];
	
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	PVDZE_plr_Save = [_target,(magazines _target),true,true] ;
	publicVariableServer "PVDZE_plr_Save";

	cutText [format["You gave %1 %2.", _amount, CurrencyName], "PLAIN DOWN"];
};