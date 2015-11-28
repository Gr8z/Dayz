//===============================
// ANDRE MOST WANTED SCRIPT =====
//===============================
//====================
// CONFIGURATION =====
//====================

//THE TIME THE FUGITIVE NEED TO RESIST ALIVE TO WIN *IN MINUTES*
_aliveTimeToWin = 20;

//THE TIME CYCLE THE FUGITIVE MARK WILL BE UPDATED *IN SECONDS*
_updateMark = 100;

//MAXIMUN TIME THE FUGITIVE IS ALLOWED TO BE IN A PLOT OR SAFEZONE RADIUS TO RECEIVE HIS REWARD IN CASE OF WIN (a percentage of _aliveTimeToWin)
_maxTimeNearPlot = 0.15;

//TIME CYCLE *IN SECONDS* TO CHECK FOR PLOTS NEAR THE FUGITIVE AND SAFEZONES
_onPlotCheckFrequency = 20;

//THE RADIUS OF THE POSITION HINT (FUGITIVE WILL BE SOMEWHERE INSIDE THE CIRCLE) *IN METERS*
_circleSize = 150;

//MINIMUM NUMBER OF PLAYERS TO RUN
_minPlayersToRun = 15;

//TIME TO WAIT BEFORE TRY TO RUN AGAIN *IN MINUTES*
_runTimeInter = 50;

//FIRST RUN DELAY *IN MINUTES*
_firstRunDelay = 30;

//FUGITIVE TIME REWARDS: [time in minutes to exec reward (in sequence),reward message,reward code where _this is the fugitive]
_fugitiveRewards = [
	[4,"The Fugitive received a MK 48 and Ammo.",{_posF = position _this;_posFGround = [_posF select 0,_posF select 1,0];_holder = createVehicle ['Weaponholder',_posFGround,[],0,'NONE'];_holder addWeaponCargoGlobal ['Mk_48_DZ',1];_holder addMagazineCargoGlobal ['100Rnd_762x51_M240',5];_this reveal [_holder,4];}],
	[4,"The fugitive received a motorbike.",{_posF = position _this;_posFGround = [_posF select 0,_posF select 1,0];_veh = createVehicle ['TT650_Ins',_posFGround,[],8,'NONE'];_veh setVariable ['ObjectID','0',true];_veh setVariable ['ObjectUID',str round random 9999999,true];_this reveal [_veh,4];}],
	[4,"The fugitive received medical items.",{_posF = position _this;_posFGround = [_posF select 0,_posF select 1,0];_holder = createVehicle ['Weaponholder',_posFGround,[],0,'NONE'];_holder addMagazineCargoGlobal ['ItemBloodBag',1];_holder addMagazineCargoGlobal ['ItemBandage',2];_holder addMagazineCargoGlobal ['ItemSeaBassCooked',1];_holder addMagazineCargoGlobal ['ItemWaterbottle',1];_holder addMagazineCargoGlobal ['ItemPainkiller',1];_holder addMagazineCargoGlobal ['ItemORP',1];_holder addMagazineCargoGlobal ['ItemMorphine',1];_this reveal [_holder,4];}],
	[4,"The fugitive sees an enemy.",{donn_seeSmoke = [];{if (_this distance _x < 300 && !((vehicle _x) isKindOf 'Air')) then {_posK = position _x;for '_i' from 1 to 4 do {_smoke = createVehicle [['SmokeShell','SmokeShellYellow','SmokeShellRed','SmokeShellGreen','SmokeShellPurple','SmokeShellBlue','SmokeShellOrange'] call BIS_fnc_selectRandom,[_posK select 0,_posK select 1,40+_i*10],[],0,'CAN_COLLIDE'];donn_seeSmoke = donn_seeSmoke + [_smoke];};};} forEach (playableUnits-[_this]);}],
	[1/12,"",{{deleteVehicle _x;} forEach donn_seeSmoke;}]
];

//SAFE ZONES
_safezones = switch (toLower worldName) do {
//NAPF
		case "napf":{
			[
			//position
			[8246.3184,15485.867,0],
			[15506.952,13229.368,0],
			[9167.5254,5443.9243,0],
			[7841.8633,8851.4551,0],
			[11065.948,11801.703,0],
			[2036.6864,7815.2349,0],
			[16840.762,5261.2378,0],
			[8989.9902,7566.8682,0],
			[18168.822,2115.8555,0]
			];
		};
//chernarus
		case "chernarus":{
			[
			//position
			[6325.6772,7807.7412,0],
			[4063.4226,11664.19,0],
			[11447.472,11364.504,0],
			[3445.0112,3804.1453,0],
			[12944.227,12766.889,0],
			[13441.16,5429.3013,0],
			[5066.8984,9729.3574,0],
			[4361.4937,2259.9526,0]
			];
		};
//tavi
		case "tavi":{
			[
			//position
			[11698.81,15210.121,0],
			[15309.663,9278.4912,0],
			[5538.7354,8762.2695,0],
			[7376.6084,4296.5879,0],
			[15587.822,16394.049,0],
			[16555.732,10159.68,0],
			[6815.0776,8534.1504,0],
			[4066.3528,7265.0024,0],
			[17497.631,7159.0879,0],
			[13342.758,8611.9932,0],
			[9859.4209,7471.5684,0]
			];
		};
//default
		default{
			[
			//position
			[0,0,0]
			];
		};
};
_safezonesRad = 160;

//ADMINS STEAM ID (TO PREVENT THE SCRIPT TO SELECT ADMINS AS FUGITIVE)
_LAdmins = [							
	"76561198080045762", // Deadskin	(Mod)
	"76561197970044945", // MrCheeseyman
	"76561198128804731", // xtsis
	"76561198166231771", // Wombat
	"76561198001066546", // MeowMix
	"76561198126348047", // Mr. Bandit
	"76561198067566966", // SniperNoSniping
	"76561197960289679", // TangoWhiskey
	"76561198242337504", // MrCheeseyman
	"76561198137880291", //Xenon
	"76561198062993387", // Azul
	"76561198135739831", // Daveyy
	"76561198058099842", // Fap
"0"
]; 

/*  ADMINISTRATORS         */ 
_NAdmins = [
	"76561198183434467", // MeowMix Admin
	"76561198203698253", // xtsis
	"76561198196195669", // Shroudy
	"76561198163835069", // SniperNoSniping
	"76561198084154973", // Mr.Bandit
	"76561198257149369", // TangoWhiskey
	"76561198042335279", // Dean Winchester
	"76561198237597876", // FAP
	"76561198261729728", // Daveyy
	"76561198260519944", // Azul
"0"
]; 

/* HEAD ADMINS / OWNERS     */ 
_SAdmins = [
	"76561198078201908", // Gr8 
	"76561198153784743", // Ghost
	"76561198137100220", // Deadskin
	"76561198115492831", //BigEgg
	"76561198195305425", //Shahzad
"0"
];

_admins = _SAdmins+_NAdmins+_LAdmins;

//=====================
// FUNCTIONS ==========
//=====================

_lockedFugitives = [];

//THE TWO LINES BELLOW ARE EPOCH SPECIFIC
waitUntil {!isNil "DZE_safeVehicle"};
DZE_safeVehicle = DZE_safeVehicle + ["TT650_Ins"];

donn_fugitiveChoose = {
	_fugitive = objNull;
	_maxSumDist = -1;
	{
		_p = _x;
			if (damage _p < 0.2 && vehicle _p == _p) then {
				if (count (_p nearObjects ["Plastic_Pole_EP1_DZ",(DZE_PlotPole select 0)*1.25]) == 0) then {
					_pUID = getPlayerUID _p;
					if !(_pUID in _admins || _pUID in _lockedFugitives) then {
						_sumDist = 0;
						{_sumDist = _sumDist + (_p distance _x);} forEach playableUnits;
						if (_sumDist > _maxSumDist) then {_fugitive = _p;_maxSumDist = _sumDist;};
					};
				};
			};
	} forEach playableUnits;
	_fugitive
};

//=====================
// THE SCRIPT =========
//=====================

_aliveTimeToWin = round (_aliveTimeToWin*60);
_runTimeInter = round (_runTimeInter*60);
_firstRunDelay = round (_firstRunDelay*60);
_lastTimeConclude = time-_runTimeInter+_firstRunDelay;
while {true} do {
	waitUntil {uiSleep 15;count playableUnits >= _minPlayersToRun && (time-_lastTimeConclude) >= _runTimeInter};
	_fugitive = call donn_fugitiveChoose;
	if (!isNull _fugitive) then {
		diag_log "[MOSTWA] Begin!";
		_fugitiveName = name _fugitive;
		_fugitiveID = getPlayerUID _fugitive;
		_aliveTimeStart = time;
		_aliveTimePassed = 0;
		_timeCell = 2;
		_sleepAMark = round(_updateMark/_timeCell);
		_slepBIndex = 0;
		_sleepBMark = -1;
		if !(_slepBIndex == count _fugitiveRewards) then {
			_sleepBMark = round(((_fugitiveRewards select _slepBIndex select 0)*60)/_timeCell);
		};
		_sleepCMark = round(_onPlotCheckFrequency/_timeCell);
		_sleepDMark = round (10/_timeCell);
		//_sleepA = _sleepAMark;
		_sleepA = 0;
		_sleepB = 0; 
		_sleepC = 0;
		_sleepD = 0;
		_txt = ((name _fugitive)+" has a price on his head. Kill him to receive a reward.\n"+(name _fugitive)+", stay alive " +(str(round(_aliveTimeToWin/60)))+" minutes to receive the prize.\n\n");
		_timeInPlot = 0;
		while {alive _fugitive && !isNull _fugitive && _aliveTimePassed < _aliveTimeToWin && _timeInPlot <= _aliveTimeToWin*_maxTimeNearPlot} do {
			if (_sleepA >= _sleepAMark) then {
				_txt = _txt + ((name _fugitive)+" mark updated on map.\n"+(str (round(((_aliveTimeToWin-_aliveTimePassed)/60)*10)/10))+" minutes to stop the hunt.\n\n");
				_sleepA = 0;
				_fPos = position _fugitive;
				_error = (_circleSize*2)/sqrt(2);
				_fPosBlur = [(_fPos select 0)-_error/2+(random _error),(_fPos select 1)-_error/2+(random _error),0];
				if (_aliveTimePassed > 0) then {deleteMarker "DONN_FUGITIVE";deleteMarker "DONN_FUGITIVE_DOT";};
				createMarker ["DONN_FUGITIVE",_fPosBlur];
				"DONN_FUGITIVE" setMarkerColor "ColorYellow";
				"DONN_FUGITIVE" setMarkerShape "ELLIPSE";
				"DONN_FUGITIVE" setMarkerBrush "SolidBorder";
				"DONN_FUGITIVE" setMarkerSize [_circleSize,_circleSize];
				createMarker ["DONN_FUGITIVE_DOT",_fPosBlur];
				"DONN_FUGITIVE_DOT" setMarkerColor "ColorBlack";
				"DONN_FUGITIVE_DOT" setMarkerType "Vehicle";
				"DONN_FUGITIVE_DOT" setMarkerText "Fugitive!";
			};
			if (_sleepB == _sleepBMark) then {
				_nearPlotPole = _fugitive nearObjects ["Plastic_Pole_EP1_DZ",DZE_PlotPole select 0];
				_inSafe = false;
				{if (_fugitive distance _x < _safezonesRad) exitWith {_inSafe = true;};} forEach _safezones;
				_isFlying = ((getPosATL _fugitive) select 2) > 45;
				if (count _nearPlotPole == 0 && !_inSafe && !_isFlying) then {
					_txt = _txt + "Time Reward! " + (_fugitiveRewards select _slepBIndex select 1);
					_code = _fugitiveRewards select _slepBIndex select 2;
					_fugitive call _code;
				} else {
					_txt = _txt + "Time Reward!? In safe, on plot or flying. No reward...";
				};
				_sleepB = 0;
				_slepBIndex = _slepBIndex + 1;
				_sleepBMark = -1;
				if !(_slepBIndex == count _fugitiveRewards) then {
					_sleepBMark = round(((_fugitiveRewards select _slepBIndex select 0)*60)/_timeCell);
				};
			};
			if (_sleepC == _sleepCMark) then {
				_nearPlotPole = _fugitive nearObjects ["Plastic_Pole_EP1_DZ",DZE_PlotPole select 0];
				_inSafe = false;
				_isHigh = ((getPosATL _fugitive) select 2) > 1250;
				{if (_fugitive distance _x < _safezonesRad) exitWith {_inSafe = true;};} forEach _safezones;
				if (count _nearPlotPole > 0 || _inSafe || _isHigh) then {_timeInPlot = _timeInPlot+_sleepCMark*_timeCell};
				_sleepC = 0;
			};
			if (_sleepD == _sleepDMark) then {
				if (vehicle _fugitive == _fugitive) then {
					_sleepAMark = round(_updateMark/_timeCell);
				} else {
					if (vehicle _fugitive isKindOf "Air") then {
						_sleepAMark = round ((_updateMark/_timeCell)*0.25);
					} else {
						_sleepAMark = round ((_updateMark/_timeCell)*0.5);
					};
				};
				_sleepD = 0;
			};
			if (_txt != "" && _txt != "Time Reward! ") then {[nil,nil,rTitleText,_txt,"PLAIN",7.5] call RE;};
			uiSleep _timeCell;
			_txt = "";
			_sleepA = _sleepA + 1;
			_sleepB = _sleepB + 1;
			_sleepC = _sleepC + 1;
			_sleepD = _sleepD + 1;
			_aliveTimePassed = (time - _aliveTimeStart);
		};
		deleteMarker "DONN_FUGITIVE";
		deleteMarker "DONN_FUGITIVE_DOT";
		if (!isNull _fugitive) then {
			_lockedFugitives = _lockedFugitives + [_fugitiveID];
			if (alive _fugitive) then {
				if (_timeInPlot <= _aliveTimeToWin*_maxTimeNearPlot) then {
					[nil,nil,rTitleText,((name _fugitive)+", time over! The prize is yours!\nColect your reward near you."),"PLAIN",7.5] call RE;
					_veh = createVehicle ["CSJ_GyroC",[position _fugitive select 0,position _fugitive select 1,0],[],10,'NONE'];
					_veh setVariable ["ObjectID","0",true];
					_veh setVariable ["ObjectUID",str round random 9999999,true];
					_fugitive reveal [_veh,4];
					_holder = createVehicle ["Weaponholder",[position _fugitive select 0,position _fugitive select 1,0],[],0,"NONE"];
					_holder addMagazineCargoGlobal ["ItemBriefCase100oz",4];
					_fugitive reveal [_holder,4];
					diag_log "[MOSTWA] Ending! Fugitive Win!";
					_lastTimeConclude = time;
				} else {
					[nil,nil,rTitleText,("Hunt time over! "+(name _fugitive)+", you were near plot poles or safezones\n or high in the sky. No pain no gain. No reward."),"PLAIN",10] call RE;
					diag_log "[MOSTWA] Ending! Fugitive not Fair...";
					_lastTimeConclude = time-_runTimeInter*0.75;
				};
			} else {
				[nil,nil,rTitleText,((name _fugitive)+", perished! Collect the prize on his body!\nMark is on map for 45 seconds..."),"PLAIN",10] call RE;
				createMarker ["DONN_FUGITIVE",position _fugitive];
				"DONN_FUGITIVE" setMarkerColor "ColorRed";
				"DONN_FUGITIVE" setMarkerShape "ELLIPSE";
				"DONN_FUGITIVE" setMarkerBrush "SolidBorder";
				"DONN_FUGITIVE" setMarkerSize [100,100];
				createMarker ["DONN_FUGITIVE_DOT",position _fugitive];
				"DONN_FUGITIVE_DOT" setMarkerColor "ColorBlack";
				"DONN_FUGITIVE_DOT" setMarkerType "Vehicle";
				"DONN_FUGITIVE_DOT" setMarkerText "Fugitive Body...";
				_holder = createVehicle ["Weaponholder",[position _fugitive select 0,position _fugitive select 1,0],[],0,"NONE"];
				_holder addMagazineCargoGlobal ["ItemBriefCase100oz",4];
				_fugitive reveal [_holder,4];
				uiSleep 120;
				deleteMarker "DONN_FUGITIVE";
				deleteMarker "DONN_FUGITIVE_DOT";
				diag_log "[MOSTWA] Ending! Fugitive perished.";
				_lastTimeConclude = time;
			};
		} else {
			[nil,nil,rTitleText,("The hunt for "+_fugitiveName+" head is over... "+_fugitiveName+" disconnected."),"PLAIN",5] call RE;
			diag_log "[MOSTWA] Fugitive disconnected...";
			_lastTimeConclude = time-_runTimeInter*0.75;
		};
	} else {
		diag_log "[MOSTWA] Cant find an elegible fugitive...";
		_lastTimeConclude = time-_runTimeInter*0.75;
	};
};