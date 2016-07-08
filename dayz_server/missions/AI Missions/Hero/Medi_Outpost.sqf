private ["_missName","_coords","_base","_base1","_base2","_base3","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate2","_txt"];

_missName = "[Mission] Medical Outpost";

_coords = call AIMissionFindPos;

_txt = "Heroes have established a Medical Outpost! Go Secure their Medical Supplies!";
fnc_show_colorAdminMsg = [_txt,'#0049FF'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM HeroMarker;

_base = createVehicle ["US_WarfareBFieldhHospital_Base_EP1",[(_coords select 0) +2, (_coords select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_base1 = createVehicle ["MASH_EP1",[(_coords select 0) - 24, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["MASH_EP1",[(_coords select 0) - 17, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base3 = createVehicle ["MASH_EP1",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

[_base] call ProtectObj;
[_base1] call ProtectObj;
[_base2] call ProtectObj;
[_base3] call ProtectObj;

_veh1 = ["large"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

[_vehicle] call SetupVehicle;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[[(_coords select 0) - 20, (_coords select 1) - 15,0],4,0,"HeroUnits","hero","hero"] call AISpawn;
sleep 3;
[[(_coords select 0) + 10, (_coords select 1) + 15,0],4,0,"HeroUnits","hero","hero"] call AISpawn;
sleep 3;
[[(_coords select 0) - 10, (_coords select 1) - 15,0],4,0,"HeroUnits","hero","hero"] call AISpawn;
sleep 3;
[[(_coords select 0) + 20, (_coords select 1) + 15,0],4,0,"HeroUnits","hero","hero"] call AISpawn;
sleep 3;

[_coords,"HeroUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;

_txt = "The Medical Outpost is under Bandit Control!";
fnc_show_colorAdminMsg = [_txt,'#0049FF'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Hero Medical Outpost Mission has Ended."];
deleteMarker "HeroMarker";
deleteMarker "HeroDot";

HeroDone = true;