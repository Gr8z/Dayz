
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;


_LastUsedTime = 60;
_unit = player;
_Range = 1000;
_NearPlotMeters = 60;
_inVehicle = (_vehicle != player);
_hasGPS = "ItemGPS" in items player;

_Time = time - lastscan;

if(_Time < _LastUsedTime) exitWith { // If cooldown is not done then exit script
	DZE_ActionInProgress = false;
	cutText [format["please wait %1s before scaning again!",(round(_Time - _LastUsedTime))], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done\
};
if(count(nearestObjects [player, ["Plastic_Pole_EP1_DZ"],_NearPlotMeters]) > 1) exitWith {
	DZE_ActionInProgress = false; 
	cutText ["\n\nYou are near a Base and cannot perform that action!" , "PLAIN DOWN"];
};

if (!_hasGPS) exitWith {DZE_ActionInProgress = false;cutText ["You don't have a GPS", "PLAIN DOWN"];};
if (dayz_combat == 1) exitwith { DZE_ActionInProgress = false; cutText ["\n\nYou are in combat and cannot perform that action!", "PLAIN DOWN"]; };

_Radar = ["GG\sounds\GPS.ogv",1.04] spawn bis_fnc_customGPSvideo;

for "_x" from 1 to 10 do {
	if (_x >= 2) then {cutText [format ["SCANING IN PROGRESS...", 11-_x], "PLAIN DOWN"];};
	uiSleep 1;
};

lastscan = time;

_playercount =  count ((position player) nearEntities ['CAManBase',_Range]);
_zombiecount =  count ((position player) nearEntities ['zZombie_Base',_Range]);
_vehiclecount = count ((position player) nearEntities ['allVehicles',_Range]) - _playercount;
uiSleep 3;		

cutText [format["GPS: Within %1 Meters - %2 AI/players, %3 zombies, %4 vehicles",_Range,_playercount,_zombiecount,_vehiclecount], "PLAIN DOWN"];

DZE_ActionInProgress = false;
