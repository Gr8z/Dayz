// Abandoned player safe mission by Cramps (zfclan.org/forum)
// Needs an SQL event set up to turn abandoned vault codes to 0000

private ["_rndvault","_curvaultcode","_curvault","_vaultarray","_numvaults","_allvaults","_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker","_title"];

// First chack if there is a vault available, no point running if not

diag_log ("Checking vaults...");

_allvaults = (allmissionobjects "VaultStorageLocked");
_numvaults = (count _allvaults);
_vaultarray = [];

for "_i" from 0 to _numvaults do {
	_curvault = _allvaults select _i;
	_curvaultcode = _curvault getVariable "CharacterID";
	if (_curvaultcode == "0000" ) then {
		_vaultarray = _vaultarray + [_curvault];
		};
};

_numvaults = (count _vaultarray);
diag_log ("Total open vaults on server: " + str(_numvaults));

// Exit if no safes
if (_numvaults == 0) exitWith {};

_rndvault = _vaultarray select (floor (random (count _vaultarray)));
_position = getPos _rndvault;
diag_log ("Location of randomly picked 0000 vault = " + str(_position));

// Main epoch mission stuff

_spawnChance =  0.20; // Percentage chance of event happening
_markerRadius = 150; // Radius the loot can spawn and used for the marker
_wait_time = 900; 
_start_time = time;
_debug = false; // Ignores the random chance and runs every time.

if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 
// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};

// Draw markers & tell players
 
_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorKhaki";
_event_marker setMarkerSize [(_markerRadius + 100), (_markerRadius + 100)];

_event_marker2 = createMarker [ format ["loot_event_marker_%2", _start_time], _position];
_event_marker2 setMarkerShape "ICON";
_event_marker2 setMarkerType "mil_dot";
_event_marker2 setMarkerColor "ColorBlack";
_event_marker2 setMarkerText "Abandoned Survivor Safe";

if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _position];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorBlack";
_debug_marker setMarkerAlpha 1;
};

_title = "Abandoned Safe";
_message = "It's rumored there is a survivor safe lost with 0000 as it's code. Go find it!";
PVOZ_GGHCmsgsrvr2 = [_title, _message];publicVariableServer "PVOZ_GGHCmsgsrvr2";

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;
 
// Clean up
EPOCH_EVENT_RUNNING = false;
deleteMarker _event_marker;
deleteMarker _event_marker2;
