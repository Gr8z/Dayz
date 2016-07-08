private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate1","_crate2","_crate3","_txt"];

_missName = "[Mission] NATO Weapons Cache";

_coords = call AIMissionFindPos;

_txt = "Bandits have secured a NATO Weapons Cache!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missname] ExecVM BanditMarker;

_net = createVehicle ["Land_CamoNetB_NATO",[(_coords select 0) - 0.0649, (_coords select 1) + 0.6025,0],[], 0, "CAN_COLLIDE"];
[_net] call ProtectObj;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3.7251,(_coords select 1) - 2.3614, 0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3.4346, 0, 0],[], 0, "CAN_COLLIDE"];
_crate3 = createVehicle ["USLaunchersBox",[(_coords select 0) + 4.0996,(_coords select 1) + 3.9072, 0],[], 0, "CAN_COLLIDE"];

[_crate,"MainBox"] ExecVM BoxSetup;
[_crate1,"WeaponsBox"] ExecVM BoxSetup;
[_crate2,"WeaponsBox"] ExecVM BoxSetup;
[_crate3,"WeaponsBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;
[_crate1] call ProtectObj;
[_crate2] call ProtectObj;
[_crate3] call ProtectObj;

[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;

[_coords,"BanditUnits"] call WaitMissionComp;

_txt = "The Weapons Cache is Under Hero Control!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Weapon Cache Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;