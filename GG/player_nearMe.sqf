// Config
_allowedDistance = 1000; 
_allowedAfterTime = 300000; // 1000 = 1 sec, 5*60*1000 = 300000
// Config End

_inVehicle = (vehicle player != player);
_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder and !_inVehicle);
_hasGPS = "ItemGPS" in items player;

if(isNil "LastUsedCheck") then {
LastUsedCheck = 0;
};

if (!_hasGPS) exitWith {cutText ["You don't have a GPS", "PLAIN DOWN"];};
if(count(nearestObjects [player, ["Plastic_Pole_EP1_DZ"],60]) > 1) exitWith {cutText ["\n\nYou are near a Base and cannot perform that action!" , "PLAIN DOWN"];};
if (dayz_combat == 1) exitWith {cutText ["\n\nYou are in combat and cannot perform that action!", "PLAIN DOWN"]; };
if (_inVehicle) exitWith { cutText ["\n\nYou are in a vehicle and cannot perform that action!", "PLAIN DOWN"]; };

if (_canDo) then {

	closeDialog 1;
	cutText ["Scanning 1000m around you....", "PLAIN DOWN"];

	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";

	[player,"repair",0,false] call dayz_zombieSpeak;
	[player,50,true,(getPosATL player)] spawn player_alertZombies;

	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;

	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		if (_started and !_isMedic) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};
	r_doLoop = false;
			
	if (_finished && _hasGPS) then {
		if( LastUsedCheck == 0 || (diag_tickTime-LastUsedCheck)>_allowedAfterTime) then {

			_playercount = (({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 1000]))-1)
			 
			uiSleep 3;

			if (_playercount == 0) then {cutText ["GPS : No players detected near you..", "PLAIN DOWN"];};
			if (_playercount == 1) then {cutText ["GPS: There is one other player in your area.", "PLAIN DOWN"];};
			if (_playercount > 1) then {cutText [format["GPS: There are %1 in your area!",_playercount], "PLAIN DOWN"];};
			LastUsedCheck = diag_tickTime;
		} else {
			cutText [format["You can not use this now. Available in %1 sec.",(_allowedAfterTime  - (diag_tickTime-LastUsedCheck))/1000], "PLAIN DOWN"];
		}; 
	} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText ["Cancelled Scan", "PLAIN DOWN"];
	};
} else {
	cutText ["\n\nCanceled deploying vehicle", "PLAIN DOWN"];
};