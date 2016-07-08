private ["_missName","_coords","_base","_base1","_veh1","_vehicle","_crate","_txt"];

_missName = "[Mission] Stash House";

_coords = call AIMissionFindPos;

_txt = "Bandit's have set up a Stash House! Go Empty it Out!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM BanditMarker;

_base = createVehicle ["Land_HouseV_1I4",_coords,[], 0, "CAN_COLLIDE"];
_base setDir 152.66766;
_base setPos _coords;
_base1 = createVehicle ["Land_kulna",[(_coords select 0) + 5.4585, (_coords select 1) - 2.885,0],[], 0, "CAN_COLLIDE"];
_base1 setDir -28.282881;
_base1 setPos [(_coords select 0) + 5.4585, (_coords select 1) - 2.885,0];

[_base] call ProtectObj;
[_base1] call ProtectObj;

_veh1 = ["large"] call GetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) - 10.6206, (_coords select 1) - 0.49,0],[], 0, "CAN_COLLIDE"];

[_vehicle] call SetupVehicle;

_crate = createVehicle ["USBasicAmmunitionBox",[(_coords select 0) + 0.7408, (_coords select 1) + 1.565, 0.10033049],[], 0, "CAN_COLLIDE"];
[_crate,"MainBox"] ExecVM BoxSetup;
[_crate] call ProtectObj;

[[(_coords select 0) - 4.0796, (_coords select 1) - 11.709,0],6,2,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 3;
[[(_coords select 0) + 2.8872, (_coords select 1) + 18.964,0],6,2,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 3;

[_coords,"BanditUnits"] call WaitMissionComp;

[_vehicle] ExecVM SaveVeh;

_txt = "The Stash House is under Hero Control!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Stash House Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;