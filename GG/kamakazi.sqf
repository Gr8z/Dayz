//Nohcrash
donn_NHC_horn_alert = false;
donn_GHL_helis = [
	'CH53_DZE',
	'MH6J_DZ',
	'AH6X_DZ',
	'UH1H_DZE',
	'Mi17_DZE',
	'Mi17_Civilian_DZ',
	'UH60M_EP1_DZE',
	'MV22_DZ',
	'CH_47F_EP1_DZE',
	'AN2_DZ'
];
donn_vehCenter = {
	_vehicle = _this;
	_vehCenter = getPosATL _vehicle;
	_vehCenter
};
donn_GHL_maxSpeed = 35;
[] spawn {
	_fpsNow = diag_fps;
	while {true} do {
		_fpsNow = round ((_fpsNow * 2 + diag_fps)/3);
		if (_fpsNow >  60) then {donn_GHL_maxSpeed = 70;};
		if (_fpsNow <= 60) then {donn_GHL_maxSpeed = 60;};
		if (_fpsNow <= 40) then {donn_GHL_maxSpeed = 50;};
		if (_fpsNow <= 30) then {donn_GHL_maxSpeed = 40;};
		if (_fpsNow <= 20) then {donn_GHL_maxSpeed = 35;};
		uiSleep 2;
	};
};
donn_GHL_ejectKamiTry = {
	private ['_car','_ejecterPos','_nearAir','_nearAirAll','_canbuild','_carCrewCount'];
	_car = _this;
	if (speed _car > 2) then {
		_canbuild = canbuild;
		_nearAirAll = nearestObjects [_car, donn_GHL_helis, 120];
		_nearAir = [];
		{
			if (_canbuild) then {
				if (alive _x && Locked _x && !(isEngineOn _x)) then {	_nearAir = _nearAir + [_x];};
			} else {
				if (alive _x && !(isEngineOn _x)) then {_nearAir = _nearAir + [_x];};
			};
		} forEach _nearAirAll;
		{
			[_car, _x] spawn {
				private ['_minDistance'];
				_car = _this select 0;
				_heli = _this select 1;
				_sizeCar = sizeOf (typeOf _car);
				_sizeHeli = sizeOf (typeOf _heli);
				_minDistance = (_sizeHeli/2 + _sizeCar/2) * 1.1;
				_isAir = _car isKindOF "Air";
				if (_isAir) then {
					while {((getPosATL _car) select 2) > 1 && alive _car && (isNull (driver _car))} do {
						if ((_car distance _heli) < _minDistance) then {
							_carNowPos = getPosATL _car;
							_car setPosATL [_carNowPos select 0, _carNowPos select 1, (_carNowPos select 2) + 25];
						};
						sleep 0.001;
					};
				} else {
					while {(speed _car) > 1 && alive _car && (isNull (driver _car))} do {
						if ((_car distance _heli) < _minDistance && ((getPosASL _car) select 2) >= (((getPosASL _heli) select 2)-1)) then {
							_car engineOn false;
							_car setVelocity [0,0,0];
						};
						sleep 0.001;
					};
				};
			};
		} forEach _nearAir;
	};
};
donn_GHL_nearestFound = false;
[] spawn {
	while {true} do {
		donn_GHL_playerVeh = vehicle player;
		if (donn_GHL_playerVeh != player) then {
			if (driver donn_GHL_playerVeh == player) then {
				while {driver donn_GHL_playerVeh == player} do {
					_nearAir = nearestObjects [donn_GHL_playerVeh, donn_GHL_helis, 50];
					_nearestFound = false;
					if (canbuild) then {
						{
							if (alive _x && Locked _x && !(isEngineOn _x)) then {
								if (((getPosASL donn_GHL_playerVeh) select 2) >= (((getPosASL _x) select 2)-1)) then {
									donn_GHL_nearest = _x;
									_nearestFound = true;
								};
							};
							if (_nearestFound) exitWith {};
						} forEach _nearAir;
					} else {
						{
							if (alive _x && !(isEngineOn _x)) then {
								if (((getPosASL donn_GHL_playerVeh) select 2) >= (((getPosASL _x) select 2)-1)) then {
									donn_GHL_nearest = _x;
									_nearestFound = true;
								};
							};
							if (_nearestFound) exitWith {};
						} forEach _nearAir;
					};
					donn_GHL_nearestFound = _nearestFound;
					sleep 0.001;
				};
				donn_GHL_playerVeh call donn_GHL_ejectKamiTry;
				donn_GHL_nearestFound = false;
			};
		};
		sleep 0.5;
	};
};
[] spawn {
	while {true} do {
		waitUntil {donn_GHL_nearestFound};
		_player = donn_GHL_playerVeh;
		_nearest = donn_GHL_nearest;
		_sizePlayer = sizeOf (typeOf _player);
		_sizeNearest = sizeOf (typeOf _nearest);
		_isAir = _player isKindOf "Air";
		_minDistDirect = (_sizePlayer/2 + _sizeNearest/2) * 1.1;
		_airPlayerDist = _player distance _nearest;
		_firstSafe = true;
		if (_airPlayerDist < _minDistDirect) then {_firstSafe = false;};
		_playerPosSafe = getPosATL _player;
		while {_nearest == donn_GHL_nearest && donn_GHL_nearestFound} do {
			if (_airPlayerDist < _minDistDirect) then {
				if (_isAir && _firstSafe) then {
					_playerNowPos = getPosATL _player;
					_speedPlayer = speed _player;
					_hTp = 30;
					if (_speedPlayer <= 80) then {_hTp = 25;};
					if (_speedPlayer <= 65) then {_hTp = 20;};
					if (_speedPlayer <= 55) then {_hTp = 15;};
					if (_speedPlayer <= 45) then {_hTp = 10;};
					if (_speedPlayer <= 35) then {_hTp =  5;};
					if (_speedPlayer <= 25) then {_hTp =  3;};
					if (_speedPlayer <= 15) then {_hTp =  1;};
					_player setPosATL [_playerNowPos select 0, _playerNowPos select 1, (_playerNowPos select 2) + _hTp];
				} else {
					_speedPlayer = speed _player;
					_retarder = (donn_GHL_maxSpeed/(_speedPlayer + 1)) min 1;
					_velP = velocity _player;
					_player setVelocity [(_velP select 0) * _retarder, (_velP select 1) * _retarder, (_velP select 2) * _retarder];
					_nearestPosNow = getPosATL _nearest;
					_newPosMoveTo = [
						((_nearestPosNow select 0) + ((_playerPosSafe select 0) - (_nearestPosNow select 0)) * 1.05),
						((_nearestPosNow select 1) + ((_playerPosSafe select 1) - (_nearestPosNow select 1)) * 1.05),
						0.1
					];
					_player setPosATL _newPosMoveTo;
					_playerPosSafe = _newPosMoveTo;
				};
				if (!donn_NHC_horn_alert) then {
					donn_NHC_horn_alert = true;
					[] spawn {
						systemChat 'No no no! (-)_(-)';
						sleep 3;
						donn_NHC_horn_alert = false;
					};
				};
			} else {
				_firstSafe = true;
				_playerPosSafe = getPosATL _player;
			};
			sleep 0.001;
			_airPlayerDist = _player distance _nearest;
		};
	};
};