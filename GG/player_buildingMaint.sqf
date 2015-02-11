private ["_objectID","_objectUID","_obj"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_52") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

player removeAction s_player_maint_build;
s_player_maint_build = 1;

_obj = _this select 3;

_objectID     = _obj getVariable ["ObjectID","0"];

_objectUID    = _obj getVariable ["ObjectUID","0"];

if(_objectID == "0" && _objectUID == "0") exitWith {DZE_ActionInProgress = false; s_player_maint_build = -1; cutText [(localize "str_epoch_player_50"), "PLAIN DOWN"];};

[1,1] call dayz_HungerThirst;
player playActionNow "Medic";
[player,20,true,(getPosATL player)] spawn player_alertZombies;

cutText [format[(localize "STR_EPOCH_ACTIONS_4"), 1], "PLAIN DOWN", 5];
PVDZE_maintainArea = [player,2,_obj];
publicVariableServer "PVDZE_maintainArea";

DZE_ActionInProgress = false;
s_player_maint_build = -1;