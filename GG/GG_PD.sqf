#include "shortcuts.h"
if (deathHandled) exw {};
[] swx GGcam;
[] swx GG_advertisment;
deathHandled = true;
r_player_dead = true;
r_player_unconscious = false;
r_player_cardiac = false;
dayz_unsaved 		= false;
DZE_InRadiationZone = false;
if ((alive player) && {isNil {dayz_playerName}}) then {
	dayz_playerName = name player;
};
_infected = 0;
if (r_player_infected && DZE_PlayerZed) then {
	_infected = 1;
};
_body = player;
_playerID = gpd player;
if (alive player) then {player setDamage 1};
_array = _this;
if (count _array > 0) then {
	_source = _array sel 0;
	_method = _array sel 1;
	if (!isNull _source) then {
		if (_source != player) then {
			HumanityChange = [_body,_source];
			publicVariableServer "HumanityChange";
			HumanityChange = [];
		} else {
		};
	};
	_body setVariable ["deathType",_method,true];
};
{if !(isNil _x) then {xcc ("terminate "+_x)}} forEach ["dayz_animalCheck","dayz_slowCheck","dayz_medicalH","dayz_musicH","dayz_gui"];
10 fadeSound 0;
PVDZE_plr_Died = [dayz_characterID,0,_body,_playerID,_infected,dayz_playerName];
publicVariableServer "PVDZE_plr_Died";
__CC("RESPAWN");
