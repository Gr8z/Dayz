private ["_tug","_disabled","_trailer"];
_tug = _this select 0;
_disabled = _tug getVariable "LOG_disabled";
if (isNil "_disabled") then{_tug setVariable ["LOG_disabled",false];};
_trailer = _tug getVariable "LOG_trailer";
if (isNil "_trailer") then{ _tug setVariable ["LOG_trailer",objNull,false];};
_tug addAction [("<t color='#dddd00'>" + "Untow Vehicle" + "</t>"), "GG\Lift\tow\detach.sqf",[],0,true,true,"","LOG_OBJECT_ADDACTION == _target && LOG_TRAILER_MOVE_VALID"];
_tug addAction [("<t color='#eeeeee'>" + "... Tow selected vehicle to this" + "</t>"), "GG\Lift\tow\attach.sqf",[],0,true,true,"","LOG_OBJECT_ADDACTION == _target && LOG_TRAILER_SELECT_VALID"];