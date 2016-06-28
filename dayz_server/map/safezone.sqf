if (isServer) exitWith {
 
{
_center = _x select 1;
_radius = _x select 2;
for '_i' from 0 to 360 step (270 / _radius)*2 do
{
_location = [(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
_dir = ((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
_object = createVehicle ['Sign_sphere100cm_EP1', _location, [], 0, 'CAN_COLLIDE'];
_object setDir _dir;
};
} forEach SafeZones;
 
};