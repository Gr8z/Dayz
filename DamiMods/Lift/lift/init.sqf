private ["_carrier","_disabled","_object"];
_carrier = _this select 0;
_disabled = _carrier getVariable "LOG_disabled";
if (isNil "_disabled") then{ _carrier setVariable ["LOG_disabled",false];};
_object = _carrier getVariable "LOG_heliporte";
if (isNil "_object") then{ _carrier setVariable ["LOG_heliporte",objNull,false];};
_carrier addAction [("<t color='#dddd00'>" + "Lift..." + "</t>"),"DamiMods\Lift\lift\lift.sqf",[],0,true,true,"","LOG_OBJECT_ADDACTION == _target && LOG_HELI_LIFT_VALID"];
_carrier addAction [("<t color='#dddd00'>" + "Detach Vehicle" + "</t>"),"DamiMods\Lift\lift\drop.sqf",[],0,true,true,"","LOG_OBJECT_ADDACTION == _target && LOG_HELI_DROP_VALID"];