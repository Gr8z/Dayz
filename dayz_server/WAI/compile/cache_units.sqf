private ["_unitGroup","_countRange","_timeTillFreeze","_state","_stateFroze","_timeFroze","_matchingObjectsArray","_numberOfMatchingObjectsNumber","_playerCount"];
 
_unitGroup = _this select 0;
 
/**************************************/
/**Range for Re-Activation*************/
/****** Default: 800 ******************/
_countRange = 800;
/**************************************/
/**************************************/
/**Time untill units are Frozen again**/
/************* Default: 30 ************/
_timeTillFreeze = 30;
/**************************************/
/**************************************/
/****** Log Actions to RPT File? ******/
/*********** Default: true ************/
freeze_log = true;
/**************************************/
/**************************************/
/******** Unassign Waypoints?  ********/
/*********** Default: false ***********/
unassign_waypoints = false;
/**************************************/
/**************************************/
/******** Randomize Position?  ********/
/******** Distance to Randomize *******/
/*********** Default: true ************/
/*********** Distance: 20 *************/
randomize_position = true;
randomize_distance = 20;
/**************************************/
/**************************************/
/********** Hide un-used AI?  *********/
/*********** Default: true ************/
hide_ai = true;
/**************************************/
/**************************************/
 
/**
fnc_freeze: Used to Freeze the Units of the Group
Parameters: Unit Group (Type: Object / Group)
Behaviour: For Each Unit of the given Group the AI will be disabled (force them to freeze)
Addition: Set's a Variable with the time the AI is frozen and the state
**/
fnc_freeze = {
        private ["_unitGroup","_nic"];
        _unitGroup = _this select 0;
       
        if (freeze_log) then {
                diag_log(format["[DEBUG] Freezing Units of Group: %1", _unitGroup]);
        };
       
        {
                _x disableAI "TARGET";
                sleep 0.05;
                _x disableAI "AUTOTARGET";
                sleep 0.05;
                _x disableAI "MOVE";
                sleep 0.05;
                _x disableAI "ANIM";
                sleep 0.05;
                if (unassign_waypoints) then {
                        _x disableAI "FSM";
                        sleep 0.05;
                };
               
                if (hide_ai) then {
                        //_x hideObjectGlobal true;
                        _nic = [nil, _x, "per", rHideObject, true ] call RE;
                };
               
        } foreach units _unitGroup;
       
        _unitGroup setVariable["FrozenState",[time,true],true];
};
 
/**
fnc_unfreeze: Used to Unfreeze the Units of the Group
Parameters: Unit Group (Type: Object / Group)
Behaviour: For Each Unit of the given Group the AI will be enabled
Addition: Set's a Variable with the time the AI is Unfrozen and the state
**/
fnc_unfreeze = {
        private ["_unitGroup","_posX","_posY","_posZ","_pos","_nic"];
        _unitGroup = _this select 0;
       
        if (freeze_log) then {
                diag_log(format["[DEBUG] Un-Freezing Units of Group: %1", _unitGroup]);
        };
       
        {
                _x enableAI "TARGET";
                sleep 0.05;
                _x enableAI "AUTOTARGET";
                sleep 0.05;
                _x enableAI "MOVE";
                sleep 0.05;
                _x enableAI "ANIM";
                sleep 0.05;
               
                if (unassign_waypoints) then {
                        _x enableAI "FSM";
                        sleep 0.05;
                };
               
                if (randomize_position) then {
                        _pos = getPos _x;
                        _posX = _pos select 0;
                        _posY = _pos select 1;
                        _posZ = _pos select 2;
                        _posX = _posX + round(random randomize_distance);
                        _posY = _posY + round(random randomize_distance);
                        sleep 0.05;
                        _x setPos [_posX,_posY,_posZ];
                        sleep 0.05;
                };
               
                if (hide_ai) then {
                        //_x hideObjectGlobal false;
                        _nic = [nil, _x, "per", rHideObject, false ] call RE;
                };
               
        } foreach units _unitGroup;
       
        _unitGroup setVariable["FrozenState",[time,false],true];
};
 
//Call the Freeze Function, in Order to make the Units freeze
[_unitGroup] spawn fnc_freeze;
 
 
/**
While {true}: Infinite Loop, that runs every 15 Seconds
Parameters: None
Behaviour: Counts nearby Units, if it found a Unit it will check if the Unit is a Player
Behaviour: If the Unit is a Player, the Frozen Group will be defrosted.
Behaviour: If there is no Player near that Group for _timeTillFreeze the AI will be frozen again
Addition: None
**/
while {true} do {
        _matchingObjectsArray = ((units _unitGroup) select 0) nearEntities ["CAManBase",_countRange];
        _numberOfMatchingObjectsNumber = (count _matchingObjectsArray);
       
        if (_numberOfMatchingObjectsNumber >= 1) then {
               
                _state = _unitGroup getVariable["FrozenState",[time,true]];
                _timeFroze = _state select 0;
                _stateFroze = _state select 1;
               
                if (_stateFroze) then {
               
                        {
                                if (isPlayer _x) then {
                                       
                                        if (freeze_log) then {
                                                diag_log(format["[DEBUG] %1 Triggered Un-Freezing of Group: %2", _x, _unitGroup]);
                                        };
                                        [_unitGroup] spawn fnc_unfreeze;
                                       
                                } else {
                               
                                        if (!_stateFroze && ((time - _timeFroze) > _timeTillFreeze)) then {
                       
                                                if (freeze_log) then {
                                                        diag_log(format["[DEBUG] Re-Freezing Group: %1", _unitGroup]);
                                                };
                                               
                                                [_unitGroup] spawn fnc_freeze;
                                       
                                        };
                                };
                               
                        } foreach _matchingObjectsArray;
                       
                } else {
                       
                        if (!_stateFroze && ((time - _timeFroze) > _timeTillFreeze)) then {
                       
                                if (freeze_log) then {
                                        diag_log(format["[DEBUG] Re-Freezing Group: %1", _unitGroup]);
                                };
                                [_unitGroup] spawn fnc_freeze;
                               
                        };
                       
                };
               
        };
       
        sleep 15;
       
};