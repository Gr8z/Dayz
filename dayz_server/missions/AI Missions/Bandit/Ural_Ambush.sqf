private ["_missName","_coords","_crash","_body","_body1","_body2","_body3","_veh1","_vehicle","_vehicle1","_crate","_crate2","_txt"];

_missName = "[Mission] Ural Ambush";

_coords = call AIMissionFindPos;

_txt = "Bandits have Ambushed a Hero Ural Carrying Supplies!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missname] ExecVM BanditMarker;

_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
_crash setDir 149.64919;
[_crash] call ProtectObj;

_body = createVehicle ["Body",[(_coords select 0) - 2.2905,(_coords select 1) - 3.3438,0],[], 0, "CAN_COLLIDE"];
_body setDir 61.798588;
[_body] call ProtectObj;

_body1 = createVehicle ["Body",[(_coords select 0) - 2.8511,(_coords select 1) - 2.4346,0],[], 0, "CAN_COLLIDE"];
_body1 setDir 52.402905;
[_body1] call ProtectObj;

_body2 = createVehicle ["Body",[(_coords select 0) - 3.435,(_coords select 1) - 1.4297,0],[], 0, "CAN_COLLIDE"];
_body2 setDir -117.27345;
[_body2] call ProtectObj;

_body3 = createVehicle ["Body2",[(_coords select 0) - 4.0337,(_coords select 1) + 0.5,0],[], 0, "CAN_COLLIDE"];
_body3 setDir 23.664057;
[_body3] call ProtectObj;

_veh1 = ["large"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 5.7534, (_coords select 1) - 9.2149,0],[], 0, "CAN_COLLIDE"];

[_vehicle] call SetupVehicle;

_crate = createVehicle ["USBasicWeaponsBox",[(_coords select 0) + 2.6778,(_coords select 1) - 3.0889,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;
_crate setDir -28.85478;

_crate2 = createVehicle ["USBasicAmmunitionBox",[(_coords select 0) + 2.5405,(_coords select 1) - 4.1612,0],[], 0, "CAN_COLLIDE"];
[_crate2,"Weapons"] ExecVM BoxSetup;
[_crate2] call ProtectObj;
_crate2 setDir -27.93351;

[[(_coords select 0) - 6.9458,(_coords select 1) - 3.5352, 0],6,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 4.4614,(_coords select 1) + 2.5898, 0],6,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 4.4614,(_coords select 1) + 2.5898, 0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;

[_coords,"BanditUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;

_txt = "The Ural Supplies have been Secured by Heroes!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Ural Ambush Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;