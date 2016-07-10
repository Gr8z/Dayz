#include "shortcuts.h"
private ["_allSupplies","_msg","_cost","_positionM","_Marker","_LastUsedTime","_height","_downspeed","_wealth","_distance","_boxtype","_unit","_getPos","_position","_box","_chute","_smoke","_var","_textt","_tools","_items","_walls","_supplies","_weapon","_weapon2","_weapon3","_weapon4","_weapon5","_weapon6","_giveWep","_possibleMags","_mag","_whichBuild","_crateItems","_text"];

if(DZE_ActionInProgress) exw { 
	_msg = "Another AirDrop is in progress"; 
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
DZE_ActionInProgress = true;


_cost = 10000;
_wealth = player xgv["GGCoins",0];
_distance = 500;
_boxtype = "USVehicleBox_EP1";
_LastUsedTime = 900;
_height = 100;
_downspeed = -3;
_OnlineLimit = 10;
_unit = player;
_getPos = getPos _unit;
_position = [_getPos sel 0, (_getPos sel 1) - 5, _height];
_positionM = [_getPos sel 0, _getPos sel 1];
_playerName = name player;
_NearPlotMeters = 60;
_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

_tools = ["ItemEtool","ItemKnife","ItemGPS","ItemFishingPole","ItemHatchet_DZE","ItemMatchbox_DZE","ItemCrowbar"];
_items = ["ItemSodaPepsi","FoodCanCorn","FoodNutmix","ItemSodaClays","FoodCanSardines","ItemKiloHemp"];
_walls = ["cinder_door_kit","cinder_wall_kit","m240_nest_kit","cinder_garage_kit","metal_floor_kit","ItemWoodWallGarageDoor","ItemWoodWallWithDoorLg","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodFloor"];
_supplies = ["CinderBlocks","MortarBucket","ItemTankTrap","PartWoodPlywood","PartWoodLumber","ItemPole","PartGlass","ItemSandbag"];
_allSupplies = _walls+_supplies+_items;

_giveWep = ["DMR","FHQ_ACR_WDL_TWS_SD","BAF_LRR_scoped","M32_EP1","USSR_cheytacM200_sd","m107_DZ","BAF_L85A2_RIS_CWS","SCAR_H_STD_EGLM_Spect","BAF_L85A2_UGL_Holo","G36_C_SD_camo","M4A1_AIM_SD_camo","Mk_48_DZ","M240_DZ","FHQ_MSR_SD_DESERT","FHQ_XM2010_DESERT","M110_NVG_EP1"] call BIS_fnc_selectRandom;
_possibleMags = getArray (xcf >> "cfgWeapons" >> _giveWep >> "magazines");
_mag = _possibleMags sel 0;

_crateItems = [_allSupplies] call BIS_fnc_selectRandom;

_Time = time - lastDrop;

if(_Time < _LastUsedTime) exw {
	DZE_ActionInProgress = false;
	_msg = fmt["Please wait %1s before calling in another Air Drop!",(round(_Time - _LastUsedTime))];
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if	((nearestObject [player,'Plastic_Pole_EP1_DZ']) distance player < 75) exw {
	DZE_ActionInProgress = false; 
	_msg = "You are near a Base and cannot perform that action!";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (_inVehicle) exw {
	DZE_ActionInProgress = false;
	_msg = "You are in a vehicle and cannot perform that action!";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if (dayz_combat == 1) exw { 
	DZE_ActionInProgress = false; 
	_msg = "You are in combat and cannot perform that action!";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if(!(canbuild) || (inSafeZone) || (count(nearestObjects [player, ["Infostand_2_EP1","Info_Board_EP1"],200]) > 1)) exw { 
	DZE_ActionInProgress = false; 
	_msg = "You need to be far away from a Trader to call an Airdrop.";
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

if ((count playableUnits) < _OnlineLimit) exw  {
	DZE_ActionInProgress = false; 
	_msg = fmt["Air Drop Failed. Less Than %1 Players online.",_OnlineLimit];
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};
if(_wealth < _cost) exw {
	DZE_ActionInProgress = false; 
	_msg = fmt["You need %1 coins to Call an AirDrop.",_cost];
	systemChat ("Server: "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

player xsv["GGCoins",(_wealth - _cost),true];

PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";

deleteMarker "MarkerDrop";
_null  = xct ["MarkerDrop",_positionM];
"MarkerDrop"  setMarkerText fmt["%1's Air Drop",_playerName];
"MarkerDrop"  setMarkerType "mil_objective";
"MarkerDrop"  setMarkerColor "ColorRed";

_message = parseText format["<t align='center' color='#4CA0DC' shadow='2' size='1.75'>Air Drop</t><br/><t align='center' color='#ffffff'>%1 has called in an Air Drop! Check your map for the location!</t>",_playerName];
[nil,nil,rHINT,_message] call RE;
diag_log text fmt["[AirDrop]: Air Drop Called By a player Successfully"];

for "_x" from 1 to 100 do {
	if (_x >= 2) then {cutText [fmt ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
	uiSleep 1;
};

lastDrop = time;
publicVariable "lastDrop";

_chute = createVehicle ["ParachuteMediumEast", _position, [], 0, "FLY"];
_chutePos = getPos _chute;
_box = createVehicle [_boxtype, _chutePos, [], 0, "FLY"];
_box attachTo [_chute, [0,0,3]];
_box xsv ["Mission",1,true];
_chute xsv ["Mission",1,true];
_box xsv ["ObjectID", ""];
_chute xsv ["ObjectID", ""];
_smoke = "SmokeShellBlue" createVehicle (getPos _box);
_smoke attachTo [_box, [0,0,0]];
_var = floor((random 5) + (random 5) +1);
_var2 = floor((random 10) + 1);

_msg = fmt ["The Air Drop is above you!",10];
systemChat ("Server: "+str _msg);
_msg swx AH_fnc_dynTextMsg;

while {getPos _box sel 2 > 4} do
{
 _chute SetVelocity [0,0,_downspeed];
 uiSleep 0.1;
};
detach _box;
while {getPos _box sel 2 > 0} do {
_box setPos [getPos _box sel 0, getPos _box sel 1, (getPos _box sel 2) - .25]
};
deleteVehicle _chute;
_posATL = getPosATL _box;
deleteVehicle _box;
_boxx = _boxtype createVehicle _posATL;
_boxx xsv ["Mission",1,true];
_boxx xsv ["ObjectID", ""];

clearweaponcargoglobal _boxx;
clearmagazinecargoglobal _boxx;

_i=0;
while {_i < _var} do {
  _boxx addMagazineCargoGlobal [(_allSupplies call BIS_fnc_selectRandom), (floor((random 10) + 1))];
  _i = _i + 1;
};
{_boxx addWeaponCargoGlobal [_x, 1];} forEach _tools;
_boxx addMagazineCargoGlobal [_mag, _var2];
_boxx addWeaponCargoGlobal [_giveWep, 1];

DZE_ActionInProgress = false;

waitUntil{
sleep 1;
(({isPlayer _x && _x distance _box <= 5} count playableUnits > 0));
};

sleep 90;
deleteMarker "MarkerDrop";