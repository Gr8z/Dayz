purge = {
 if(!isNull(_this)) then {
  _this enableSimulation false;
  _this removeAllMPEventHandlers "mpkilled";
  _this removeAllMPEventHandlers "mphit";
  _this removeAllMPEventHandlers "mprespawn";
  _this removeAllEventHandlers "FiredNear";
  _this removeAllEventHandlers "HandleDamage";
  _this removeAllEventHandlers "Killed";
  _this removeAllEventHandlers "Fired";
  _this removeAllEventHandlers "GetOut";
  _this removeAllEventHandlers "GetIn";
  _this removeAllEventHandlers "Local";
  clearVehicleInit _this;
  deleteVehicle _this;
  deleteGroup (group _this);
  _this = nil;
 };
};

if (isServer) then {
	[] spawn
	{
		waitUntil {!(isNil "sm_done")};
		diag_log ["CLEANUP Initialized"];

		_lastlootcheck = diag_tickTime;
		_lastZombieClean = diag_tickTime;
		_lastGroupClean = diag_tickTime;
		_lastGullMod = diag_tickTime;
		_lastGaveClean = diag_tickTime;
		_lastBikeClean = diag_tickTime;
		_lastWeaponHolder = diag_tickTime;

		while {true} do {
			if (((diag_tickTime - _lastlootcheck) > 120)) then
			// Loot Cleanup
			{
				_lastUpdate = diag_tickTime;
				_ammobox = ['USLaunchersBox','RULaunchersBox','USSpecialWeapons_EP1','USVehicleBox'];
				_lootpiles =  allMissionObjects 'ReammoBox';
				_deleted = 0;
				{
					if(!isNull _x) then
					{
						_obj = _x;
						_keep = (_obj getvariable['permaLoot',false]) || (typeOf _obj in _ammobox);
						if(!_keep) then
						{
							_nearby = {isPlayer _x} count (_obj nearEntities 100);
							if(_nearby==0) then
							{
								_deleted = _deleted + 1;deleteVehicle _obj;
							};
						};
					};
				sleep 0.001;
				} forEach _lootpiles;
					
				if (_deleted > 0) then {
					_qty = count _lootpiles;
					diag_log (format["CLEANUP: Deleted %1 Loot Piles out of %2",_deleted,_qty]);
				};
			};

			if ((diag_tickTime - _lastZombieClean) > 180) then {
			// Zombie Cleanup
				_lastZombieClean = diag_tickTime;
				{
					if (local _x) then {
						private ["_pos","_delrndzed","_qty","_randomzeds","_nearby"];

						_randomzeds = entities "zZombie_Base";
						_delrndzed = 0;
							
						_x call purge;
						sleep 0.025;
						_delrndzed = _delrndzed + 1;
							} else {
								if (!alive _x) then {
									_pos = getPosATL _x;
									if (count _pos > 0) then {
										_nearby = {(isPlayer _x) and (alive _x)} count (_pos nearEntities [["CAManBase","AllVehicles"], 130]);
										if (_nearby==0) then {
											_x call purge;
											sleep 0.025;
											_delrndzed = _delrndzed + 1;
										};
									};
								};
							};
							sleep 0.001;
				} forEach _randomzeds;
					if (_delrndzed > 0) then {
						_qty = count_randomzeds;
						diag_log (format["CLEANUP: Deleted %1 Zombies out of %2",_delrndzed,_qty]);
					};
				};
					
			if ((diag_tickTime - _lastGroupClean) > 360) then {
				//Player Groups Cleanup
					if (count units _x==0) then {
						deleteGroup _x;
						_x = nil;
					}; 
			} forEach allGroups;


			if ((diag_tickTime - _lastGullMod) > 360) then {
			// Seagull cleanup
				_deleted = 0;
				{
					if(!isNull _x) then
					{
						_x enableSimulation false;
						deleteGroup (group _x);
						_deleted = _deleted + 1;deleteVehicle _x;
					};
				} forEach entities 'Seagull';
				
				if (_deleted > 0) then {
					_qty = count _graves;
					diag_log (format["CLEANUP: Deleted %1 Seagulls",_deleted]);
				};
			};
			
			if ((diag_tickTime - _lastGaveClean) > 1800) then {
			// cleanup Graves
				_graves = allMissionObjects 'GraveDZE';
				_deleted = 0;
				{
					_obj = _x;
					if(!isNull _obj) then
					{
						_count = {isPlayer _x} count (_obj nearEntities 100);
						if(_count == 0) then
						{
							_deleted = _deleted + 1;deleteVehicle _obj;
						};
					};
				} forEach _graves;
				
				if (_deleted > 0) then {
					_qty = count _graves;
					diag_log (format["CLEANUP: Deleted %1 Graves out of %2",_deleted,_qty]);
				};
			};
			
			if ((diag_tickTime - _lastBikeClean) > 180) then {
			// cleanup Bikes
				_bikes = entities 'MMT_Civ';
				_deleted = 0;
				{
					_obj = _x;
					if(!isNull _obj) then
					{
						_count = {isPlayer _x} count (_obj nearEntities 100);
						if(_count == 0) then
						{
							_deleted = _deleted + 1;deleteVehicle _obj;
						};
					};
				} forEach _bikes;
				
				if (_deleted > 0) then {
					_qty = count _bikes;
					diag_log (format["CLEANUP: Deleted %1 Bikes out of %2",_deleted,_qty]);
				};
			};	
			
			if ((diag_tickTime - _lastWeaponHolder) > 180) then {
			// cleanup Weapon Holders
				_allstartlk = ((allMissionObjects 'WeaponHolder')+(allMissionObjects 'Sound_Flies')+(allDead)+([0,0,0] nearEntities ['CAAnimalBase', 10000000]));
				_deleted = 0;
				{
					if(!isNull _x) then
					{
						_obj = _x;
						if(_obj in vehicles) then {_deleted = _deleted + 1;deletevehicle _obj;};
						if(!isNull _obj) then
						{
							_nearbylk1 = {isPlayer _x} count (_obj nearEntities 250);
							_keeplk = _obj getvariable['permaLoot',false];
							if((_nearbylk1 == 0) && (!_keeplk) && !(_obj in alldead)) then
							{
								_deleted = _deleted + 1;deleteVehicle _obj;
							};
							if(!isNull _obj) then
							{
								_nearbylk2 = {isPlayer _x} count (_obj nearEntities 25);
								if((_nearbylk2 == 0) && (_obj in alldead) && (_obj isKindOf 'zZombie_Base')) then
								{
									_deleted = _deleted + 1;deleteVehicle _obj;
								};
								if(!isNull _obj) then
								{
									if((_nearbylk2 == 0) && (_obj isKindOf 'CAAnimalBase')) then {_deleted = _deleted + 1;deleteVehicle _obj;};
								};
							};
						};
					};
				} foreach _allstartlk;
				
				if (_deleted > 0) then {
					_qty = count _allstartlk;
					diag_log (format["CLEANUP: Deleted %1 Weapon Holders out of %2",_deleted,_qty]);
				};
			};
			
		sleep 5;
		};
	};
};