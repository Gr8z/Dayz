/***********************************/ 	
/* Vehicle Key Changer v1.5.4      */
/* Written by OtterNas3            */
/* January, 11, 2014               */
/* Last update: 26/10/2014         */
/* Advanced by hellraver           */
/***********************************/


/* Setup the private variables */
private ["_magazinesPlayer","_max","_j","_actionArray","_targetVehicle","_targetVehicleID","_targetVehicleUID","_temp_keys","_ownerID","_temp_keysDisplayName","_carKeyName","_targetVehicleKey","_typeOfTargetVehicle","_targetVehiclePos","_targetVehicleDir","_carName","_changeNamePrice","_claimNamePrice","_keyName","_keyID","_changeKeyPrice","_claimKeyPrice","_keyNumber","_keySelected","_keyIsAdded","_keyIsOK","_dis","_sfx","_animState","_started","_finished","_isMedic","_loop"];

/* Remove the Action Menu entry */
player removeAction s_player_changeKey;
s_player_changeKey = -1;
player removeAction s_player_claimKey;
s_player_claimKey = -1;

/* Get the array and setup the variables */
_actionArray = _this select 3;
_targetVehicle = _actionArray select 0;
_targetVehicleID = _targetVehicle getVariable ["ObjectID","0"];
_targetVehicleUID = _targetVehicle getVariable ["ObjectUID","0"];
	

/* Check if the Vehicle is in the Database, if false exit */
if (_targetVehicleID == "0" && _targetVehicleUID == "0") exitWith {cutText ["Sorry but\nthis Vehicle does not support\nKeychange/Claiming!","PLAIN",0];s_player_changeKey = -1;s_player_claimKey = -1;};

/* Setup more variables */
_temp_keys = _actionArray select 1;
_ownerID = _actionArray select 2;
_temp_keysDisplayName = _actionArray select 3;
_carKeyName = _actionArray select 4;
_targetVehicleKey = _actionArray select 5;
_changeKeyPrice = _actionArray select 6;
_claimKeyPrice = _actionArray select 7;
_typeOfTargetVehicle = typeOf _targetVehicle;

_targetVehiclePos = getPosATL _targetVehicle;
_targetVehicleDir = getDir _targetVehicle;

_carName = getText (configFile >> "CfgVehicles" >> _typeOfTargetVehicle >> "displayName");
_changeNamePrice = getText (configFile >> "CfgMagazines" >> _changeKeyPrice >> "displayName");
_claimNamePrice = getText (configFile >> "CfgMagazines" >> _claimKeyPrice >> "displayName");

/* Just in case it is a just bought vehicle and does not yet have a ObjectUID variable set */
if (_targetVehicleUID == "0") then {
	_targetVehicleUID = "";
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_targetVehicleUID = _targetVehicleUID + str(round(_x));
	} forEach _targetVehiclePos;
	_targetVehicleUID = _targetVehicleUID + str(round(_targetVehicleDir + time));
	_targetVehicle setVariable["ObjectUID",_targetVehicleUID,true];
};

/* Setup the Key Names list to select from */
keyNameList = [];
for "_i" from 0 to (count _temp_keysDisplayName) -1 do {
	keyNameList set [(count keyNameList), _temp_keysDisplayName select _i];
};

/* Setup the Key Numbers list to select from */
keyNumberList = [];
for "_i" from 0 to (count _temp_keys) -1 do {
	keyNumberList set [(count keyNumberList), _temp_keys select _i];
};

/* Resetting menu variables*/
keyNameSelect = "";
keyColorSelect = "";
exitscript = true;
closeMenu1 = false;
closeMenu2 = false;
snext = false;

/* Creating the menu */
changeKeyMenu =
{
	private ["_keyMenu","_keyArray"];
	_keyMenu = [["",true], ["Select the new Key you want to use:", [-1], "", -5, [["expression", ""]], "1", "0"]];
	for "_i" from (_this select 0) to (_this select 1) do
	{
		_keyArray = [format['%1', keyNameList select (_i)], [_i - (_this select 0) + 2], "", -5, [["expression", format ["keyNameSelect = keyNameList select %1; keyNumberSelect = keyNumberList select %1", _i]]], "1", "1"];
		_keyMenu set [_i + 2, _keyArray];
	};
	_keyMenu set [(_this select 1) + 2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
	if (count keyNameList > (_this select 1)) then
	{
		_keyMenu set [(_this select 1) + 3, ["Next", [12], "", -5, [["expression", "snext = true;"]], "1", "1"]];
	} else {
		_keyMenu set [(_this select 1) + 3, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
	};
	_keyMenu set [(_this select 1) + 4, ["Exit", [13], "", -5, [["expression", "keyNameSelect = 'exitscript';"]], "1", "1"]];
	showCommandingMenu "#USER:_keyMenu";
};

claimKeyMenu =
{
	private ["_keyColorMenu"];
	_keyColorMenu = [["",true], ["Select which Key color is claimed:", [-1], "", -5, [["expression", ""]], "1", "0"],
		["Green Key", [2], "", -5, [["expression", "keyColorSelect = 'ItemKeyGreen';"]], "1", "1"],
		["Red Key", [3], "", -5, [["expression", "keyColorSelect = 'ItemKeyRed';"]], "1", "1"],
		["Blue Key", [4], "", -5, [["expression", "keyColorSelect = 'ItemKeyBlue';"]], "1", "1"],
		["Yellow Key", [5], "", -5, [["expression", "keyColorSelect = 'ItemKeyYellow';"]], "1", "1"],
		["Black Key", [6], "", -5, [["expression", "keyColorSelect = 'ItemKeyBlack';"]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [13], "", -5, [["expression", "keyColorSelect = 'exitscript';"]], "1", "1"]];
		showCommandingMenu "#USER:_keyColorMenu";
};

/* Wait for the player to select a Key for change or Key color for claiming from the list */
_j = 0;
_max = 10;
if (_max > 9) then {_max = 10;};
if (isNil "s_player_openMenu") then {s_player_openMenu = 0;};
while {keyNameSelect == "" && keyColorSelect == ""} do {
	if (_ownerID != "0") then {
		[_j, (_j + _max) min (count keyNameList)] call changeKeyMenu;
		_j = _j + _max;
	} else {
		[] spawn claimKeyMenu;
	};
	if (s_player_openMenu == 0) then {
		s_player_openMenu = 1;
		closeMenu2 = true;
		waitUntil {keyNameSelect != "" || keyColorSelect != "" || closeMenu1 || snext};
		if (closeMenu1) then {
			breakOut "exit";
		};
		snext = false;
	} else {
		s_player_openMenu = 0;
		closeMenu1 = true;
		closeMenu2 = false;
		waitUntil {keyNameSelect != "" || keyColorSelect != "" || closeMenu2 || snext};
		if (closeMenu2) then {
			breakOut "exit";
		};
		snext = false;
	};
};

/* Player selected a Key or new Key was generated when a vehicle is claimed, lets make the Vehicle update call */
if (keyNameSelect != "exitscript" && keyColorSelect != "exitscript") then {

	/* Check again for the needed change key price or claim key price and remove it from the players inventory */
	_magazinesPlayer = magazines player;
	if (_changeKeyPrice != "0") then {
		/* Player still has the costs in hi inventory */
		if (_changeKeyPrice in _magazinesPlayer) then {
			[player, _changeKeyPrice, 1] call BIS_fnc_invRemove;
			systemChat (format["Key Change costs a %1, thanks for your Payment!", _changeNamePrice]);

		/* Player doesn't have the costs anymore, tried to trick the system? */
		} else {
			systemChat (format["Key Change costs a %1, you had it and tried to trick the system - Keychange for this Vehicle disabled!", _changeNamePrice]);

			/* This disables the Keychange ability for this vehicle JUST for this Player */
			/* However he can relog and try again but it is a little punishment for trying to trick it */
			_targetVehicle setVariable ["VKC_disabled", 1];
			breakOut "exit";
		};
	};

	/* We generate now the new KeyID when a vehicle is claimed. */
	if (keyColorSelect != "") then {
		_keyNumber = (floor(random 2500)) + 1;
		_keySelected = format[("%1%2"),keyColorSelect,_keyNumber];
		if (_claimKeyPrice != "0") then {
			/* Player still has the costs in his inventory and we add Key to the toolbelt. */
			if (_claimKeyPrice in _magazinesPlayer) then {
				_keyIsAdded = [player,_keySelected] call BIS_fnc_invAdd;
				_keyIsOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
				_keyName = getText(configFile >> "CfgWeapons" >> _keySelected >> "displayName");
				_keyID = getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid");

				if (_keyIsAdded && _keyIsOK) then {
					keyNameSelect = format["%1", _keyName];
					keyNumberSelect = format["%1", _keyID];
					systemChat (format["%1 added to toolbelt.", _keyName]);
					[player, _claimKeyPrice, 1] call BIS_fnc_invRemove;
					systemChat (format["Key Claim costs a %1, thanks for your Payment!", _claimNamePrice]);
				} else {
					cutText ["You do not have enough room on your toolbelt!", "PLAIN DOWN"];
					breakOut "exit";
				};

			/* Player doesn't have the costs anymore, tried to trick the system? */
			} else {
				systemChat (format["Key Claim costs a %1, you had it and tried to trick the system - Claiming for this Vehicle disabled!", _claimNamePrice]);

				/* This disables the Claiming ability for this vehicle JUST for this Player */
				/* However he can relog and try again but it is a little punishment for trying to trick it */
				_targetVehicle setVariable ["VKC_claiming_disabled", 1];
				breakOut "exit";
			};
			
		/* We add Key to the toolbelt when Key Claim is free. */
		} else {
			_keyIsAdded = [player,_keySelected] call BIS_fnc_invAdd;
			_keyIsOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
			_keyName = getText(configFile >> "CfgWeapons" >> _keySelected >> "displayName");
			_keyID = getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid");

			if (_keyIsAdded && _keyIsOK) then {
				keyNameSelect = format["%1", _keyName];
				keyNumberSelect = format["%1", _keyID];
				systemChat (format["%1 added to toolbelt.", _keyName]);
			} else {
				cutText ["You do not have enough room on your toolbelt!", "PLAIN DOWN"];
				breakOut "exit";
			};
		};
	};
	
	/* We got the Money let's do our Job */
	/* Lock the vehicle */
	_targetVehicle setVehicleLock "LOCKED";
	
	/* This calls the custom update function which we put it in server_updateObject.sqf */
	PVDZE_veh_Update = [_targetVehicle, "vehiclekey", player, _typeOfTargetVehicle, keyNumberSelect, keyNameSelect, _targetVehicleID, _targetVehicleUID]; 
	publicVariableServer "PVDZE_veh_Update";

	/* The super duper OneForAllAnimation... */
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	
	_dis = 20;
	_sfx = "repair";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	_animState = animationState player;
	_loop = true;
	_started = false;
	_finished = false;
	
	while {_loop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		/* Inform the player about the performing */
		if (_loop && _ownerID != "0") then {
			cutText["~~ Performing Key Change ~~\n~~ Please wait ~~","PLAIN",0.5];
		};
		if (_loop && _ownerID == "0") then {
			cutText["~~ Performing Key Claim ~~\n~~ Please wait ~~","PLAIN",0.5];
		};
		if (_started && !_isMedic) then {
			_loop = false;
			_finished = true;
		};
		sleep 1;
	};

	waitUntil {PVDZE_vkc_Success || !PVDZE_vkc_Success};
	if (_finished) then {
		/* Inform the player about the success and tell him to check the Key */
		if (PVDZE_vkc_Success) then {
			if (_ownerID != "0") then {
				/* Remove the Key from the Toolbelt of the player and put it in the Backpack - No Backpack and the Key gets lost */
				if (_targetVehicleKey != "0" && !isNull (unitBackpack player)) then {
					[player, _targetVehicleKey, 1] call BIS_fnc_invRemove;
					(unitBackpack (vehicle player)) addWeaponCargoGlobal [_targetVehicleKey, 1];
					systemChat (format["%1 has been moved to your Backpack.", _carKeyName]);
				};
				cutText["~~ Vehicle Key Change - SUCCESS ~~","PLAIN",1];
				if (_changeKeyPrice != "0") then {
					systemChat (format["Changed %1 to %2 for a %3.", _carKeyName, keyNameSelect, _changeNamePrice]);
				} else {
					systemChat (format["Changed %1 to %2.", _carKeyName, keyNameSelect]);
				};
				systemChat (format["Please check Vehicle function with %1 before you throw away %2!", keyNameSelect, _carKeyName]);
			};
			if (_ownerID == "0") then {
				cutText["~~ Vehicle Key Claim - SUCCESS ~~","PLAIN",1];
				if (_claimKeyPrice != "0") then {
					systemChat (format["Claimed %1 for a %2.", _carName, _claimNamePrice]);
				} else {
					systemChat (format["Claimed %1.", _carName]);
				};
				systemChat (format["You can now %1 lock or unlock with %2!", _carName, _keyName]);
			};

			/* This updates the Vehicle as it is now, position, gear, damage, fuel */
			/* Should prevent the "backporting" some dudes reported. */
			/* Just fyi i never had that but just in case... */
			[nil,nil,nil,_targetVehicle] execVM "\z\addons\dayz_code\actions\forcesave.sqf";

		/* Something went wrong, inform the player and refund the costs */
		} else {
			if (_ownerID != "0") then {
				cutText["~~ Vehicle Key Change - FAIL ~~","PLAIN",1];
				systemChat ("Sorry something went wrong.");
				systemChat ("Please try again. If it keeps failing, please contact a Admin!");
				if (_changeKeyPrice != "0") then {
					[player, _changeKeyPrice] call BIS_fnc_invAdd;
					systemChat (format["Refunded a %1.", _changeNamePrice]);
				};
			};
			if (_ownerID == "0") then {
				cutText["~~ Vehicle Key Claim - FAIL ~~","PLAIN",1];
				systemChat ("Sorry something went wrong.");
				systemChat ("Please try again. If it keeps failing, please contact a Admin!");
				[player, _keySelected, 1] call BIS_fnc_invRemove;
				systemChat (format["%1 was removed.", _keyName]);
				if (_claimKeyPrice != "0") then {
					[player, _claimKeyPrice] call BIS_fnc_invAdd;
					systemChat (format["Refunded a %1.", _claimNamePrice]);
				};
			};
		};
	};
};

/* Reset the action menu variables for a new run */
player removeAction s_player_changeKey;
s_player_changeKey = -1;
player removeAction s_player_claimKey;
s_player_claimKey = -1;
s_player_openMenu = 0;

/**************************************/
/* That's it, hope you enjoy this Mod */
/*                                    */
/* Yours sincerly,                    */
/* Otter                              */
/**************************************/