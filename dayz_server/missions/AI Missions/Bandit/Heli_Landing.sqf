private ["_missName","_coords","_ranChopper","_chopper","_truck","_trash","_trash2","_crate","_crate2","_txt"];

_missName = "[Mission] Helicopter Landing";

_coords = call AIMissionFindPos;

_txt = "A Supply Helicopter has been Forced to Land! Stop the Bandits from Refueling!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missname] ExecVM BanditMarker;

_ranChopper = ["heli"] call GetVeh;
_chopper = createVehicle [_ranChopper,_coords,[], 0, "NONE"];

[_chopper] call SetupVehicle;
_chopper setDir -36.279881;

_truck = createVehicle ["HMMWV_DZ",[(_coords select 0) - 8.7802,(_coords select 1) + 6.874,0],[], 0, "CAN_COLLIDE"];
[_truck] call SetupVehicle;

_trash = createVehicle ["Body1",[(_coords select 0) - 3.0185,(_coords select 1) - 0.084,0],[], 0, "CAN_COLLIDE"];
_trash2 = createVehicle ["Body2",[(_coords select 0) + 1.9248,(_coords select 1) + 2.1201,0],[], 0, "CAN_COLLIDE"];
[_trash] call ProtectObj;
[_trash2] call ProtectObj;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6.1718,(_coords select 1) + 0.6426,0],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 7.1718,(_coords select 1) + 1.6426,0],[], 0, "CAN_COLLIDE"];
[_crate2,"WeaponsBox"] ExecVM BoxSetup;
[_crate2] call ProtectObj;

[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],6,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 7.5337,(_coords select 1) + 4.2656,0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[[(_coords select 0) + 7.5337,(_coords select 1) + 4.2656,0],4,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;

[_coords,"BanditUnits"] call WaitMissionComp;

[_chopper] ExecVM SaveVeh;
[_truck] ExecVM SaveVeh;

_txt = "The Helicopter has been Taken by Heroes!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Helicopter Landing Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;