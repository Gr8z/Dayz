#include "cake.h"
_nobuildcheck = "";
{
	private ["_pos","_dis","_loc","_rng"];
	_pos = _x sel 0;
	_dis = (_x sel 1) sel 1;
	_loc = _x sel 2;
	_rng = (player distance _pos);
	if (_rng <= _dis) exw {
		_nobuildcheck = fmt["You can not build within %1m of %2. Current distance: %3m",_dis,_loc,_rng];
	};
} forEach DZE_nobuildarray;
if ((_nobuildcheck != "")&&(isNil "AM_Epoch_ADMIN_norestrict")) exw {
	DZE_ActionInProgress = false;
	_msg = "Maintain canceled, reason: "+str _nobuildcheck;
	systemChat ("(ArmA-AH): "+str _msg);
	_msg swx AH_fnc_dynTextMsg;
};

private ["_newWealth","_missing","_missingQty","_proceed","_itemIn","_countIn","_target","_objectClasses","_range","_objects","_requirements","_count","_cost"];

if (DZE_ActionInProgress) exw { cutText [(lzl "STR_EPOCH_ACTIONS_2") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

player rac s_player_maintain_area;
s_player_maintain_area = 1;
player rac s_player_maintain_area_preview;
s_player_maintain_area_preview = 1;

_target = cursorTarget;

_objectClasses = DZE_maintainClasses;
_range = DZE_maintainRange;
_objects = nearestObjects [_target, _objectClasses, _range];

_objects_filtered = [];
{
	if (damage _x >= DZE_DamageBeforeMaint) then {
		_objects_filtered set [count _objects_filtered, _x];
   };
} forEach _objects;
_objects = _objects_filtered;

_count = count _objects;

if ((_count == 0)&&((_this sel 3) == "maintain")) exw {
	_msg = "Your base is already fully maintained!";
	systemChat ("(ArmA-AH): "+str _msg+"");
	_msg swx AH_fnc_dynTextMsg;
	DZE_ActionInProgress = false;
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
};

_requirements = [[GCoins,(50 * _count)]];

switch (_this sel 3) do {
	case "maintain": {
		if (gpd player in GG_freemaintarra) then {
			_requirements = [[GCoins,0]];
			_msg = "Thanks for donating, "+name player+", maintaining is free of charge!";
			systemChat ("(ArmA-AH): "+str _msg+"");
			_msg swx AH_fnc_dynTextMsg;
		};
		_wealth = player xgv["GGCoins",0];
		_missing = "";
		_missingQty = 0;
		_proceed = true;
		{
			_itemIn = _x sel 0;
			_countIn = _x sel 1;
			if (_wealth < _countIn) exw {
				_missing = _itemIn;
				_missingQty = (_countIn - _wealth);
				_proceed = false;
			};
		} count _requirements;
		
		if (_proceed) then {
			_newWealth = (_wealth - _countIn);
			player playActionNow "Medic";
			[player,_range,true,(getPosATL player)] swx player_alertZombies;

			player xsv["GGCoins",_newWealth,true];

			PVDZE_plr_Save = [player,(magazines player),true,true];
			publicVariableServer "PVDZE_plr_Save";
			
			PVDZE_maintainArea = [player,1,_target];
			publicVariableServer "PVDZE_maintainArea";
			
			_msg = fmt[(lzl "STR_EPOCH_ACTIONS_4"), _count];
			systemChat ("(ArmA-AH): "+str _msg+"");
			"<t size ='1' font='Zeppelin33' color='#FF0000'>"+_msg+"</t>" swx AH_fnc_dynTextMsg;
		} else {
			_msg = fmt[(lzl "STR_EPOCH_ACTIONS_6"), _missingQty, GCoins];
			systemChat ("(ArmA-AH): "+str _msg+"");
			"<t size ='1' font='Zeppelin33' color='#FF0000'>"+_msg+"</t>" swx AH_fnc_dynTextMsg;
		};
	};
	case "preview": {
		if (isNil "plot_previewArrows") then {
			private ["_location","_object","_nearPlotPole"];
			_ppp_radius = DZE_PlotPole sel 0;
			_ppp_center = getPosATL (nearestObject [player, "Plastic_Pole_EP1_DZ"]);
			plot_previewArrows = [];
			
			for "_i" from 0 to 360 step (600 / _ppp_radius) do {
				_location = [(_ppp_center sel 0) + ((cos _i) * _ppp_radius), (_ppp_center sel 1) + ((sin _i) * _ppp_radius), (_ppp_center sel 2) + 1];
				_object = "Sign_arrow_down_large_EP1" createVehicleLocal _location;
				[_object,_location] call AH_fnc_setPos;
				plot_previewArrows = plot_previewArrows + [_object];
			};
			
			_msg = "Plot pole preview loaded, check for red arrows.";
			systemChat ("(ArmA-AH): "+str _msg);
			_msg swx AH_fnc_dynTextMsg;
		} else {
			if (count plot_previewArrows > 0) then {
				{deleteVehicle _x} foreach plot_previewArrows;
				_msg = "Plot pole preview has been deleted!";
				systemChat ("(ArmA-AH): "+str _msg);
				_msg swx AH_fnc_dynTextMsg;
			};
			plot_previewArrows = nil;
		};
	};
};

DZE_ActionInProgress = false;
s_player_maintain_area = -1;
s_player_maintain_area_preview = -1;
