private ["_w","_m","_r","_r1","_r2","_isSD","_isMagSD","_m2c","_isDone","_d","_launcherResult","_launcherMagazineRandomiser","_checkIfSD_Weapon","_checkIfSD_Ammo"];
_w = 		"";
_m = 		[];
_r = 		[];
_r1 = 		false;
_r2 = 		false;
_isSD = 	false;
_isMagSD =	false;
_m2c =		"";
_isDone =	false;

_w = _this select 0;
_m = _this select 1;
_r = _this select 2;
_r1 = 	_r select 0;
_r2 = 	_r select 1;

_checkIfSD_Weapon = {
	private ["_isInConfig","_isInWepName","_isInMag0Name","_result"];
	_result = false;
	_isInConfig = 	(getNumber (configFile >> "CfgAmmo" >> (getText (configFile >> "cfgMagazines" >> (_m select 0) >> "ammo")) >> "audibleFire")) < 0.1;
	_isInWepName = 	[_w,"SD"] call KRON_StrInStr;
	_isInMag0Name = [_m select 0, "SD"] call KRON_StrInStr;

	if (_isInWepName || _isInMag0Name || _isInConfig) then {
		_result = true;
	};
	
	_result
};

_checkIfSD_Ammo = {
	private ["_isInConfig","_isInMag0Name","_result"];
	_result = 		false;
	_isInConfig = 	(getNumber (configFile >> "CfgAmmo" >> (getText (configFile >> "cfgMagazines" >> (_this) >> "ammo")) >> "audibleFire")) < 1;
	_isInMag0Name = [_this, "SD"] call KRON_StrInStr;

	if (_isInMag0Name || _isInConfig) then {
		_result = 	true;
	};


	_result
};

_launcherMagazineRandomiser = {
	private ["_magOutput","_wepName","_isLauncher","_isM203Muzzle","_muzzleName","_isM32","_isM203","_isGP25","_isGP25Muzzle"];
	_magOutput = 	_this select 0;
	_wepName = 		_this select 1;
	_isLauncher = 	false;
	_isM203Muzzle = false;
	_muzzleName = 	[];
	
	_isM32 = 		[_wepName, "M32_EP1"] call KRON_StrInStr;
	if (_isM32) then {
		_isLauncher = 	true;
		_magOutput = 	["6Rnd_HE_M203", "6Rnd_HE_M203", "6Rnd_HE_M203", "6Rnd_HE_M203", "1Rnd_HE_M203", "6Rnd_Smoke_M203", "6Rnd_SmokeRed_M203", "6Rnd_SmokeGreen_M203", "6Rnd_SmokeYellow_M203"] call BIS_fnc_selectRandom;
	};
	
	_isM203 = 		[_magOutput, "M203"] call KRON_StrInStr;
	if (_isM203) then {
		_isLauncher = 	true;
		_magOutput = 	["1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_Smoke_M203", "1Rnd_SmokeRed_M203", "1Rnd_SmokeGreen_M203", "1Rnd_SmokeYellow_M203"] call BIS_fnc_selectRandom;
	};
	
	_isGP25 = 		[_magOutput, "GP25"] call KRON_StrInStr;
	if (_isGP25) then {
		_isLauncher = 	true;
		_magOutput = 	["1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_SMOKE_GP25", "1Rnd_SmokeRed_GP25", "1Rnd_SmokeGreen_GP25", "1Rnd_SmokeYellow_GP25"] call BIS_fnc_selectRandom;
	};

	if (!_isLauncher) then {
		_muzzleName = (getArray (configFile >> "cfgWeapons" >> _wepName >> "muzzles"));
		if (count _muzzleName > 1) then {
			if ((random 10) > 7.75) then {
				_isM203Muzzle = [_muzzleName select 1, "M203"] call KRON_StrInStr;
				if (_isM203Muzzle) then {
					_isLauncher = true;
					_magOutput = ["1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_Smoke_M203", "1Rnd_SmokeRed_M203", "1Rnd_SmokeGreen_M203", "1Rnd_SmokeYellow_M203"] call BIS_fnc_selectRandom;
				};
				_isGP25Muzzle = [_muzzleName select 1, "GP25"] call KRON_StrInStr;
				if (_isGP25Muzzle) then {
					_isLauncher = true;
					_magOutput = ["1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_SMOKE_GP25", "1Rnd_SmokeRed_GP25", "1Rnd_SmokeGreen_GP25", "1Rnd_SmokeYellow_GP25"] call BIS_fnc_selectRandom;
				};
			};
		};
	};


	[_isLauncher,_magOutput]
};


if !(count _m > 0) then {
	_m2c = 		_m select 0;
	_isDone = 	true;
};

if (!_r1 && !_isDone) then {	

	_launcherResult = 	[_m2c,_w] call _launcherMagazineRandomiser;
	if (_launcherResult select 0) then {
		_m2c = 			_launcherResult select 1;
		_isSD = 		false;
		_isDone = 		true;
	} else {
		_isSD = 		call _checkIfSD_Weapon;
	};
} else {
	_isSD = 			_r2;
};
	
if (_isSD && !_isDone) then {
		_m2c = _m call BIS_fnc_selectRandom;
		_isMagSD = _m2c call _checkIfSD_Ammo;

		if !(_isMagSD) then {
			_m = _m - [_m2c];
			_m2c = [_this select 0, _m,[true,true]] call randomMags;
		};

} else {

	if (!_isDone) then {
		_m2c = 		_m call BIS_fnc_selectRandom;
		_isMagSD = 	_m2c call _checkIfSD_Ammo;

		if (_isMagSD) then {
			_m = _m - [_m2c];
			_m2c = [_this select 0, _m,[true,false]] call randomMags;
		};
	};

};

if (isNil "_m2c" || isNil "_m" || {_m2c == ""} || {str _m == str[]}) then {
	_m2c = [] + getArray (configFile >> "cfgWeapons" >> _w >> "magazines");
	_m2c = _m2c select 0;
};

_m2c