private ["_trigger", "_trigger_pos", "_trigger_area", "_angle", "_radius", "_distance", "_count", "_step"];
_trigger = _this;
_trigger_pos = getPos _trigger;
_trigger_area = triggerArea _trigger;
_angle = _trigger_area select 2;
_radius = _trigger_area select 0;
_distance = 25; // meters
//_distance = 18; // meters
_count = round((2 * 3.14592653589793 * _radius) / _distance);
_step = 360/_count;

for "_x" from 0 to _count do
{
	private["_pos", "_sign"];
	_a = (_trigger_pos select 0) + (sin(_angle)*_radius);
	_b = (_trigger_pos select 1) + (cos(_angle)*_radius);

	_pos = [_a,_b];
	_angle = _angle + _step;
	_sign = createVehicle ["Land_aif_billboard_chuckiemike", _pos, [], 0, "CAN_COLLIDE"];
	//_sign = createVehicle ["SignM_FARP_Winchester_EP1", _pos, [], 0, "CAN_COLLIDE"]; //++
	//_sign setVehicleInit "this setObjectTexture [0, ""Scripts\safezone\sign.paa""];"; //++
	_sign setDir ([_pos, _trigger_pos] call BIS_fnc_DirTo);
};
