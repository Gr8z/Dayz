diag_log ("(GG-AntiHack): Admin tool additions loading...");

AH_CUSTOM = {
	Level3_custommenu = {
		adminadd set [count adminadd,[" __________________________________","","0","1","0","0",[]]];
		adminadd set [count adminadd,[" Custom Scripts ","","0","1","0","0",[]]];
		adminadd set [count adminadd,[" __________________________________","","0","1","0","0",[]]];
		adminadd set [count adminadd,["    Add to/Sub from target's Cash Money",admin_subaddGold,"0","0","0","1",[]]];
		adminadd set [count adminadd,["    Add to/Sub from target's Bank Money",admin_subaddGoldBank,"0","0","0","1",[]]];
	};
	Level2_custommenu = {
		adminadd set [count adminadd,[" __________________________________","","0","1","0","0",[]]];
		adminadd set [count adminadd,[" Custom Scripts ","","0","1","0","0",[]]];
		adminadd set [count adminadd,[" __________________________________","","0","1","0","0",[]]];
		adminadd set [count adminadd,["    Add to/Sub from target's Cash Money",admin_subaddGold,"0","0","0","1",[]]];
		adminadd set [count adminadd,["    Add to/Sub from target's Bank Money",admin_subaddGoldBank,"0","0","0","1",[]]];
	};
	Level1_custommenu = {};
	admin_subaddGold = {
		_name = _this select 0;
		_allPlayers = playableUnits;
		{
			if (name _x == _name) then {
				sel_gold = nil;
				disableSerialization;
				['Give gold to '+str(_name),'Amount:','Give','sel_gold'] call AH_fnc_displayCreate;
				if (isNil 'sel_gold') then {
					_msg = format ['Giving gold cancelled!',_name];
					systemChat ("(GG-AntiHack): " + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_msg = format ['Giving '+str(sel_gold)+' coins to %1!',_name];
					systemChat ("(GG-AntiHack): " + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_msg = format ['[ADMIN] %1 gave you %2 coins.',name player,sel_gold call BIS_fnc_numberText];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					
					_savelog = format['%1 gave %3 coins to %2',name player,_name,sel_gold call BIS_fnc_numberText];
					[_savelog] call admin_adminlogAction;
					
					_dothis = format ['
						if (name player == ''%1'') then {
							[] spawn {
								player setVariable ["GGCoins",(player getVariable["GGCoins",0])+ %3,true];
								uiSleep 1;
								PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
							};
						};
					',_name,name player,sel_gold];
					[_dothis] spawn admin_dothis;
				};
			};
		} forEach _allPlayers;
	};
	admin_subaddGoldBank = {
		_name = _this select 0;
		_allPlayers = playableUnits;
		{
			if (name _x == _name) then {
				sel_gold = nil;
				disableSerialization;
				['Give gold to '+str(_name),'Amount:','Give','sel_gold'] call AH_fnc_displayCreate;
				if (isNil 'sel_gold') then {
					_msg = format ['Giving bank money cancelled!',_name];
					systemChat ("(GG-AntiHack): " + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_msg = format ['Adding '+str(sel_gold)+' to %1''s bank!',_name];
					systemChat ("(GG-AntiHack): " + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_msg = format ['%1 added %2 coins to your bank.',name player,sel_gold call BIS_fnc_numberText];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					
					_savelog = format['%1 added %3 coins to %2''s bank',name player,_name,sel_gold call BIS_fnc_numberText];
					[_savelog] call admin_adminlogAction;
					
					_dothis = format ['
						if (name player == ''%1'') then {
							[] spawn {
								player setVariable ["GGBank",(player getVariable["GGBank",0])+ %3,true];
								uiSleep 1;
								PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer "PVDZE_plr_Save";
								PVDZE_bank_Save = [player];publicVariableServer "PVDZE_bank_Save";
							};
						};
					',_name,name player,sel_gold];
					[_dothis] spawn admin_dothis;
				};
			};
		} forEach _allPlayers;
	};
};


diag_log ("(GG-AntiHack): Admin tool additions loaded...");