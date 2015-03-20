private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} count ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if(safezone != 1) then
{
	if( isPlayer cursorTarget and alive cursorTarget and vehicle cursorTarget == cursorTarget ) then
	{
		_friendlies = player getVariable ["friendlyTo",[]];
		_ownerID = getplayerUID cursorTarget;

		_friend = _ownerID in _friendlies;

		// check if friendly to owner
		if( !_friend || {group cursorTarget != group player}) then {
			_display closeDisplay 1;
			if (isNil 'FixSilly') then { FixSilly = true; };
			if (FixSilly) then {
				systemChat ("This player is not tagged friendly, you do not have access to their bag."); FixSilly = false; [] spawn { uiSleep 5; FixSilly = true; };
			};
		} else {
			if (isNil 'FixSilly2') then { FixSilly2 = true; };
			if (FixSilly2) then {
				systemChat ("This player is tagged friendly, you have access to this players bag."); FixSilly2 = false; [] spawn { uiSleep 5; FixSilly2 = true; };
			};
		};
	};
};
