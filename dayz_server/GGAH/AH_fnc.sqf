_AH_scrhndlr = [];
diag_log ("(GG-AntiHack): Loading settings...");

#include "\z\addons\dayz_server\GGAH\AH_bin\AH_files\AH_config.sqf";
diag_log ("(GG-AntiHack): Settings loaded.");
waitUntil {!isNil "BIS_fnc_init"};
diag_log ("(GG-AntiHack): Compiling anti-hack...");

_BIS_MPF_RES = {
	_MPF 	= compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
	_array 	= _this select 1;
	_objet 	= _array select 1;
	_input 	= _array select 2;
	if (isNil '_input') exitWith {};
	if ((_input in ['spawn','execvm','jipexec'])&&(isServer)) then {
		if (!isNil '_array') then {diag_log format ['MPF RE HANDLE: ARR: %1',_array]};
		if (!isNil '_objet') then {diag_log format ['MPF RE HANDLE: OBJ: %1',_objet]};
		if (!isNil '_input') then {diag_log format ['MPF RE HANDLE: INP: %1',_input]};
	};
	if (_input in ['switchmove','playmove','say','jipexec','execVM','spawn','titleCut','titleText','hint','globalChat']) exitWith {_this call _MPF};
	if (_input in ['loc','locper','perloc','per']) exitWith {
		_perFn = _array select 3;
		if (_perFn in ['hideObject','titleText']) exitWith {
			if (_perFn == 'hideObject') then {
				if ((!isNull _objet) && !(isPlayer _objet)) exitWith {_this call _MPF};
			} else {_this call _MPF};
		};
		if (count _array > 3) exitWith {
			_perCo = _array select 4;
			if ((_perFn == 'JIPexec') && (typename _perCo == 'ARRAY')) exitWith {if (_perCo select 3 == 'execVM') exitWith {_this call _MPF}};
			if ((_perFn == 'execVM') && (typename _perCo == 'STRING')) exitWith {if (_perCo == 'ca\Modules\Functions\init.sqf') exitWith {_this call _MPF}};
		};
	};
};

PIDP_check = {
	private ["_charID","_array"];
	_array 	= toArray _this;
	_charID = "";
	if (count _array < 3) then {
		diag_log ("PIDP_check: ERROR, player ID not passed.");
	} else {
		_charID = toString[57,_array select 9,_array select 10,_array select 11,_array select 12,_array select 13,_array select 14,_array select 15,_array select 16];
	};
	_charID;
};
publicVariable "PIDP_check";

call compile ("
	if ("+str _AH_CUDHC+") then {
		[] spawn {
			if (isNil 'PVOZ_HeadlessUnit') then {PVOZ_HeadlessUnit = objNull};
			waitUntil {!isNull PVOZ_HeadlessUnit};
			while {13 > 5} do {
				_groups = [];
				{_groups = _groups + [group _x];} forEach (entities 'Logic');
				{
					_units = units _x;
					_local = false;
					{if (local _x) exitWith {_local = true}} forEach _units;
					if (_local) then {
						{[_x] joinSilent (group PVOZ_HeadlessUnit)} forEach _units;
						
						NO_CU_EXPLOIT = _units;
						(owner PVOZ_HeadlessUnit) publicVariableClient 'NO_CU_EXPLOIT';
					};
					if (count (units _x) > 0) then {{if (isNull _x) then {[_x] joinSilent grpNull}} forEach (units _x)};
					if ((count (units _x) == 0)&&(!isNull _x)) then {deleteGroup _x}
				} forEach (_groups + allGroups);
				sleep 3;
			};
		};
	};
	if ("+str _AH_CUD+") then {
		[] spawn {
			while {33 > 50} do {
				_cnt = count playableUnits;
				if (_cnt > 0) then {
					_handleradded = false;
					_grps = [];{_grps = _grps + [group _x];} forEach (entities 'FunctionsManager');
					{
						_units = units _x;
						_localDetected = false;
						{if (local _x) exitWith {_localDetected = true}} forEach _units;
						if (_localDetected) then {
							if (!_handleradded) then {
								_handleradded = true;
								_obj = 'Rabbit' createVehicle [0,0,0];
								_obj addMPEventHandler ['MPKilled',""if (!isServer) then {
									"+_cuc+"=nil;
									'"+_cuc+"' addPublicVariableEventHandler {
										"+_cuc+" = nil;
										_units = _this select 1;
										_unitGroup = createGroup EAST;
										{
											_unit = _x;
											[_unit] joinSilent _unitGroup;
											if ((getPlayerUID _unit == '')&&(_unit isKindOf 'Man')) then {
												if (vehicle _unit == _unit) then {
													_unit enableAI 'TARGET';
													_unit enableAI 'AUTOTARGET';
													_unit enableAI 'ANIM';
													_unit enableAI 'FSM';
													_unit enableAI 'MOVE';
													{_unit setSkill [(_x select 0),(_x select 1)]} forEach [['aimingAccuracy',0.60],['aimingShake',0.40],['aimingSpeed',0.60],['endurance',1.00],['spotDistance',0.65],['spotTime',0.60],['courage',1.00],['reloadSpeed',1.00],['commanding',1.00],['general',1.00]];
													_unit removeAllEventHandlers 'Killed';
													_unit addEventHandler ['Killed',{[_this select 0, _this select 1, 'ground'] call on_kill}];
													_unitGroup setFormation 'ECH LEFT';
													_unitGroup selectLeader ((units _unitGroup) select 0);
												} else {
													_unitVehicle = (vehicle _unit);
													_unit addEventHandler ['Killed',{[_this select 0, _this select 1, 'vehicle'] call on_kill}];
													if (driver _unitVehicle == _unit) then {
														_unit assignAsDriver _unitVehicle;
														{_unit setSkill [_x,1]} count ['aimingAccuracy','aimingShake','aimingSpeed','endurance','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];
													} else {
														_unit assignAsGunner _unitVehicle;
													};
													_unitGroup allowFleeing 0;
													_unitGroup setBehaviour 'AWARE';
													_unitGroup setCombatMode 'RED';
												};
											};
											_allPlayers = playableUnits;
											{_unit reveal _x} forEach _allPlayers;
										} forEach _units;
									};
								};""];
								_obj setDamage 5;
								deleteVehicle _obj;
							};

							_unit = _units select 0;
							_unsorted = playableUnits;
							_sorted = [];
							{
								_closest = _unsorted select 0;
								{if ((getPos _x distance _unit) < (getPos _closest distance _unit)) then {_closest = _x}} forEach _unsorted;
								_sorted = _sorted + [_closest];
								_unsorted = _unsorted - [_closest]
							} forEach _unsorted;
							_sorted;

							_plr = objNull;
							{if (!isNull _x) exitWith {_plr = _x;};} forEach _sorted;

							{
								if (!isNull _x) then
								{
									_x removeAllEventHandlers 'Killed';
									_x addEventHandler ['Killed', {
										(_this select 0) removeMagazines 'Stinger';
										(_this select 0) removeWeapon 'Stinger';
									}];
									[_x] joinSilent (group _plr);
									diag_log format['<Dead Cell> Locality of unit %1(%2) transfered to Client.',_x,typeOf _x];
								};
							} forEach _units;

							"+_cuc+" = _units;
							(owner _plr) publicVariableClient '"+_cuc+"';
						};
					} forEach (_grps+allGroups);
					{
						if (count (units _x) > 0) then {{if (isNull _x) then {[_x] joinSilent grpNull}} forEach (units _x)};
						if ((count (units _x) == 0)&&(!isNull _x)) then {deleteGroup _x}
					} forEach allGroups;
				};
				uiSleep 3;
			};
		};
	};
	diag_log ('(GG-AntiHack): (1/2) Server AH framework loading...');
	[] spawn {
		if ("+str _SVR_FW+") then {
			dayzSetFogAH 			= "+str _SVR_FOG+";
			dayzSetRainAH 			= "+str _SVR_RAIN+";
			dayzSetOvercastAH 		= "+str _SVR_OVC+";
			dayzSetViewDistanceAH 	= "+str _SVR_VDIS+";
			diag_log format ['(GG-AntiHack): Weather set! FOG: %4 RAIN:%3 OVERCAST: %2 VIEW DISTANCE: %1',dayzSetViewDistanceAH,dayzSetOvercastAH,dayzSetRainAH,dayzSetFogAH];
			publicVariable 'dayzSetFogAH';
			publicVariable 'dayzSetRainAH';
			publicVariable 'dayzSetOvercastAH';
			publicVariable 'dayzSetViewDistanceAH';
			0 setFog dayzSetFogAH;
			0 setRain dayzSetRainAH;
			0 setOvercast dayzSetOvercastAH;
			setViewDistance dayzSetViewDistanceAH;
			diag_log ('(GG-AntiHack): Global weather settings applied.');
		};
		
		'dayzSetDateAH' addPublicVariableEventHandler {server_timeSync = {};setDate dayzSetDateAH};
		'dayzSetFogAH' 	addPublicVariableEventHandler {3 setFog dayzSetFogAH};
		'dayzSetRainAH' addPublicVariableEventHandler {3 setRain dayzSetRainAH};
		'dayzSetOvercastAH' addPublicVariableEventHandler {3 setOvercast dayzSetOvercastAH};
		'dayzSetViewDistanceAH' addPublicVariableEventHandler {setViewDistance dayzSetViewDistanceAH};
		
		_badVehicles = [];
		{_badVehicles = _badVehicles + [toLower(_x)]} forEach "+str _BAD_VEHS+";
		_RE 	= compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
		_MPF 	= "+str _BIS_MPF_RES+";
		RE 		= _RE;
		BIS_MPF_remoteExecutionServer = _MPF;
		_onPlayerDisconnect = {
			[_uid,_name] call server_onPlayerDisconnect;
			_time = call AH_fnc_serverTime;
			
			_log = format['%1 (%2) has disconnected from dayz_instance %3',_name,_uid,dayz_instance];
			_tog = format[' @ UPT: %1h(s) %2min(s)',_time select 0,_time select 1];
			diag_log _log; 
			""ConnLog"" callExtension (_log);
			PVOZ_loglog set [count PVOZ_loglog, ['     '+_log+_tog,'','0','1','0','0',[1,0,0,1]]];
			if !("+str _LG_PVC+") then {publicVariable 'PVOZ_loglog'};
		};
		_onPlayerConnect = {
			if ((_uid == '') && (_name == '__SERVER__')) exitWith {};
			_time = call AH_fnc_serverTime;
			
			_log = format['%1 (%2) has connected to dayz_instance %3',_name,_uid,dayz_instance];
			_tog = format[' @ UPT: %1h(s) %2min(s)',_time select 0,_time select 1];
			diag_log _log;
			""ConnLog"" callExtension (_log);
			PVOZ_loglog set [count PVOZ_loglog, ['     '+_log+_tog,'','0','1','0','0',[0,1,0,1]]];
			if !("+str _LG_PVC+") then {publicVariable 'PVOZ_loglog'};
		};
		AH_AH_scrhndlr = "+(str _AH_scrhndlr)+";
		AH_WL_DIS = "+str _WL_DIS+";
		AH_SVR_VDIS = "+str _SVR_VDIS+";
		AH_SVR_OVC = "+str _SVR_OVC+";
		AH_SVR_RAIN = "+str _SVR_RAIN+";
		AH_SVR_FOG = "+str _SVR_FOG+";
		AH_SVR_FW = "+str _SVR_FW+";
		AH_AdminArray = "+(str _AdminArray)+";
		AH_BAD_WEPS = "+(str _BAD_WEPS)+";
		AH_CMD_WLS = "+(str _CMD_WLS)+";
		AH_AM_WLS = "+(str _AM_WLS)+";
		AH_UN_FNC = "+str _UN_FNC+";
		AH_AH_DZE = "+str _AH_DZE+";
		AH_BAD_VAR = "+str _BAD_VAR+";
		AH_BAD_FILE = "+str _BAD_FILE+";
		AH_AH_KICK = "+str _AH_KICK+";
		
		_AH_MPFINIT = createAgent ['Survivor2_DZ',[30 + (random 100),10000 + (random 500),0],[],0,'FORM'];
		_AH_MPFINIT setVehicleInit ""if ("+str _AH_DZE+") then [{[] execVM '\z\addons\dayz_code\system\ca\functions\init.sqf'},{[] execVM 'ca\Modules\Functions\init.sqf'}];"";
		processInitCommands;
		
		_AH_GB_ARR = [(""
			diag_log ('(GG-AntiHack): Loading AH login..');
			waitUntil {((!isNil 'dayz_medicalH') || (!isNil 'dayz_gui') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_monitor1'))};
			diag_log ('(GG-AntiHack): Spawn detected! Using default login... '+str time);
			AM_EPOCH = if (""+str AH_AH_DZE+"") then [{TRUE},{FALSE}];
			_cuid = ("+_playerID+" player);
			_luid = (profileNamespace getVariable ['AH_PUID','notsaved']);
			if !(_luid in [_cuid,'notsaved']) then {
				profileNamespace setVariable ['AH_PUID',_cuid];
				saveProfileNamespace;
				if (_luid != 'notsaved') then {
					"+_AdminReport+" = [name player,"+_playerID+" player,'New PUID','OLD: '+str(_luid)+' NEW PUID: '+str(_cuid),'misc'];
					publicVariableServer '"+_AdminReport+"';
				};
			};
			
			_badcnt = [];
			{_plant = _x createVehicleLocal [1337,1337,-10];if (sizeOf _x == 0) then {_badcnt = _badcnt + [_x]};deleteVehicle _plant;} forEach ['grass','prunus','picea','fallentree','phragmites','acer','amygdalusn','Brush','fiberplant','amygdalusc','boulder'];
			if (count _badcnt > 0) then {
				_msg = 'Deleted PBOs detected, please replace your PBO files!';
				{systemChat ('"+_AH_CHAT+": '+str _msg)} forEach [1,2,3,4];
				uiSleep 5;
				_this = ['P3D removed',('Missing: '+str _badcnt)];
				if (9 > 0) then ""+str AH_AH_KICK+"";
			};
			AH_colorskins = {
				if (isNil 'PVOZ_coloredbros') then {PVOZ_coloredbros = []};
				if (count PVOZ_coloredbros > 0) then {
					{
						_arr = call compile (_x);
						_bro = (_arr select 0);
						_clr = (_arr select 1);
						_allPlayers = playableUnits;
						{
							if (name _x == _bro) then {
								if (vehicle _x == _x) then {
									_x setObjectTexture [0,_clr];
									if (typeOf _x == 'Soldier1_DZ') then {
										_x setObjectTexture [1,'#(argb,1,1,1)color(1,1,1,1)'];
										_x setObjectTexture [2,'#(argb,1,1,1)color(1,1,1,1)'];
									};
									if (typeOf _x == 'Camo1_DZ') then {_x setObjectTexture [1,'#(argb,1,1,1)color(1,1,1,1)']};
								} else {
									(vehicle _x) setObjectTexture [0,_clr];
								};
							}
						} forEach _allPlayers;
					} forEach PVOZ_coloredbros;
				};
			};
			'PVOZ_coloredbros' addPublicVariableEventHandler AH_colorskins;
			diag_log ('(GG-AntiHack): Logged in! '+str time);
			'PVDZE_plr_SetDate' addPublicVariableEventHandler {
				if (""+str AH_SVR_FW+"") then {
					if (isNil 'stopsyncingme') then {
						stopsyncingme = true;
						setDate (_this select 1);
						diag_log ('(GG-AntiHack): Server setDate '+str _this+'. No longer updating time. FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
					};
				} else {
					setDate (_this select 1);
					diag_log ('(GG-AntiHack): Server setDate '+str _this+'. FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				};
			};
			"+(if (_SVR_FW) then [{"
				if (isNil 'dayzSetFogAH') then {dayzSetFogAH = ""+str AH_SVR_FOG+""};
				if (isNil 'dayzSetRainAH') then {dayzSetRainAH = ""+str AH_SVR_RAIN+""};
				if (isNil 'dayzSetOvercastAH') then {dayzSetOvercastAH = ""+str AH_SVR_OVC+""};
				if (isNil 'dayzSetViewDistanceAH') then {dayzSetViewDistanceAH = ""+str AH_SVR_VDIS+""};
				if (!isNil 'dayzSetDateAH') then {setDate dayzSetDateAH};
				
				0 setFog dayzSetFogAH;
				0 setRain dayzSetRainAH;
				0 setOvercast dayzSetOvercastAH;
				setViewDistance dayzSetViewDistanceAH;
				'drn_DynamicWeatherEventArgs' addPublicVariableEventHandler {};
			"},{""}])+"
			
			'dayzSetDateAH' addPublicVariableEventHandler {server_timeSync = {};setDate dayzSetDateAH};
			'dayzSetFogAH' 	addPublicVariableEventHandler {3 setFog dayzSetFogAH};
			'dayzSetRainAH' addPublicVariableEventHandler {3 setRain dayzSetRainAH};
			'dayzSetOvercastAH' addPublicVariableEventHandler {3 setOvercast dayzSetOvercastAH};
			'dayzSetViewDistanceAH' addPublicVariableEventHandler {setViewDistance dayzSetViewDistanceAH};
			
			if ("+_playerID+" player in ""+(str AH_AdminArray)+"") then {
				_msg = ('Welcome, [ADMIN] '+name player+'!');
				systemChat ('"+_AH_CHAT+": '+str _msg);
				diag_log ('(GG-AntiHack): LOGGED IN AS ADMIN. '+str time);
				
				call compile ('loadFile '+str 'anti-hack loaded. Welcome, admin! Errors'+';');
				'"+_AdminTool+"_AHALERTS' addPublicVariableEventHandler {
					_array 	= _this select 1;
					_msg 	= _array select 0;
					
					if (isNil 'PVOZ_AdminAlerts') then {PVOZ_AdminAlerts=true};
					if (PVOZ_AdminAlerts) then {
						_msg call AH_fnc_dynTextMsg;
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
				};
				
				_msg = 'Loading admin tool...';
				systemChat ('"+_AH_CHAT+": '+str _msg);
				
				diag_log ('(GG-AntiHack): Requesting admin tool... '+str time);
				"+_RND+"_RequestAHT = [player,name player];
				publicVariableServer '"+_RND+"_RequestAHT';
				waitUntil {(!isNil '"+_AdminTool+"_AHT')};
				diag_log ('(GG-AntiHack): Admin tool received! '+str time);
				[] spawn "+_AdminTool+"_AHT;
				diag_log ('(GG-AntiHack): Admin tool spawned ! '+str time);
				
				_msg = 'Admin tool loaded!';
				systemChat ('"+_AH_CHAT+": '+str _msg);
				
				{
					_x spawn {
						waitUntil {!isNull (findDisplay _this)};
						(findDisplay _this) displayAddEventHandler ['KeyUp','_this call AH_keyBinds;false'];
						(findDisplay _this) displayAddEventHandler ['KeyDown','_this call AH_keyBinds2;false'];
					};
				} forEach [12,18,46,63,106,129];
				
				_time = time;
				waitUntil {(!(isNil 'AH_CUSTOM')||(time - _time > 5))};
				if !(isNil 'AH_CUSTOM') then {
					_msg = 'Custom admin tool loaded!';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					[] spawn AH_CUSTOM;
				};
			} else {
				diag_log ('(GG-AntiHack): Logged in as player! '+str time);
				_msg = 'Welcome, '+name player+'!';
				_msg call AH_fnc_dynTextMsg;
				systemChat ('"+_AH_CHAT+": '+str _msg);
			};
			"+(if (_AH_SCRH) then [{"
				diag_log ('(GG-AntiHack): Script handler loading... FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				_AH_scripthandler = ""+str AH_AH_scrhndlr+"";
				_cntL = 0;
				_cntS = (count _AH_scripthandler);
				{
					[] spawn _x;
					_cntL = _cntL + 1;
					diag_log ('(GG-AntiHack): Script handler loaded script '+str _cntL+' out of '+str _cntS+'! FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				} forEach _AH_scripthandler;
				diag_log ('(GG-AntiHack): Script handler is finished! FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
			"},{""}])+"
		""),(""
			"+_RNNND+"_THREAD1 = [] spawn {
				diag_log ('(GG-AntiHack): Thread 1 started, waiting for login... FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				waitUntil {((!isNil 'dayz_medicalH') || (!isNil 'dayz_gui') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_monitor1'))};
				disableSerialization;
				_RE = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
				NotNull"+_randv+" = compile preprocessFileLineNumbers ('\z\addons\dayz_code\compile\fn_damageHandler.sqf');
				if (isNil 'inSafeZone') then {inSafeZone = false};
				if (isNil 'deathHandled') then {deathHandled=false};
				if (isNil 'inSafeZone') then {inSafeZone=false};
				if (isNil 'canBuild') then {canBuild=true};
				_WL_DISP = [];
				_WL_DISP = _WL_DISP + ""+str AH_WL_DIS+"";
				_OK_DISP = '(';
				_cnt = 0;
				{
					_OK_DISP = _OK_DISP + '(isNull (findDisplay '+str _x+'))';
					if (_cnt != (count _WL_DISP - 1)) then [{_OK_DISP = _OK_DISP + '&&'},{_OK_DISP = _OK_DISP + ')'}];
					_cnt = _cnt + 1;
				} forEach _WL_DISP;
				"+_randv+"_dizchk = compile _OK_DISP;
				_spaceInterrupt = str(dayz_spaceInterrupt);
				"+_randv+"_flchk1 = -20000;
				"+_randv+"_flchk2 = -20000;
				"+_randv+"_flchk3 = -20000;
				"+_randv+"_flchk4 = -20000;
				"+_randv+"_flchk5 = -20000;
				if (isNil '"+_RND+"_adminESPmarkers') then {"+_RND+"_adminESPmarkers = 0};
				if (isNil '"+_RND+"_adminspecESP') then {"+_RND+"_adminspecESP = 0};
				while {35 < 69} do {
					_allPlayers = playableUnits;
					if !('ItemGPS' in (items player)) then [{"+_RND+"_fespGPS = false},{"+_RND+"_fespGPS = true}];
					if ((time - "+_randv+"_flchk3 > 5)&&("+_RND+"_fespGPS)&&("+_RND+"_adminESPmarkers == 0)&&("+_RND+"_adminspecESP == 0)&&(profileNameSpace getVariable ['AH_FESP',true])) then {
						"+_randv+"_flchk3 = time;
						_AHT_SGIV = true;
						setGroupIconsVisible [_AHT_SGIV,_AHT_SGIV];
						{
							if ((isPlayer _x) && (alive _x) && (!isNull _x)) then {
								if ((("+_playerID+" _x) call PIDP_check) != (("+_playerID+" player) call PIDP_check)) then {
									_fuid = (("+_playerID+" _x) call PIDP_check);
									_pfls = player getVariable ['AH_friendlist',[]];
									
									_puid = (("+_playerID+" player) call PIDP_check);
									_ffls = _x getVariable ['AH_friendlist',[]];
									_friend = (group _x);clearGroupIcons _friend;
									if ((_fuid in _pfls)&&(_puid in _ffls)) then {
										if (vehicle _x != _x) then {
											_crew = [];
											_driver = driver (vehicle _x);
											{if (_x != _driver) then {_crew = _crew + [name _x]}} forEach (crew (vehicle _x));
											
											if (_driver == _x) then {
												_friend addGroupIcon ['x_art'];
												if (count _crew < 1) then {
													_veh = (getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'));
													_friend setGroupIconParams [[0,0,1 ,1],format ['%1 (%3 - %2m)',name _x,round (_x distance player),_veh],0.7,true];
												} else {
													_friend setGroupIconParams [[0,0,1 ,1],format ['D: %1 (%2m) P: %3',name _x,round (_x distance player),_crew],0.7,true];
												};
											} else {
												_duid 	= (("+_playerID+" _driver) call PIDP_check);
												_dif 	= (_duid in _pfls);
												if ((isNull _driver)||(!alive _driver)||(!isPlayer _driver)||(!_dif)) then {
													_crew = [];
													{_crew = _crew + [name _x]} forEach (crew (vehicle _x));
													_veh = (getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'));
													_friend addGroupIcon ['b_inf'];
													if ((isNull _driver)||(!alive _driver)||(!isPlayer _driver)) then {
														_friend setGroupIconParams [[0,0,1 ,1],format ['D: None (%3 - %1m) P: %2',round (_x distance player),_crew,_veh],0.7,true];
													} else {
														_friend setGroupIconParams [[0,0,1 ,1],format ['D: %4 (%3 - %1m) P: %2',round (_x distance player),_crew,_veh,name _driver],0.7,true];
													};
												};
											};
										} else {
											_friend addGroupIcon ['x_art'];
											_friend setGroupIconParams [[0,0,1 ,1],format ['%1 (%2m)',name _x,round (_x distance player)],0.7,true];
										};
									};
								};
							};
						} forEach _allPlayers;
					} else {
						if ((time - "+_randv+"_flchk4 > 5)&&("+_RND+"_adminESPmarkers == 0)&&("+_RND+"_adminspecESP == 0)&&!(profileNameSpace getVariable ['AH_FESP',true])) then {
							"+_randv+"_flchk4 = time;
							_AHT_SGIV = false;
							setGroupIconsVisible [_AHT_SGIV,_AHT_SGIV];
							{_friend = (group _x);clearGroupIcons _friend} forEach _allPlayers;
						};
					};
					if !("+_playerID+" player in ""+(str AH_AdminArray)+"") then {
						if (time - "+_randv+"_flchk2 >= 5) then {
							"+_randv+"_flchk2 = time;
							{
								_item 	= _x;
								_ci 	= ((weapons player) + (magazines player));
								if !(isNull (unitBackpack player)) then {
									_bpm1 = (getMagazineCargo (unitBackpack player)) select 0;
									_bpm2 = (getMagazineCargo (unitBackpack player)) select 1;
									_bpw1 = (getWeaponCargo (unitBackpack player)) select 0;
									_bpw2 = (getWeaponCargo (unitBackpack player)) select 1;
									if (_item in (_bpm1+_bpw1)) then {
										clearWeaponCargoGlobal (unitBackpack player);
										clearMagazineCargoGlobal (unitBackpack player);
										
										_cnt = 0;
										{if (_x == _item) then {_cnt = _cnt + 1;_bpm1 set [_forEachIndex,objNull];_bpm2 set [_forEachIndex,objNull];};} forEach _bpm1;
										{if (_x == _item) then {_cnt = _cnt + 1;_bpw1 set [_forEachIndex,objNull];_bpw2 set [_forEachIndex,objNull];};} forEach _bpw1;
										
										_bpm1 = _bpm1 - [objNull];
										_bpm2 = _bpm2 - [objNull];
										_bpw1 = _bpw1 - [objNull];
										_bpw2 = _bpw2 - [objNull];
										
										_num = 0;
										{(unitBackpack player) addMagazineCargoGlobal [_x,_bpm2 select _num];_num = _num + 1;} forEach _bpm1;
										_num = 0;
										_item = (unitBackpack player);
										_dcarr = [_x,_bpw2 select _num];
										{_item addWeaponCargoGlobal _dcarr;_num = _num + 1;} forEach _bpw1;
										
										_msg = 'Removing banned '+str _item+' (COUNT: '+str _cnt+') from backpack.';
										_msg call AH_fnc_dynTextMsg;
										systemChat ('"+_AH_CHAT+": '+str _msg);
										
										"+_AdminReport+" = [name player,"+_playerID+" player,'Bad Item(s)',''+str _cnt+' '+_item+'(s) in backpack('+(typeOf (unitBackpack player))+')!'];
										publicVariableServer '"+_AdminReport+"';
									};
								};
								if (_item in _ci) then {
									_cnt = 0;
									{
										if (_item == _x) then {
											_cnt = _cnt + 1;
											(vehicle player) removeWeapon _item;
											(vehicle player) removeMagazine _item;
											(vehicle player) removeMagazines _item;
										};
									} forEach _ci;
									
									_msg = 'Removing banned item(s): '+str _item+' (COUNT: '+str _cnt+')';
									_msg call AH_fnc_dynTextMsg;
									systemChat ('"+_AH_CHAT+": '+str _msg);
									
									"+_AdminReport+" = [name player,"+_playerID+" player,'Bad Item(s)',''+str _cnt+' '+_item+'(s)'];
									publicVariableServer '"+_AdminReport+"';
								};
							} forEach ""+(str AH_BAD_WEPS)+"";
							"+(if (_BAD_VAR_DIS) then [{"
							{
								_this = ['Global Var',_x];
								if !(isNil _x) then ""+str AH_AH_KICK+"";
							} forEach (""+(str AH_BAD_VAR)+"");
							"},{""}])+"
						};
						"+(
						if (!_BAD_FILE_DIS) then [{"
						if (time - "+_randv+"_flchk1 >= 1800) then {
							diag_log ('(GG-AntiHack): Thread 1 loop file scan starting... FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
							"+_randv+"_flchk1 = time;
							{
								_loadfile = call compile ('loadFile '+str(_x)+';');
								_this = ['Hack File',_x];
								if (_loadfile != '') then ""+str AH_AH_KICK+"";
							} forEach (""+(str AH_BAD_FILE)+"");
							diag_log ('(GG-AntiHack): Thread 1 loop file scan complete. FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
						};"},{""}])+(if !(_CMD_DIS) then [{"
							_this = ['Commanding menu',(str commandingMenu)];
							if !(commandingMenu in (['','RscMainMenu','RscStatus','RscGroupRootMenu']+""+(str AH_CMD_WLS)+"")) then [""+str AH_AH_KICK+"",{if (commandingMenu in ['RscMainMenu','RscStatus','RscGroupRootMenu']) then {showCommandingMenu ''}}];
						"},{""}])+(if !(_AM_DIS) then [{"
							if (isNil '"+_randv+"_dzacts') then {
								{
									if (isNil _x) then {call compile (_x+' = -1;')};
									"+_randv+"_dzacts = [];
									call compile ('"+_randv+"_dzacts = "+_randv+"_dzacts + ['+_x+'];');
								} forEach ""+(str AH_AM_WLS)+"";
							};
							_tempRemoveAction = vehicle player addAction ['','',[],1,false,true,'','false'];
							_startRemove = _tempRemoveAction - 10;
							_endRemove = _tempRemoveAction + 99;
							for '_i' from _startRemove to _endRemove do {
								if !(_i in "+_randv+"_dzacts) then {
									(vehicle player) removeAction _i;
									(cursorTarget) removeAction _i;
								}
							};
						"},{""}])+"
						if ((damage(vehicle player)) > 0.98) then {if !(inSafeZone) then [{player action ['EJECT',(vehicle player)];if (r_player_blood > 4000) then {r_player_blood = ((random 4000) max 500)}},{deleteVehicle (vehicle player)}]};
						if (!deathHandled) then {
							if (""+str AH_AH_DZE+"" && dayz_clientPreload && dayz_authed) then {
								_charID = player getVariable ['CharacterID','0'];
								if (isNil '_charID') then {
									if (isNil 'dayz_characterID') then {
										_msg = 'CharID is null, requesting new one...';
										systemChat ('"+_AH_CHAT+": '+str _msg);
										
										dayzPlayerLogin = [];
										PVDZE_plr_Login = [getPlayerUID player,player];
										publicVariableServer 'PVDZE_plr_Login';
										waitUntil{count (dayzPlayerLogin) > 1};
										dayz_characterID = dayzPlayerLogin select 0;
										player setVariable ['CharacterID',dayz_characterID,true];
										
										_charID = player getVariable ['CharacterID','0'];
										if (isNil '_charID') then {
											_msg = 'CharID failed to update! Disconnecting you in 5 seconds...';
											systemChat ('"+_AH_CHAT+": '+str _msg);
											
											uiSleep 5;
											
											"+_AdminReport+" = [name player,"+_playerID+" player,'charID','NULL'];
											publicVariableServer '"+_AdminReport+"';
											(findDisplay 46) closeDisplay 0;
											
										};
									} else {
										_msg = 'CharID was null, fixed charID now.';
										systemChat ('"+_AH_CHAT+": '+str _msg);
										player setVariable ['CharacterID',dayz_characterID,true]
									};
								};
							};
							if (r_player_blood <= 0) then {player setDamage 1};
						};
						if (animationState player in ['smk_urbanproneleft','smk_urbanproneright','smk_prone_to_urbanprone_left','smk_prone_to_urbanprone_right']) then {
							if (time - "+_randv+"_flchk5 > 5) then {
								"+_randv+"_flchk5 = time;
								if ((nearestObject [player,'Plastic_Pole_EP1_DZ']) distance player < 60) then {
									[objNull,player,rSwitchMove,''] call RE;
									_msg = 'Can not use urbanprone near plot poles!';
									_msg call AH_fnc_dynTextMsg;
									systemChat ('"+_AH_CHAT+": '+str _msg);
								}
							}
						};
						if (!isNull (uiNamespace getVariable 'RscDisplayRemoteMissions')) then {
							closeDialog 0;
							_this = ['Hack Menu','DISPLAY -1 (RscDisplayRemoteMissions)'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if ((call "+_randv+"_dizchk)&&!(ctrlEnabled 1900)) then {closeDialog 0};
						if (!isNull (findDisplay 7331)) then {
							{
								((findDisplay 7331) displayCtrl _x) ctrlRemoveAllEventHandlers 'MouseButtonDown';
								((findDisplay 7331) displayCtrl _x) ctrlRemoveAllEventHandlers 'MouseButtonUp';
							} forEach [1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010];
							((findDisplay 7331) displayCtrl 1010) buttonSetAction '[lbtext [1002,lbCurSel 1002]] spawn baseManage_addFriend;';
							((findDisplay 7331) displayCtrl 1009) buttonSetAction '[lbtext [1003,lbCurSel 1003]] spawn baseManage_delFriend;';
							((findDisplay 7331) displayCtrl 1008) buttonSetAction '['''','''','''',''maintain''] execVM ''DamiMods\Epoch\dami_MA.sqf'';closeDialog 0;';
						};
						if (ctrlEnabled 4) then {
							_this = ['Hack Menu','CTRL 4'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (ctrlEnabled 810) then {
							_this = ['Hack Menu','CTRL 810'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (lbSize 109 > 2) then {
							_this = ['Hack Menu','lbSize 109'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (lbSize 114 > 2) then {
							_this = ['Hack Menu','lbSize 114'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (ctrlText 8 != '') then {
							_this = ['Hack Menu','CTRL 8'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						{
							if (!isNull (findDisplay _x)) then {
								closeDialog 0;
								_this = ['Hack Menu',str _x];
								if (9 > 0) then ""+str AH_AH_KICK+"";
							};
						} forEach [166,17,162,155,2929,3030,69420];
						{
							if (!isNull (findDisplay _x)) then {
								(findDisplay _x) displayRemoveAllEventHandlers 'KeyDown';
								(findDisplay _x) displayRemoveAllEventHandlers 'KeyUp';
								if !(_x in [-1,106]) then {
									(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonDown';
									(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonUp';
								};
							};
						} forEach [-1,12,18,24,49,63,106,129,7331];
						if ((unitRecoilCoefficient player) != 1) then {
							_this = ['Memory Hack','No Recoil '+str(currentWeapon player)];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if ((abs (player ammo (currentWeapon player)) > 200)&&(vehicle player == player)&&!(currentWeapon player in ['MeleeBaseBallBatBarbed','MeleeBaseBallBatNails','MeleeBaseBallBat','MeleeHatchet','MeleeHatchet_DZE','MeleeCrowbar','MeleeCrowbar_DZE','MeleeMachete','MeleeMachete_DZE','MeleeSledge','MeleeFishingPole','ChainSaw','ChainSawB','ChainSawG','ChainSawP','ChainSawR'])) then {
							_this = ['Memory Hack','Infinite Ammo '+str(currentWeapon player)];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if ((!isNil 'TraderItemList')&&(typeName TraderItemList == 'CODE')) then {
							_this = ['Global Var','TraderItemList modified: '+str TraderItemList+''];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (typeName (player getVariable ['ahworldspace',0]) != 'SCALAR') then {
							_this = ['Global Var','ahworldspace'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (_spaceInterrupt != str(dayz_spaceInterrupt)) then {
							_this = ['Global Var',format ['spaceInterrupt MODIFIED TO (%1)',dayz_spaceInterrupt]];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (typeName(player) != 'OBJECT') then {
							_this = ['Global Var','Player is '+(str(typeName player))];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (typeName time != 'SCALAR') then {
							_this = ['Global Var',format ['Time: %1',_time]];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if ((str(typeName true) != str('BOOL')) || (str (true) != 'true') || !(true)) then {
							if !(true) exitWith {
								_this = ['Global Var','TRUE == FALSE'];
								if (9 > 0) then ""+str AH_AH_KICK+"";
							};
							_this = ['Global Var','TRUE =/= TRUE'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						if (str(diag_ticktime) == str(-100)) then {
							_this = ['Global Var',format ['Diag_ticktime modified: %1',diag_ticktime]];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						_obj = toArray(str player);_obj resize 9;_obj;
						if (toString _obj == 'B 1-2-6:1') then {
							_this = ['Global Var','Group hack'];
							if (9 > 0) then ""+str AH_AH_KICK+"";
						};
						buttonSetAction [104,''];
						((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
						((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
						(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
						(findDisplay 46) displayAddEventHandler ['KeyDown','_this call dayz_spaceInterrupt'];
					};
					if ((player getVariable ['bodyName','ah_check']) == 'ah_check') then {player setVariable ['bodyName',name player,true]};
					if (str(player getVariable ['AH_friendlist',[]]) != str(profileNameSpace getVariable ['AH_friendlist',[]])) then {
						_nochange = true;
						if (count (player getVariable ['AH_friendlist',[]]) > 0) then {
							{
								if (((("+_playerID+" _x) call PIDP_check) in (profileNameSpace getVariable ['AH_friendlist',[]])) && !((("+_playerID+" player) call PIDP_check) in (_x getVariable ['AH_friendlist',[]]))) then {
									_nochange = false;
									_msg = (name _x+' removed you from their friendlist.');
									systemChat ('"+_AH_CHAT+": ' + str _msg);
									_msg call AH_fnc_dynTextMsg;
									
									profileNamespace setVariable ['AH_friendlist',(player getVariable ['AH_friendlist',[]])];
									saveProfileNamespace;
								};
							} forEach _allPlayers;
						};
						if (_nochange) then {player setVariable ['AH_friendlist',(profileNameSpace getVariable ['AH_friendlist',[]]),true]};
					};
					if (!inSafeZone) then {
						fnc_usec_damageHandler = {
							_unit 	= (_this select 0);
							_hit 	= (_this select 1);
							_damage = (_this select 2);
							_source = (_this select 3);
							_ammo 	= (_this select 4);
							_maxdmg = 20;
							_explosives = ['FuelExplosion','HelicopterExploSmall','HelicopterExploBig','SmallSecondary','Bo_FAB_250','TimedExplosion'];
							if (!(isPlayer _unit)||(_unit == _source)||((vehicle _unit) == (vehicle _source))||(isNull _source)||(_unit distance _source > 2000)||(name _source == name _unit)) exitWith {
								if (!(isNull _source)&&(_unit distance _source < 2000)) then NotNull"+_randv+";
							};
							if ((isNull _source)||(_ammo in _explosives)) exitWith {};
							if (true) then NotNull"+_randv+";
						};
					};
					if (!isNil 'AH_colorskins') then {call AH_colorskins};
					if (!alive player) then {r_player_unconscious = false};
					if ((viewDistance > 3000)&&(((getPosATL (vehicle player)) select 2) > 200)) then {setViewDistance 2800};
					if (r_player_unconscious) then {
						[] spawn {
							waitUntil {
								if (!isNull (findDisplay 106)) then [{(findDisplay 106) closeDisplay 0},{closeDialog 0}];
								(!r_player_unconscious)
							};
						};
						if (r_player_timeout > 1) then {
							r_player_unconslide = nil;
							[format['<t color=''#FF0000''>Unconscious for another %1 seconds..</t>',r_player_timeout],safezoneX + 0.75,safezoneY + 0.5,2,0,0,77396] spawn AH_fnc_dynamictext;
						};
					} else {
						if (isNil 'r_player_unconslide') then {
							r_player_unconslide = true;
							['<t color=''#FF0000''>Waking up now!</t>',safezoneX + 0.75,safezoneY + 0.5,2,0,-1,77396] spawn AH_fnc_dynamictext;
						};
						['',safezoneX + 0.75,safezoneY + 0,1,0,-1,77396] spawn AH_fnc_dynamictext;
					};
					if (!DZE_CanPickup) then {
						if (isNil 'pickupwait') then {pickupwait = time};
						if ((time - pickupwait) > 5) then {
							DZE_CanPickup = true;
							pickupwait = nil;
						};
					};
					uiSleep 1;
					diag_log ('(GG-AntiHack): Thread 1 loop completed! FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				};
			};
		"")];
		_AH_PL_ARR = [(""
			{if (_x in ['allUnits','allGroups','entities','vehicles','playableUnits']) then [{call compile (_x+'=[player]')},{call compile (_x+'={}')}]} forEach ""+str AH_UN_FNC+"";
			"+_RNNND+"_THREAD2 = [] spawn {
				diag_log ('(GG-AntiHack): Thread 2 started, waiting for login... FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				"+(if (_AH_ATP) then [{"
					waitUntil {((!isNil 'dayz_medicalH') || (!isNil 'dayz_gui') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_monitor1'))};
					_debugPos = getMarkerpos 'respawn_west';
					_ctp = 0;
					_mtp = 3;
					while {100 > 69} do {
						_tscan = time;
						_plr1 = vehicle player;
						_oldpos = getPos _plr1;
						_oldgps = mapGridPosition _oldpos;
						_oldpos set [2,0];
						_speed1 = round(speed(vehicle player));
						uiSleep 1;
						_plr2 = vehicle player;
						_newpos = getPos _plr2;
						_newgps = mapGridPosition _newpos;
						_newpos set [2,0];
						_speed2 = round(speed(vehicle player));
						
						_travelDis = (round(_oldpos distance _newpos));
						_debugPoZ = (round(_debugPos distance _oldpos));
						_isNotDebug = ((parseNumber _newgps < 900000)&&(parseNumber _oldgps < 900000)&&(parseNumber _newgps > 200)&&(parseNumber _oldgps > 200));
						_adminTP = player getVariable ['AdminTempTele"+_RND+"',false];
						_notneg = ((_speed2 > 0)&&(_speed1 > 0));
						_speed = _speed2;
						_isOk = true;
						_iv = (_plr2 != player);
						_ia = (_plr2 isKindOf 'AIR');
						_speed = if ((_speed2 == 0)||(_speed2 < _speed1)) then [{_speed1},{_speed2}];
						_isLag = (round(time - _tscan) >= 2);
						_maxDist = switch (true) do {
							default {60};
							case ((_speed > 40)&&(_speed <= 50)&&_iv): {140};
							case ((_speed > 50)&&(_speed <= 150)&&_iv): {160};
							case ((_speed > 150)&&(_speed <= 250)&&_iv): {180};
							case ((_speed > 250)&&(_speed <= 350)&&_iv): {200};
							case ((_speed > 250)&&(_speed <= 350)&&_ia): {250};
							case ((_speed > 350)&&(_speed <= 450)&&_ia): {300};
							case ((_speed > 450)&&(_speed <= 550)&&_ia): {350};
							case ((_speed > 550)&&(_speed <= 650)&&(_plr2 isKindOf 'Plane')): {400};
							case ((_speed > 650)&&(_speed <= 750)&&(_plr2 isKindOf 'Plane')): {500};
							case ((_speed > 750)&&(_speed <= 850)&&(_plr2 isKindOf 'Plane')): {600};
							case ((_speed > 850)&&(_speed <= 950)&&(_plr2 isKindOf 'Plane')): {700};
							case ((_speed > 950)&&(_speed <= 1050)&&(_plr2 isKindOf 'Plane')): {800};
							case ((_speed > 1050)&&(_speed <= 1150)&&(_plr2 isKindOf 'Plane')): {800};
							case ((_speed > 1150)&&(_speed <= 1250)&&(_plr2 isKindOf 'Plane')): {800};
						};
						if (vehicle player != player) then {
							_driver = (driver (vehicle player));
							if ((_driver != player)&&(!isNull _driver)) then {_isOk = false};
						};
						_isHaloing = false;
						if ((vehicle player == player)&&(_speed > 25)) then {if ((!isNil 'bis_fnc_halo_para_loop')||(!isNil 'bis_fnc_halo_clouds')||(!isNil 'bis_fnc_halo_para_vel')) then {_isHaloing = true}};
						if ((!_isHaloing)&&(_notneg)&&(!_adminTP)&&(_isOk)&&(_travelDis > _maxdist)&&(!isNull _plr2)&&(alive player)&&(_plr1 == _plr2)&&(_debugpoZ > 18000)&&(_isNotDebug)&&!(_isLag)) then {
							if (_plr2 isKindOf 'air') then {(vehicle player) setPos [(_oldpos select 0),(_oldpos select 1),150]} else {(vehicle player) setPos _oldpos};
							(vehicle player) setVelocity [0,0,0];
							_ctp = _ctp + 1;
							[] spawn {
								if (isNil 'Tele"+_RND+"') then {
									Tele"+_RND+" = true;
									uiSleep 10;
									_ctp = 0;
									Tele"+_RND+" = nil;
								};
							};
							_log = format['DISTANCE: %1m | MAX DIS: %6 | (%2 >> %3)! SPD1: %4 SPD2: %5 CURRENT CLASS: %7 TIME: %8',_travelDis,_oldgps,_newgps,_speed1,_speed2,_maxDist,typeOf (vehicle player),time - _tscan];
							"+_AdminReport+" = [name player,"+_playerID+" player,'Teleport',_log];
							publicVariableServer '"+_AdminReport+"';
						};
						if (_ctp >= _mtp) then {
							_log = format['%1m - %2 to %3! CURRENT CLASS: %4. | PLAYER KICKED! |',_travelDis,_oldgps,_newgps,typeOf (vehicle player)];
							"+_AdminReport+" = [name player,"+_playerID+" player,'Teleport',_log];
							publicVariableServer '"+_AdminReport+"';
							(findDisplay 46) closeDisplay 0;
						};
						diag_log ('(GG-AntiHack): Thread 2 loop completed! FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
					};
				"},{""}])+"
			};
		"")];
		_cnt = 0;
		{
			_cnt = _cnt + 1;
			_payload = _x;
			_AH_PAYLOAD = ""
				hideObject this;
				this removeAllEventHandlers 'handleDamage';
				this removeAllEventHandlers 'killed';
				this removeAllEventHandlers 'hit';
				this enableSimulation false;
				this allowDamage false;
				if (!hasInterface) exitWith {};
				diag_log ('(GG-AntiHack): Player received AH unit ""+str _cnt+""! FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				[] spawn {
					waitUntil {getPlayerUID player != ''};
					""+_payload+""
				};
			"";
			_AH_MPFINIT = createAgent ['Survivor2_DZ',[30 + (random 100),10000 + (random 500),0],[],0,'FORM'];
			_AH_MPFINIT setVehicleInit _AH_PAYLOAD;
			processInitCommands;
			diag_log ('(GG-AntiHack): AH init unit created... ('+str _cnt+')');
		} forEach _AH_GB_ARR;
		{
			_cnt = _cnt + 1;
			_payload = _x;
			_AH_PAYLOAD = ""
				hideObject this;
				this removeAllEventHandlers 'handleDamage';
				this removeAllEventHandlers 'killed';
				this removeAllEventHandlers 'hit';
				this enableSimulation false;
				this allowDamage false;
				if (!hasInterface) exitWith {};
				diag_log ('(GG-AntiHack): Player received AH unit ""+str _cnt+""! FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
				[] spawn {
					waitUntil {getPlayerUID player != ''};
					if !("+_playerID+" player in ""+(str AH_AdminArray)+"") then {""+_payload+""}
				};
			"";
			_AH_MPFINIT = createAgent ['Survivor2_DZ',[30 + (random 100),10000 + (random 500),0],[],0,'FORM'];
			_AH_MPFINIT setVehicleInit _AH_PAYLOAD;
			processInitCommands;
			diag_log ('(GG-AntiHack): AH init unit created... ('+str _cnt+')');
		} forEach _AH_PL_ARR;
		diag_log ('(GG-AntiHack): All AH init units created, total: ('+str _cnt+')');
		
		_fmlist = [];
		{if ((typeOF _x) == 'FunctionsManager') then [{_x setPos [floor(random 9999),floor(random 9999),1000000000];_fmlist set [count _fmlist,_x]},{deleteVehicle _x}]} forEach (entities 'Logic');
		"+(if (_AH_TERCHK) then [{"
		_AH_CHECK1 = ""
			hideObject this;
			this removeAllEventHandlers 'handleDamage';
			this removeAllEventHandlers 'killed';
			this removeAllEventHandlers 'hit';
			this enableSimulation false;
			this allowDamage false;
			if (!hasInterface) exitWith {};
			[] spawn {
				if (!("+_playerID+" player in ""+(str AH_AdminArray)+"") && (typeName (getPlayerUID player) == 'STRING') && ((getPlayerUID player) != '')) then {
					if (isNil '"+_RNNND+"_THREAD1') exitWith {};
					_this = ['Memory Hack','Thread1 terminated'];
					if (scriptDone "+_RNNND+"_THREAD1) exitWith ""+str AH_AH_KICK+"";
					"+(if (_AH_ATP) then [{"
						if (isNil '"+_RNNND+"_THREAD2') exitWith {};
						_this = ['Memory Hack','Thread2 terminated'];
						if (scriptDone "+_RNNND+"_THREAD2) exitWith ""+str AH_AH_KICK+"";
					"},{""}])+"
				};
			};
		"";
		"+_Player_LOGIN+"_unit1 = objNull;
		"},{""}])+"
		while {100 == 100} do {
			diag_log ('(GG-AntiHack): AH_PERF PLAYERS: '+(str (count playableUnits))+' UNITS: '+(str (count allUnits))+' OBJECTS: '+(str (count (allMissionObjects '')))+' FPS: '+(str diag_fps)+' TIME: '+(str time)+'');
			"+(if (_AH_TERCHK) then [{"
			if !(isNull "+_Player_LOGIN+"_unit1) then {clearVehicleInit "+_Player_LOGIN+"_unit1;deleteVehicle "+_Player_LOGIN+"_unit1};
			_AH_UNIT = createAgent ['Survivor2_DZ',[30 + (random 100),10000 + (random 500),0],[],0,'FORM'];
			_AH_UNIT setVehicleInit _AH_CHECK1;
			processInitCommands;
			"+_Player_LOGIN+"_unit1 = _AH_UNIT;
			"},{""}])+"
			
			onPlayerDisconnected _onPlayerDisconnect;
			onPlayerConnected _onPlayerConnect;
			if (str RE != str _RE) then {
				['SERVER','WARNING','RE MODIFIED',str(RE)] spawn "+_AdminReport+"_PVEH;
				RE = _RE;
			};
			if (str BIS_MPF_remoteExecutionServer != str _MPF) then {
				['SERVER','WARNING','MPF MODIFIED',str(BIS_MPF_remoteExecutionServer)] spawn "+_AdminReport+"_PVEH;
				BIS_MPF_remoteExecutionServer = _MPF;
			};
			if (({typeOF _x == 'FunctionsManager'} count (entities 'logic')) > 1) then {
				['RESTART SERVER','REM EXEC DETECTED','FM ADDED',str _info] spawn "+_AdminReport+"_PVEH;
			};
			{if ((typeOF _x) != 'FunctionsManager') then {deleteVehicle _x}} forEach (entities 'Logic');
			if (!isNil 'fnc_plyrHit') then {
				{
					_x removeAllMPEventHandlers ""MPHit"";
					_x addMPEventHandler [""MPHit"", {_this spawn fnc_plyrHit}];
				} forEach playableUnits;
			};
			{
				if (count (units _x) > 0) then {{if (isNull _x) then {[_x] joinSilent grpNull}} forEach (units _x)};
				if ((count (units _x) == 0)&&(!isNull _x)) then {deleteGroup _x}
			} forEach allGroups;
			"+(if ((!_AH_CUDHC)&&(!_AH_CUDHC)) then [{"
			{
				_funcGrop = (group _x);
				_grpUnits = (units _funcGrop);
				_fncmGrp = (group _x);
				_grpUnits = if !(isNull _funcGrop) then [{(units _funcGrop)},{[objNull]}];
				if ((isNull _x)||((count _grpUnits) > 1)||(isNull _fncmGrp)||(isNull _funcGrop)||(str _fncmGrp != str(_funcGrop))||(isNull _fncmGrp)) then {
					if (isNull _funcGrop) then {['RESTART SERVER','REM EXEC DETECTED','NULL GRP',str _funcGrop] spawn "+_AdminReport+"_PVEH};
					if (str _fncmGrp != str _funcGrop) then {
						_info = [];
						if !(isNull _fncmGrp) then {
							if (count (units _fncmGrp) > 1) then {
								{
									_skunit = _x;
									_skid 	= owner _skunit;
									_isPlr 	= false;
									{
										if (_x == _skid) then {
											_isPlr = true;
											_found = _x;
										};
									} foreach playableUnits;
									if (_isPlr) then {
										_cake = format ['Hacked unit owner: %1 (%2 - %3) Unit: %4',name _found,getPlayerUID _found,_found,typeOf _skunit];
										_info = _info + [_cake];
									};
								} forEach (units _fncmGrp);
							};
						};
						['RESTART SERVER','REM EXEC DETECTED','GRP CHANGE','NEW: '+str (group _x)+' OLD: '+str _funcGrop+' Extra info: '+str _info] spawn "+_AdminReport+"_PVEH;
					};
					if ((count _grpUnits) > 1) then {
						_info = [];
						{
							_skunit = _x;
							_skid 	= owner _skunit;
							_isPlr 	= false;
							{
								if (str(_x) == str(_skid)) then {
									_isPlr = true;
									_found = _x;
								};
							} foreach playableUnits;
							if (_isPlr) then {
								_cake = format ['Hacked unit owner: %1 (%2 - %3) Unit: %4',name _found,getPlayerUID _found,_found,typeOf _skunit];
								_info = _info + [_cake];
							} else {
								_cake = format ['Unit owner: %1 Unit: %2 (%3)',str _skid,str _skunit,typeOf _skunit];
								_info = _info + [_cake];
							};
						} forEach _grpUnits;
						['RESTART SERVER','REM EXEC DETECTED','GROUP MODIFIED',str _info] spawn "+_AdminReport+"_PVEH;
					};
				};
			} forEach _fmlist;"},{""}])+"
			uiSleep 10;
		};
	};
	diag_log ('(GG-AntiHack): (1/2) Server AH framework loaded!');
");
call compile ("
	diag_log ('(GG-AntiHack): (2/2) Anti-hack PVEHs loading...');
	if ("+str _OD_DPLY+") then {
		""PVOZ_OBJ_DEPLOY"" addPublicVariableEventHandler {
			_array = _this select 1;
			_positn = _array select 0;
			_player = _array select 1;
			_select = _array select 2;
			if (_select in "+(str _OD_AOBJ)+") then {
				_object = createVehicle [_select,_positn,[],0,""CAN_COLLIDE""];
				[_object,_positn] call AH_fnc_setPos;
				
				_object engineOn true;
				_object setvelocity [0,0,1];
				_object setDir ((getDir _player) + 90);
				_object setVariable ['ObjectID','1',true];
				_object setVariable ['ObjectUID','1',true];
				_object setVariable ['Deployed',true,true];
				(playableUnits select 0) action ['LightOn',_object];
				
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				
				if (!isNil ""dayz_serverObjectMonitor"") then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object]};
				if (!isNil ""PVDZE_serverObjectMonitor"") then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object]};
				if (!isNil 'fnc_veh_ResetEH') then {_object call fnc_veh_ResetEH};
				if (!isNil 'PVDZE_veh_Init') then {PVDZE_veh_Init = _object;publicVariable ""PVDZE_veh_Init""};
				if (!isNil 'server_updateObject') then {[_object,""all""] spawn server_updateObject};
			} else {
				_log = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"",name _player,"+_playerID+" _player,""PVOZ_OBJ_DEPLOY"",_select,dayZ_instance];
				""HackLog"" callExtension (_log);
				
				_log_menu = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"",name _player,"+_playerID+" _player,""PVOZ_OBJ_DEPLOY"",_select,dayZ_instance];
				"+_RND+"_HackerLog = "+_RND+"_HackerLog + [['     '+_log_menu,'','0','1','0','0',[]]];
				if !("+str _LG_PVC+") then {publicVariable '"+_RND+"_HackerLog'};
				
				_alert = format [""Caught: %1 Reason: %2 (%3)"",name _player,""PVOZ_OBJ_DEPLOY"",_select];
				{
					if ("+_playerID+" _x in "+(str _AdminArray)+") then {
						"+_AdminTool+"_AHALERTS = [_alert];
						(owner _x) publicVariableClient '"+_AdminTool+"_AHALERTS';
					};
				} forEach playableUnits;
			};
		};
	};
	if ("+str _LG_PVC+") then {
		'"+_RND+"_RequestAHFL' addPublicVariableEventHandler {
			_array 		= _this select 1;
			_playerObj 	= _array select 0;
			_namePLR 	= _array select 1;
			{call compile ('
				if (isNil ""'+_x+'"") then {'+_x+' = []};
				if (count '+_x+' > 50) then {
					'+_x+' resize 50;
					'+_x+';
				}
			')} forEach ['"+_RND+"_HackerLog','"+_RND+"_adminLog','"+_RND+"_KeyLog','PVOZ_Misclog','PVOZ_hitlog','PVOZ_loglog'];
			"+_RND+"_VarReceive = true;
			(owner _playerObj) publicVariableClient '"+_RND+"_HackerLog';
			(owner _playerObj) publicVariableClient '"+_RND+"_adminLog';
			(owner _playerObj) publicVariableClient '"+_RND+"_KeyLog';
			(owner _playerObj) publicVariableClient 'PVOZ_Misclog';
			(owner _playerObj) publicVariableClient 'PVOZ_hitlog';
			(owner _playerObj) publicVariableClient 'PVOZ_loglog';
			(owner _playerObj) publicVariableClient '"+_RND+"_VarReceive';
		};
	};
	'"+_RND+"_RequestAHT' addPublicVariableEventHandler {
		_array 		= _this select 1;
		_playerObj 	= _array select 0;
		_namePLR 	= _array select 1;
		diag_log format ['(GG-AntiHack): Spawning admin tool on %1...',_namePLR];
		if ("+_playerID+" _playerOBJ in "+str _AdminArray+") then {
			(owner _playerObj) publicVariableClient '"+_AdminTool+"_AHT';
			if !(isNil 'AH_CUSTOM') then {(owner _playerObj) publicVariableClient 'AH_CUSTOM'};
			diag_log format ['(GG-AntiHack): Admin tool spawned on %1!',_namePLR];
		};
	};
	"+_AdminReport+"_PVEH = {
		_array = (if (count _this > 2) then [{_this},{_this select 1}]);
		_cnt = count _array;
		if (_cnt == 2) then {
			_player = (_this select 1) select 0;
			_uid = "+_playerID+" _player;
			
			_log = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"",name _player,"+_playerID+" _player,""PID fail"",format [""Time: %1"",str time],dayZ_instance];
			""HackLog"" callExtension (_log);
			
			if ("+str _LG_ENBL+") then {
				_time = call AH_fnc_serverTime;
				_log_menu = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|  @ UPT: %6h(s) %7min(s)"",name _player,"+_playerID+" _player,""VA Bypass"",format [""Time: %1"",str time],dayZ_instance,_time select 0,_time select 1];
				"+_RND+"_HackerLog = "+_RND+"_HackerLog + [['     '+_log_menu,'','0','1','0','0',[1,0.3,0,1]]];
				if !("+str _LG_PVC+") then {publicVariable '"+_RND+"_HackerLog'};
			};
		};
		if (_cnt == 3) then {
			_name 	= (_array select 0);
			_uid 	= (_array select 1);
			_key 	= (_array select 2);
			
			_alert = format [""Logged: %1 Key: %2"",_name,_key];
			{
				if ("+_playerID+" _x in "+(str _AdminArray)+") then {
					"+_AdminTool+"_AHALERTS = [_alert];
					(owner _x) publicVariableClient '"+_AdminTool+"_AHALERTS';
				};
			} forEach playableUnits;
			
			_log = format [""Key Log: %1 (%2) KEY: %3 - |DayZ Instance: %4|"",_name,_uid,_key,dayZ_instance];
			diag_log (_log);
			""KeyLog"" callExtension (_log);
			
			if ("+str _LG_ENBL+") then {
				_time = call AH_fnc_serverTime;
				_log_menu = format [""KEY LOGGED: %1 (%2) KEY: %3  @ UPT: %4h(s) %5min(s)"",_name,_uid,_key,_time select 0,_time select 1];
				"+_RND+"_KeyLog = "+_RND+"_KeyLog + [['     '+_log_menu,'','0','1','0','0',[]]];
				if !("+str _LG_PVC+") then {publicVariable '"+_RND+"_KeyLog'};
			};
		};
		if (_cnt == 4) then {
			_name 	= (_array select 0);
			_uid 	= (_array select 1);
			_reason = (_array select 2);
			_field 	= (_array select 3);
			
			_alert = format [""Caught: %1 Reason: %2 (%3)"",_name,_reason,_field];
			{
				if ("+_playerID+" _x in "+(str _AdminArray)+") then {
					"+_AdminTool+"_AHALERTS = [_alert];
					(owner _x) publicVariableClient '"+_AdminTool+"_AHALERTS';
				};
			} forEach playableUnits;
			
			_log = format [""Hack Log: %1 (%2) REASON: %3 LOG: %4 - |DayZ Instance: %5|"",_name,_uid,_reason,_field,dayZ_instance];
			diag_log (_log);
			""HackLog"" callExtension (_log);
			
			if ("+str _LG_ENBL+") then {
				_time = call AH_fnc_serverTime;
				_log_menu = format [""HACKER: %1 (%2) REASON: %3 (%4) @ UPT: %5h(s) %6min(s)"",_name,_uid,_reason,_field,_time select 0,_time select 1];
				"+_RND+"_HackerLog = "+_RND+"_HackerLog + [['     '+_log_menu,'','0','1','0','0',[1,0.3,0,1]]];
				if !("+str _LG_PVC+") then {publicVariable '"+_RND+"_HackerLog'};
			};
		};
		if (_cnt >= 5) then {
			_name 	= (_array select 0);
			_uid 	= (_array select 1);
			_reason = (_array select 2);
			_field 	= (_array select 3);
			_action = (_array select 4);
			
			if (_action == 'misc') then {
				_log = format [""Misc Log: %1 (%2) REASON: %3 LOG: %4 - |DayZ Instance: %5|"",_name,_uid,_reason,_field,dayZ_instance];
				diag_log _log;
				'MiscLog' callExtension _log;
				PVOZ_MiscLog = PVOZ_MiscLog + [['     '+_log,'','0','1','0','0',[]]];
			};
			if (_action == 'kick') then {
				_alert = format [""Kicked: %1 Reason: %2 (%3)"",_name,_reason,_field];
				{
					if ("+_playerID+" _x in "+(str _AdminArray)+") then {
						"+_AdminTool+"_AHALERTS = [_alert];
						(owner _x) publicVariableClient '"+_AdminTool+"_AHALERTS';
					};
				} forEach playableUnits;
				
				_log = format [""Hack Log: %1 (%2) REASON: %3 LOG: %4 - |DayZ Instance: %5|"",_name,_uid,_reason,_field,dayZ_instance];
				""HackLog"" callExtension (_log);
				diag_log (_log);
				
				if ("+str _LG_ENBL+") then {
					_time = call AH_fnc_serverTime;
					_log_menu = format [""HACKER: %1 (%2) REASON: %3 (%4) @ UPT: %5h(s) %6min(s)"",_name,_uid,_reason,_field,_time select 0,_time select 1];
					"+_RND+"_HackerLog = "+_RND+"_HackerLog + [['     '+_log_menu,'','0','1','0','0',[1,0.3,0,1]]];
					if !("+str _LG_PVC+") then {publicVariable '"+_RND+"_HackerLog'};
				};
			};
		};
	};
	'"+_AdminReport+"' addPublicVariableEventHandler "+_AdminReport+"_PVEH;
	diag_log ('(GG-AntiHack): (2/2) Anti-hack PVEHs loaded!');
");

diag_log ("(GG-AntiHack): Anti-hack compiled!");
_badGFNC = [
	"rcallVarcode","markerColor","markerBrush",
	"createTeam","addTeamMember","removeTeamMember",
	"saveStatus","loadStatus","saveVar","BattleFieldClearance",
	"setWaypointStatements","BIS_MPF_logic","BIS_MPF_dummygroup"
];
markerText = {};
loadFile = {};
{call compile (_x+' = {};publicVariable "'+_x+'";')} forEach _badGFNC;

diag_log format ["(GG-AntiHack): Disabled bad fncs: %1",_badGFNC];
diag_log ("(GG-AntiHack): Successfully loaded.");