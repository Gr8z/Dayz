private ["_msg","_trade_item","_currency","_price","_BoS","_textPart","_obj","_qty","_keySelected","_isKeyOK","_config","_isOk","_removed","_trader","_helipad","_location","_veh","_hitpoints","_okToSell","_tires","_tireDmg","_damage","_objectID","_objectUID","_needed"];
if (DZE_ActionInProgress) exitWith {
	_msg = "Trade already in progress.";
	systemChat ("(ArmA-AH.net): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
DZE_ActionInProgress = true;
_trade_item = _this select 0;
_currency 	= _this select 1;
_price 		= _this select 2;
_BoS 		= _this select 3;
_textPart 	= _this select 4;
_obj 		= (nearestObjects [(getPosATL player), [_trade_item], 80]);
_qty 		= (if (_BoS == "buy") then [{player getVariable ["GGCoins",0]},{count _obj}]);

if ((_qty <= 0)&&(_BoS == "sell")) exitWith {
	_msg = format["No %1 found within 20 meters.",_textPart];
	systemChat ("(GG-AH): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
	call TraderFinishTrade;
};
if (((_qty >= _price)&&(_BoS == "buy"))||((_qty > 0)&&(_BoS == "sell"))) then {
	if (_BoS == "buy") then {
		_keySelected = format[("ItemKey%1%2"),(["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom),((floor(random 2500)) + 1)];
		_isKeyOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
		_config = _keySelected;
		_isOk = [player,_config] call BIS_fnc_invAdd;
		if (_isOk && (isClass(configFile >> "CfgWeapons" >> _keySelected))) then {
			player setVariable ["GGCoins", (_qty - _price), true];
			_removed = _qty - (player getVariable ["GGCoins",0]);
			_msg = format ["Paid %1 Coins. %2 incoming!",_removed,_trade_item, GCoins];
			_msg call AH_fnc_dynTextMsg;
			if (_removed == _price) then {
				_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
				//PVOZ_tradeshit = [player,_trader,_BoS,_trade_item,_price];publicVariableServer "PVOZ_tradeshit";
				_helipad = nearestObjects [player, ["HeliHCivil","HeliHempty"], 100];
				if (count _helipad > 0) then {_location = (getPosATL (_helipad select 0))} else {_location = [(position player),0,20,1,0,2000,0] call BIS_fnc_findSafePos};
				_veh = createVehicle ["Sign_arrow_down_large_EP1", _location, [], 0,"CAN_COLLIDE"];
				_location = (getPosATL _veh);
				PVDZE_veh_Publish2 = [_veh,[(round(random 360)),_location],_trade_item,false,_keySelected,player];
				publicVariableServer  "PVDZE_veh_Publish2";
				_msg = format ["Bought %3 for %1 %2, key added to toolbelt.",_price,_currency,_textPart];
				_msg call AH_fnc_dynTextMsg;
			} else {player removeMagazine _keySelected};
		} else {
			_msg = "You do not have enough room on your toolbelt for the key!";
			systemChat ("(GG-AH): "+str _msg+"");
			_msg call AH_fnc_dynTextMsg;
		};
	} else {
		_obj = _obj select 0;
		_hitpoints = _obj call vehicle_getHitpoints;
		_okToSell = true;
		_tires = 0;
		_tireDmg = 0;
		_damage = 0;
		{
			if (["Wheel",_x,false] call fnc_inString) then {
				_damage = [_obj,_x] call object_getHit;
				_tireDmg = _tireDmg + _damage;
				_tires = _tires + 1;
			};
		} forEach _hitpoints;
		if ((_tireDmg > 0 and _tires > 0)&&((_tireDmg / _tires) > 0.75)) then {_okToSell = false};
		if ((local _obj)&&(!isNull _obj)&&(alive _obj)) then {
			if (_okToSell) then {
				_trader = (text ((nearestLocations [player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000]) select 0));if (isNil '_trader') then {_trader = 'unknown'};
				//PVOZ_tradeshit = [player,_trader,_BoS,_trade_item,_price];publicVariableServer "PVOZ_tradeshit";
				
				player setVariable ["GGCoins", ((player getVariable ["GGCoins",0]) + _price), true];
				_objectID 	= _obj getVariable ["ObjectID","0"];
				_objectUID	= _obj getVariable ["ObjectUID","0"];
				PVDZE_obj_Delete = [_objectID,_objectUID,player];
				publicVariableServer "PVDZE_obj_Delete";
				deleteVehicle _obj;
				_msg = format ["Sold %1 for %2 %3",_textPart,_price,_currency];
				_msg call AH_fnc_dynTextMsg;
			} else {
				_msg = format ["Cannot sell %1, tires are too damaged.",_textPart];
				systemChat ("(GG-AH): "+str _msg+"");
				_msg call AH_fnc_dynTextMsg;
			};
		} else {
			_msg = "Failed, you must get into the driver's seat first.";
			systemChat ("(GG-AH): "+str _msg+"");
			_msg call AH_fnc_dynTextMsg;
		};
	};
	{player removeAction _x} forEach s_player_parts;s_player_parts = [];
	s_player_parts_crtl = -1;
} else {
	_needed =  _price - _qty;
	_msg = format ["You need another %1 %2",_needed,_textPart];
	systemChat ("(GG-AH): "+str _msg+"");
	_msg call AH_fnc_dynTextMsg;
};
call TraderFinishTrade;