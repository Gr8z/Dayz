#include "shortcuts.h"
if (deathHandled) exw {};
[] swx GGcam;
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
		_source = _array sel 0;
		player xsv ["deathType",(_array sel 1),true];
		if ((!izn _source) && (_source != player)) then {
			_isBandit = ((player xgv ["humanity",0]) <= -2000);
			_humanityHit = 0;
			if (!_isBandit) then {
				_kills = _source xgv ["humanKills",0];
				_source xsv ["humanKills",(_kills + 1),true];
				_myKills = ((player xgv ["humanKills",0]) * 1000);
				_humanityHit = -(2000 - _myKills);
				PVDZE_send = [_source,"Humanity",[_source,_humanityHit,300]];
				publicVariableServer "PVDZE_send";
			} else {
				_killsV = _source xgv ["banditKills",0];
				_source xsv ["banditKills",(_killsV + 1),true];
				_hty = abs(player xgv ["humanity",-2000]);
				_multi = (switch (true) do {
					default {0.16};
					case (_hty > 25000): {0.15};
					case (_hty > 50000): {0.14};
					case (_hty > 75000): {0.13};
					case (_hty > 100000): {0.12};
					case (_hty > 125000): {0.11};
					case (_hty > 150000): {0.1};
					case (_hty > 175000): {0.09};
					case (_hty > 200000): {0.08};
					case (_hty > 300000): {0.06};
					case (_hty > 400000): {0.04};
					case (_hty > 700000): {0.03};
				});
				_reward = round (_hty * _multi);
				PVDZE_send = [_source,"Humanity",[_source,_reward,300]];
				publicVariableServer "PVDZE_send";
			};
		};
	};
};
{if !(isNil _x) then {xcc ("terminate "+_x)}} forEach ["dayz_animalCheck","dayz_slowCheck","dayz_medicalH","dayz_musicH","dayz_gui"];
10 fadeSound 0;
PVDZE_plr_Died = [dayz_characterID,0,player,(gpd player),0];
publicVariableServer "PVDZE_plr_Died";
__CC("RESPAWN");
