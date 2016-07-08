private ["_missName","_coords","_crash","_crate","_crate1","_crate2","_txt"];

_missName = "[Mission] Weapons Truck";

_coords = call AIMissionFindPos;

_txt = "A Weapons Truck has Crashed! Go Recover the Supplies!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM BanditMarker;

_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

[_crash] call ProtectObj;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"WeaponsBox"] ExecVM BoxSetup;
[_crate1] call ProtectObj;

_crate2 = createVehicle ["RULaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"WeaponsBox"] ExecVM BoxSetup;
[_crate2] call ProtectObj;

[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;
[_coords,3,0,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;

[_coords,"BanditUnits"] call WaitMissionComp;

_txt = "The Weapons Truck has been Secured by Heroes!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Weapons Truck Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;