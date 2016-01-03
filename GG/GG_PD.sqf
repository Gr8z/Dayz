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
if (alive player) then {player setDamage 1};
_array = _this;
if (count _array > 0) then {
	if (typeName(_array sel 1) == "OBJECT") then {
		_player = _array sel 0;
		_killer = _array sel 1;
		if ((isPlayer _killer)&&(_player != _killer)) then {
			_wepstate = weaponState _killer;
			if (isNil '_wepstate') then {_wepstate = ["","","","",""]};
			if (_wepstate sel 0 == "") then [{_weapon = ["unknown","","Player"]},{if (_wepstate sel 0 == "Throw") then [{_weapon = [_wepstate sel 3,_wepstate sel 3,"Player"]},{_weapon = [_wepstate sel 0,_wepstate sel 0,"Player"]}]}];
			player xsv ["AttackedBy", _killer,true];
			player xsv ["AttackedByName", (name _killer),true];
			player xsv ["AttackedByWeapon", _weapon,true];
			player xsv ["AttackedFromDistance", _player distance _killer,true];
		};
	} else {
		__ccp ("GG\GG_HC");
	};
};
{if !(isNil _x) then {xcc ("terminate "+_x)}} forEach ["dayz_animalCheck","dayz_slowCheck","dayz_medicalH","dayz_musicH","dayz_gui"];
10 fadeSound 0;
PVDZE_plr_Died = [dayz_characterID,0,player,(gpd player),0];
publicVariableServer "PVDZE_plr_Died";
__CC("RESPAWN");
