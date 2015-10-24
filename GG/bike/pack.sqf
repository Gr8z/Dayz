private["_isPackingLocked","_lastPackTime","_exitWith","_deployable","_cursorTarget"];

_exitWith = "nil";
_deployable = (_this select 3) select 0;
_cursorTarget = (_this select 3) select 1;
_lastPackTime = _cursorTarget getVariable["lastPackTime",diag_tickTime - 11];
_isPackingLocked = diag_tickTime - _lastPackTime < 10;

{
    if(_x select 0) exitWith {
        _exitWith = (_x select 1);
    };
} forEach [
    [(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS,                   "admin"],
    [!(call fnc_can_do),                                        format["You can't pack your %1 right now.",(_deployable call getDeployableDisplay)]],
    [!(count crew _cursorTarget == 0),                          format["There is a player in your %1.",(_deployable call getDeployableDisplay)]],
    [(damage cursorTarget > (_deployable call getDamageLimit)), format["The %1 must be under %2 percent damaged to pack!",(_deployable call getDeployableDisplay),(_deployable call getDamageLimit) * 100]],      
    [_isPackingLocked,                                          format["Someone just tried to pack that %1! Try again in a few seconds.",(_deployable call getDeployableDisplay)]],
    [DZE_PACKING,                                                      "You are already packing something!"],
    [DZE_DEPLOYING,                                                    "You are already building something!"]
];

if(_exitWith != "nil" && _exitWith != "admin") exitWith {
    taskHint [_exitWith, DZE_COLOR_DANGER, "taskFailed"];
};

_cursorTarget setVariable["lastPackTime",diag_tickTime,true];
DZE_PACKING = true;

{
    if(isClass(configFile >> "CfgWeapons" >> _x)) then {
        player addWeapon _x;
    };
    if(isClass(configFile >> "CfgMagazines" >> _x)) then {
        player addMagazine _x;
    };
} forEach (_deployable call getDeployableParts);

if(_deployable call getPermanent) then {
    PVDZE_obj_Delete = [_cursorTarget getVariable["ObjectID","0"],_cursorTarget getVariable["ObjectUID","0"],player];
    publicVariableServer "PVDZE_obj_Delete";
};
hideObject _cursorTarget;
_cursorTarget setPos [0,0,0];
deleteVehicle _cursorTarget;
player removeAction (_deployable call getActionId);
[_deployable,-1] call setActionId;
DZE_PACKING = false;

taskHint [format["You packed %1 back into your %2.",(_deployable call getDeployableDisplay),(_deployable call getDeployableKitDisplay)], DZE_COLOR_PRIMARY, "taskDone"];