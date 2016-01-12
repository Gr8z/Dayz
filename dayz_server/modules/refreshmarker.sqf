_coords = _this select 0;
_radius = _this select 1;
_shape = _this select 2;
_color = _this select 3;
_type = _this select 4;
_time = _this select 5;
if(_type == 0) then {
	while{EPOCH_EVENT_RUNNING} do {
		_event_marker = createMarker [ format ["loot_event_marker_%1", _time], _coords];
		_event_marker setMarkerShape _shape;
		_event_marker setMarkerColor _color;
		_event_marker setMarkerAlpha 0.5;
		_event_marker setMarkerSize [(_radius + 50), (_radius + 50)];
		sleep 15;
		deleteMarker _event_marker;
	};
};
if(_type == 1) then {
	while{SPECIAL_EVENT_RUNNING} do {
		_event_marker = createMarker [ format ["loot_event_marker_%1", _time], _coords];
		_event_marker setMarkerShape _shape;
		_event_marker setMarkerColor _color;
		_event_marker setMarkerAlpha 0.5;
		_event_marker setMarkerSize [(_radius + 50), (_radius + 50)];
		sleep 15;
		deleteMarker _event_marker;
	};
};