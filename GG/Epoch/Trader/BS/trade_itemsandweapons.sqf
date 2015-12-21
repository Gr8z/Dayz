private ["_msg","_trade_item","_currency","_price","_BoS","_textPart","_inside","_psamnt","_isWeapon","_qty","_freeslots","_required","_inv","_trader","_removed","_nty","_needed","_textpart"];
if (DZE_ActionInProgress) exitWith {
	_msg = "Trade already in progress.";
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
DZE_ActionInProgress = true;

call dami_getVehicleCargo;
call dami_getBackpackCargo;
call dami_getPlayerCargo;

_trade_item = _this select 0;
_currency 	= _this select 1;
_price 		= _this select 2;
_BoS 		= _this select 3;
_textPart 	= _this select 4;
_inside 	= _this select 5;
_psamnt 	= _this select 6;
_price 		= _price * _psamnt;
_isWeapon 	= isClass (configFile >> 'CfgWeapons' >> _trade_item);
_qty 		= (if (_BoS == "buy") then [{player getVariable ["GGCoins",0]}, {{_x == _trade_item} count (switch (_inside) do {case "plyr": {dami_plyrweps+dami_plyrmags};case "bp": {dami_bpweps+dami_bpmags};case "veh": {dami_vehweps+dami_vehmags};})}]);
_freeslots 	= (switch (_inside) do {default {0};case "plyr": {(([player] call BIS_fnc_invSlotsEmpty) select 4)};case "bp": {((dami_bpobj call dami_checkFreeSlotsBP) select 0)};case "veh": {if (_isWeapon) then {((dami_vehobj call dami_checkFreeSlotsVEH) select 1)} else {((dami_vehobj call dami_checkFreeSlotsVEH) select 0)};};});
_required 	= (_trade_item call dami_countReqWepSlots);
_inv 		= (switch (_inside) do {case "plyr": {"your inventory"};case "bp": {"your backpack"};case "veh": {"your vehicle"};});
if ((_psamnt > 12)&&(_inside == "plyr")&&(_BoS == "buy")) exitWith {
	_msg = "Not enough space!";
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade
};
if ((_inside == 'bp')&&(isNull dami_bpobj)) exitWith {
	_msg = "You are not wearing a backpack!";
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade;
};
if ((_inside == 'veh')&&(isNull dami_vehobj)) exitWith {
	_msg = "Vehicle not found! Make sure you have the key in your main inventory!";
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade;
};
if ((_isWeapon)&&(_BoS == "buy")&&(_inside == 'plyr')&&(primaryWeapon player != "")&&((getNumber (configFile >> "CfgWeapons" >> _trade_item >> "type")) in [0,1,4])) exitWith {
	_msg = "Trade canceled. You already have a primary weapon!";
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade;
};
if ((_isWeapon)&&(_inside == "veh")) then {_required = 1 * _psamnt};
if ((_BoS == "buy")&&((_freeslots < _required)&&(((_inside != "plyr")&&(_isWeapon))||(!_isWeapon)))) exitWith {
	_msg = ("Not enough room inside "+_inv+" to buy "+_textPart+"! Free slots: "+str _freeslots+" Required: "+str _required);
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade;
};
if (((_qty >= _price)&&(_BoS == "buy"))||((_qty >= _psamnt)&&(_BoS == "sell"))) then {
	if (_BoS == "buy") then {
		_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
		//PVOZ_tradeshit = [player,_trader,_BoS,_textPart,_price];publicVariableServer "PVOZ_tradeshit";
		player setVariable ["GGCoins", (_qty - _price), true];
		_removed = _qty - (player getVariable ["GGCoins",0]);
		if (_removed == _price) then {
			if (_isWeapon) then {
				switch (_inside) do {
					default {0};
					case "plyr": {for "_i" from 1 to _psamnt do {player addWeapon _trade_item}};
					case "bp": {[dami_bpobj,_trade_item,_psamnt,"wep"] call dami_addToCargo};
					case "veh": {[dami_vehobj,_trade_item,_psamnt,"wep"] call dami_addToCargo};
				};
			} else {
				switch (_inside) do {
					default {0};
					case "plyr": {for "_i" from 1 to _psamnt do {player addMagazine _trade_item}};
					case "bp": {[dami_bpobj,_trade_item,_psamnt,"mag"] call dami_addToCargo};
					case "veh": {[dami_vehobj,_trade_item,_psamnt,"mag"] call dami_addToCargo};
				};
			};
			_msg =format["Bought %1 %2(s) for %3 %4",_psamnt,_textPart,_price,_currency];
			_msg call AH_fnc_dynTextMsg;
		};
	} else {
		dami_failed = false;
		if (_isWeapon) then {
			switch (_inside) do {
				default {0};
				case "plyr": {for "_i" from 1 to _psamnt do {player removeWeapon _trade_item}};
				case "bp": {[dami_bpobj,_trade_item,_psamnt,"wep"] call dami_removeFromCargo};
				case "veh": {[dami_vehobj,_trade_item,_psamnt,"wep"] call dami_removeFromCargo};
			};
			if (dami_failed) exitWith TraderFinishTrade;
			_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
			//PVOZ_tradeshit = [player,_trader,_BoS,_textPart,_price];publicVariableServer "PVOZ_tradeshit";
			player setVariable ["GGCoins", (((player getVariable ["GGCoins",0]) + _price)) , true];
			_msg =format["Sold %1 %2(s) for %3 %4",_psamnt,_textPart,_price,_currency];
			_msg call AH_fnc_dynTextMsg;
		} else {
			switch (_inside) do {
				default {0};
				case "plyr": {for "_i" from 1 to _psamnt do {player removeMagazine _trade_item}};
				case "bp": {[dami_bpobj,_trade_item,_psamnt,"mag"] call dami_removeFromCargo};
				case "veh": {[dami_vehobj,_trade_item,_psamnt,"mag"] call dami_removeFromCargo};
			};
			call dami_getVehicleCargo;
			call dami_getBackpackCargo;
			call dami_getPlayerCargo;
			_nty = {_x == _trade_item} count (switch (_inside) do {case "plyr": {dami_plyrmags};case "bp": {dami_bpmags};case "veh": {dami_vehmags};});
			if (_qty == _nty) then {
				_msg = "Error selling "+_textPart+"!";
				systemChat ("(ArmA-AH.net): "+str _msg+"");
				_msg call AH_fnc_dynTextMsg;
			} else {
				_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
				//PVOZ_tradeshit = [player,_trader,_BoS,_textPart,_price];publicVariableServer "PVOZ_tradeshit";
				player setVariable ["GGCoins", (((player getVariable ["GGCoins",0]) + _price)) , true];
				_msg = format["Sold %1 %2(s) for %3 %4",_psamnt,_textPart,_price,_currency];
				_msg call AH_fnc_dynTextMsg;
			};
		};
	};
} else {
	_needed = _psamnt - _qty;
	_msg = (if (_BoS == "buy") then {format["Need %1 more %2",_needed,_currency]} else {format["Need %1 more %2",_needed,_textpart]});
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
call TraderFinishTrade;