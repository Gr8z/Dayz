#include "shortcuts.h"

if(DZE_ActionInProgress) exw { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

_LastUsedTime = 60;
_unit = player;
_Range = 1000;
_NearPlotMeters = 60;
_inVehicle = (_vehicle != player);
_hasGPS = "ItemGPS" in items player;

_Time = time - lastscan;

if(_Time < _LastUsedTime) exw {
	DZE_ActionInProgress = false;
	_msg = fmt["please wait %1s before scaning again!",(round(_Time - _LastUsedTime))];
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if(count(nearestObjects [player, ["Plastic_Pole_EP1_DZ"],_NearPlotMeters]) > 1) exw {
	DZE_ActionInProgress = false; 
	_msg = "You are near a Base and cannot perform that action!";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

if (!_hasGPS) exw {
	DZE_ActionInProgress = false;
	_msg = "You don't have a GPS";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (dayz_combat == 1) exw { 
	DZE_ActionInProgress = false;
	_msg = "You are in combat and cannot perform that action!";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

_Radar = ["GG\GUI\GPS.ogv",1.04] swx bis_fnc_customGPSvideo;

for "_x" from 1 to 10 do {
	if (_x >= 2) then {cutText [fmt ["\n\nSCANING IN PROGRESS...", 11-_x], "PLAIN DOWN"];};
	uiSleep 1;
};

lastscan = time;

_playercount = (({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'],_Range]))-1);

uiSleep 3;

if (_playercount == 0) then {
	_msg = "GPS : No players detected near you..";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (_playercount == 1) then {
	_msg = "GPS: There is one other player in your area.";
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (_playercount > 1) then {
	_msg = fmt["GPS: There are %1 players in your area!",_playercount];
	systemChat ("(GG-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

DZE_ActionInProgress = false;
