private ["_missName","_coords","_vehicle","_txt"];

_missName = "[Mission] Bandit Squad";

_coords = call AIMissionFindPos;

_txt = "A C130 Carrying Supplies has Crashed! Heroes are Securing the Cargo!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

[_coords,_missName] ExecVM BanditMarker;

[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 5;
[_coords,2,1,"BanditUnits","bandit","bandit"] call AISpawn;
sleep 1;

[_coords,"BanditUnits"] call WaitMissionComp;

_txt = "The Bandit Squad has been Wiped Out!";
fnc_show_colorAdminMsg = [_txt,'#F00000'];
publicVariable 'fnc_show_colorAdminMsg';

diag_log text format["[AI Missions]: Bandit Squad Mission has Ended."];
deleteMarker "BanditMarker";
deleteMarker "BanditDot";

BanditDone = true;