private ["_part_out","_part_in","_qty_out","_qty_in","_qty","_buy_o_sell","_traderID","_bos","_needed","_activatingPlayer","_textPartIn","_textPartOut","_started","_finished","_animState","_isMedic","_removed"];
// [part_out,part_in, qty_out, qty_in,"buy"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_activatingPlayer = player;

_part_out = (_this select 3) select 0;
_part_in = (_this select 3) select 1;
_qty_out = (_this select 3) select 2;
_qty_in = (_this select 3) select 3;
_buy_o_sell = (_this select 3) select 4;
_textPartIn = (_this select 3) select 5;
_textPartOut = (_this select 3) select 6;
_traderID = (_this select 3) select 7;
_bos = 0;

if(_buy_o_sell == "buy") then {
	//_qty = {_x == _part_in} count magazines player;
	_qty = player getVariable ["cashMoney",0]; // get your money variable	
} else {
	_qty = {_x == _part_in} count weapons player;
	_bos = 1;
};

if (_qty >= _qty_in) then {

	cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"];
	 
	[1,1] call dayz_HungerThirst;

	private["_newPosition","_finished","_oldPosition"];
    if(isNil "_oldPosition") then { _oldPosition = position player;};
    _finished = false;
    sleep 2;
    if (player distance _oldPosition <= 2) then {
        _finished = true;
    };
	
    if (!_finished) exitWith {
        DZE_ActionInProgress = false;
        r_autoTrade = false;
        cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
    };

	if (_finished) then {

		// double check for all parts
		if(_buy_o_sell == "buy") then {
			//_qty = {_x == _part_in} count magazines player;
			_qty = player getVariable ["cashMoney",0]; // get your money variable	

		} else {
			_qty = {_x == _part_in} count weapons player;
		};

		if (_qty >= _qty_in) then {

			if (isNil "_part_out") then { _part_out = "Unknown Weapon/Magazine" };
			if (isNil "inTraderCity") then { inTraderCity = "Unknown Trader City" };
			if (_bos == 1) then {
				// Selling
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_in,inTraderCity,CurrencyName,_qty_out];
			} else {
				// Buying
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_out,inTraderCity,CurrencyName,_qty_in];
			};
			publicVariableServer  "PVDZE_obj_Trade";
	
			waitUntil {!isNil "dayzTradeResult"};

			//diag_log format["DEBUG Complete Trade: %1", dayzTradeResult];

			if(dayzTradeResult == "PASS") then {

					if(_buy_o_sell == "buy") then {
							//_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
				_qtychange = _qty - _qty_in;
				player setVariable ["cashMoney", _qtychange , true];	
				_newM = player getVariable ["cashMoney",0];
				//_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
				_removed = _qty - _newM; // 
							
				if(_removed == _qty_in) then {
					for "_x" from 1 to _qty_out do {
						player addWeapon _part_out;
					};
					cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
				};
						} else {
							
										//_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);

				_removed = ([player,_part_in,_qty_in] call BIS_fnc_invRemove);
				 							
				if(_removed == _qty_in) then {
					//for "_x" from 1 to _qty_out do {
						//player addWeapon _part_out;
					//};
					_myMoney = player getVariable ["cashMoney",0];
								_myMoney = _myMoney + _qty_out;
								player setVariable ["cashMoney", _myMoney , true];	
								
					cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
				};
							cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
						};
			
				
	
				
		
				{player removeAction _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;

			} else {
				cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
			};
			dayzTradeResult = nil;
		};
	};

} else {
	_needed =  _qty_in - _qty;
	cutText [format[(localize "str_epoch_player_184"),_needed,_textPartIn] , "PLAIN DOWN"];
};

DZE_ActionInProgress = false;