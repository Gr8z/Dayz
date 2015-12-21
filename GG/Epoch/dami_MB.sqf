#include "cake.h"
private ["_location","_dir","_classname","_missing","_text","_proceed","_num_removed","_object","_missingQty","_itemIn","_countIn","_qty","_removed","_removed_total","_tobe_removed_total","_objectID","_objectUID","_temp_removed_array","_textMissing","_requirements","_obj","_upgrade","_objectCharacterID"];
if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_52") , "PLAIN DOWN"]};
DZE_ActionInProgress = true;
player rac s_player_maint_build;
s_player_maint_build = 1;
_obj 		= _this sel 3;
_objectID 	= _obj xgv ["ObjectID","0"];
_objectUID	= _obj xgv ["ObjectUID","0"];
_ownerid 	= _obj xgv ["CharacterID","0"];
if (_objectID == "0" && _objectUID == "0") exw {
	DZE_ActionInProgress = false;
	s_player_maint_build = -1;
	cutText [(lzl "str_epoch_player_50"), "PLAIN DOWN"]
};
_classname = typeOf _obj;
if ((_classname in GG_indestructables)&&(_ownerID in GG_indarra)) exw {
	_msg = "You can't maintain "+str _classname+" because it is an indestructible object.";
	systemChat ("(ArmA-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
_text = getText (xcf >> "CfgVehicles" >> _classname >> "displayName");
_upgrade = getArray (xcf >> "CfgVehicles" >> _classname >> "maintainBuilding");
if ((count _upgrade) > 0) then [{_requirements = _upgrade},{
	if (gpd player in GG_freemaintarra) then {
		_requirements = [["ItemCopperBar",1]];
		player addMagazine "ItemCopperBar";
		_msg = "Thanks for donating, "+name player+", maintaining is free of charge!";
		systemChat ("(ArmA-AH): "+str _msg);
		_msg swx AH_fnc_dynTextMsg;
	} else {_requirements = [["PartGeneric",1]]};
}];
_missingQty = 0;
_missing = "";
_proceed = true;
{
	_itemIn = _x sel 0;
	_countIn = _x sel 1;
	_qty = { (_x == _itemIn) || (configName(inheritsFrom(xcf >> "cfgMagazines" >> _x)) == _itemIn) } count magazines player;
	if (_qty < _countIn) exw { _missing = _itemIn;
		_missingQty = (_countIn - _qty);
		_proceed = false;
	};
} forEach _requirements;
if (_proceed) then {
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	[player,20,true,(getPosATL player)] swx player_alertZombies;
	_temp_removed_array = [];
	_removed_total = 0;
	_tobe_removed_total = 0;
	{
		_removed = 0;
		_itemIn = _x sel 0;
		_countIn = _x sel 1;
		_tobe_removed_total = _tobe_removed_total + _countIn;
		{
			if ( (_removed < _countIn) && ((_x == _itemIn) || configName(inheritsFrom(xcf >> "cfgMagazines" >> _x)) == _itemIn)) then {
				_num_removed = ([player,_x] call BIS_fnc_invRemove);
				_removed = _removed + _num_removed;
				_removed_total = _removed_total + _num_removed;
				if (_num_removed >= 1) then {_temp_removed_array set [count _temp_removed_array,_x]};
			};
		} forEach magazines player;
	} forEach _requirements;
	if (_tobe_removed_total == _removed_total) then {
		cutText [fmt[(lzl "STR_EPOCH_ACTIONS_4"), 1], "PLAIN DOWN", 5];
		PVDZE_maintainArea = [player,2,_obj];
		publicVariableServer "PVDZE_maintainArea";
	} else {
		{player addMagazine _x} forEach _temp_removed_array;
		cutText [fmt[(lzl "str_epoch_player_145"),_removed_total,_tobe_removed_total], "PLAIN DOWN"];
	};
} else {
	_textMissing = getText(xcf >> "CfgMagazines" >> _missing >> "displayName");
	cutText [fmt[(lzl "str_epoch_player_146"),_missingQty, _textMissing], "PLAIN DOWN"];
};
DZE_ActionInProgress = false;
s_player_maint_build = -1;
