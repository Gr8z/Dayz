private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate","_txt"];

_missName = "[Mission] Medical Cache";

_coords = call AIMissionFindPos;

_txt = "Bandits have Taken Over a Hero Medical Cache!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missname] ExecVM BanditMarker;

_net = createVehicle ["Land_CamoNetB_NATO",[(_coords select 0) - 0.0649, (_coords select 1) + 0.6025,0],[], 0, "CAN_COLLIDE"];
[_net] call ProtectObj;

_veh1 = ["small"] call GetVeh;
_veh2 = ["large"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10.0303, (_coords select 1) - 12.2979,10],[], 0, "CAN_COLLIDE"];
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 6.2764, (_coords select 1) - 14.086,10],[], 0, "CAN_COLLIDE"];

[_vehicle] call SetupVehicle;
[_vehicle1] call SetupVehicle;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
_crate1 = createVehicle ["MedBox0",[(_coords select 0) - 3.7251,(_coords select 1) - 2.3614, 0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["MedBox0",[(_coords select 0) - 3.4346, 0, 0],[], 0, "CAN_COLLIDE"];
_crate3 = createVehicle ["MedBox0",[(_coords select 0) + 4.0996,(_coords select 1) + 3.9072, 0],[], 0, "CAN_COLLIDE"];

[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;
[_crate1] call ProtectObj;
[_crate2] call ProtectObj;
[_crate3] call ProtectObj;

[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;

[_coords,"BanditUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;
[_vehicle1] ExecVM SaveVeh;

_txt = "The Medical Cache has been retaken by Heroes!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Medical Cache Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;