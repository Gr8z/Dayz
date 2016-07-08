private ["_missName","_coords","_crash","_crate","_txt"];

_missName = "[Mission] Humvee Crash";

_coords = call AIMissionFindPos;

_txt = "A Humvee has crashed! Go Investigate the Cause of the Wreck!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM BanditMarker;

_crash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];

[_crash] call ProtectObj;

_crate = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[_coords,3,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;

[_coords,"BanditUnits"] call WaitMissionComp;

_txt = "The Humvee has been Secured by Heroes!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Humvee Crash Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;