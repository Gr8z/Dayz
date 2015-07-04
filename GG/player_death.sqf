private ["_display","_body","_playerID","_array","_source","_method","_canHitFree","_isBandit","_punishment","_humanityHit","_myKills","_humanity","_kills","_killsV","_myGroup"];
disableSerialization;
if (deathHandled) exitWith {};
deathHandled = true;
if ((alive player) && {isNil {dayz_playerName}}) then {
	dayz_playerName = name player;
};
//Prevent client freezes
_display = findDisplay 49;
if(!isNull _display) then {_display closeDisplay 0;};
if (dialog) then {closeDialog 0;};
if (visibleMap) then {openMap false;};

_body = player;
_playerID = getPlayerUID player;

disableUserInput true;


_infected = 0;
if (r_player_infected && DZE_PlayerZed) then {
	_infected = 1;
};
PVDZE_plr_Died = [dayz_characterID,0,_body,_playerID,_infected, dayz_playerName];
publicVariableServer "PVDZE_plr_Died";

_id = [player,100,true,getPosATL player] call player_alertZombies;

sleep 0.5;

player setDamage 1;
0.1 fadeSound 0;

player setVariable ["NORRN_unconscious", false, true];
player setVariable ["unconsciousTime", 0, true];
player setVariable ["USEC_isCardiac",false,true];
player setVariable ["medForceUpdate",true,true];
player setVariable ["startcombattimer", 0];
r_player_unconscious = false;
r_player_cardiac = false;

_array = _this;
if (count _array > 0) then {
	_source = _array select 0;
	_method = _array select 1;
	if (!isNull _source) then {
		if (_source != player) then {
			// Killed
			ctc_HumanityChange = [_body,_source];
			publicVariableServer "ctc_HumanityChange"; //Send needed values to server.
			ctc_HumanityChange = []; //Clean up global variable.
		} else {
			// Suicide
		};
	};
	_body setVariable ["deathType",_method,true];
};

terminate dayz_musicH;
terminate dayz_slowCheck;
terminate dayz_animalCheck;
terminate dayz_monitor1;
terminate dayz_medicalH;
terminate dayz_gui;

r_player_dead = true;

"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;

//Player is Dead!
3 fadeSound 0;
sleep 1;

dayz_originalPlayer enableSimulation false;

addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;

_body removeWeapon "ItemMap";
_body removeWeapon "ItemFlashlight";

//_myGroup = group _body;
//[_body] joinSilent dayz_firstGroup;
//deleteGroup _myGroup;

3 cutRsc ["default", "PLAIN",3];
4 cutRsc ["default", "PLAIN",3];

_body setVariable["combattimeout", 0, true];


1 cutRsc ["DeathScr","BLACK OUT",3];

"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;


for  "_x" from 20 to 1 step -1 do {
	titleText [format[localize "str_return_lobby", _x], "PLAIN DOWN", 1];
	sleep 1;
};

PVDZE_Server_Simulation = [_body, false];
publicVariableServer "PVDZE_Server_Simulation";

endMission "END1";
