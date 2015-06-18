if (isServer) then {
fnc_fix_now =
		{
			waitUntil {!(isNil "sm_done")};
			diag_log ["CLEANUP Initialized"];
			
			systemChat format['infiSTAR.de CLEANUP: cleaning ReammoBoxes - start time: %1 - fps: %2',diag_tickTime,diag_fps];
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
			} forEach _lootpiles;
			systemChat format['infiSTAR.de CLEANUP: cleaning ReammoBoxes - end time: %1 - fps: %2 - deleted: %3',diag_tickTime,diag_fps,_deleted];
			
			systemChat format['infiSTAR.de CLEANUP: cleaning Weaponholder - start time: %1 - fps: %2',diag_tickTime,diag_fps];
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
			systemChat format['infiSTAR.de CLEANUP: cleaning Weaponholder - end time: %1 - fps: %2 - deleted: %3',diag_tickTime,diag_fps,_deleted];
			
			systemChat format['infiSTAR.de CLEANUP: cleaning Bikes - start time: %1 - fps: %2',diag_tickTime,diag_fps];
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
			systemChat format['infiSTAR.de CLEANUP: cleaning Bikes - end time: %1 - fps: %2 - deleted: %3',diag_tickTime,diag_fps,_deleted];
			
			systemChat format['infiSTAR.de CLEANUP: cleaning Graves - start time: %1 - fps: %2',diag_tickTime,diag_fps];
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
			systemChat format['infiSTAR.de CLEANUP: cleaning Graves - end time: %1 - fps: %2 - deleted: %3',diag_tickTime,diag_fps,_deleted];
			
			systemChat format['infiSTAR.de CLEANUP: cleaning Zombies - start time: %1 - fps: %2',diag_tickTime,diag_fps];
			_zeds = entities 'zZombie_Base';
			_deleted = 0;
			{
				_obj = _x;
				if(!isNull _obj) then
				{
					_count = {isPlayer _x} count (_obj nearEntities 250);
					if(_count == 0) then
					{
						_deleted = _deleted + 1;deleteVehicle _obj;
					};
				};
			} forEach _zeds;
			systemChat format['infiSTAR.de CLEANUP: cleaning Zombies - end time: %1 - fps: %2 - deleted: %3',diag_tickTime,diag_fps,_deleted];
			
			systemChat format['infiSTAR.de CLEANUP: cleaning Seagulls - start time: %1 - fps: %2',diag_tickTime,diag_fps];
			_deleted = 0;
			{
				if(!isNull _x) then
				{
					_x enableSimulation false;
					deleteGroup (group _x);
					_deleted = _deleted + 1;deleteVehicle _x;
				};
			} forEach entities 'Seagull';
			systemChat format['infiSTAR.de CLEANUP: cleaning Seagulls - end time: %1 - fps: %2 - deleted: %3',diag_tickTime,diag_fps,_deleted];
		};
		[] spawn fnc_fix_now;
};