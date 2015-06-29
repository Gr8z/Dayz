/*---------------------------------------------------------------------------
Variable Init
---------------------------------------------------------------------------*/
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
_d = 		false;			//enable/disable debugging

/*---------------------------------------------------------------------------
	Inputs
---------------------------------------------------------------------------*/

_w = _this select 0;
_m = _this select 1;
_r = _this select 2;
_r1 = 	_r select 0;
_r2 = 	_r select 1;

/*---------------------------------------------------------------------------
Private Functions
---------------------------------------------------------------------------*/

_checkIfSD_Weapon = {
	private ["_isInConfig","_isInWepName","_isInMag0Name","_result"];
	_result = false;
	//get audible value from ammo, check if less than 0.1
	_isInConfig = 	(getNumber (configFile >> "CfgAmmo" >> (getText (configFile >> "cfgMagazines" >> (_m select 0) >> "ammo")) >> "audibleFire")) < 0.1;
	//check if SD is in weapon name
	_isInWepName = 	[_w,"SD"] call KRON_StrInStr;
	//check if SD is in the default magazine name
	_isInMag0Name = [_m select 0, "SD"] call KRON_StrInStr;

	//if any of above are true, result is true
	if (_isInWepName || _isInMag0Name || _isInConfig) then {
		_result = true;
	};
	
	if (_d) then { diag_log (format["_checkIfSD_Weapon: Input: (%1) Result(Config,WepName,Mag0name): (%2)",[_w,_m],[_isInConfig,_isInWepName,_isInMag0Name]]); };

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

	if (_d) then {	diag_log (format["_checkIfSD_Ammo: Input: (%1) Result(Config/MagName): (%2)",[_this],[_isInConfig,_isInMag0Name]]); };

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

	if (_d) then { diag_log (format["_launcherMagazineRandomiser: Input: (%1) Output: (%3)  Result(_isM32,_isM203,_isGP25): (%2)",[_magOutput,_wepName],[_isM32,_isM203,_isGP25],[_isLauncher,_magOutput]]); };

	[_isLauncher,_magOutput]
};


/*---------------------------------------------------------------------------
Instructions
---------------------------------------------------------------------------*/
if (_d && !_r1) then { diag_log (format["P2DEBUG: p2_randomMags: Input: %1",[_w,_m,[_r1,_r2]]]); };

//if mag count not > 0
if !(count _m > 0) then {
	_m2c = 		_m select 0;
	_isDone = 	true;
};

//if not a re-run and not done, check if sd.
if (!_r1 && !_isDone) then {	
	if (_d) then { diag_log ("p2_randomMags: Not ReRun"); };

	//if is grenade launcher weapon this will randomise the nades, if not proceed as normal
	_launcherResult = 	[_m2c,_w] call _launcherMagazineRandomiser;
	if (_launcherResult select 0) then {
		_m2c = 			_launcherResult select 1;
		_isSD = 		false;
		_isDone = 		true;
	} else {
		_isSD = 		call _checkIfSD_Weapon;
	};
} else {
	//if a rerun, sd val is parsed from last time in r2
	if (_d) then { diag_log (format["p2_randomMags: reRun, _r2: %1 _m: %2",_r2,_m]); };
	_isSD = 			_r2;
};
	
if (_isSD && !_isDone) then {
		_m2c = _m call BIS_fnc_selectRandom;
		_isMagSD = _m2c call _checkIfSD_Ammo;

		//ReRun if non-SD mag returned
		if !(_isMagSD) then {
			if (_d) then { diag_log (format["p2_randomMags: !isMagSD reRun, _m2c: %1, _m: %2",_m2c,_m]); };
			_m = _m - [_m2c];
			if (_d) then { diag_log (format["p2_randomMags: !isMagSD reRun ResizeArray, _m: %1",_m]); };
			_m2c = [_this select 0, _m,[true,true]] call randomMags;
		};

} else {

	if (!_isDone) then {
		_m2c = 		_m call BIS_fnc_selectRandom;
		_isMagSD = 	_m2c call _checkIfSD_Ammo;

		//ReRun if SD mag returned
		if (_isMagSD) then {
			if (_d) then { diag_log (format["p2_randomMags: !isMagSD reRun, _m2c: %1, _m: %2",_m2c,_m]); };
			_m = _m - [_m2c];
			if (_d) then { diag_log (format["p2_randomMags: !isMagSD reRun ResizeArray, _m: %1",_m]); };
			_m2c = [_this select 0, _m,[true,false]] call randomMags;
		};
	};

};

//Select default if _m2c is Nil or ""
if (isNil "_m2c" || isNil "_m" || {_m2c == ""} || {str _m == str[]}) then {
	if (_d) then { diag_log ("p2_randomMags: isNil reRun"); };
	_m2c = [] + getArray (configFile >> "cfgWeapons" >> _w >> "magazines");
	_m2c = _m2c select 0;
};

if (_d && !_r1) then { diag_log (format["P2DEBUG: p2_randomMags: Output: %1",_m2c]); };
/*---------------------------------------------------------------------------
Output
---------------------------------------------------------------------------*/
_m2c