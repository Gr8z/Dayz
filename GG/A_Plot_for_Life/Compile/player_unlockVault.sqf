private ["_objectID","_objectUID","_obj","_ownerID","_dir","_pos","_holderGG","_weapons","_magazines","_backpacks","_objWpnTypes","_objWpnQty","_countr","_alreadyPacking","_playerNear","_playerID","_claimedBy","_unlockedClass","_text","_nul","_objType","_characterID","_playerUID","_vector"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_21") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} count s_player_combi;s_player_combi = [];
s_player_unlockvault = 1;

_obj = _this;
_objType = typeOf _obj;

if (!(_objType in DZE_LockedStorage)) exitWith {
	s_player_unlockvault = -1;
	DZE_ActionInProgress = false;
};

_playerNear = _obj call dze_isnearest_player;
if(_playerNear) exitWith { DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_20") , "PLAIN DOWN"];  };

if(isNull _obj || !(alive _obj)) exitWith { DZE_ActionInProgress = false; };

_unlockedClass = getText (configFile >> "CfgVehicles" >> _objType >> "unlockedClass");
_text = 		getText (configFile >> "CfgVehicles" >> _objType >> "displayName");

_alreadyPacking = _obj getVariable["packing",0];
_claimedBy = _obj getVariable["claimed","0"];
_characterID = _obj getVariable["CharacterID","0"];
_ownerID = _obj getVariable["ownerPUID","0"];;

if (DZE_APlotforLife) then {
	_playerUID = [player] call FNC_GetPlayerUID;
}else{
	_playerUID = dayz_characterID;
};

if (_alreadyPacking == 1) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_124"),_text], "PLAIN DOWN"]};

if ((_characterID == dayz_combination) || (_ownerID == _playerUID)) then {

	_playerNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]) > 1;
	_playerID = [player] call FNC_GetPlayerUID;

	if (_claimedBy == "0" || !_playerNear) then {
		_obj setVariable["claimed",_playerID,true];
	};
	
	_dir = direction _obj;
	_vector = [(vectorDir _obj),(vectorUp _obj)];	
	_pos	= _obj getVariable["OEMPos",(getposATL _obj)];
	_objectID 	= _obj getVariable["ObjectID","0"];
	_objectUID	= _obj getVariable["ObjectUID","0"];

	_claimedBy = _obj getVariable["claimed","0"];
	
	if (_claimedBy == _playerID) then {

		if(!isNull _obj && alive _obj) then {

			PVDZE_log_lockUnlock = [player, _obj, false];
			publicVariableServer "PVDZE_log_lockUnlock";

			_obj setVariable["packing",1];
			[1,1] call dayz_HungerThirst;
			_weapons = 		_obj getVariable["WeaponCargo",[]];
			_magazines = 	_obj getVariable["MagazineCargo",[]];
			_backpacks = 	_obj getVariable["BackpackCargo",[]];
			_safebank =		_obj getVariable["safeMoney","0"];
			player playActionNow "Medic";
			sleep 1;
			[player,"tentpack",0,false] call dayz_zombieSpeak;
			sleep 5;

			_holderGG = createVehicle [_unlockedClass,_pos,[], 0, "CAN_COLLIDE"];
			deleteVehicle _obj;
			_holderGG setdir _dir;
			_holderGG setVariable["memDir",_dir,true];
			_holderGG setVectorDirAndUp _vector;
			_holderGG setPosATL _pos;
			player reveal _holderGG;
	
			_holderGG setVariable["CharacterID",_characterID,true];
			_holderGG setVariable["ObjectID",_objectID,true];
			_holderGG setVariable["ObjectUID",_objectUID,true];
			_holderGG setVariable ["OEMPos", _pos, true];
			_holderGG setVariable ["ownerPUID", _ownerID , true];
			_holderGG setVariable ["safeMoney", _safebank,true];

			if (count _weapons > 0) then {
				_objWpnTypes = 	_weapons select 0;
				_objWpnQty = 	_weapons select 1;
				_countr = 0;
				{
					_holderGG addweaponcargoGlobal [_x,(_objWpnQty select _countr)];
					_countr = _countr + 1;
				} count _objWpnTypes;
			};
	
			if (count _magazines > 0) then {
				_objWpnTypes = _magazines select 0;
				_objWpnQty = _magazines select 1;
				_countr = 0;
				{
					if( _x != "CSGAS" ) then
					{
						_holderGG addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];
						_countr = _countr + 1;
					};
				} count _objWpnTypes;
			};

			if (count _backpacks > 0) then {
				_objWpnTypes = _backpacks select 0;
				_objWpnQty = _backpacks select 1;
				_countr = 0;
				{
					_holderGG addbackpackcargoGlobal [_x,(_objWpnQty select _countr)];
					_countr = _countr + 1;
				} count _objWpnTypes;
			};
	
			cutText [format[(localize "str_epoch_player_125"),_text], "PLAIN DOWN"];
		};
	} else {
		DZE_ActionInProgress = false; 
		cutText [format[(localize "str_player_beinglooted"),_text] , "PLAIN DOWN"];
	};
} else {
	[10,10] call dayz_HungerThirst;
	player playActionNow "Medic";
	sleep 1;
	[player,"repair",0,false] call dayz_zombieSpeak;
	[player,25,true,(getPosATL player)] spawn player_alertZombies;
	sleep 5;
	cutText [format[(localize "str_epoch_player_126"),_text], "PLAIN DOWN"];
};
s_player_unlockvault = -1;
DZE_ActionInProgress = false;
