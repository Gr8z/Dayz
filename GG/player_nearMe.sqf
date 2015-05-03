
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;


_LastUsedTime = 0;
_unit = player;
_NearPlotMeters = 60;
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

_Time = time - lastpack;

if(_Time < _LastUsedTime) exitWith { // If cooldown is not done then exit script
	DZE_ActionInProgress = false;
	cutText [format["please wait %1s before scaning again!",(round(_Time - _LastUsedTime))], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done\
};
if(count(nearestObjects [player, ["Plastic_Pole_EP1_DZ"],_NearPlotMeters]) > 1) exitWith {
	DZE_ActionInProgress = false; 
	cutText ["\n\nYou are near a Base and cannot perform that action!" , "PLAIN DOWN"];
};

if (!_hasGPS) exitWith {cutText ["You don't have a GPS", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText ["\n\nYou are in a vehicle and cannot perform that action!", "PLAIN DOWN"]; };
if (dayz_combat == 1) exitwith { DZE_ActionInProgress = false; cutText ["\n\nYou are in combat and cannot perform that action!", "PLAIN DOWN"]; };
if(!(canbuild) || (inSafeZone) || (count(nearestObjects [player, ["Infostand_2_EP1","Info_Board_EP1"],200]) > 1)) exitWith { DZE_ActionInProgress = false; cutText ["\n\nYou need to be far away from a Trader to scan for players" , "PLAIN DOWN"]; };

lastpack = time;

for "_x" from 1 to 10 do {
	if (_x >= 2) then {cutText [format ["SCANING IN PROGRESS...", 11-_x], "PLAIN DOWN"];};
	uiSleep 1;
};

_playercount = (({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 1000]))-1);

uiSleep 3;

if (_playercount == 0) then {cutText ["GPS : No players detected near you..", "PLAIN DOWN"];};
if (_playercount == 1) then {cutText ["GPS: There is one other player in your area.", "PLAIN DOWN"];};
if (_playercount > 1) then {cutText [format["GPS: There are %1 in your area!",_playercount], "PLAIN DOWN"];};

DZE_ActionInProgress = false;
