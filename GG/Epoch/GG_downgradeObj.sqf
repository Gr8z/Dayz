#include "shortcuts.h"
private ["_found","_location","_dir","_classname","_text","_object","_objectID","_objectUID","_newclassname","_refund","_obj","_upgrade","_objectCharacterID","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_distance","_needText","_findNearestPole","_isNearPlot","_i","_invResult","_itemOut","_countOut","_abortInvAdd","_addedItems"];
if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_48") , "PLAIN DOWN"]};
DZE_ActionInProgress = true;
player rac s_player_downgrade_build;
s_player_downgrade_build = 1;
_needText = lzl "str_epoch_player_246";
if !(call player_canBuildPP) exw {
	DZE_ActionInProgress = false;
	cutText [fmt[(lzl "str_epoch_player_141"),_needText,DZE_PlotPole sel 0] , "PLAIN DOWN"];
};
_obj = _this sel 3;
_objectCharacterID 	= _obj xgv ["CharacterID","0"];
if (DZE_Lock_Door != _objectCharacterID) exw {
	DZE_ActionInProgress = false;
	cutText [(lzl "str_epoch_player_49") , "PLAIN DOWN"];
};
_objectID 	= _obj xgv ["ObjectID","0"];
_objectUID	= _obj xgv ["ObjectUID","0"];
if (_objectID == "0" && _objectUID == "0") exw {
	DZE_ActionInProgress = false;
	s_player_upgrade_build = -1;
	cutText [(lzl "str_epoch_player_50"), "PLAIN DOWN"]
};
_classname = typeOf _obj;
_text = getText (xcf >> "CfgVehicles" >> _classname >> "displayName");
_upgrade = getArray (xcf >> "CfgVehicles" >> _classname >> "downgradeBuilding");
if ((count _upgrade) > 0) then [{
	_newclassname = _upgrade sel 0;
	_refund = _upgrade sel 1;
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	[player,20,true,(getPosATL player)] swx player_alertZombies;
	_invResult = false;
	_abortInvAdd = false;
	_i = 0;
	_addedItems = [];
	{
		_itemOut = _x sel 0;
		_countOut = _x sel 1;
		for "_x" from 1 to _countOut do {
			_invResult = [player,_itemOut] call BIS_fnc_invAdd;
			if (!_invResult) exw {_abortInvAdd = true};
			if (_invResult) then {
				_i = _i + 1;
				_addedItems set [(count _addedItems),[_itemOut,1]];
			};
		};
		if (_abortInvAdd) exw {};
	} forEach _refund;
	if (_i != 0) then {
		_location	= _obj xgv["OEMPos",(getPosATL _obj)];
		_dir = getDir _obj;
		_vector = [(vectorDir _obj),(vectorUp _obj)];
		if (_classname in DZE_DoorsLocked) then {
			_object xsv ["CharacterID",PIDP_playerUID,true];
			_objectCharacterID = PIDP_playerUID;
		};
		_classname = _newclassname;
		_object = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
		_object setDir _dir;
		_object sdu _vector;
		_object setPosATL _location;
		cutText [fmt[(lzl "str_epoch_player_142"),_text], "PLAIN DOWN", 5];
		if (_classname in GG_indestructables) then [{
			_object allowDamage false;
			_object addEventHandler ["HandleDamage", {false}];
			_object enableSimulation false
		},{_object addEventHandler ["HandleDamage", {_this call GG_bohandleDamage}]}];
		PVDZE_obj_Swap = [_objectCharacterID,_object,[_dir,_location,_vector],_classname,_obj,player];
		publicVariableServer "PVDZE_obj_Swap";
		player reveal _object;
	} else {
		cutText [fmt[(lzl "str_epoch_player_143"), _i,(getText(xcf >> "CfgMagazines" >> _itemOut >> "displayName"))], "PLAIN DOWN"];
		{[player,(_x sel 0),(_x sel 1)] call BIS_fnc_invRemove} forEach _addedItems;
	};
},{cutText [(lzl "str_epoch_player_51"), "PLAIN DOWN"]}];
DZE_ActionInProgress = false;
s_player_downgrade_build = -1;
