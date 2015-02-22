private ["_cost","_positionM","_Marker","_LastUsedTime","_height","_downspeed","_wealth","_distance","_boxtype","_unit","_getPos","_position","_box","_chute","_smoke","_var","_textt","_tools","_items","_walls","_supplies","_weapon","_weapon2","_weapon3","_weapon4","_weapon5","_weapon6","_giveWep","_possibleMags","_mag","_whichBuild","_crateItems","_text"];

_cost = 20000;
_wealth = player getVariable["cashMoney",0];
_distance = 500;
_boxtype = "USVehicleBox_EP1";
_unit = player;
_getPos = getPos _unit;
_position = [_getPos select 0, _getPos select 1, 100];
_positionM = [_getPos select 0, _getPos select 1];
_LastUsedTime = 500;
_height = 100;
_downspeed = -3;
_OnlineLimit = 20;

//item lists
_tools = ["ItemEtool","ItemKnife","ItemGPS","ItemFishingPole","ItemHatchet_DZE","ItemMatchbox_DZE","ItemCrowbar"];
_items = ["ItemSodaPepsi","FoodCanCorn","FoodNutmix","ItemSodaClays","FoodCanSardines","ItemKiloHemp"];
_walls = ["ItemWoodWallGarageDoor","ItemWoodWallWithDoorLg","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodFloor","metal_floor_kit"];
_supplies = ["CinderBlocks","MortarBucket","ItemTankTrap","PartWoodPlywood","PartWoodLumber","ItemPole","PartGlass"];


//weapon lists
_weapon = "DMR";
_weapon2 = "FHQ_ACR_WDL_TWS_SD";
_weapon3 = "BAF_LRR_scoped";
_weapon4 = "USSR_cheytacM200_sd";
_weapon5 = "m107_DZ";
_weapon6 = "BAF_L85A2_RIS_CWS";
_giveWep = [_weapon,_weapon2,_weapon3,_weapon4,_weapon5,_weapon6] call BIS_fnc_selectRandom;
_possibleMags = getArray (configfile >> "cfgWeapons" >> _giveWep >> "magazines");
_mag = _possibleMags select 0;

//select arrays to use
_crateItems = [_walls,_supplies,_items] call BIS_fnc_selectRandom;

_Time = time - lastpack;

if(_Time < _LastUsedTime) exitWith { // If cooldown is not done then exit script
	cutText [format["please wait %1 before calling in another Air Drop!",(round(_Time - _LastUsedTime))], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done
};

if !(canbuild) exitWith {
	cutText ["You Cannot Call an Air Drop in a safezone ! "];
};

if ((count playableUnits) < _OnlineLimit) exitWith  { cutText [format["Air Drop Failed. Less Than %1 Players online.",_OnlineLimit], "PLAIN DOWN"]; };
if(_wealth < _cost) exitWith { cutText [format["You need %1 coins to Call an AirDrop.",_cost], "PLAIN DOWN"]; };

player setVariable["cashMoney",(_wealth - _cost),true];

PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";


_Marker  = createMarker ["_Marker ",_positionM];
_Marker  setMarkerText "Air Drop";
_Marker  setMarkerType "mil_objective";
_Marker  setMarkerColor "ColorRed";
_Marker  = _Marker ;

for "_x" from 1 to 60 do {
	if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1", 61-_x], "PLAIN DOWN"];};
	uiSleep 1;
};

_unit = player;
_getPos = getPos _unit;
_position = [_getPos select 0, (_getPos select 1) - 5, _height];
_chute = createVehicle ["ParachuteMediumEast", _position, [], 0, "FLY"];
_chutePos = getPos _chute;
_box = createVehicle [_boxtype, _chutePos, [], 0, "FLY"];
_box attachTo [_chute, [0,0,3]];
_box setVariable ["Mission",1,true];
_chute setVariable ["Mission",1,true];
_box setVariable ["ObjectID", ""];
_chute setVariable ["ObjectID", ""];
_smoke = "SmokeShellBlue" createVehicle (getPos _box);
_smoke attachTo [_box, [0,0,0]];
_var = floor((random 20) + 1);
lastpack = time;

//display text to alert user
_textt = format ["\nCarepackage is above you!",10];
titleText [_textt,"PLAIN DOWN"];

while {getPos _box select 2 > 4} do
{
 _chute SetVelocity [0,0,_downspeed];
 uiSleep 0.1;
};
detach _box;
while {getPos _box select 2 > 0} do {
_box setPos [getPos _box select 0, getPos _box select 1, (getPos _box select 2) - .25]
};
deleteVehicle _chute;
_posATL = getPosATL _box;
deleteVehicle _box;
_boxx = _boxtype createVehicle _posATL;
_boxx setVariable ["Mission",1,true];
_boxx setVariable ["ObjectID", ""];

clearweaponcargoglobal _boxx;
clearmagazinecargoglobal _boxx;

{_boxx addMagazineCargoGlobal [_x, _var];} forEach _crateItems;
{_boxx addWeaponCargoGlobal [_x, 1];} forEach _tools;
_boxx addMagazineCargoGlobal [_mag, _var];
_boxx addWeaponCargoGlobal [_giveWep, 1];

uisleep 100;
deleteMarker _Marker;