#include "cake.h"
private ["_found","_activatingPlayer","_obj","_objectID","_objectUID","_started","_finished","_animState","_isMedic","_isOk","_proceed","_counter","_limit","_objType","_sfx","_dis","_itemOut","_countOut","_selectedRemoveOutput","_friendlies","_nearestPole","_ownerID","_refundpart","_isWreck","_findNearestPole","_isNearPlot","_brokenTool","_removeTool","_isDestructable","_isRemovable","_objOwnerID","_isOwnerOfObj","_preventRefund","_ipos","_item","_radius","_isWreckBuilding","_nameVehicle","_isModular"];
if (DZE_ActionInProgress) exw {cutText [(lzl "str_epoch_player_88") , "PLAIN DOWN"]};
DZE_ActionInProgress = true;
player rac s_player_deleteBuild;
s_player_deleteBuild = 1;
_obj = _this sel 3;
_activatingPlayer = player;
_objOwnerID = _obj xgv["CharacterID","0"];
_isOwnerOfObj = (_objOwnerID == PIDP_playerUID);
if (_obj in DZE_DoorsLocked) exw {
	DZE_ActionInProgress = false;
	cutText [(lzl "STR_EPOCH_ACTIONS_20"), "PLAIN DOWN"]
};
if (_obj xgv ["GeneratorRunning", false]) exw {
	DZE_ActionInProgress = false;
	cutText [(lzl "str_epoch_player_89"), "PLAIN DOWN"]
};

_objectID 	= _obj xgv ["ObjectID","0"];
_objectUID	= _obj xgv ["ObjectUID","0"];
_isOk = true;
_proceed = false;
_objType = typeOf _obj;
_isDestructable = _obj iko "BuiltItems";
_isWreck = _objType in DZE_isWreck;
_isRemovable = _objType in DZE_isRemovable;
_isWreckBuilding = _objType in DZE_isWreckBuilding;
_isMine = _objType in ["Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck"];
_isModular = _obj iko "ModularItems";
_limit = 3;
if (DZE_StaticConstructionCount > 0) then [{_limit = DZE_StaticConstructionCount},{if (isNumber (xcf >> "CfgVehicles" >> _objType >> "constructioncount")) then {_limit = xgn(xcf >> "CfgVehicles" >> _objType >> "constructioncount")}}];
if (call player_canBuildPP) then {_limit = round(_limit*2)};
_nameVehicle = getText(xcf >> "CfgVehicles" >> _objType >> "displayName");
cutText [fmt[(lzl "str_epoch_player_162"),_nameVehicle], "PLAIN DOWN"];
if (_isModular) then {cutText [(lzl "STR_EPOCH_ACTIONS_21"), "PLAIN DOWN"]};
[player,50,true,(getPosATL player)] swx player_alertZombies;
_brokenTool = false;
_counter = 0;
while {_isOk} do {
	if (izn(_obj)) exw {
		_isOk = false;
		_proceed = false;
	};
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	_dis=20;
	[player,_dis,true,(getPosATL player)] swx player_alertZombies;
	r_interrupt = false;
	_animState = xas player;
	r_doLoop = true;
	_started = false;
	_finished = false;
	while {r_doLoop} do {
		_animState = xas player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {_started = true};
		if (_started && !_isMedic) then {
			r_doLoop = false;
			_finished = true;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		};
		if (r_interrupt) then {r_doLoop = false};
		uiSleep 0.1;
	};
	if (!_finished) exw {
		_isOk = false;
		_proceed = false;
	};
	if (_finished) then {
		_counter = _counter + 1;
		if ((_isDestructable || _isRemovable) && !_isOwnerOfObj) then {if ((random 10) <= 1) then {_brokenTool = true}};
	};
	if (_brokenTool) exw {
		_isOk = false;
		_proceed = false;
	};
	cutText [fmt[(lzl "str_epoch_player_163"), _nameVehicle, _counter,_limit], "PLAIN DOWN"];
	if (_counter == _limit) exw {
		_isOk = false;
		_proceed = true;
	};
};
if (_brokenTool) then {
	if (_isWreck) then [{_removeTool = "ItemToolbox"},{_removeTool = ["ItemCrowbar","ItemToolbox"] call BIS_fnc_selectRandom}];
	if (([player,_removeTool,1] call BIS_fnc_invRemove) > 0) then {cutText [fmt[(lzl "str_epoch_player_164"),getText(xcf >> "CfgWeapons" >> _removeTool >> "displayName"),_nameVehicle], "PLAIN DOWN"]};
};
if (_proceed) then {
	if (!izn(_obj)) then {
		_ipos = getPosATL _obj;
		deleteVehicle _obj;
		if (!_isWreck) then {
			PVDZE_obj_Delete = [_objectID,_objectUID,_activatingPlayer];
			publicVariableServer "PVDZE_obj_Delete";
		};
		cutText [fmt[(lzl "str_epoch_player_165"),_nameVehicle], "PLAIN DOWN"];
		_preventRefund = false;
		_selectedRemoveOutput = [];
		if (_isWreck) then {
			_refundpart = ["PartEngine","PartGeneric","PartFueltank","PartWheel","PartGlass","ItemJerrycan"] call BIS_fnc_selectRandom;
			_selectedRemoveOutput set [count _selectedRemoveOutput,[_refundpart,1]];
		} else {
			if (_isWreckBuilding) then {_selectedRemoveOutput = getArray (xcf >> "CfgVehicles" >> _objType >> "removeoutput")} else {
				_selectedRemoveOutput = getArray (xcf >> "CfgVehicles" >> _objType >> "removeoutput");
				_preventRefund = (_objectID == "0" && _objectUID == "0");
			};
		};
		if ((count _selectedRemoveOutput) <= 0) then {cutText [(lzl "str_epoch_player_90"), "PLAIN DOWN"]};
		if (_ipos sel 2 < 0) then {_ipos set [2,0]};
		_radius = 1;
		if (_isMine) then {
			if ((random 10) <= 4) then {
				_gems = ["ItemTopaz","ItemObsidian","ItemSapphire","ItemAmethyst","ItemEmerald","ItemCitrine","ItemRuby"];
				_gem = _gems sel (floor(random (count _gems)));
				_selectedRemoveOutput set [(count _selectedRemoveOutput),[_gem,1]];
			};
		};
		if ((count _selectedRemoveOutput) > 0 && !_preventRefund) then {
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			{
				_itemOut = _x sel 0;
				_countOut = _x sel 1;
				if (typeName _countOut == "ARRAY") then {_countOut = round((random (_countOut sel 1)) + (_countOut sel 0));
				};
				_item addMagazineCargoGlobal [_itemOut,_countOut];
			} forEach _selectedRemoveOutput;
			_item setposATL _iPos;
			player reveal _item;
			player xac ["Gear", _item];
		};
	} else {cutText [(lzl "str_epoch_player_91"), "PLAIN DOWN"];
	};
} else {
	r_interrupt = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
	};
};
DZE_ActionInProgress = false;
s_player_deleteBuild = -1;
