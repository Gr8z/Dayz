private ["_missName","_coords","_crash","_crate","_txt"];

_missName = "[Mission] Humvee Crash";

_coords = call AIMissionFindPos;

_txt = "A Humvee has crashed! Go Investigate the Cause of the Wreck!";
fnc_show_colorAdminMsg = [_txt,'#0049FF'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM HeroMarker;

_crash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];

[_crash] call ProtectObj;

_crate = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[_coords,3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 1;
[_coords,3,1,"HeroUnits","hero","hero"] call AISpawn;
sleep 1;

[_coords,"HeroUnits"] call WaitMissionComp;

_txt = "The Humvee has been Secured by Bandits!";
fnc_show_colorAdminMsg = [_txt,'#0049FF'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Hero Humvee Crash Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;