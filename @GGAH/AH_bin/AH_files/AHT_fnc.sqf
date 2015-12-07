_fn_gv 	= {
	_a = ["a","b","c","d","e","f","g","h","u","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0"];
	for "_i" from 1 to 6 do {_this = _this + (_a select (random ((count _a)-1)))};
	_this
};

_AdminReport 	= "PVOZ_" call _fn_gv;
_AdminVAR 		= "PVOZ_" call _fn_gv;
_RND 			= "PVOZ_" call _fn_gv;
_cuc 			= "PVOZ_" call _fn_gv;

_AdminTOOL 		= "ADMIN_" call _fn_gv;
_AH_INIT 		= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_chkplr 		= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_GVARR 			= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_PlayerKey 		= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_PlayerKeyCHK 	= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_Playerkeylog 	= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_Player_LOGIN 	= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_randv 			= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;
_RNNND 			= "STOP" + "looking" + "AT" + "my" + "HANDLES" call _fn_gv;

_SERVER_KEY = (profileNamespace getVariable ['AH_SERVER_KEY','123']);
if (_SERVER_KEY == '123') then {
	profileNamespace setVariable ['AH_SERVER_KEY',"SERVER_KEY_" call _fn_gv];
	saveProfileNamespace;
	_SERVER_KEY = (profileNamespace getVariable ['AH_SERVER_KEY','123']);
};

_AH_KICK = compile ("
	'"+("" call _fn_gv)+"';_AH_BANNED = (profileNamespace getVariable ['AH_BANNED_"+_SERVER_KEY+"',false]);'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';if !(_AH_BANNED) then {'"+("" call _fn_gv)+"';'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';profileNamespace setVariable ['AH_BANNED_"+_SERVER_KEY+"',true];'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';saveProfileNamespace;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';};'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';if (isServer || isDedicated) exitWith {'"+("" call _fn_gv)+"';};'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';if (isNil '_this') then {'"+("" call _fn_gv)+"';_this = ['',''];'"+("" call _fn_gv)+"';};'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';"+_AdminReport+" = [name player,"+_playerID+" player,_this select 0,_this select 1,'kick'];'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';publicVariableServer '"+_AdminReport+"';'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';uisleep 1;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';ctrlactivate ((finddisplay 0) displayCtrl 102);'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';(finddisplay 3) closedisplay 2;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';ctrlactivate ((finddisplay 0) displayCtrl 106);'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';for '_i' from 0 to 99 do {'"+("" call _fn_gv)+"';(findDisplay _i) closeDisplay 0;'"+("" call _fn_gv)+"';};'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';player setvehicleinit ('"+("" call _fn_gv)+"'+';call compile (''true;'');'+'"+("" call _fn_gv)+"');'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';processinitcommands;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';clearvehicleinit player;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';_obj = 'Rabbit' createVehicle [0,0,0];'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';_obj addMPEventHandler ['MPKilled','"+("" call _fn_gv)+"'+';call compile (''true;'');'+'"+("" call _fn_gv)+"'];'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';player addMPEventHandler ['MPKilled','"+("" call _fn_gv)+"'+';call compile (''true;'');'+'"+("" call _fn_gv)+"'];'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';_obj setDamage 5;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';deleteVehicle _obj;'"+("" call _fn_gv)+"';
	'"+("" call _fn_gv)+"';player setdamage 1;'"+("" call _fn_gv)+"';
");

_hasWAI = (preProcessFileLineNumbers "\z\addons\dayz_server\WAI\init.sqf" != "");
_hasDB 	= (preProcessFileLineNumbers "DamiMods\Epoch\dami_init.sqf" != "");

PVOZ_coloredbros = [];
AH_fnc_dynamictext = compile preprocessFileLineNumbers "ca\modules_e\functions\GUI\fn_dynamicText.sqf";
AH_fnc_getPos = {
	private ["_return"];
	_return = if (surfaceIsWater (position _this)) then [{ASLtoATL (getPosASL _this)},{getPosATL _this}];
	_return
};
AH_fnc_setPos = {
	private ["_obj","_pos"];
	_obj = _this select 0;
	_pos = _this select 1;
	_obj setPosATL _pos;
};
AH_fnc_serverTime = {
	private ["_st","_hr","_mn","_return"];
	_st	= if (serverTime > 43200) then [{0},{serverTime}];
	_hr	= floor(_st/60/60);
	_mn	= (floor(_st/60) - (_hr*60)) min 60;
	
	_return = [_hr,_mn];
	_return;
};
AHT_badItems = ([
	"BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4",
	"TimeBomb","Mine","MineE","AK_BASE","AKS_BASE","AK_107_BASE","GrenadeLauncher",
	"L85A2_base_BAF","BAF_L17_40mm","Launcher","LauncherCore","GrenadeCore","CannonCore",
	"MGunCore","RifleCore","PistolCore","Default","AngelCookies","ItemCore",
	"MGun","Pistol","ItemBriefcase_base","bulk","Kostey_notebook","Kostey_map_case",
	"Kostey_photos","EvDogTags","EvKobalt","EvMap","EvMoney","EvMoscow","EOvPhoto",
	"Cobalt_File","ItemMap_Debug","Moscow_Bombing_File","PMC_documents","SkinBase"
] + _BAD_WEPS);
if (_AH_DZE) then {AHT_badItems = (AHT_badItems+["MeleeBaseBallBat","bat_swing"])};
AH_fnc_displayCreate = {
	disableSerialization;
	TXT_var = '';
	createDialog 'AH_RSC_TXT';
	((findDisplay 71069) displayCtrl 1000) ctrlSetText (_this select 0);
	((findDisplay 71069) displayCtrl 1002) ctrlSetText (_this select 1);
	((findDisplay 71069) displayCtrl 1) ctrlSetText (_this select 2);
	waitUntil {(isNull (findDisplay 71069))};
	if (TXT_var == '') exitWith {};
	if (toLower(_this select 3) in ['msg_all','msg_player','search_menu','addfriend','delfriend','view_distance_change']) then {
		switch toLower(_this select 3) do {
			case 'msg_all': {TXT_var spawn msg_all};
			case 'msg_player': {TXT_var spawn msg_player};
			case 'search_menu': {[TXT_var,_this select 4,_this select 5] spawn search_menu};
			case 'view_distance_change': {TXT_var spawn view_distance_change};
		};
	} else {call compile ((_this select 3)+' = TXT_var;')};
};
AH_fnc_dynTextMsg = {
	_this spawn {
	_message 	= _this;
	if (isNil "DT_curLine") then {DT_curLine = 0} else {DT_curLine = DT_curLine + 1};
	{if (isNil _x) then {call compile (_x+" = false;")}} foreach ["DT_usedLine1","DT_usedLine2","DT_usedLine3","DT_usedLine4","DT_usedLine5","DT_usedLine6","DT_usedLine7","DT_usedLine0"];
	{call compile ("if (DT_usedLine"+_x+") exitWith {DT_curLine = (-1 + "+_x+")}")} foreach ["7","6","5","4","3","2","1"];
	line_hold = {call compile (""+_this+" = false;[] spawn {uiSleep 10;"+_this+" = true}")};
	line_add = {
		if (DT_curLine > 6) exitWith {
			DT_safeOffset = 0.35;
			DT_dispIDC = 133706;
			'DT_usedLine0' call line_hold;
		};
		{
			call compile ("
			if (DT_curLine == "+(_x select 0)+") exitWith {
				DT_safeOffset 	= "+(_x select 2)+";
				DT_dispIDC 		= "+(_x select 1)+";
				'DT_usedLine"+str(1 + (parseNumber (_x select 0)))+"' call line_hold;
			};");
		} foreach [["0","133701","0.1"],["1","133702","0.15"],["2","133703","0.2"],["3","133704","0.25"],["4","133705","0.3"],["5","133706","0.35"],["6","133707","0.4"]];
	};
	call line_add;
	["",safeZoneX,(safeZoneY + DT_safeOffset),10,1,0,DT_dispIDC] spawn AH_fnc_dynamictext;
	[_message,DT_safeOffset,DT_dispIDC] spawn {
		_message = _this select 0;
		_safeoff = _this select 1;
		_dispidc = _this select 2;
		_timedel = _this select 3;
		
		sleep 0.1;
		_timedel = ((((count(toArray _message)) / 50) max 1) * 7);
		[format ["<t size =""0.5""align=""left""font=""Zeppelin33"">%1</t>",_message],safeZoneX,(safeZoneY + DT_safeOffset),_timedel,1,0,DT_dispIDC] spawn AH_fnc_dynamictext;
		uiSleep (_timedel - 1);
		[format ["<t size =""0.5""align=""left""font=""Zeppelin33"">%1</t>",_message],safeZoneX,(safeZoneY + _safeoff),5,0,-2,_dispidc] spawn AH_fnc_dynamictext;
	};
	};
};

publicVariable "AHT_badItems";
publicVariable "AH_fnc_getPos";
publicVariable "AH_fnc_setPos";
publicVariable "AH_fnc_serverTime";
publicVariable "AH_fnc_dynTextMsg";
publicVariable "AH_fnc_dynamictext";
publicVariable "AH_fnc_displayCreate";

diag_log ("(GG-AntiHack): Compiling admin tool...");
call compile ("
	diag_log ('(GG-AntiHack): (1/2) Admin tool loading...');
	"+_rnd+"_HackerLog 	= [['______________________[[ Bottom of Logs ]]______________________','','0','1','0','0',[0,0.5,1,1]]];
	"+_rnd+"_KeyLog 	= [['______________________[[ Bottom of Logs ]]______________________','','0','1','0','0',[0,0.5,1,1]]];
	"+_rnd+"_adminLog 	= [['______________________[[ Bottom of Logs ]]______________________','','0','1','0','0',[0,0.5,1,1]]];
	PVOZ_loglog 		= [['______________________[[ Bottom of Logs ]]______________________','','0','1','0','0',[0,0.5,1,1]]];
	PVOZ_hitlog 		= [['______________________[[ Bottom of Logs ]]______________________','','0','1','0','0',[0,0.5,1,1]]];
	PVOZ_Misclog 		= [['______________________[[ Bottom of Logs ]]______________________','','0','1','0','0',[0,0.5,1,1]]];
	
	'"+_RND+"_colorme' addPublicVariableEventHandler {
		_arr 	= _this select 1;
		_player = _arr select 0;
		_color 	= _arr select 1;
		_action = _arr select 2;
		if ((!isPlayer _player)||(isNull _player)||(name _player == 'Error: No unit')) exitWith {};
		_pname 	= name _player;
		
		if (_action == 'join') then {
			if (_color == 'RANDOM') then {
				_color = switch (['c_red','c_pink','c_lightpink','c_black','c_yellow','c_orange','c_blue','c_cyan','c_green','c_darkgreen','c_lpurple','c_purple','c_darkpurple'] call BIS_fnc_selectRandom) do {
					default {'#(argb,112.91,1.33,0.1291)color(311,0,1,0.2)'};
					case 'c_red': {'#(argb,1,1,1)color(1,0,0,5)'};
					case 'c_green': {'#(argb,1,1,1)color(0,1,0,5)'};
					case 'c_darkgreen': {'#(argb,1,1,1)color(0.01,0.15,0.01,1)'};
					case 'c_blue': {'#(argb,1,1,1)color(0,0,1,5)'};
					case 'c_yellow': {'#(argb,1,1,1)color(1,1,0,1)'};
					case 'c_orange': {'#(argb,1,1,1)color(1,0.4,0.15,1)'};
					case 'c_lightpink': {'#(argb,1,1,1)color(1.514125,0.51231,0.45232,612.111)'};
					case 'c_pink': {'#(argb,1,1,1)color(1,0.5,1,1)'};
					case 'c_lpurple': {'#(argb,1,1,1)color(1.514125,0.51231,5.45232,612.111)'};
					case 'c_purple': {'#(argb,1,1,1)color(1,0,1,1)'};
					case 'c_darkpurple': {'#(argb,1,1,1)color(1,0,1,0.2)'};
					case 'c_cyan': {'#(argb,1,1,1)color(0,1,1,1)'};
					case 'c_black': {'#(argb,1,1,1)color(0,0,0,1)'};
					case 'c_invisible': {'#(argb,112.91,1.33,0.1291)color(311,0,1,0.2)'};
				};
			};
			if (count PVOZ_coloredbros > 0) then {
				private '_inarray';
				_inarray = false;
				{
					_arr = call compile (_x);
					_bro = (_arr select 0);
					_clr = (_arr select 1);
					if (_pname == _bro) then {
						_inarray = true;
						PVOZ_coloredbros = (PVOZ_coloredbros - [format ['[''%1'',''%2'']',_bro,_clr]]);
					};
				} forEach PVOZ_coloredbros;
				if (_inarray) then {publicVariable 'PVOZ_coloredbros'};
			};
			PVOZ_coloredbros = (PVOZ_coloredbros + [format ['[''%1'',''%2'']',_pname,_color]]);
			publicVariable 'PVOZ_coloredbros';
		} else {
			if (count PVOZ_coloredbros > 0) then {
				private '_inarray';
				_inarray = false;
				{
					_arr = call compile (_x);
					_bro = (_arr select 0);
					_clr = (_arr select 1);
					if (_pname == _bro) then {
						_inarray = true;
						PVOZ_coloredbros = (PVOZ_coloredbros - [format ['[''%1'',''%2'']',_bro,_clr]]);
					};
				} forEach PVOZ_coloredbros;
				if (_inarray) then {publicVariable 'PVOZ_coloredbros'};
			};
		};
	};
	"+_AdminTOOL+"_AHT = {
		if ((isNil ""inSub"")||(isNil ""Level3_menu"")||(isNil ""Level2_menu"")||(isNil ""Level1_menu"")) then {
			adminadd = [];
			admin_AHactiveTarget = objNull;
			if (isNil ""admin_font_style"") then {admin_font_style = 'Zeppelin33'};
			if (isNil ""admin_toggled"") then {admin_toggled = []};
			if (isNil ""admin_LGRCV"") then {admin_LGRCV = false};
			if (isNil 'DZE_PlotPole') then {DZE_PlotPole=[30,45]};
			if (isNil ""AM_EPOCH"") then {AM_EPOCH = false};
			if (isNil ""SMCLR"") then {SMCLR 	= [0.85,0.85,1,1]};
			if (isNil ""MMCLR"") then {MMCLR 	= [1,0.4,0,1]};
			if (isNil ""SSMCLR"") then {SSMCLR 	= [1,1,0.5,1]};
			if (isNil ""APCLR"") then {APCLR 	= [0.75,0,0,1]};
			_tpLogSize 	= profileNameSpace getVariable ['AHT_TPlogArrize',5];
			_fontSize 	= profileNameSpace getVariable ['AHT_fontSize',0];
			_mani 		= profileNameSpace getVariable ['AHT_subMan',false];
			_eventmenu 	= profileNameSpace getvariable ['AHT_subEvent',false];
			_color 		= profileNameSpace getVariable ['AHT_subClr',false];
			_ggear 		= profileNameSpace getVariable ['AHT_subGgear',false];
			_anim8 		= profileNameSpace getVariable ['AHT_subAnim',false];
			_dispids 	= profileNameSpace getVariable ['AHT_displayUIDS',false];
			_classWPN 	= profileNameSpace getVariable ['AHT_classesWPN',false];
			_classVEH 	= profileNameSpace getVariable ['AHT_classesVEH',false];
			_tpLOG 		= profileNameSpace getVariable ['AHT_TPlogArr',[]];
			if ((_fontSize <= 0.05)&&(_fontSize >= -0.05)) then [{admin_font_size = _fontSize},{admin_font_size = 0}];
			SUBMENU_adminEvents = _eventmenu;
			SUBMENU_Manipulate 	= _mani;
			SUBMENU_colorMenu 	= _color;
			SUBMENU_giveGear 	= _ggear;
			SUBMENU_Animate 	= _anim8;
			admin_maxTPlogs 	= _tpLogSize;
			admin_DispPUIDs 	= _dispids;
			admin_DispClassWPN 	= _classWPN;
			admin_DispClassVEH 	= _classVEH;
			admin_TPlog 		= _tpLOG;
			admin_TPlog 		= admin_TPlog - [objNull];
			inSub 				= false;
			Level3_menu = {
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""                         HOTKEYS                         "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      Double click players to quick spectate."","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      F2 to heal close players     F3 to open weapon menu"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      F4 to delete target        F5 to EXIT spectating"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      1 to flip vehicle         2 to repair vehicle"","""",""0"",""1"",""0"",""0"",[]]];
				if (AM_EPOCH) then {
					adminadd set [count adminadd,[""      3 to get password of cursorTarget "","""",""0"",""1"",""0"",""0"",[]]];
					adminadd set [count adminadd,[""      4 to spawn key of cursorTarget(vehicle) "","""",""0"",""1"",""0"",""0"",[]]];
					adminadd set [count adminadd,[""      5 to steal cursorTarget(vehicle) "","""",""0"",""1"",""0"",""0"",[]]];
					adminadd set [count adminadd,[""      6 to open OTF script writer "","""",""0"",""1"",""0"",""0"",[]]];
					adminadd set [count adminadd,[""      7 to quick-glue"","""",""0"",""1"",""0"",""0"",[]]];
				} else {
					adminadd set [count adminadd,[""      3 to steal cursorTarget(vehicle) "","""",""0"",""1"",""0"",""0"",[]]];
					adminadd set [count adminadd,[""      4 to open OTF script writer "","""",""0"",""1"",""0"",""0"",[]]];
					adminadd set [count adminadd,[""      5 to quick-glue"","""",""0"",""1"",""0"",""0"",[]]];
				};
				adminadd set [count adminadd,[""      [ teleport 1M in player direction               "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      \ teleport 5M in player direction               "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      ; teleport to cursor target                     "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""                         HOTKEYS                         "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Server Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Fix server lag"",admin_fixServerLag,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete all broken vehicles"",admin_deletevehicles,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete/kill all zombies"",admin_deletezombies,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Spawn Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn Vehicle (temp)"",""Vehicles"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn Vehicle (hive)"",""VehiclesHIVE"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn Buildings & Objects"",""Objects"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn Weapons, Items, & Magazines"",""Weaponz"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn player Morph"",""Skinz"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn admin crate (has everything)"",admincrate,""0"",""0"",""0"",""0"",[0,0.8,0.76,1]]];if (AM_EPOCH) then {
				if (AM_EPOCH) then {
				adminadd set [count adminadd,[""  Spawn donator crate"",donorcrate_init,""0"",""0"",""0"",""0"",[1,1,0,1]]];
				adminadd set [count adminadd,[""  Spawn donator safe 1"",donorsafe1,""0"",""0"",""0"",""0"",[1,1,0,1]]];
				adminadd set [count adminadd,[""  Spawn donator safe 2"",donorsafe2,""0"",""0"",""0"",""0"",[1,1,0,1]]];
				adminadd set [count adminadd,[""  Spawn donator safe 3"",donorsafe3,""0"",""0"",""0"",""0"",[1,1,0,1]]];
				adminadd set [count adminadd,[""  Spawn building crate"",admincrate_epoch_4,""0"",""0"",""0"",""0"",[0,0.8,0.76,1]]];
				adminadd set [count adminadd,[""  Spawn skin crate"",admincrate_epoch_2,""0"",""0"",""0"",""0"",[0,0.8,0.76,1]]];
				adminadd set [count adminadd,[""  Spawn food crate"",admincrate_epoch_3,""0"",""0"",""0"",""0"",[0,0.8,0.76,1]]]};
				};
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Toggleable Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      ALT + Left Click Teleport"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				if ((AM_EPOCH)&&("+str _hasDB+")) then {
				adminadd set [count adminadd,[""  Toggle Instant Build (Epoch)"",admin_instantbuild,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle No restrictions (Epoch)"",admin_norestrict,""1"",""0"",""0"",""0"",[]]];
				};
				adminadd set [count adminadd,[""  Toggle God"",admin_godmodeToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Teleport"",admin_teleportToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle ESP"",admin_espToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle 3D ESP"",admin_3Dtoggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle 3D AI ESP"",admin_3DAItoggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle player Markers"",admin_playerMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle AI Markers"",admin_aiMarkers,""1"",""0"",""0"",""0"",[]]];
				if (AM_EPOCH) then {
				adminadd set [count adminadd,[""  Toggle Plot pole Markers"",admin_ppMarkers,""1"",""0"",""0"",""0"",[]]];
				};
				adminadd set [count adminadd,[""  Toggle dead Markers"",admin_deadMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle vehicle Markers"",admin_vehicleMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Wreck Markers"",admin_wreckMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Tent Markers"",admin_tentMarkers,""1"",""0"",""0"",""0"",[]]];if (AM_EPOCH) then {
				adminadd set [count adminadd,[""  Toggle Vault Markers"",admin_vaultMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Stash Markers"",admin_stashMarkers,""1"",""0"",""0"",""0"",[]]];};
				adminadd set [count adminadd,[""  Toggle Map ICONS"",admin_alpIcons,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Stealth"",admin_invisibleToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Rapid fire"",admin_rapidFire,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Infinite ammo"",admin_infAmmo,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle no-recoil"",admin_noRecoil,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle zombie aggro"",admin_disableAggro,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle zombie shield"",admin_zedShield,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle speed boost"",admin_vehiclespeedhack,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle car godmode"",admin_vehicleGodmode,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Targeted Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Move to Target"",admin_teleportToTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Move Target to Me"",admin_targetTPhere,""0"",""0"",""0"",""1"",[]]];
				call admin_fillTPlogs;
				adminadd set [count adminadd,[""  Spectate Target"",admin_spectateTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  View gear Target"",admin_viewgearTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Give ammo to Target"",admin_giveAmmo,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Mute/Unmute target"",admin_muteTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Heal Target"",admin_healTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Kill Target"",admin_killTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Slap Target"",admin_slapTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Break Target's legs"",admin_breaklegsTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  RemoveGear Target"",admin_removegearTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Eject target from vehicle"",manipulate_eject,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Move target in passenger"",manipulate_moveinveh,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Join target's vehicle"",manipulate_joinvehicle,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Add to/Sub from target's humanity"",admin_subaddHumanity,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""----Sub Menus----"","""",""0"",""1"",""0"",""0"",[]]];if (SUBMENU_giveGear) then admin_subGiveGear else {
				adminadd set [count adminadd,[""[]---- Give Gear ----[]"",admin_subTglGive,""0"",""0"",""0"",""0"",MMCLR]];};if (SUBMENU_Animate) then admin_subAnimate else {
				adminadd set [count adminadd,[""[]----- Animate -----[]"",admin_subTglAnim,""0"",""0"",""0"",""0"",MMCLR]];};if (SUBMENU_Manipulate) then admin_subManipulate else {
				adminadd set [count adminadd,[""[]---- Manipulate ----[]"",admin_subTglManip,""0"",""0"",""0"",""0"",MMCLR]];};
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Menu Options "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle player IDs"",admin_tglDisplayPUIDs,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle classnames (items)"",admin_tglDisplayClassWPN,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle classnames (vehicles)"",admin_tglDisplayClassVEH,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Increase font size"",admin_incrsFontSize,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Decrease font size"",admin_decrsFontSize,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Event Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				if ("+str _CC_CHTCMD+") then {if (SUBMENU_adminEvents) then admin_subAdminEvents else {
				adminadd set [count adminadd,[""[] --- !event --- []"",admin_subTglEvents,""0"",""0"",""0"",""0"",MMCLR]];
				}};
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				if ("+str _hasWAI+") then {
				adminadd set [count adminadd,[""[] --- WAI --- []"","""",""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Spawn 5 AI (Map click)"",admin_WAI_AIG,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn AI vehicle (Map click)"",admin_WAI_AIV,""0"",""0"",""0"",""0"",[]]];
				};
				adminadd set [count adminadd,[""[] --- Man hunt --- []"","""",""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Man hunt target"",admin_manHuntPlayer,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Man hunt lowest humanity"",admin_manHuntKiller,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Update man hunt marker"",admin_manhuntupdate,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  End man hunt"",admin_endManHunt,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Miscellaneous "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];if (AM_EPOCH) then {
				adminadd set [count adminadd,[""  Find vehicle"",admin_findVehicle,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Kill all AI within 500m"",admin_killAI,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete closest plot pole (""+str (DZE_PlotPole select 0)+""m)"",admin_deletePlotePole,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete closest camo net (""+str (DZE_PlotPole select 0)+""m)"",admin_deleteCamoNet,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete closest ... (""+str (DZE_PlotPole select 0)+""m)"",admin_deleteClosecake,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete base/area"",admin_baseDelete,""0"",""0"",""0"",""0"",[]]]};
				adminadd set [count adminadd,[""  Repair close buildings."",admin_repairBuildings,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Repair close entities."",admin_repairentities,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Open environment scroll menu"",admin_environmentmenu,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Open ADV menu"",admin_advancedMenu,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Open OTF script writer"",admin_OTFwriter,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Force Disconnect (Self)"",{endmission ""LOSER""},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Force Disconnect (Target)"",admin_disconnectTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Crash client (Target)"",admin_crashTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""----Sub Menus----"","""",""0"",""1"",""0"",""0"",[]]];if (SUBMENU_colorMenu) then admin_subColorMenu else {
				adminadd set [count adminadd,[""[]---- Color Menu ----[]"",admin_subTglColrs,""0"",""0"",""0"",""0"",MMCLR]]};
				if !(isNil 'Level3_custommenu') then {call Level3_custommenu};
			};
			Level2_menu = {
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""                         HOTKEYS                         "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      Double click players to quick spectate."","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      F4 to delete target        F5 to EXIT spectating"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      1 to flip vehicle         2 to repair vehicle"","""",""0"",""1"",""0"",""0"",[]]];if (AM_EPOCH) then {
				adminadd set [count adminadd,[""      3 to get password of cursorTarget "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      4 to spawn key of cursorTarget(vehicle) "","""",""0"",""1"",""0"",""0"",[]]]};
				adminadd set [count adminadd,[""                         HOTKEYS                         "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Server Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Fix server lag"",admin_fixServerLag,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete all broken vehicles"",admin_deletevehicles,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete/kill all zombies"",admin_deletezombies,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Spawn Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn Weapons, Items, & Magazines"",""Weaponz"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""  Spawn player Morph"",""Skinz"",""0"",""0"",""1"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Toggleable Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      ALT + Left Click Teleport"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Teleport"",admin_teleportToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle player Markers"",admin_playerMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle AI Markers"",admin_aiMarkers,""1"",""0"",""0"",""0"",[]]];
				if (AM_EPOCH) then {
				adminadd set [count adminadd,[""  Toggle Plot pole Markers"",admin_ppMarkers,""1"",""0"",""0"",""0"",[]]];
				};
				adminadd set [count adminadd,[""  Toggle dead Markers"",admin_deadMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle vehicle Markers"",admin_vehicleMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Stealth"",admin_invisibleToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle zombie aggro"",admin_disableAggro,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle zombie shield"",admin_zedShield,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Targeted Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Move to Target"",admin_teleportToTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Move Target to Me"",admin_targetTPhere,""0"",""0"",""0"",""1"",[]]];
				call admin_fillTPlogs;
				adminadd set [count adminadd,[""  Spectate Target"",admin_spectateTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  View gear Target"",admin_viewgearTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Give ammo to Target"",admin_giveAmmo,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Mute/Unmute target"",admin_muteTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Heal Target"",admin_healTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Kill Target"",admin_killTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  RemoveGear Target"",admin_removegearTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Move player in passenger"",manipulate_moveinveh,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Join player's vehicle"",manipulate_joinvehicle,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Add to/Sub from target's humanity"",admin_subaddHumanity,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""----Sub Menus----"","""",""0"",""1"",""0"",""0"",[]]];
				if (SUBMENU_giveGear) then {call admin_subGiveGear} else {
				adminadd set [count adminadd,[""[]---- Give Gear ----[]"",admin_subTglGive,""0"",""0"",""0"",""0"",MMCLR]];
				};
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Menu Options "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle player IDs"",admin_tglDisplayPUIDs,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle classnames (items)"",admin_tglDisplayClassWPN,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Increase font size"",admin_incrsFontSize,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Decrease font size"",admin_decrsFontSize,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Event Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""[] --- Man hunt --- []"","""",""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Man hunt target"",admin_manHuntPlayer,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Man hunt lowest humanity"",admin_manHuntKiller,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Update man hunt marker"",admin_manhuntupdate,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  End man hunt"",admin_endManHunt,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Miscellaneous "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				if (AM_EPOCH) then {
				adminadd set [count adminadd,[""  Find vehicle"",admin_findVehicle,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Kill all AI within 500m"",admin_killAI,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete closest plot pole (""+str (DZE_PlotPole select 0)+""m)"",admin_deletePlotePole,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete closest camo net (""+str (DZE_PlotPole select 0)+""m)"",admin_deleteCamoNet,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete base/area"",admin_baseDelete,""0"",""0"",""0"",""0"",[]]];
				};
				adminadd set [count adminadd,[""  Repair close buildings"",admin_repairBuildings,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Repair close entities"",admin_repairentities,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Force Disconnect (Self)"",{endmission ""LOSER""},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Force Disconnect (Target)"",admin_disconnectTarget,""0"",""0"",""0"",""1"",[]]];
				if !(isNil 'Level2_custommenu') then {call Level2_custommenu};
			};
			Level1_menu = {
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""                         HOTKEYS                         "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      Double click players to quick spectate."","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      F5 to EXIT spectating"","""",""0"",""1"",""0"",""0"",[]]];if (AM_EPOCH) then {
				adminadd set [count adminadd,[""      3 to get password of cursorTarget "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      4 to spawn key of cursorTarget(vehicle) "","""",""0"",""1"",""0"",""0"",[]]]};
				adminadd set [count adminadd,[""                         HOTKEYS                         "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Toggleable Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""      ALT + Left Click Teleport"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Teleport"",admin_teleportToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle player Markers"",admin_playerMarkers,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle Stealth"",admin_invisibleToggle,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle zombie shield"",admin_zedShield,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Targeted Scripts "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Spectate Target"",admin_spectateTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  View gear Target"",admin_viewgearTarget,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Menu Options "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle player IDs"",admin_tglDisplayPUIDs,""1"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Increase font size"",admin_incrsFontSize,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Decrease font size"",admin_decrsFontSize,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				if !(isNil 'Level1_custommenu') then {call Level1_custommenu};
			};
			admin_WAImission = {
				_code = ""if (isServer) then {
					if !(isNil 'wai_mi"" + ""ssi"" + ""ons') then {
						execVM format ['\z\addons\dayz_server\WAI\mi"" + ""ssio"" + ""ns\%1.sqf',(wai_m"" + ""issi"" + ""ons call BIS_fnc_selectRandom)];
					};
					if !(isNil 'wai_hero_mission') then {
						if (random 100 > 60) then {
							execVM format ['\z\addons\dayz_server\WAI\missions\bandit\%1.sqf',(wai_bandit_mission call BIS_fnc_selectRandom)];
						} else {
							execVM format ['\z\addons\dayz_server\WAI\missions\hero\%1.sqf',(wai_hero_mission call BIS_fnc_selectRandom)];
						};
					};
				};"";
				[_code] spawn admin_dothis;
				_msg = ""Spawning WAI mission!"";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_savelog = format[""%1 spawned an AI miss ion"",name player];
				[_savelog] call admin_adminlogAction;
			};
			admin_WAI_AIG = {
				closeDialog 0;
				openMap [true,false]; 
				_msg = ""Click on your map to spawn AI!"";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				admin_WAI_sAIG = {
					openMap [false,false];
					_msg = ""Spawning WAI group on ""+str(mapGridPosition _this)+""!"";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					PVOZ_aipos = _this;
					publicVariableServer ""PVOZ_aipos"";
					_code = ""if (isServer) then {
						if !(isNil 'spawn_group') then {
							[PVOZ_aipos,5,'Random','Random',3,'Random','Hero','Random','Hero',_mission] call spawn_group;
						}
					};"";
					[_code] spawn admin_dothis;
					
					_savelog = format[""%1 spawned 5 AI at %2"",name player,mapgridPosition _this];
					[_savelog] call admin_adminlogAction;
				};
				onMapSingleClick ""_pos spawn admin_WAI_sAIG;onMapSingleClick '';true;"";
			};
			admin_WAI_AIV = {
				closeDialog 0;
				openMap [true,false]; 
				_msg = ""Click on your map to spawn AI!"";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				admin_WAI_sAIV = {
					openMap [false,false];
					_msg = ""Spawning WAI vehicle patrol on ""+str(mapGridPosition _this)+""!"";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					PVOZ_aipos = _this;
					publicVariableServer ""PVOZ_aipos"";
					_code = ""if (isServer) then {
						if !(isNil 'spawn_group') then {
							[PVOZ_aipos,[(PVOZ_aipos select 0) + 100, PVOZ_aipos select 1, 0],500,2,'HMMWV_Armored','Random','Hero','Hero',_mission] call vehicle_patrol;
						}
					};"";
					[_code] spawn admin_dothis;
					
					_savelog = format[""%1 spawned AI vehicle patrol at %2"",name player,mapgridPosition _this];
					[_savelog] call admin_adminlogAction;
				};
				onMapSingleClick ""_pos spawn admin_WAI_sAIV;onMapSingleClick '';true;"";
			};
			getControl = {
				disableSerialization;
				(findDisplay 3030) displayCtrl _this;
			};
			admin_fillTPlogs = {
				adminadd set [count adminadd,[format [""    -- Clear TP log (%2 out of %1)--"",admin_maxTPlogs,count admin_TPlog],admin_clearTPlog,""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Increase max logs"",admin_addTPlogs,""0"",""0"",""0"",""0"",[1,0.45,0.45,1]]];
				adminadd set [count adminadd,[""  Decrease max logs"",admin_minTPlogs,""0"",""0"",""0"",""0"",[1,0.35,0.35,1]]];
				if (count admin_TPlog > 0) then {
					for '_i' from 0 to ((count admin_TPlog)-1) do {
						_log = call compile (admin_TPlog select _i);
						_name = _log select 0;
						_ppos = call compile (_log select 1);
						adminadd set [count adminadd,[""  --> Revert N: ""+str _name+"" GPS: ""+str (mapGridPosition _ppos)+"" "",compile (""[""+str(_name)+"",""+str(_ppos)+""] spawn admin_revertPos;""),""0"",""0"",""0"",""0"",[1,0,0,1]]];
					};
				};
			};
			admin_menuHeader = {
				['',0,safezoneY,1,0,0,3077] spawn AH_fnc_dynamictext;
				['',0,safezoneY,1,0,0,3078] spawn AH_fnc_dynamictext;
				adminadd set [count adminadd,[""    Main Menu"",""MainMenu"",""0"",""0"",""1"",""0"",[0,0.5,1,1]]];
				adminadd set [count adminadd,[""    - Misc Log"",""MiscLog"",""0"",""0"",""1"",""0"",[0,0.5,1,0.5]]];
				adminadd set [count adminadd,[""    - Key Log"",""keyLog"",""0"",""0"",""1"",""0"",[0,0.5,1,0.5]]];
				adminadd set [count adminadd,[""    - Hacker Log"",""hackerLog"",""0"",""0"",""1"",""0"",[0,0.5,1,0.5]]];
				adminadd set [count adminadd,[""    - Connection Log"",""LogLog"",""0"",""0"",""1"",""0"",[0,0.5,1,0.5]]];
				adminadd set [count adminadd,[""    - Kill and hit Log"",""PHitLog"",""0"",""0"",""1"",""0"",[0,0.5,1,0.5]]];
				if ("+_playerID+" player in levelthree) then {
					adminadd set [count adminadd,[""    - Admin Log"",""WriteLog"",""0"",""0"",""1"",""0"",[0,0.5,1,0.5]]];
					adminadd set [count adminadd,[""  Change weather (global)"",""Weather"",""0"",""0"",""1"",""0"",[0.25,0.25,1,1]]];
					adminadd set [count adminadd,[""  Change Time (global)"",""Time"",""0"",""0"",""1"",""0"",[0.25,0.25,1,1]]];
				};
			};
			admin_subColorMenu = {
				adminadd set [count adminadd,[""[]---- Color Menu ----[]"",admin_subTglColrs,""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Remove paint from target"",admin_changecolor_NONE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Red"",admin_changecolor_RED,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Pink"",admin_changecolor_PINK,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Light Pink"",admin_changecolor_LPINK,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Dark puple"",admin_changecolor_DPURPLE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Purple"",admin_changecolor_PURPLE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Light purple"",admin_changecolor_LPURPLE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Dark Green"",admin_changecolor_DGREEN,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Green"",admin_changecolor_GREEN,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Cyan"",admin_changecolor_CYAN,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Blue"",admin_changecolor_BLUE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Orange"",admin_changecolor_ORANGE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Yellow"",admin_changecolor_YELLOW,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target White"",admin_changecolor_WHITE,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Paint target Black"",admin_changecolor_BLACK,""0"",""0"",""0"",""1"",SMCLR]];
			};
			admin_subAnimate = {
				adminadd set [count adminadd,[""[]---- Animate Menu ----[]"",admin_subTglAnim,""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  End animations on player"",anim_end,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player dance (1) "",anim_dance1,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player dance (2) "",anim_dance2,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player dance (3) "",anim_dance3,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player box(fighting)"",anim_boxing,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player handstand "",anim_handstand,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player Laydown "",anim_laydown,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Make player Suicide"",anim_suicide,""0"",""0"",""0"",""1"",SMCLR]];
			};
			admin_subAdminEvents = {
				adminadd set [count adminadd,[""[] --- !event --- []"",admin_subTglEvents,""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Create admin event TP position"",admin_addEvent,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Create hatchet event TP position"",admin_addEventHatchet,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Create pistol event TP position"",admin_addEventPistol,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Create rifle event TP position"",admin_addEventRifle,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Toggle last man standing"",admin_LMSevent,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Lock event"",admin_lockevent,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Unlock event"",admin_unlockevent,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Delete admin event TP position"",admin_delEvent,""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Add target to event"",admin_addtoEvent,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Kick target from event"",admin_kickfromEvent,""0"",""0"",""0"",""1"",[]]];
				adminadd set [count adminadd,[""  Rollback !leaveevent for target"",admin_rollBackEvent,""0"",""0"",""0"",""1"",[]]];
			};
			admin_subGiveGear = {
				adminadd set [count adminadd,[""[]---- Give Gear ----[]"",admin_subTglGive,""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,["" [ -- BACKPACKS -- ]"","""",""0"",""0"",""0"",""0"",SSMCLR]];
				if (AM_EPOCH) then {
				adminadd set [count adminadd,["" --> Give large gunbag"",loadout_largegunbag,""0"",""0"",""0"",""1"",SMCLR]];
				};
				adminadd set [count adminadd,["" --> Give coyote backpack "",loadout_coyote,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give alice backpack "",loadout_alice,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" [ -- HE WEAPONS -- ]"","""",""0"",""0"",""0"",""0"",SSMCLR]];
				adminadd set [count adminadd,["" --> Give MAAWS loadout"",loadout_MAAWS,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give IGLA loadout"",loadout_IGLA,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give JAVELIN loadout"",loadout_JAVELIN,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" [ -- SNIPERS -- ]"","""",""0"",""0"",""0"",""0"",SSMCLR]];
				adminadd set [count adminadd,["" --> Give AS50 loadout"",loadout_as50,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M107_DZ loadout (EPOCH)"",loadout_M107,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give DMR_DZ loadout (EPOCH)"",loadout_dmr_DZ,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give DMR loadout"",loadout_dmr,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M14 AIM loadout"",loadout_m14,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" [ -- ASSAULT RIFLES -- ]"","""",""0"",""0"",""0"",""0"",SSMCLR]];
				adminadd set [count adminadd,["" --> Give SCAR H loadout"",loadout_SCARh,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give SCAR H SD loadout"",loadout_SCARhSD,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give SCAR L loadout"",loadout_SCARl,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give SCAR L HOLO loadout"",loadout_SCARlHOLO,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give FN FAL loadout"",loadout_fnfal,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M4A1 SD loadout"",loadout_m4a1sd,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M4A3 HOLO loadout"",loadout_m4a3holo,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M4A1 HOLO loadout"",loadout_m4a1holo,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M16 ACOG loadout"",loadout_m16acog,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give M16 M203 loadout"",loadout_m16m203,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give G36 loadout"",loadout_g36,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,["" --> Give L85 THERMAL loadout"",loadout_l85,""0"",""0"",""0"",""1"",SMCLR]];
			};
			admin_subManipulate = {
				adminadd set [count adminadd,[""[]---- Manipulate Menu ----[]"",admin_subTglManip,""0"",""0"",""0"",""0"",MMCLR]];
				adminadd set [count adminadd,[""  Spawn zombies on player"",manipulate_spawnzed,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Spawn whine on player"",manipulate_pitchwhine,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Remove player's zombie aggro"",manipulate_aggro,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Send player 50m up"",manipulate_fly50,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Send player 100m up"",manipulate_fly100,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Spawn explosion on player"",manipulate_boom,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Toggle godmode for target"",manipulate_godmode,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Toggle instant build for target"",manipulate_instantbuild,""0"",""0"",""0"",""1"",SMCLR]];
				adminadd set [count adminadd,[""  Toggle building restrictions for target"",manipulate_norestrictions,""0"",""0"",""0"",""1"",SMCLR]];
			};
			admin_weather = {
				inSub = false;
				_isSpawnMenu = false;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				lbclear _ctrl;
				adminadd = [];
				call admin_menuHeader;
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""View Distance "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  1"",{[9,player,1,1] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  500"",{[9,player,1,500] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  1000"",{[9,player,1,1000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  2000"",{[9,player,1,2000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  3000"",{[9,player,1,3000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  4000"",{[9,player,1,4000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  5000"",{[9,player,1,5000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  6000"",{[9,player,1,6000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  7000"",{[9,player,1,7000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  8000"",{[9,player,1,8000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  9000"",{[9,player,1,9000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  10000"",{[9,player,1,10000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  12000"",{[9,player,1,12000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  14000"",{[9,player,1,14000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  16000"",{[9,player,1,16000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  18000"",{[9,player,1,18000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  20000"",{[9,player,1,20000] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Fog "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Off"",{	[9,player,4,0] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  20%"",{	[9,player,4,0.2] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  40%"",{	[9,player,4,0.4] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  60%"",{	[9,player,4,0.6] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  80%"",{	[9,player,4,0.8] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  100%"",{[9,player,4,1] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Rain "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Off"",{	[9,player,3,0] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  20%"",{	[9,player,3,0.2] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  40%"",{	[9,player,3,0.4] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  60%"",{	[9,player,3,0.6] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  80%"",{	[9,player,3,0.8] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  100%"",{[9,player,3,1] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""Overcast "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Clear"",{[9,player,2,0] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Partly Cloudy"",{[9,player,2,0.2] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Cloudy"",{[9,player,2,0.4] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Rain"",{[9,player,2,0.6] call admin_adminREexec;[9,player,3,0.2] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Heavy Rain"",{[9,player,2,0.8] call admin_adminREexec;[9,player,3,0.6] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Storm"",{[9,player,2,1] call admin_adminREexec;[9,player,3,1] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				
				call admin_populateMenu;
			};
			admin_time = {
				inSub = false;
				_isSpawnMenu = false;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				lbclear _ctrl;
				adminadd = [];
				call admin_menuHeader;
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  Time Selection "","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""_________________________________________________________"","""",""0"",""1"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  12 AM"",{[10,player,[2013,8,3,1,0],0] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  1 AM"",{[10,player,[2013,8,3,1,0],1] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  2 AM"",{[10,player,[2013,8,3,1,0],2] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  3 AM"",{[10,player,[2013,8,3,1,0],3] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  4 AM"",{[10,player,[2013,8,3,1,0],4] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  5 AM"",{[10,player,[2013,8,3,1,0],5] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  6 AM"",{[10,player,[2013,8,3,1,0],6] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  7 AM"",{[10,player,[2013,8,3,1,0],7] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  8 AM"",{[10,player,[2013,8,3,1,0],8] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  9 AM"",{[10,player,[2013,8,3,1,0],9] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  10 AM"",{[10,player,[2013,8,3,1,0],10] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  11 AM"",{[10,player,[2013,8,3,1,0],11] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  12 PM"",{[10,player,[2013,8,3,1,0],12] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  1 PM"",{[10,player,[2013,8,3,1,0],13] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  2 PM"",{[10,player,[2013,8,3,1,0],14] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  3 PM"",{[10,player,[2013,8,3,1,0],15] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  4 PM"",{[10,player,[2013,8,3,1,0],16] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  5 PM"",{[10,player,[2013,8,3,1,0],17] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  6 PM"",{[10,player,[2013,8,3,1,0],18] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  7 PM"",{[10,player,[2013,8,3,1,0],19] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  8 PM"",{[10,player,[2013,8,3,1,0],20] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  9 PM"",{[10,player,[2013,8,3,1,0],21] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  10 PM"",{[10,player,[2013,8,3,1,0],22] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				adminadd set [count adminadd,[""  11 PM"",{[10,player,[2013,8,3,1,0],23] call admin_adminREexec},""0"",""0"",""0"",""0"",[]]];
				call admin_populateMenu;
			};
			admin_displayPAA = {
				_ctrl = 1003 call getControl;
				if (((adminadd select (lbCurSel 2) select 3) != '0')&&((adminadd select (lbCurSel 2) select 3) != '1')) then {
					if (plyrinfoloop) then {
						_info = 1 call getControl;
						_info ctrlRemoveAllEventHandlers 'LBSelChanged';
						plyrinfoloop = false;
					};
					
					_txt1 = (adminadd select (lbCurSel 2) select 3);
					_txt2 = (adminadd select (lbCurSel 2) select 0);
					_img = (adminadd select (lbCurSel 2) select 2);
					_ims = (_this select 0);
					_cfg = (switch (true) do {
						default {''};
						case (isClass (configFile >> 'CfgWeapons' >> _txt1)): 	{['CfgWeapons',_txt1]};
						case (isClass (configFile >> 'CfgMagazines' >> _txt1)): {['CfgMagazines',_txt1]};
						case (isClass (configFile >> 'CfgVehicles' >> _txt1)): 	{['CfgVehicles',_txt1]};
						case (isClass (configFile >> 'CfgWeapons' >> _txt2)): 	{['CfgWeapons',_txt2]};
						case (isClass (configFile >> 'CfgMagazines' >> _txt2)): {['CfgMagazines',_txt2]};
						case (isClass (configFile >> 'CfgVehicles' >> _txt2)): 	{['CfgVehicles',_txt2]};
					});
					_dsc = (if (_cfg select 0 != '') then {(gettext (configFile >> _cfg select 0 >> _cfg select 1 >> 'Library' >> 'libTextDesc'))} else {''});
					_text = '<t align=''center''><br/><img size=''4'' image='+str _img+'/></t><br/>';
					_text = _text + 'Class:<br/>';
					_text = _text + '<t size=''0.7''>'+_txt1+'</t><br/>';
					if (_dsc != '') then {_text = _text + 'Desc:<br/><t size=''0.7''>'+_dsc+'</t>'};
					_ctrl ctrlSetStructuredText parseText _text;
				} else {_ctrl ctrlSetStructuredText parseText ''};
			};
			admin_environmentmenu = {
				closeDialog 0;
				surrmenu = [
					['',true],
					['Terrain',[2],'#USER:termenu',-5,[['expression','']],'1','1'],
					['View Distance',[3],'#USER:distmenu',-5,[['expression','']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Time',[4],'#USER:dtimemenu',-5,[['expression','']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Overcast',[5],'#USER:overcastmenu',-5,[['expression','']],'1','1'],
					['Fog',[6],'#USER:fogmenu',-5,[['expression','']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Exit',[13],'',-3,[['expression','']],'1','1']
				];
				dtimemenu = [
					['',true],
					['Select time:',[-1],'',-5,[['expression','']],'1','0'],['00:00',[2],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,0,0];']],'1','1'],
					['03:00',[3],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,3,0];']],'1','1'],
					['06:00',[4],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,6,0];']],'1','1'],
					['09:00',[5],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,9,0];']],'1','1'],
					['12:00',[5],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,12,0];']],'1','1'],
					['15:00',[6],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,15,0];']],'1','1'],
					['18:00',[7],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,18,0];']],'1','1'],
					['21:00',[8],'',-5,[['expression','setDate [date select 0,date select 1,date select 2,21,0];']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Back',[12],'',-4,[['expression','']],'1','1'],
					['Exit',[13],'',-3,[['expression','']],'1','1']
				];
				termenu = [
					['',true],
					['Select terrain level:',[-1],'',-5,[['expression','']],'1','0'],['Very High',[2],'',-5,[['expression','setTerrainGrid 3.125;']],'1','1'],
					['High',[3],'',-5,[['expression','setTerrainGrid 6.25;']],'1','1'],
					['Normal',[4],'',-5,[['expression','setTerrainGrid 12.5;']],'1','1'],
					['Low',[5],'',-5,[['expression','setTerrainGrid 25;']],'1','1'],
					['Very Low',[6],'',-5,[['expression','setTerrainGrid 50;']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Back',[12],'',-4,[['expression','']],'1','1'],
					['Exit',[13],'',-3,[['expression','']],'1','1']
				];
				overcastmenu = [
					['',true],
					['Select overcast:',[-1],'',-5,[['expression','']],'1','0'],['Clear',[2],'',-5,[['expression','3 setovercast 0;']],'1','1'],
					['Partly Sunny',[3],'',-5,[['expression','3 setovercast 0.2;']],'1','1'],
					['Cloudy',[4],'',-5,[['expression','3 setovercast 0.4;']],'1','1'],
					['Rain',[5],'',-5,[['expression','3 setovercast 0.6;']],'1','1'],
					['Heavy Rain',[6],'',-5,[['expression','3 setovercast 0.8;']],'1','1'],
					['Storm',[7],'',-5,[['expression','3 setovercast 1;']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Back',[12],'',-4,[['expression','']],'1','1'],
					['Exit',[13],'',-3,[['expression','']],'1','1']
				];
				fogmenu = [
					['',true],
					['Select fog level:',[-1],'',-5,[['expression','']],'1','0'],['Off',[2],'',-5,[['expression','3 setFog 0;']],'1','1'],
					['20%',[3],'',-5,[['expression','3 setFog 0.2;']],'1','1'],
					['40%',[4],'',-5,[['expression','3 setFog 0.4;']],'1','1'],
					['60%',[5],'',-5,[['expression','3 setFog 0.6;']],'1','1'],
					['80%',[6],'',-5,[['expression','3 setFog 0.8;']],'1','1'],
					['100%',[7],'',-5,[['expression','3 setFog 1;']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Back',[12],'',-4,[['expression','']],'1','1'],
					['Exit',[13],'',-3,[['expression','']],'1','1']
				];
				distmenu = [
					['',true],
					['Select rendering distance:',[-1],'',-5,[['expression','']],'1','0'],['900',[2],'',-5,[['expression','setViewDistance 900;']],'1','1'],
					['1000',[3],'',-5,[['expression','setViewDistance 1000;']],'1','1'],
					['1200',[4],'',-5,[['expression','setViewDistance 1200;']],'1','1'],
					['1500',[5],'',-5,[['expression','setViewDistance 1500;']],'1','1'],
					['2000',[5],'',-5,[['expression','setViewDistance 2000;']],'1','1'],
					['2250',[6],'',-5,[['expression','setViewDistance 2250;']],'1','1'],
					['2500',[7],'',-5,[['expression','setViewDistance 2500;']],'1','1'],
					['3500',[8],'',-5,[['expression','setViewDistance 3500;']],'1','1'],
					['4500',[9],'',-5,[['expression','setViewDistance 4500;']],'1','1'],
					['5500',[9],'',-5,[['expression','setViewDistance 5500;']],'1','1'],
					['6500',[9],'',-5,[['expression','setViewDistance 6500;']],'1','1'],
					['7500',[9],'',-5,[['expression','setViewDistance 7500;']],'1','1'],
					['8500',[9],'',-5,[['expression','setViewDistance 8500;']],'1','1'],
					['',[-1],'',-5,[['expression','']],'1','0'],
					['Back',[12],'',-4,[['expression','']],'1','1'],
					['Exit',[13],'',-3,[['expression','']],'1','1']
				];
				showCommandingMenu '#USER:surrmenu';
			};
			admin_spawnweapons 		= {
				closeDialog 0;
				admin_CMD_quickspawn1 = [];
				admin_CMD_quickspawn2 = [];
				admin_CMD_quickspawn3 = [];
				admin_CMD_quickspawn4 = [];
				admin_CMD_quickspawn5 = [];
				admin_CMD_quickspawn6 = [];
				admin_CMD_quickspawn7 = [];
				admin_CMD_quickspawn8 = [];
				admin_CMD_quickspawn9 = [];
				admin_CMD_quickspawn10 = [];
				admin_CMD_quickspawn11 = [];
				admin_CMD_quickspawn12 = [];
				admin_CMD_quickspawn13 = [];
				admin_CMD_quickspawn14 = [];
				admin_CMD_quickspawn15 = [];
				admin_CMD_quickspawn16 = [];
				admin_CMD_quickspawn17 = [];
				admin_CMD_quickspawn18 = [];
				admin_CMD_quickspawn19 = [];
				_HURtext = ""_p4rt_0ut = '%1';
					player addWeapon _p4rt_0ut;
					_addAmmo = getArray(configfile >> 'cfgWeapons' >> '%1' >> 'magazines');
					_mag = _addAmmo select 0;
					player addMagazine _mag;
					player selectWeapon '%1';
					reload player;"";
				admin_CMD_quickspawn1 = [
					["""",true],
					[""Popular"",[2],""#USER:admin_CMD_quickspawn2"",-5,[[""expression"",""""]],""1"",""1""],
					[""Sidearms"",[3],""#USER:admin_CMD_quickspawn3"",-5,[[""expression"",""""]],""1"",""1""],
					[""Shotguns"",[4],""#USER:admin_CMD_quickspawn4"",-5,[[""expression"",""""]],""1"",""1""],
					[""Sub Machine Guns"",[5],""#USER:admin_CMD_quickspawn5"",-5,[[""expression"",""""]],""1"",""1""],
					[""Light Machine Guns"",[6],""#USER:admin_CMD_quickspawn6"",-5,[[""expression"",""""]],""1"",""1""],
					[""Assault Rifles"",[7],""#USER:admin_CMD_quickspawn8"",-5,[[""expression"",""""]],""1"",""1""],
					[""Sniper Rifles"",[8],""#USER:admin_CMD_quickspawn14"",-5,[[""expression"",""""]],""1"",""1""],
					[""Explosives"",[9],""#USER:admin_CMD_quickspawn16"",-5,[[""expression"",""""]],""1"",""1""],
					[""Smoke"",[10],""#USER:admin_CMD_quickspawn17"",-5,[[""expression"",""""]],""1"",""1""],
					[""Flares"",[11],""#USER:admin_CMD_quickspawn19"",-5,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn2 = [
					["""",true],
					[""M9SD"",[2],"""",-5,[[""expression"",format[_HURtext,""M9SD""]]],""1"",""1""],
					[""Bizon PP-19 SD"",[3],"""",-5,[[""expression"",format[_HURtext,""bizon_silenced""]]],""1"",""1""],
					[""M4A1 CCO SD"",[4],"""",-5,[[""expression"",format[_HURtext,""M4A1_AIM_SD_camo""]]],""1"",""1""],
					[""L85A2 AWS"",[5],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_RIS_CWS""]]],""1"",""1""],
					[""AKM"",[6],"""",-5,[[""expression"",format[_HURtext,""AK_47_M""]]],""1"",""1""],
					[""MK48 Mod 0"",[7],"""",-5,[[""expression"",format[_HURtext,""Mk_48_DZ""]]],""1"",""1""],
					[""SVD Camo"",[8],"""",-5,[[""expression"",format[_HURtext,""SVD_CAMO""]]],""1"",""1""],
					[""M107"",[9],"""",-5,[[""expression"",format[_HURtext,""m107_DZ""]]],""1"",""1""],
					[""AS50"",[10],"""",-5,[[""expression"",format[_HURtext,""BAF_AS50_scoped""]]],""1"",""1""],
					[""PDW SD *"",[11],"""",-5,[[""expression"",format[_HURtext,""UZI_SD_EP1""]]],""1"",""1""],
					[""AS50 TWS *"",[12],"""",-5,[[""expression"",format[_HURtext,""BAF_AS50_TWS""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn3 = [
					["""",true],
					[""Makarov"",[2],"""",-5,[[""expression"",format[_HURtext,""Makarov""]]],""1"",""1""],
					[""Revolver"",[3],"""",-5,[[""expression"",format[_HURtext,""revolver_EP1""]]],""1"",""1""],
					[""M1911"",[4],"""",-5,[[""expression"",format[_HURtext,""Colt1911""]]],""1"",""1""],
					[""G17"",[5],"""",-5,[[""expression"",format[_HURtext,""glock17_EP1""]]],""1"",""1""],
					[""PDW"",[6],"""",-5,[[""expression"",format[_HURtext,""UZI_EP1""]]],""1"",""1""],
					[""M9"",[7],"""",-5,[[""expression"",format[_HURtext,""M9""]]],""1"",""1""],
					[""M9SD"",[8],"""",-5,[[""expression"",format[_HURtext,""M9SD""]]],""1"",""1""],
					[""Makarov SD *"",[9],"""",-5,[[""expression"",format[_HURtext,""MakarovSD""]]],""1"",""1""],
					[""Sa-61 *"",[10],"""",-5,[[""expression"",format[_HURtext,""Sa61_EP1""]]],""1"",""1""],
					[""Revolver Gold *"",[11],"""",-5,[[""expression"",format[_HURtext,""revolver_gold_EP1""]]],""1"",""1""],
					[""PDW SD *"",[12],"""",-5,[[""expression"",format[_HURtext,""UZI_SD_EP1""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn4 = [
					["""",true],
					[""Hatchet"",[2],"""",-5,[[""expression"",format[_HURtext,""MeleeHatchet""]]],""1"",""1""],
					[""Crowbar"",[3],"""",-5,[[""expression"",format[_HURtext,""MeleeCrowbar""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Compound Crossbow"",[4],"""",-5,[[""expression"",format[_HURtext,""Crossbow""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Double-barreled Shotgun"",[5],"""",-5,[[""expression"",format[_HURtext,""MR43""]]],""1"",""1""],[""Winchester 1866"",[6],"""",-5,[[""expression"",format[_HURtext,""Winchester1866""]]],""1"",""1""],[""M1014"",[7],"""",-5,[[""expression"",format[_HURtext,""M1014""]]],""1"",""1""],[""Remington 870 (Flashlight)"",[8],"""",-5,[[""expression"",format[_HURtext,""Remington870_lamp""]]],""1"",""1""],
					[""Saiga 12K *"",[9],"""",-5,[[""expression"",format[_HURtext,""Saiga12K""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn5 = [
					["""",true],
					[""PDW"",[2],"""",-5,[[""expression"",format[_HURtext,""UZI_EP1""]]],""1"",""1""],
					[""Bizon PP-19 SD"",[3],"""",-5,[[""expression"",format[_HURtext,""bizon_silenced""]]],""1"",""1""],
					[""MP5A5"",[4],"""",-5,[[""expression"",format[_HURtext,""MP5A5""]]],""1"",""1""],
					[""MP5SD6"",[5],"""",-5,[[""expression"",format[_HURtext,""MP5SD""]]],""1"",""1""],
					[""Sa-61 *"",[6],"""",-5,[[""expression"",format[_HURtext,""Sa61_EP1""]]],""1"",""1""],
					[""PDW SD *"",[7],"""",-5,[[""expression"",format[_HURtext,""UZI_SD_EP1""]]],""1"",""1""],
					[""Bizon PP-19 *"",[8],"""",-5,[[""expression"",format[_HURtext,""bizon""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn6 = [
				["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn7"",-5,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""M240"",[2],"""",-5,[[""expression"",format[_HURtext,""M240_DZ""]]],""1"",""1""],
					[""M249 SAW"",[3],"""",-5,[[""expression"",format[_HURtext,""M249_DZ""]]],""1"",""1""],
					[""Mk 48 Mod 0"",[4],"""",-5,[[""expression"",format[_HURtext,""Mk_48_DZ""]]],""1"",""1""],
					[""L7A2 GPMG *"",[5],"""",-5,[[""expression"",format[_HURtext,""BAF_L7A2_GPMG""]]],""1"",""1""],
					[""M60E4 *"",[6],"""",-5,[[""expression"",format[_HURtext,""M60A4_EP1""]]],""1"",""1""],
					[""MG36 *"",[7],"""",-5,[[""expression"",format[_HURtext,""MG36""]]],""1"",""1""],
					[""PKM *"",[8],"""",-5,[[""expression"",format[_HURtext,""PK""]]],""1"",""1""],
					[""PKP (Pecheneg) *"",[9],"""",-5,[[""expression"",format[_HURtext,""Pecheneg""]]],""1"",""1""],
					[""RPK *"",[10],"""",-5,[[""expression"",format[_HURtext,""RPK_74""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn7 = [
					["""",true],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""L110A1 *"",[2],"""",-5,[[""expression"",format[_HURtext,""BAF_L110A1_Aim""]]],""1"",""1""],
					[""M249 SAW *"",[3],"""",-5,[[""expression"",format[_HURtext,""M249_EP1""]]],""1"",""1""],
					[""M240 Scope *"",[4],"""",-5,[[""expression"",format[_HURtext,""m240_scoped_EP1""]]],""1"",""1""],
					[""M249 Scope *"",[5],"""",-5,[[""expression"",format[_HURtext,""M249_m145_EP1""]]],""1"",""1""],
					[""Mk48 Mod 0 (Camo) *"",[6],"""",-5,[[""expression"",format[_HURtext,""Mk_48_DES_EP1""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn8 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn9"",-5,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""AK-74"",[2],"""",-5,[[""expression"",format[_HURtext,""AK_74""]]],""1"",""1""],
					[""AKS-74 Kobra"",[3],"""",-5,[[""expression"",format[_HURtext,""AKS_74_kobra""]]],""1"",""1""],
					[""AKS-74U"",[4],"""",-5,[[""expression"",format[_HURtext,""AKS_74_U""]]],""1"",""1""],
					[""AKM"",[5],"""",-5,[[""expression"",format[_HURtext,""AK_47_M""]]],""1"",""1""],
					[""FN FAL"",[6],"""",-5,[[""expression"",format[_HURtext,""FN_FAL""]]],""1"",""1""],
					[""FN FAL AN/PVS-4"",[7],"""",-5,[[""expression"",format[_HURtext,""FN_FAL_ANPVS4""]]],""1"",""1""],
					[""L85A2 AWS"",[8],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_RIS_CWS""]]],""1"",""1""],
					[""Lee Enfield"",[9],"""",-5,[[""expression"",format[_HURtext,""LeeEnfield""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn9 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn10"",-5,[[""expression"",""""]],""1"",""1""],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""M14 AIM"",[2],"""",-5,[[""expression"",format[_HURtext,""M14_EP1""]]],""1"",""1""],
					[""M16A2"",[3],"""",-5,[[""expression"",format[_HURtext,""M16A2""]]],""1"",""1""],
					[""M16A2 M203"",[4],"""",-5,[[""expression"",format[_HURtext,""M16A2GL""]]],""1"",""1""],
					[""M16A4 ACOG"",[5],"""",-5,[[""expression"",format[_HURtext,""m16a4_acg""]]],""1"",""1""],
					[""M4A1"",[6],"""",-5,[[""expression"",format[_HURtext,""M4A1""]]],""1"",""1""],[""M4A1 CCO"",[7],"""",-5,[[""expression"",format[_HURtext,""M4A1_Aim""]]],""1"",""1""],
					[""M4A1 CCO SD (Camo)"",[8],"""",-5,[[""expression"",format[_HURtext,""M4A1_AIM_SD_camo""]]],""1"",""1""],
					[""M4A1 Holo"",[9],"""",-5,[[""expression"",format[_HURtext,""M4A1_HWS_GL""]]],""1"",""1""],
					[""M4A3 CCO"",[10],"""",-5,[[""expression"",format[_HURtext,""M4A3_CCO_EP1""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn10 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn11"",-5,[[""expression"",""""]],""1"",""1""],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""AK-107 GP-25 *"",[2],"""",-5,[[""expression"",format[_HURtext,""AK_107_GL_kobra""]]],""1"",""1""],
					[""AK-107 GP-25 PSO *"",[3],"""",-5,[[""expression"",format[_HURtext,""AK_107_GL_pso""]]],""1"",""1""],
					[""AK-107 Kobra*"",[4],"""",-5,[[""expression"",format[_HURtext,""AK_107_kobra""]]],""1"",""1""],
					[""AK-107 PSO *"",[5],"""",-5,[[""expression"",format[_HURtext,""AK_107_pso""]]],""1"",""1""],
					[""AK-74 GP-25 *"",[6],"""",-5,[[""expression"",format[_HURtext,""AK_74_GL""]]],""1"",""1""],
					[""AK-74 GP-25 Kobra *"",[7],"""",-5,[[""expression"",format[_HURtext,""AK_74_GL_kobra""]]],""1"",""1""],
					[""AKS-74UN Kobra SD *"",[8],"""",-5,[[""expression"",format[_HURtext,""AKS_74_UN_kobra""]]],""1"",""1""],
					[""AKS-74 PSO *"",[9],"""",-5,[[""expression"",format[_HURtext,""AKS_74_pso""]]],""1"",""1""],
					[""AKS *"",[10],"""",-5,[[""expression"",format[_HURtext,""AK_47_S""]]],""1"",""1""],
					[""AKS (Gold) *"",[11],"""",-5,[[""expression"",format[_HURtext,""AKS_GOLD""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn11 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn12"",-5,[[""expression"",""""]],""1"",""1""],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""G36 *"",[2],"""",-5,[[""expression"",format[_HURtext,""G36a""]]],""1"",""1""],
					[""G36 (Camo) *"",[3],"""",-5,[[""expression"",format[_HURtext,""G36A_camo""]]],""1"",""1""],
					[""G36C *"",[4],"""",-5,[[""expression"",format[_HURtext,""G36C""]]],""1"",""1""],
					[""G36C (Camo) *"",[5],"""",-5,[[""expression"",format[_HURtext,""G36C_camo""]]],""1"",""1""],
					[""G36C SD *"",[6],"""",-5,[[""expression"",format[_HURtext,""G36_C_SD_eotech""]]],""1"",""1""],
					[""G36C SD (Camo) *"",[7],"""",-5,[[""expression"",format[_HURtext,""G36_C_SD_camo""]]],""1"",""1""],
					[""G36K *"",[8],"""",-5,[[""expression"",format[_HURtext,""G36K""]]],""1"",""1""],
					[""G36K (Camo) *"",[9],"""",-5,[[""expression"",format[_HURtext,""G36K_camo""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn12 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn13"",-5,[[""expression"",""""]],""1"",""1""],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""L85A2 ACOG *"",[2],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_RIS_ACOG""]]],""1"",""1""],
					[""L85A2 Holo *"",[3],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_RIS_Holo""]]],""1"",""1""],
					[""L85A2 SUSAT *"",[4],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_RIS_SUSAT""]]],""1"",""1""],
					[""L85A2 ACOG GL *"",[5],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_UGL_ACOG""]]],""1"",""1""],
					[""L85A2 Holo GL *"",[6],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_UGL_Holo""]]],""1"",""1""],
					[""L85A2 SUSAT GL *"",[7],"""",-5,[[""expression"",format[_HURtext,""BAF_L85A2_UGL_SUSAT""]]],""1"",""1""],
					[""L86A2 LSW *"",[8],"""",-5,[[""expression"",format[_HURtext,""BAF_L86A2_ACOG""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn13 = [
					["""",true],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""M16A4 *"",[2],"""",-5,[[""expression"",format[_HURtext,""M16A4""]]],""1"",""1""],
					[""M16A4 M203 *"",[3],"""",-5,[[""expression"",format[_HURtext,""M16A4_GL""]]],""1"",""1""],
					[""M16A4 M203 ACOG *"",[4],"""",-5,[[""expression"",format[_HURtext,""M16A4_ACG_GL""]]],""1"",""1""],
					[""M4A1 Holo (Camo) *"",[5],"""",-5,[[""expression"",format[_HURtext,""M4A1_HWS_GL_camo""]]],""1"",""1""],
					[""M4A1 Holo SD (Camo) *"",[6],"""",-5,[[""expression"",format[_HURtext,""M4A1_HWS_GL_SD_Camo""]]],""1"",""1""],
					[""M4A1 M203 RCO *"",[7],"""",-5,[[""expression"",format[_HURtext,""M4A1_RCO_GL""]]],""1"",""1""],
					[""M4A1 CCO (Camo) *"",[8],"""",-5,[[""expression"",format[_HURtext,""M4A1_Aim_camo""]]],""1"",""1""],
					[""M4A3 M203 ACOG *"",[9],"""",-5,[[""expression"",format[_HURtext,""M4A3_RCO_GL_EP1""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn14 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn15"",-5,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""CZ 550"",[2],"""",-5,[[""expression"",format[_HURtext,""huntingrifle""]]],""1"",""1""],
					[""M24"",[3],"""",-5,[[""expression"",format[_HURtext,""M24""]]],""1"",""1""],
					[""DMR"",[4],"""",-5,[[""expression"",format[_HURtext,""DMR""]]],""1"",""1""],
					[""SVD (Camo)"",[5],"""",-5,[[""expression"",format[_HURtext,""SVD_CAMO""]]],""1"",""1""],
					[""M107"",[6],"""",-5,[[""expression"",format[_HURtext,""m107_DZ""]]],""1"",""1""],
					[""AS50"",[7],"""",-5,[[""expression"",format[_HURtext,""BAF_AS50_scoped""]]],""1"",""1""],
					[""AS50 TWS *"",[8],"""",-5,[[""expression"",format[_HURtext,""BAF_AS50_TWS""]]],""1"",""1""],
					[""KSVK *"",[9],"""",-5,[[""expression"",format[_HURtext,""KSVK""]]],""1"",""1""],
					[""M40A3 *"",[10],"""",-5,[[""expression"",format[_HURtext,""M40A3""]]],""1"",""1""],
					[""Mk12 SPR *"",[11],"""",-5,[[""expression"",format[_HURtext,""M4SPR""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn15 = [
					["""",true],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""L115A3 LRR*"",[2],"""",-5,[[""expression"",format[_HURtext,""BAF_LRR_scoped_W""]]],""1"",""1""],
					[""L115A3 LRR (Desert Camo)*"",[3],"""",-5,[[""expression"",format[_HURtext,""BAF_LRR_scoped""]]],""1"",""1""],
					[""M24 (Desert Camo)*"",[4],"""",-5,[[""expression"",format[_HURtext,""M24_des_EP1""]]],""1"",""1""],
					[""SVD *"",[5],"""",-5,[[""expression"",format[_HURtext,""SVD""]]],""1"",""1""],
					[""SVD (Desert Camo) *"",[6],"""",-5,[[""expression"",format[_HURtext,""SVD_des_EP1""]]],""1"",""1""],
					[""SVD NSPU *"",[7],"""",-5,[[""expression"",format[_HURtext,""SVD_NSPU_EP1""]]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn16 = [
					["""",true],
					[""M67 Frag Grenade"",[2],"""",-5,[[""expression"",""_mag = 'HandGrenade_West';player addMagazine _mag;""]],""1"",""1""],
					[""RGO Frag Grenade"",[3],"""",-5,[[""expression"",""_mag = 'HandGrenade_East';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""M203 HE"",[4],"""",-5,[[""expression"",""_mag = '1Rnd_HE_M203';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 HE *"",[5],"""",-5,[[""expression"",""_mag = '1Rnd_HE_GP25';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Satchel Charges"",[6],"""",-5,[[""expression"",""_mag = 'PipeBomb';player addMagazine _mag;""]],""1"",""1""],
					[""IED (Garbage) *"",[7],"""",-5,[[""expression"",""_mag = 'BAF_ied_v1';player addMagazine _mag;""]],""1"",""1""],
					[""Mine *"",[8],"""",-5,[[""expression"",""_mag = 'Mine';player addMagazine _mag;""]],""1"",""1""],
					[""MineE *"",[9],"""",-5,[[""expression"",""_mag = 'MineE';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn17 = [
					["""",true],
					["">>> Next >>>"",[13],""#USER:admin_CMD_quickspawn18"",-5,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Smoke Grenade"",[2],"""",-5,[[""expression"",""_mag = 'SmokeShell';player addMagazine _mag;""]],""1"",""1""],
					[""Smoke Grenade (Red)"",[3],"""",-5,[[""expression"",""_mag = 'SmokeShellRed';player addMagazine _mag;""]],""1"",""1""],
					[""Smoke Grenade (Green)"",[4],"""",-5,[[""expression"",""_mag = 'SmokeShellGreen';player addMagazine _mag;""]],""1"",""1""],
					[""Smoke Grenade (Yellow) *"",[5],"""",-5,[[""expression"",""_mag = 'SmokeShellYellow';player addMagazine _mag;""]],""1"",""1""],
					[""Smoke Grenade (Orange) *"",[6],"""",-5,[[""expression"",""_mag = 'SmokeShellOrange';player addMagazine _mag;""]],""1"",""1""],
					[""Smoke Grenade (Purple) *"",[7],"""",-5,[[""expression"",""_mag = 'SmokeShellPurple';player addMagazine _mag;""]],""1"",""1""],
					[""Smoke Grenade (Blue) *"",[8],"""",-5,[[""expression"",""_mag = 'SmokeShellBlue';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn18 = [
					["""",true],
					[""<<< Back <<<"",[12],"""",-4,[[""expression"",""""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""M203 Smoke"",[2],"""",-5,[[""expression"",""_mag = '1Rnd_Smoke_M203';player addMagazine _mag;""]],""1"",""1""],
					[""M203 Smoke (Red) *"",[3],"""",-5,[[""expression"",""_mag = '1Rnd_SmokeRed_M203';player addMagazine _mag;""]],""1"",""1""],
					[""M203 Smoke (Green) *"",[4],"""",-5,[[""expression"",""_mag = '1Rnd_SmokeGreen_M203';player addMagazine _mag;""]],""1"",""1""],
					[""M203 Smoke (Yellow) *"",[5],"""",-5,[[""expression"",""_mag = '1Rnd_SmokeYellow_M203';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""GP-25 Smoke *"",[6],"""",-5,[[""expression"",""_mag = '1Rnd_Smoke_GP25';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 Smoke (Red) *"",[7],"""",-5,[[""expression"",""_mag = '1Rnd_SmokeRed_GP25';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 Smoke (Green) *"",[8],"""",-5,[[""expression"",""_mag = '1Rnd_SmokeGreen_GP25';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 Smoke (Yellow) *"",[9],"""",-5,[[""expression"",""_mag = '1Rnd_SmokeYellow_GP25';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				admin_CMD_quickspawn19 = [
					["""",true],
					[""M203 Flare (White)"",[2],"""",-5,[[""expression"",""_mag = 'FlareWhite_M203';player addMagazine _mag;""]],""1"",""1""],
					[""M203 Flare (Green)"",[3],"""",-5,[[""expression"",""_mag = 'FlareGreen_M203';player addMagazine _mag;""]],""1"",""1""],
					[""M203 Flare (Red) *"",[4],"""",-5,[[""expression"",""_mag = 'FlareRed_M203';player addMagazine _mag;""]],""1"",""1""],
					[""M203 Flare (Yellow) *"",[5],"""",-5,[[""expression"",""_mag = 'FlareYellow_M203';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""GP-25 Flare (White) *"",[6],"""",-5,[[""expression"",""_mag = 'FlareWhite_GP25';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 Flare (Green) *"",[7],"""",-5,[[""expression"",""_mag = 'FlareGreen_GP25';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 Flare (Red) *"",[8],"""",-5,[[""expression"",""_mag = 'FlareRed_GP25';player addMagazine _mag;""]],""1"",""1""],
					[""GP-25 Flare (Yellow) *"",[9],"""",-5,[[""expression"",""_mag = 'FlareYellow_GP25';player addMagazine _mag;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,[[""expression"",""""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:admin_CMD_quickspawn1"";
			};
			admin_objectDelete = {
				_objectID 	= _this getVariable ['ObjectID','0'];
				_objectUID 	= _this getVariable ['ObjectUID','0'];
				if (isNil '_objectID') exitWith {
					_msg = 'Error deleting '+str(typeOf _this)+'! objectID null';
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (isNil '_objectUID') exitWith {
					_msg = 'Error deleting '+str(typeOf _this)+'! objectUID null';
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (AM_EPOCH) then {
					PVDZE_obj_Delete = [_objectID,_objectUID,player];
					publicVariableServer 'PVDZE_obj_Delete';
				} else {
					PVDZ_obj_Delete = [_objectID,_objectUID,player];
					publicVariableServer 'PVDZ_obj_Delete';
				};
				if !(isNull _this) then {deleteVehicle _this};
			};
			admin_fnc_dynTextSend = {
				_name 		= _this select 0;
				_message 	= _this select 1;
				if (isNil '_name') exitWith {
					systemChat ('dynTextSend error! MSG: '+str _message);
				};
				if (_name == 'everyone') then {
					_exec = format [""
						systemChat ("""""+_AH_CHAT+": %2"""");
						'%2' call AH_fnc_dynTextMsg;
					"",_name,_message];
					[_exec] spawn admin_dothis;
				} else {
					_exec = format [""
					if (name player == """"%1"""") then {
						systemChat ("""""+_AH_CHAT+": %2"""");
						'%2' call AH_fnc_dynTextMsg;
					};"",_name,_message];
					[_exec] spawn admin_dothis;
				};
			};
			admin_findVehicle = {
				closeDialog 0;
				recover_tpto = {
					_veh = _this select 0;
					_key = _this select 1;
					
					_dir = getDir _veh;
					_pos = _veh call AH_fnc_getPos;
					_pos = [(_pos select 0)-5*sin(_dir),(_pos select 1)-5*cos(_dir),(_pos select 2)+1];
					[(vehicle player),_pos] call AH_fnc_setPos;
				};
				recover_tphere = {
					_veh = _this select 0;
					_key = _this select 1;
					
					_dir = getDir (vehicle player);
					_pos = (vehicle player) call AH_fnc_getPos;
					_pos = [(_pos select 0)+5*sin(_dir),(_pos select 1)+5*cos(_dir),(_pos select 2)+1];
					[_veh,_pos] call AH_fnc_setPos;
				};
				recover_info = {
					_veh = _this select 0;
					_key = _this select 1;
					
					_msg = (str(typeOf _veh)+' found! KEY: '+str(_key)+' CORDS: '+str(mapGridPosition getPos _veh)+' POS: '+str(getPosATL _veh)+'!');
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				recover_vehicle = {
					recover_selVeh = _this select 0;
					recover_selVKY = _this select 1;
					ADMIN_recoverVeh = 
					[	
						['',true],
						['Teleport to...',		[2],'',-5,[['expression','[recover_selVeh,recover_selVKY] call recover_tpto;']],'1','1'],
						['Teleport here...',	[3],'',-5,[['expression','[recover_selVeh,recover_selVKY] call recover_tphere;']],'1','1'],
						['Display info...',	[4],'',-5,[['expression','[recover_selVeh,recover_selVKY] call recover_info;']],'1','1'],
						['',[-1],'',-5,[['expression','']],'1','0'],
						['Exit',[-1],'',-3,[['expression','']],'1','1']
					];
					showCommandingMenu '#USER:ADMIN_recoverVeh';
				};
				genmen_nextPage = false;
				genmen_objRem = [];
				genmen_selObj = '';
				_hasKeys = false;
				{
					_isKey = ['ItemKey',_x] call fnc_inString;
					if (_isKey) then {
						_hasKeys = true;
						genmen_objRem set [count genmen_objRem,_x];
					};
				} forEach (items player);
				if (!_hasKeys) exitWith {
					_msg = ('No keys found in inventory!');
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				genmen_generate = {
					_Dami_GMGDFP = [['',true],['Select key:',[-1],'',-5,[['expression','']],'1','0']];
					for '_i' from (_this select 0) to (_this select 1) do {
						_arr = [format['%1',genmen_objRem select (_i)],[_i - (_this select 0) + 2],'',-5,[['expression',format['genmen_selObj = genmen_objRem select %1;',_i]]],'1','1'];
						_Dami_GMGDFP set [_i+2,_arr];
					};
					if (count genmen_objRem >  (_this select 1)) then {
						_Dami_GMGDFP set [(_this select 1)+2,['Next',[12],'',-5,[['expression','genmen_nextPage = true;']],'1','1']];
					} else {
						_Dami_GMGDFP set [(_this select 1)+2,['',[-1],'',-5,[['expression','']],'1','0']];
					};
					_Dami_GMGDFP set [(_this select 1)+3,['Exit',[13],'',-5,[['expression','genmen_selObj = ''genmen_exit'';']],'1','1']];
					showCommandingMenu '#USER:_Dami_GMGDFP';
				};

				_j = 0;
				while {genmen_selObj == ''} do {
					[_j,(_j+10) min (count genmen_objRem)] call genmen_generate;
					_j = _j + 10;
					waitUntil {genmen_selObj!='' or genmen_nextPage};	
					genmen_nextPage = false;
				};

				if (genmen_selObj != 'genmen_exit') then {
					_selected = genmen_selObj;
					_found = false;
					{
						private ['_key','_id'];
						_id = parseNumber (_x getVariable ['CharacterID','0']);
						if (_id != 0) then {
							if ((_id > 0)&&(_id <= 2500)) then {_key = format['ItemKeyGreen%1',_id]};
							if ((_id > 2500)&&(_id <= 5000)) then {_key = format['ItemKeyRed%1',_id - 2500]};
							if ((_id > 5000)&&(_id <= 7500)) then {_key = format['ItemKeyBlue%1',_id - 5000]};
							if ((_id > 7500)&&(_id <= 10000)) then {_key = format['ItemKeyYellow%1',_id - 7500]};
							if ((_id > 10000)&&(_id <= 12500)) then {_key = format['ItemKeyBlack%1',_id - 10000]};
							if (isNil '_key') then {_key = ''};
							if (_key == _selected) then {
								_found = true;
								[_x,_key] spawn recover_vehicle;
							};
						};
					} forEach (vehicles);
					if !(_found) then {
						_msg = ('Could not find vehicle with key '+_selected);
						systemChat ('"+_AH_CHAT+": ' + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
				};
			};
			admin_QuickGlue = {
				if !(isNil 'glue_deactivate') then {call glue_deactivate};
				if (isNil 'glue_eh') then {glue_eh = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call glue_keybinds;']};
				glue_keybinds = {
					_key = (_this select 1);
					_shift 	= _this select 2;
					_ctrl 	= _this select 3;
					_alt 	= _this select 4;
					glued_object setDir glued_od;
					comment 'Shift home';
					if ((_key == 0xC7)&&(_shift)) then {
						[] spawn glue_attachobject;
					};
					comment 'CTRL home';
					if ((_key == 0xC7)&&(_ctrl)) then {
						[] spawn glue_detachobject;
					};
					comment 'Shift right';
					if ((_key == 0xCD)&&(_shift)) then {
						glued_od = glued_od + 5;
						glued_object setDir glued_od;
					};
					comment 'Shift left';
					if ((_key == 0xCB)&&(_shift)) then {
						glued_od = glued_od - 5;
						glued_object setDir glued_od;
					};
					comment 'Shift up';
					if ((_key == 0xC8)&&(_shift)) then {
						glued_z = glued_z + 0.05;
						[] spawn glue_reattach;
					};
					comment 'Shift down';
					if ((_key == 0xD0)&&(_shift)) then {
						glued_z = glued_z - 0.05;
						[] spawn glue_reattach;
					};
					comment 'Arrow up';
					if ((_key == 0xC8)&&(!_shift)) then {
						glued_y = glued_y + 0.1;
						[] spawn glue_reattach;
					};
					comment 'Arrow down';
					if ((_key == 0xD0)&&(!_shift)) then {
						glued_y = glued_y - 0.1;
						[] spawn glue_reattach;
					};
					comment 'Arrow left';
					if ((_key == 0xCB)&&(!_shift)) then {
						glued_x = glued_x - 0.1;
						[] spawn glue_reattach;
					};
					comment 'Arrow right';
					if ((_key == 0xCD)&&(!_shift)) then {
						glued_x = glued_x + 0.1;
						[] spawn glue_reattach;
					};
					comment 'H';
					if (_key == 0x23) then {
						[] spawn glue_help;
					};
				};
				glue_help = {
					{systemChat ('"+_AH_CHAT+": '+str _x)} forEach [
						'Shift + Home to glue cursorTarget',
						'Ctrl + Home to unglue object',
						'UP to move object foward',
						'DOWN to move object backward',
						'LEFT to move object left',
						'RIGHT to move object right',
						'SHIFT UP to move object up',
						'SHIFT DOWN to move object down',
						'SHIFT LEFT to rotate object left',
						'SHIFT RIGHT to rotate object right',
						'---  Press H  to show this again  ---'
					];
				};
				glue_reattach = {
					glued_object attachTo [(vehicle player),[glued_x,glued_y,glued_z]];
					glued_object setDir glued_od;
				};
				glue_deactivate = {
					call glue_detachobject;
					(findDisplay 46) displayRemoveEventHandler ['KeyDown',glue_eh];
					glue_eh = nil;
					glue_deactivate = nil;
					
					_msg = 'Glue hotkeys removed,quick glue script disabled!';
					systemChat ('"+_AH_CHAT+": '+str _msg);
				};
				glue_detachobject = {
					if (isNil 'glued_object') exitWith {
						_msg = 'No object to unglue.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
					detach glued_object;
					
					_pos = glued_object call AH_fnc_getPos;
					[glued_object,_pos] call AH_fnc_setPos;
					glued_object setDir (direction glued_object);
					
					_msg = 'Unglued '+str (typeOf glued_object)+'';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					glued_object = nil;
				};
				glue_attachobject = {
					if !(isNil 'glued_object') exitWith {
						_msg = 'Object ('+str (typeOf glued_object)+') is already glued to you!';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
					if (isNull cursorTarget) exitWith {
						_msg = 'Object not found. Try again.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
					_msg = 'Glueing '+str (typeOf cursorTarget)+' to you.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					glued_object = (cursorTarget);
					glued_od = 0;
					glued_x = 0;
					glued_y = 2;
					glued_z = 0.25;
					glued_object attachTo [(vehicle player),[glued_x,glued_y,glued_z]];
				};
				call glue_help;
			};
			admin_addtoEvent = {
				if (str("+_RND+"_eventPos) == '[]') exitWith {
					_msg = 'There is no active event.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
				};
				_name = _this select 0;
				
				_msg = name player+' added you to the event.';
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				_addto = format ['if (name player == ''%1'') then {
					intheevent = true;
					admin_movedevent = true;
					[] spawn "+_RND+"_eventGo;
				};',_name];
				[_addto] spawn admin_dothis;
				
				_savelog = format['%1 added %2 to the event.',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_rollBackEvent = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = name player+' reverted your gear for !leaveevent.';
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				['if (isServer) then {event_'+(getPlayerUID _plyr)+'_gear set [1,true]}'] spawn admin_dothis;
				
				_savelog = format['%1 kicked %2 from the event.',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_kickfromEvent = {
				_name = _this select 0;
				
				_msg = name player+' kicked you from the event.';
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				_kickfrom = format ['if (name player == ''%1'') then {
					player setVariable [''intheevent'',false,true];
					[] spawn "+_RND+"_eventLeave;
				};',_name];
				[_kickfrom] spawn admin_dothis;
				
				_savelog = format['%1 kicked %2 from the event.',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_LMSevent = {
				if (isNil 'LMS_toggled') then {LMS_toggled = true};
				if (LMS_toggled) then {
					LMS_toggled = false;
					if (str("+_RND+"_eventPos) == '[]') exitWith {
						_msg = 'There is no active event.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
					_msg = format ['%1 enabled last man standing mode! If you die in the event, you automatically leave.',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					"+_RND+"_eventPos set [2,'LASTMAN'];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 enabled last man standing.',name player];
					[_savelog] call admin_adminlogAction;
				} else {
					LMS_toggled = true;
					if (str("+_RND+"_eventPos) == '[]') exitWith {
						_msg = 'There is no active event.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
					_msg = format ['%1 disabled last man standing mode!',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					"+_RND+"_eventPos set [2,'LOCKED'];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 disabled last man standing.',name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_lockevent = {
				if (str("+_RND+"_eventPos) == '[]') exitWith {
					_msg = 'There is no active event.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
				};
				_msg = format ['%1 locked the event command! Only people in the event can use it now.',name player];
				['everyone',_msg] spawn admin_fnc_dynTextSend;
				"+_RND+"_eventPos set [2,'LOCKED'];
				publicVariable '"+_RND+"_eventPos';
				
				_savelog = format['%1 locked the event.',name player];
				[_savelog] call admin_adminlogAction;
			};
			admin_unlockevent = {
				if (str("+_RND+"_eventPos) == '[]') exitWith {
					_msg = 'There is no active event.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
				};
				_msg = format ['%1 unlocked the !event command for everyone to use!',name player];
				['everyone',_msg] spawn admin_fnc_dynTextSend;
				"+_RND+"_eventPos set [2,'UNLOCKED'];
				publicVariable '"+_RND+"_eventPos';
				
				_savelog = format['%1 unlocked the event.',name player];
				[_savelog] call admin_adminlogAction;
			};
			admin_delEvent = {
				if (isNil '"+_RND+"_eventPos') then {
					_msg = format ['There is currently no admin event pos to delete!'];
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					CTF_arr = nil;
					TDM_arr = nil;
					_msg = format ['%1 deleted the !event position. The event is over!',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos = [];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 deleted the event position.',name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_addEventRifle = {
				_pos = (vehicle player) call AH_fnc_getPos;
				if (isNil '"+_RND+"_eventPos') then {"+_RND+"_eventPos=[]};
				if (str("+_RND+"_eventPos) == '[]') then {
					_msg = format ['%1 started a rifle event, type !event to be teleported! Your old gear and position will be auto-saved.',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos = [_pos,'RIFLE','UNLOCKED','RANDOM'];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 started an event position at %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = 'The admin event position has been updated, type !event to be teleported there!';
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos set [0,_pos];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 changed the event position to %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_addEventPistol = {
				_pos = (vehicle player) call AH_fnc_getPos;
				if (isNil '"+_RND+"_eventPos') then {"+_RND+"_eventPos=[]};
				if (str("+_RND+"_eventPos) == '[]') then {
					_msg = format ['%1 started a pistol event, type !event to be teleported! Your old gear and position will be auto-saved.',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos = [_pos,'PISTOL','UNLOCKED','RANDOM'];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 started an event position at %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = 'The admin event position has been updated, type !event to be teleported there!';
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos set [0,_pos];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 changed the event position to %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_addEventHatchet = {
				_pos = (vehicle player) call AH_fnc_getPos;
				if (isNil '"+_RND+"_eventPos') then {"+_RND+"_eventPos=[]};
				if (str("+_RND+"_eventPos) == '[]') then {
					_msg = format ['%1 started a hatchet event, type !event to be teleported! Your old gear and position will be auto-saved.',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos = [_pos,'HATCHET','UNLOCKED','RANDOM'];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 started an event position at %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = 'The admin event position has been updated, type !event to be teleported there!';
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos set [0,_pos];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 changed the event position to %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_addEvent = {
				_pos = (vehicle player) call AH_fnc_getPos;
				if (isNil '"+_RND+"_eventPos') then {"+_RND+"_eventPos=[]};
				if (str("+_RND+"_eventPos) == '[]') then {
					_msg = format ['%1 started an event, type !event to be teleported! Your old gear and position will be auto-saved.',name player];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos = [_pos,'none','UNLOCKED','none'];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 started an event position at %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = 'The admin event position has been updated, type !event to be teleported there!';
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					
					"+_RND+"_eventPos set [0,_pos];
					publicVariable '"+_RND+"_eventPos';
					
					_savelog = format['%1 changed the event position to %2.',name player,mapGridPosition _pos];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_baseDelete = {
				closeDialog 0;
				if (admin_basedel_thrd) exitWith {
					_msg = 'Delete base script already running.';
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (!isnil 'admin_basedel_eh') then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',admin_basedel_eh]};
				admin_basedel_eh = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call admin_basedel_keyb;'];
				self_base_rad = nil;
				sleep 0.1;
				baseObj_menu = [
					['"+_AH_CHAT+"',true],
					['Attach base rad to self?',[-1],'',-5,[['expression','']],'1','0'],
					['',	[-1],	'',-5,	[['expression',	'']],'1','0'],
					['Yes',[2],	'',-5,	[['expression',	'self_base_rad=true;']],'1','1'],
					['No',	[3],	'',-5,	[['expression',	'self_base_rad=false;']],'1','1'],
					['',	[-1],	'',-5,	[['expression','']],'1','0'],
					['Exit',[-1],	'',-3,	[['expression',	'self_base_rad=false;']],'1','1']
				];
				showCommandingMenu '#USER:baseObj_menu';
				waitUntil {((!isNil 'self_base_rad')||(commandingMenu == ''))};
				if (isNil 'self_base_rad') then {self_base_rad=false};
				if !(self_base_rad) then {
					admin_basedel_obj = 'Sign_arrow_down_large_EP1' createVehicleLocal (position player);
					[admin_basedel_obj,((vehicle player) call AH_fnc_getPos)] call AH_fnc_setPos;
					hideObject admin_basedel_obj;
				} else {admin_basedel_obj = (vehicle player)};
				admin_basedel_objects = [];
				admin_basedel_wrad = 5;
				admin_basedel_hrad = 1;
				admin_basedel_dcnt = true;
				admin_basedel_bcnt = true;
				admin_basedel_thrd = true;
				is_walking = false;
				if (!isNil 'count_thread') then {terminate count_thread};
				if (!isNil 'rad_thread') then {terminate rad_thread};
				if (!isNil 'text_thread') then {terminate text_thread};
				admin_basedel_keyb = {
					_key 	= (_this select 1);
					_shift 	= (_this select 2);
					if (_key == 0xD3) exitWith {[] spawn admin_basedel_dele};
					if (_key == 0xD2) exitWith {[] spawn admin_basedel_deac};
					if (is_walking) exitWith {};
					if ((_key == 0xC9)&&(!_shift)&&(admin_basedel_dcnt)) exitWith {
						admin_basedel_wrad = admin_basedel_wrad + 5;
						admin_basedel_dcnt = false;
						call admin_basedel_count;
					};
					if ((_key == 0xD1)&&(!_shift)&&(admin_basedel_wrad != 5)&&(admin_basedel_dcnt)) exitWith {
						admin_basedel_wrad = admin_basedel_wrad - 5;
						admin_basedel_dcnt = false;
						call admin_basedel_count;
					};
					if ((_key == 0xC9)&&(_shift)&&(admin_basedel_dcnt)) exitWith {
						admin_basedel_hrad = admin_basedel_hrad + 1;
						admin_basedel_dcnt = false;
						call admin_basedel_count;
					};
					if ((_key == 0xD1)&&(_shift)&&(admin_basedel_wrad != 1)&&(admin_basedel_dcnt)) exitWith {
						admin_basedel_hrad = admin_basedel_hrad - 1;
						admin_basedel_dcnt = false;
						call admin_basedel_count;
					};
				};
				admin_basedel_count = {
					admin_basedel_bcnt = false;
					admin_basedel_objects = [];
					scan_radius = if (admin_basedel_wrad <= 200) then [{200},{admin_basedel_wrad}];
					{
						_radpos = ((_x call AH_fnc_getPos) select 2);
						_delpos = ((admin_basedel_obj call AH_fnc_getPos) select 2);
						if (!((typeOf _x) in DZE_LockableStorage)&&((_radpos <= (_delpos + admin_basedel_hrad)))) then {admin_basedel_objects = admin_basedel_objects + [_x]};
					} forEach (nearestObjects [admin_basedel_obj,dayz_allowedObjects,scan_radius * 2]);
					admin_basedel_bcnt = true;
				};
				admin_basedel_dele = {
					_cnt = count admin_basedel_objects;
					delete_base = nil;
					sleep 0.1;
					deleteBase_menu = [
						['"+_AH_CHAT+"',true],
						[format ['Delete %1 objects?',_cnt],[-1],'',-5,[['expression','']],'1','0'],
						['',	[-1],	'',-5,	[['expression',	'']],'1','0'],
						['Yes',[2],	'',-5,	[['expression',	'delete_base=true;']],'1','1'],
						['No',	[3],	'',-5,	[['expression',	'delete_base=false;']],'1','1'],
						['',	[-1],	'',-5,	[['expression','']],'1','0'],
						['Exit',[-1],	'',-3,	[['expression',	'delete_base=false;']],'1','1']
					];
					showCommandingMenu '#USER:deleteBase_menu';
					waitUntil {((!isNil 'delete_base')||(commandingMenu == ''))};
					if (isNil 'delete_base') then {delete_base=false};
					if !(delete_base) exitWith {
						_msg = 'Delete object cancelled.';
						systemChat ('"+_AH_CHAT+": ' + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					delete_base = nil;
					deleteBase_menu = [
						['"+_AH_CHAT+"',true],
						['Are you sure?',[-1],'',-5,[['expression','']],'1','0'],
						['',	[-1],	'',-5,	[['expression',	'']],'1','0'],
						['Yes',[2],	'',-5,	[['expression',	'delete_base=true;']],'1','1'],
						['No',	[3],	'',-5,	[['expression',	'delete_base=false;']],'1','1'],
						['',	[-1],	'',-5,	[['expression','']],'1','0'],
						['Exit',[-1],	'',-3,	[['expression',	'delete_base=false;']],'1','1']
					];
					showCommandingMenu '#USER:deleteBase_menu';
					waitUntil {((!isNil 'delete_base')||(commandingMenu == ''))};
					if (isNil 'delete_base') then {delete_base=false};
					if !(delete_base) exitWith {
						_msg = 'Delete object cancelled.';
						systemChat ('"+_AH_CHAT+": ' + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					_msg = 'Deleting '+str _cnt+'....';
					_objs = [];
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
					{
						if !((typeOf _x) in DZE_LockableStorage) then {
							_x spawn admin_objectDelete;
							_objs = _objs + [typeOf _x];
						};
					} forEach admin_basedel_objects;
					_msg = 'Deleted '+str _cnt+' objects: '+str (_objs);
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				admin_basedel_deac = {
					_msg = 'Base delete cancelled.';
					systemChat ('"+_AH_CHAT+": ' + str _msg);
					_msg call AH_fnc_dynTextMsg;
					if (!isnil 'admin_basedel_eh') then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',admin_basedel_eh]};
					admin_basedel_keyb= {};
					admin_basedel_deac=nil;
					admin_basedel_dele=nil;
					admin_basedel_count=nil;
					admin_basedel_objects=[];
					admin_basedel_wrad=0;
					admin_basedel_hrad=0;
					admin_basedel_dcnt=true;
					admin_basedel_thrd=false;
					{deleteVehicle _x} forEach (del_sprs);
					{deleteVehicle _x} forEach (del_prev);
				};
				text_thread = [] spawn {
					while {admin_basedel_thrd} do {
						[format ['<t color=''#FF3300''>Radius</t>: %1 <t color=''#FF3300''>Height</t>: %2 <t color=''#FF3300''>Near buildables</t>: %3',admin_basedel_wrad,admin_basedel_hrad,count admin_basedel_objects],0,safezoneY+0.5,60,0,0,3099] spawn BIS_fnc_DynamicText;
						sleep 0.1;
					};
					['',0,safezoneY+1.5,1,0,0,3099] spawn BIS_fnc_DynamicText;
				};
				if (self_base_rad) then {
					count_thread = [] spawn {
						while {admin_basedel_thrd} do {
							_pos = (getPosATL (vehicle player));
							waitUntil {((_pos distance (getPosATL (vehicle player))) > 2)};
							is_walking = true;
							waitUntil {str(velocity player) in ['[0,0,0]','[0,0,-0]']};
							call admin_basedel_count;
							is_walking = false;
						};
					};
				};
				rad_thread = [] spawn {
					del_prev = [];
					del_offs = -1.5;
					_baserad = admin_basedel_wrad;
					_haserad = admin_basedel_hrad;
					while {admin_basedel_thrd} do {
						del_sprs = [];
						if (_haserad != admin_basedel_hrad) then {
							{deleteVehicle _x} forEach (del_prev);
							del_prev = [];
							_object = 'Sign_arrow_down_large_EP1' createVehicleLocal [(getPosATL (vehicle player)) select 0,(getPosATL (vehicle player)) select 0,50];del_prev = del_prev + [_object];
							_object attachTo [admin_basedel_obj,[0,	5,del_offs + admin_basedel_hrad]];_object setVectorUp [0,0,-1];
							_object = 'Sign_arrow_down_large_EP1' createVehicleLocal [(getPosATL (vehicle player)) select 0,(getPosATL (vehicle player)) select 0,50];del_prev = del_prev + [_object];
							_object attachTo [admin_basedel_obj,[0,-5,del_offs + admin_basedel_hrad]];_object setVectorUp [0,0,-1];
							_object = 'Sign_arrow_down_large_EP1' createVehicleLocal [(getPosATL (vehicle player)) select 0,(getPosATL (vehicle player)) select 0,50];del_prev = del_prev + [_object];
							_object attachTo [admin_basedel_obj,[5,	0,del_offs + admin_basedel_hrad]];_object setVectorUp [0,0,-1];
							_object = 'Sign_arrow_down_large_EP1' createVehicleLocal [(getPosATL (vehicle player)) select 0,(getPosATL (vehicle player)) select 0,50];del_prev = del_prev + [_object];
							_object attachTo [admin_basedel_obj,[-5,0,del_offs + admin_basedel_hrad]];_object setVectorUp [0,0,-1];
						};
						for '_i' from 0 to 360 step (200 / admin_basedel_wrad) do {
							_object = 'Sign_arrow_down_large_EP1' createVehicleLocal [(getPosATL (vehicle player)) select 0,(getPosATL (vehicle player)) select 0,50];
							del_sprs = del_sprs + [_object];
							_object attachTo [admin_basedel_obj,[((cos _i) * admin_basedel_wrad),((sin _i) * admin_basedel_wrad),0.1 + admin_basedel_hrad]];
						};
						admin_basedel_dcnt = true;
						_baserad = admin_basedel_wrad;
						_haserad = admin_basedel_hrad;
						waitUntil {(_baserad != admin_basedel_wrad)||(_haserad != admin_basedel_hrad)};
						{deleteVehicle _x} forEach (del_sprs);
					};
				};
				_msg = 'Page up: Increase radius.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg = 'Page down: Decrease radius.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg = 'Shift Page up: Increase delete height.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg = 'Shift Page down: Decrease delete height.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg = 'Insert: Cancel base delete.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg = 'Delete: Delete area.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg = 'You can walk to adjust your delete radius, but it will not update object count until you stop moving.';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
			};
			admin_OTFwriter 		= {
				disableSerialization;
				createDialog ""RscFunctionsViewer"";
				_display 	= findDisplay 2929;
				_indexdis 	= 292905;
				_textTitle 	= _display displayctrl (_indexdis + 0);
				_textPath 	= _display displayctrl (_indexdis + 1);
				_textDesc 	= _display displayctrl (_indexdis + 2);
				_textCode 	= _display displayctrl (_indexdis + 3);
				_btnCopy 	= _display displayctrl (_indexdis + 4);
				_btnCopy2 	= _display displayctrl (_indexdis + 5);
				_btnCopy3 	= _display displayctrl (_indexdis + 6);
				_listFNCs 	= _display displayCtrl (_indexdis - 4);
				_listSRCs 	= _display displayCtrl (_indexdis - 3);
				_listTags 	= _display displayCtrl (_indexdis - 2);
				_listCats 	= _display displayCtrl (_indexdis - 1);
				_textTitle ctrlShow true;_textPath ctrlShow true;_textDesc  ctrlShow true;
				_btnCopy ctrlShow true;_btnCopy2  ctrlShow true;_btnCopy3 ctrlShow true;
				_listFNCs  ctrlShow false;_listSRCs ctrlShow false;_listTags  ctrlShow false;_listCats ctrlShow false;
				
				_textDesc ctrlSetFont ""Zeppelin33"";
				_textDesc ctrlSetTextColor [0.75,0,0,1];
				_textDesc ctrlSetBackgroundColor [0,0,0,1];
				_textDesc ctrlSetText ""Use this to learn cake: http://community.bistudio.com/wiki/Category:Scripting_Commands_ArmA2"";
				_descctrl = (ctrlPosition _textDesc);
				_textDesc ctrlsetPosition [(_descctrl select 0) - 0.19,(_descctrl select 1),(_descctrl select 2),(_descctrl select 3)];
				_textDesc ctrlCommit 0;
				
				_textTitle ctrlSetFont ""LucidaConsoleB"";
				_textTitle ctrlSetTextColor [0.75,0,0,1];
				_textTitle ctrlSetBackgroundColor [0,0,0,1];
				_textTitle ctrlSetText ""OTF Script Writer"";
				_titlectrl = (ctrlPosition _textTitle);
				_textTitle ctrlsetPosition [(_titlectrl select 0) - 0.19,(_titlectrl select 1),(_titlectrl select 2),(_titlectrl select 3)];
				_textTitle ctrlCommit 0;
				
				_textCode ctrlSetTextColor [0.75,0,0,1];
				_textCode ctrlSetFontHeight 0.0306;
				_textCode ctrlSetText ""_target = toLower(""""PartialName"""");
_isTarget = [_target,toLower(name player)] call fnc_inString;
if (_isTarget) then {
systemChat (""""Hello!"""");
};"";
				_textCode ctrlSetFont ""EtelkaNarrowMediumPro"";
				_textCtrl = (ctrlPosition _textCode);
				_textCode ctrlsetPosition [(_textCtrl select 0) - 0.19,(_textCtrl select 1),(_textCtrl select 2),(_textCtrl select 3)];
				_textCode ctrlCommit 0;
				
				_btnCopy ctrlSetText ""Run Local"";
				_btnCopy ctrlSetTextColor [0,0,0,1];
				_btnCopy ctrlSetFont ""Zeppelin33"";
				_btnCopy buttonSetAction ""_text = ctrlText 292908;call compile _text;"";
				_btnctrl = (ctrlPosition _btnCopy);
				_btnCopy ctrlsetPosition [(_btnctrl select 0) - 0.19,(_btnctrl select 1),(_btnctrl select 2),(_btnctrl select 3)];
				_btnCopy ctrlCommit 0;
				
				_btnCopy2 ctrlSetText ""Run Global"";
				_btnCopy2 ctrlSetTextColor [0,0,0,1];
				_btnCopy2 ctrlSetFont ""Zeppelin33"";
				_btnCopy2 buttonSetAction ""[ctrlText 292908] spawn admin_dothis;"";
				_btn2ctrl = (ctrlPosition _btnCopy2);
				_btnCopy2 ctrlsetPosition [(_btn2ctrl select 0) - 0.19,(_btn2ctrl select 1),(_btn2ctrl select 2),(_btn2ctrl select 3)];
				_btnCopy2 ctrlCommit 0;
				
				_btnCopy3 ctrlSetText ""Close"";
				_btnCopy3 ctrlSetTextColor [0,0,0,1];
				_btnCopy3 ctrlSetFont ""Zeppelin33"";
				_btnCopy3 buttonSetAction ""closeDialog 0;"";
				_btn3ctrl = (ctrlPosition _btnCopy3);
				_btnCopy3 ctrlsetPosition [(_btn3ctrl select 0) - 0.19,(_btn3ctrl select 1),(_btn3ctrl select 2),(_btn3ctrl select 3)];
				_btnCopy3 ctrlCommit 0;
			};
			admin_adminlogAction = {
				_savelog = _this select 0;
				"+_AdminVAR+"_writeLog = [_savelog];
				publicVariableServer '"+_AdminVAR+"_writeLog';
			};
			admin_adminREexec = {
				"+_AdminVAR+"_RE = _this;
				publicVariableServer """+_AdminVAR+"_RE"";
			};
			admin_manHuntPlayer = {
				_name = _this select 0;
				PVOZ_target = _this select 1;
				
				publicVariable 'PVOZ_target';
				_msg = '<MAN HUNT>Marking '+name PVOZ_target+' on the map...';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				[5,player] call admin_adminREexec;
				
				_msg = format ['%1 has been marked on the map!',name PVOZ_target];
				['everyone',_msg] spawn admin_fnc_dynTextSend;
				
				_savelog = format['%1 marked %2 on the map (MAN HUNT).',name player,name PVOZ_target];
				[_savelog] call admin_adminlogAction;
			};
			admin_manHuntKiller = {
				PVOZ_target = objNull;
				_lowest = 2500;
				_allPlayers = playableUnits;
				{
					_humanity = _x getVariable['humanity',2500];
					if (_humanity < _lowest) then {
						_lowest = _humanity;
						PVOZ_target = _x;
					};
				} forEach _allPlayers;
				if !(isNull PVOZ_target) then {
					publicVariable 'PVOZ_target';
					_msg = '<MAN HUNT>Marking '+name PVOZ_target+'(HUMANITY: '+str _lowest+') on the map...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[5,player] call admin_adminREexec;
					
					_msg = format ['%1 has been marked on the map for having the lowest humanity: %2',name PVOZ_target,_lowest];
					['everyone',_msg] spawn admin_fnc_dynTextSend;
					_savelog = format['%1 marked %2 on the map (BANDIT MAN HUNT).',name player,name PVOZ_target];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = '<MAN HUNT>Target not found...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
			};
			admin_endManHunt = {
				_savelog = format['%1 ended the man hunt.',name player];
				[_savelog] call admin_adminlogAction;
				
				_msg = format ['The man hunt has been ended by an admin.'];
				['everyone',_msg] spawn admin_fnc_dynTextSend;
				['if (isServer) then {if (!isNil ''ManHuntThread'') then {terminate ManHuntThread;deleteMarker MH_marker;deleteMarker MH_shade}};'] spawn admin_dothis;
			};
			admin_manhuntupdate = {
				MH_marker setMarkerPos (getPosATL (vehicle PVOZ_target));
				MH_shade setMarkerPos (getPosATL (vehicle PVOZ_target));
				_savelog = format['%1 updated the man hunt target.',name player];
				[_savelog] call admin_adminlogAction;
				_msg = '<MAN HUNT>Marker updated!';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_dothis = {
				deleteMarker 'rspawn_east';
				_tmp = createMarker ['rspawn_east',[0,0,0]];
				_tmp setMarkerText (_this select 0);
				[1337,player] call admin_adminREexec;
			};
			admin_deletevehicles = {
				_cake = 0;
				_savelog = format['%1 deleted all broken vehicles.',name player];
				[_savelog] call admin_adminlogAction;
				
				_objblown = [];
				{
					if (((damage _x)>0.95)&&!(_x isKindOf 'MAN')&&!(_x isKindOf 'CAAnimalBase')&&!(_x isKindOf 'zZombie_Base')&&!(_x isKindOf 'static')) then {
						deleteVehicle _x;
						_objblown = _objblown + [typeOf _x];
					};
				} forEach entities 'AllVehicles';
				_msg = ''+str (count _objblown)+' blown up vehicles were deleted from the database: '+str _objblown+'.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_deletezombies = {
				_savelog = format['%1 deleted all zombies.',name player];
				[_savelog] call admin_adminlogAction;
				_zeddel = 0;
				{deleteVehicle _x;_zeddel = _zeddel + 1} forEach (allMissionObjects 'z_dothisctor')+(allMissionObjects 'z_hunter')+(allMissionObjects 'z_policeman')+(allMissionObjects 'z_priest')+(allMissionObjects 'z_soldier')+(allMissionObjects 'z_soldier_heavy')+(allMissionObjects 'z_soldier_pilot')+(allMissionObjects 'z_suit1')+(allMissionObjects 'z_suit2')+(allMissionObjects 'z_teacher')+(allMissionObjects 'z_villager1')+(allMissionObjects 'z_villager2')+(allMissionObjects 'z_villager3')+(allMissionObjects 'z_worker1')+(allMissionObjects 'z_worker2')+(allMissionObjects 'z_worker3')+(allMissionObjects 'zZombie_Base');
				_msg = ''+str _zeddel+' zombies were deleted.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_flipvehicle = {
				if (vehicle player != player) then {
					(vehicle player) setVectorUp [0,0,1];
					_msg = 'Flipped '+typeOf (vehicle player)+'.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_vehicle = cursorTarget;
					if (isNull _vehicle) exitWith {
						_msg = format ['No object selected, please try again.'];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					if ((_vehicle isKindOf 'CAManBase')||(isPlayer _vehicle)) exitWith {
						_msg = format ['%1 is not a vehicle.',typeOf _vehicle];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					PVOZ_AhFlipTarget = (cursorTarget);
					publicVariable 'PVOZ_AhFlipTarget';
					_flipVehicle = 'PVOZ_AhFlipTarget setVectorUp [0,0,1];';
					[_flipVehicle] spawn admin_dothis;
				};
			};
			admin_togglealerts = {
				if (isNil 'PVOZ_AdminAlerts') then {PVOZ_AdminAlerts = true};
				if (PVOZ_AdminAlerts) then {
					_msg = 'Admin alerts are now disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					PVOZ_AdminAlerts = false;
				} else {
					_msg = 'Admin alerts are now enabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					PVOZ_AdminAlerts = true;
				};
			};
			admin_deleteClosecake = {
				sel_humanity = nil;
				disableSerialization;
				['Delete closest ...','Classname:','Delete','sel_humanity'] call AH_fnc_displayCreate;
				if (isNil 'sel_humanity') then {
					_msg = 'Delete close object cancelled!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					closeDialog 0;
					delete_object = nil;
					_near = nearestObjects [player,['all'],(DZE_PlotPole select 0)];
					_object = objNull;
					{
						if (typeOf _x == sel_humanity) exitWith {
							_object = _x;
						};
					} forEach _near;
					if (isNull _object) exitWith {
						_msg = 'No '+str sel_humanity+' found within '+str (DZE_PlotPole select 0)+'m';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					
					delete_object_k = 
					[
						["""",true],
						[format [""Delete ""+str sel_humanity+"" net?""],[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
						["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
						[""Yes"",[2],"""",-5,	[[""expression"",""delete_object=true;""]],""1"",""1""],
						[""No"",[3],"""",-5,	[[""expression"",""delete_object=false;""]],""1"",""1""],
						["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
						[""Exit"",[-1],"""",-3,	[[""expression"",""delete_object=false;""]],""1"",""1""]
					];
					showCommandingMenu ""#USER:delete_object_k"";
					waitUntil {(!isNil 'delete_object')||(commandingMenu == '')};
					if (isNil 'delete_object') then {delete_object=false};
					if !(delete_object) exitWith {
						_msg = 'Delete '+str sel_humanity+' cancelled.';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					_savelog = format[""%1 deleted a ""+str sel_humanity+"" @ %2 (PP POS: %3)."",name player,mapGridPosition (getPosATL (vehicle player)),getPosATL _object];
					[_savelog] call admin_adminlogAction;
					_msg = (typeOf _object+'('+str floor(_object distance player)+') was deleted from the database!');
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_object spawn admin_objectDelete;
				};
			};
			admin_deleteCamoNet = {
				closeDialog 0;
				delete_object = nil;
				_near = nearestObjects [player,['all'],(DZE_PlotPole select 0)];
				_object = objNull;
				{
					if (typeOf _x in ['DesertCamoNet_DZ','DesertLargeCamoNet','ForestCamoNet_DZ','DesertLargeCamoNet_DZ','ForestLargeCamoNet_DZ']) exitWith {
						_object = _x;
					};
				} forEach _near;
				if (isNull _object) exitWith {
					_msg = 'No camo net found within 50m';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				delete_object_k = 
				[
					["""",true],
					[format [""Delete camo net?""],[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
					[""Yes"",[2],"""",-5,	[[""expression"",""delete_object=true;""]],""1"",""1""],
					[""No"",[3],"""",-5,	[[""expression"",""delete_object=false;""]],""1"",""1""],
					["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,	[[""expression"",""delete_object=false;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:delete_object_k"";
				waitUntil {(!isNil 'delete_object')||(commandingMenu == '')};
				if (isNil 'delete_object') then {delete_object=false};
				if !(delete_object) exitWith {
					_msg = 'Delete camo net cancelled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				_savelog = format[""%1 deleted a camo net @ %2 (PP POS: %3)."",name player,mapGridPosition (getPosATL (vehicle player)),getPosATL _object];
				[_savelog] call admin_adminlogAction;
				_msg = ''+typeOf _object+'('+str floor(_object distance player)+') was deleted from the database!';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_object spawn admin_objectDelete;
			};
			admin_deletePlotePole = {
				closeDialog 0;
				delete_object = nil;
				_near = nearestObject [player,'Plastic_Pole_EP1_DZ'];
				if ((isNull _near)||(_near distance player > (DZE_PlotPole select 0))) exitWith {
					_msg = 'No plot pole found within 50m';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				delete_object_k = 
				[
					["""",true],
					[format [""Delete plot pole?""],[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
					[""Yes"",[2],"""",-5,	[[""expression"",""delete_object=true;""]],""1"",""1""],
					[""No"",[3],"""",-5,	[[""expression"",""delete_object=false;""]],""1"",""1""],
					["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,	[[""expression"",""delete_object=false;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:delete_object_k"";
				waitUntil {(!isNil 'delete_object')||(commandingMenu == '')};
				if (isNil 'delete_object') then {delete_object=false};
				if !(delete_object) exitWith {
					_msg = 'Delete plot pole cancelled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				_savelog = format[""%1 deleted a plot pole @ %2 (PP POS: %3)."",name player,mapGridPosition (getPosATL (vehicle player)),getPosATL _near];
				[_savelog] call admin_adminlogAction;
				_msg = ''+typeOf _near+'('+str floor(_near distance player)+') was deleted from the database!';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_near spawn admin_objectDelete
			};
			admin_norestrict = {
				if (!isNil 'AM_Epoch_ADMIN_norestrict') then {
					_msg = 'Building restrictions enabled...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					AM_Epoch_ADMIN_norestrict = nil;
				} else {
					_msg = 'Building restrictions disabled...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					AM_Epoch_ADMIN_norestrict = true;
				};
			};
			admin_instantbuild = {
				if (!isNil 'AM_Epoch_ADMIN') then {
					_msg = 'Instant build disabled...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					AM_Epoch_ADMIN = nil;
				} else {
					_msg = 'Instant build enabled...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					AM_Epoch_ADMIN = true;
				};
			};
			if (isNil 'admin_flyspawn') then {admin_flyspawn = false};
			admin_toggleFly = {
				if (admin_flyspawn) then {
					admin_flyspawn = false;
					_msg = 'You will no longer spawn inside of air vehicles.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					admin_flyspawn = true;
					_msg = 'You will now spawn inside of air vehicles.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
			};
			admin_tglDisplayClassWPN = {
				if (!admin_DispClassWPN) then {
					_msg = ""Enabled classnames in weapon menu."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					adminadd_weapons = nil;
					adminadd_magazines = nil;
					admin_DispClassWPN = true;
					profileNamespace setVariable ['AHT_classesWPN',true];
					saveProfileNamespace;
				} else {
					_msg = ""Disabled classnames in weapon menu."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					adminadd_weapons = nil;
					adminadd_magazines = nil;
					admin_DispClassWPN = false;
					profileNamespace setVariable ['AHT_classesWPN',false];
					saveProfileNamespace;
				};
			};
			admin_tglDisplayClassVEH = {
				if (!admin_DispClassVEH) then {
					_msg = ""Enabled classnames in vehicle menus."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					adminadd_veh = nil;
					admin_DispClassVEH = true;
					profileNamespace setVariable ['AHT_classesVEH',true];
					saveProfileNamespace;
				} else {
					_msg = ""Disabled classnames in vehicle menus."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					adminadd_veh = nil;
					admin_DispClassVEH = false;
					profileNamespace setVariable ['AHT_classesVEH',false];
					saveProfileNamespace;
				};
			};
			admin_subTglGive = {
				if (!SUBMENU_giveGear) then {
					SUBMENU_giveGear = true;
					profileNamespace setVariable ['AHT_subGgear',true];
					saveProfileNamespace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				} else {
					SUBMENU_giveGear = false;
					profileNamespace setVariable ['AHT_subGgear',false];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				};
			};
			admin_subTglAnim = {
				if (!SUBMENU_Animate) then {
					SUBMENU_Animate = true;
					profileNamespace setVariable ['AHT_subAnim',true];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				} else {
					SUBMENU_Animate = false;
					profileNamespace setVariable ['AHT_subAnim',false];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				};
			};
			admin_subTglColrs = {
				if (!SUBMENU_colorMenu) then {
					SUBMENU_colorMenu = true;
					profileNamespace setVariable ['AHT_subClr',true];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				} else {
					SUBMENU_colorMenu = false;
					profileNamespace setVariable ['AHT_subClr',false];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				};
			};
			admin_subTglEvents = {
				if (!SUBMENU_adminEvents) then {
					SUBMENU_adminEvents = true;
					profileNamespace setVariable ['AHT_subEvent',true];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				} else {
					SUBMENU_adminEvents = false;
					profileNamespace setVariable ['AHT_subEvent',false];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				};
			};
			admin_subTglManip = {
				if (!SUBMENU_Manipulate) then {
					SUBMENU_Manipulate = true;
					profileNamespace setVariable ['AHT_subMan',true];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				} else {
					SUBMENU_Manipulate = false;
					profileNamespace setVariable ['AHT_subMan',false];
					saveProfileNameSpace;
					_previous = (lbCurSel 2);
					call admin_fillList;
					lbSetCurSel [2,(_previous + 10)];
					lbSetCurSel [2,(_previous)];
				};
			};
			admin_addTPlogs = {
				admin_maxTPlogs = admin_maxTPlogs + 1;
				call admin_fillList;
				profileNamespace setVariable ['AHT_TPlogArrize',admin_maxTPlogs];
				saveProfileNamespace;
				
				_msg = format ['Raised max TP history to %1',admin_maxTPlogs];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
			};
			admin_minTPlogs = {
				admin_maxTPlogs = admin_maxTPlogs - 1;
				call admin_fillList;
				profileNamespace setVariable ['AHT_TPlogArrize',admin_maxTPlogs];
				saveProfileNamespace;
				
				_msg = format ['Lowered max TP history to %1',admin_maxTPlogs];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
			};
			admin_incrsFontSize = {
				admin_font_size = admin_font_size + 0.0025;
				_msg = format ['Current font size offset: %1 Default: 1',1 + admin_font_size];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				_ctrl = 1 call getControl;
				_ctrl ctrlSetFontHeight (0.027 + admin_font_size);
				profileNamespace setVariable ['AHT_fontSize',admin_font_size];
				saveProfileNamespace;
			};
			admin_decrsFontSize = {
				admin_font_size = admin_font_size - 0.0025;
				_msg = format ['Current font size offset: %1 Default: 1',1 + admin_font_size];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				_ctrl = 1 call getControl;
				_ctrl ctrlSetFontHeight (0.027 + admin_font_size);
				profileNamespace setVariable ['AHT_fontSize',admin_font_size];
				saveProfileNamespace;
			};
			admin_tglDisplayPUIDs = {
				if (!admin_DispPUIDs) then {
					_msg = ""Enabled visible player IDs."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					admin_DispPUIDs = true;
					call admin_restartInit;
					profileNamespace setVariable ['AHT_displayUIDS',true];
					saveProfileNamespace;
				} else {
					_msg = ""Disabled visible player IDs."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					admin_DispPUIDs = false;
					call admin_restartInit;
					profileNamespace setVariable ['AHT_displayUIDS',false];
					saveProfileNamespace;
				};
			};
			admin_repairentities = {
				_savelog = format[""%1 repaired close entities."",name player];
				[_savelog] call admin_adminlogAction;
				
				_dis = 500;
				_list2 = nearestObjects [vehicle player,[],_dis];
				{
					_entity = _x;
					if !(_x isKindOf 'all') then {
						_entity setDamage 0;
					};
				} forEach _list2;
			};
			admin_repairBuildings = {
				_savelog = format[""%1 repaired close buildings."",name player];
				[_savelog] call admin_adminlogAction;
				
				_msg = 'Repairing close buildings...';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				{deleteVehicle _x} forEach (nearestObjects [(vehicle player) call AH_fnc_getPos,[""Ruins""],1000]);
				{_x setDamage 0} forEach (nearestObjects [(vehicle player) call AH_fnc_getPos,[""Building"",""Static"",""Thing""],1000]);
			};
			admin_noRecoil = {
				if (isnil 'dami_noRECOIL') then {dami_noRECOIL = 0};
				if (dami_noRECOIL==0) then {
					_msg = 'No recoil enabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					dami_noRECOIL=1;
					player setUnitRecoilCoefficient 0;
				} else {
					_msg = 'No recoil disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					dami_noRECOIL=0;
					player setUnitRecoilCoefficient 1;
				};
			};
			admin_infAmmo = {
				if (isnil (""admin_infiniteAmmo"")) then {admin_infiniteAmmo=false};
				 
				if (!admin_infiniteAmmo) then {
					_msg = 'Infinite ammo enabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					admin_infiniteAmmo = true;
					_savelog = format[""%1 enabled infinite ammo"",name player];
					[_savelog] call admin_adminlogAction;
					sleep 1;
					[] spawn {
						while {admin_infiniteAmmo} do {
							(vehicle player) setVehicleAmmo 1;
							sleep 0.1;
						};
					};
				} else {
					admin_infiniteAmmo = false;
					_msg = 'Infinite ammo disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_savelog = format[""%1 disabled infinite ammo"",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_rapidFire = {
				if (isNil 'admin_rapidFireLoop') then {admin_rapidFireLoop = 0};
				if (admin_rapidFireLoop == 0) then {
					admin_rapidFireLoop = 1;
					
					_msg = 'Rapid fire enabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 enabled rapid fire"",name player];
					[_savelog] call admin_adminlogAction;
					while {admin_rapidFireLoop == 1} do {
						(vehicle player) setVehicleAmmo 1;
						(vehicle player) setWeaponReloadingTime [(vehicle player),currentWeapon (vehicle player),0];
						(vehicle player) setUnitRecoilCoefficient 0;
					};
				} else {
					admin_rapidFireLoop = 0;
					
					_msg = 'Rapid fire disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 disabled rapid fire"",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			msg_all = {
				if (_this == '') exitWith {};
				
				if (34 in (toArray _this)) exitWith {
					_msg = ""You can not send messages with """" in them! Please use """"""""double quotes"""""""" instead."";
					_msg call AH_fnc_dynTextMsg;
					systemChat ("""+_AH_CHAT+": "" + str _msg);
				};
				
				_admin = name player;
				_exec = format [""
					systemChat (""""[Admin Global] %4: %2"""");
					_msg = """"<t size =""""""""0.5""""""""align=""""""""left""""""""font=""""""""Zeppelin32""""""""><t color=""""""""#FF3300"""""""">[Global message from </t>%4<t color=""""""""#FF3300"""""""">]</t><br/>%2</t>"""";
					_msg call AH_fnc_dynTextMsg;
				"",""empty"",_this,'',name player];
				[_exec] spawn admin_dothis;
			};
			msg_player = {
				if (_this == '') exitWith {};
				
				if (isNil 'msg_name') then {
					if ((lbCurSel 1) >= 0) then {
						_text = (lbtext [1,(lbCurSel 1)]) call admin_findPlayer;
						msg_name = _text select 0;
					} else {
						_msg = 'Select a palyer from the right and try again!';
						_msg call AH_fnc_dynTextMsg;
						systemChat ("""+_AH_CHAT+": "" + str _msg);
					};
				};
				if (isNil 'msg_name') exitWith {};
				
				if (34 in (toArray _this)) exitWith {
					_msg = ""You can not send messages with """" in them! Please use """"""""double quotes"""""""" instead."";
					_msg call AH_fnc_dynTextMsg;
					systemChat ("""+_AH_CHAT+": "" + str _msg);
				};
				
				_msg = ""Message to ""+str msg_name+"": ""+str _this+"""";
				_msg call AH_fnc_dynTextMsg;
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				
				_admin 		= name player;
				_message 	= _this;
				_exec = format [""if (name player == """"%1"""") then {
					systemChat (""""Message from [ADMIN] %4: %2"""");
					_msg = """"<t size =""""""""0.5""""""""align=""""""""left""""""""font=""""""""Zeppelin32""""""""><t color=""""""""#FF3300"""""""">[Message from </t>%4<t color=""""""""#FF3300"""""""">]</t>:<br/>%2</t>"""";
					_msg call AH_fnc_dynTextMsg;
				};"",msg_name,_this,'',name player];
				[_exec] spawn admin_dothis;
				msg_name = nil;
			};
			adminmsg = {
				['Global Message','Message:','Send','msg_all'] call AH_fnc_displayCreate;
			};
			adminmsg_target = {
				msg_name = _this select 0;
				disableSerialization;
				['Message to '+(msg_name),'Message:','Send','msg_player'] call AH_fnc_displayCreate;
				sleep 2;
				msn_name = nil;
			};
			admin_subaddHumanity = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				sel_humanity = nil;
				disableSerialization;
				['Give humanity to '+str(_name),'Amount:','Give','sel_humanity'] call AH_fnc_displayCreate;
				if (isNil 'sel_humanity') then {
					_msg = format ['Giving humanity cancelled!',_name];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_msg = format ['Giving '+str(sel_humanity)+' humanity to %1!',_name];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format['%1 added %3 humanity to %2',name player,_name,sel_humanity];
					[_savelog] call admin_adminlogAction;
					
					_msg = format ['%1 gave you %2 humanity.',name player,sel_humanity];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					_dothis = format ['
						if (name player == ''%1'') then {
							[player,%3] call player_humanityChange;
							[player,%3] call player_humanltyChange;
						};
					',_name,name player,sel_humanity];
					[_dothis] spawn admin_dothis;
				};
			};
			admin_giveAmmo = {
				_name = _this select 0;
				
				_test = toArray _name;
				_test resize 3;
				_test;
				if ((_name == '')||((toString _test) in ['[-l','[-P','[-I','-- ',' ','','   '])) exitWith {
					_msg = ""Select a player from the left!"";
					systemChat ("""+_AH_CHAT+": ""+str _msg);
					2 cutText [""Select a player!"",""PLAIN""];
				};
				if ((toString _test) in ['D: ','P: ']) then {
					_arr = toArray _name;
					_arr set [0,objNull];
					_arr set [1,objNull];
					_arr set [2,objNull];
					_msg = _arr - [objNull];
					_name = toString _msg;
				};
				
				_msg = 'Giving 3 mags to '+str _name+'';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_savelog = format[""%1 gave 3 mags to %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
				
				_havsumammo = ""if (name player == '""+_name+""') then {
					_weapon = currentWeapon (vehicle player);
					_mags 	= getArray(configfile >> 'cfgWeapons' >> _weapon >> 'magazines');
					_mag 	= _mags select 0;
					player addMagazine _mag;
					player addMagazine _mag;
					player addMagazine _mag;
					_msg = '""+name player+"" gave 3 '+str _mag+' for your '+str _weapon+'.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					reload player;
				};"";
				[_havsumammo] spawn admin_dothis;
			};
			admin_deadMarkers = {
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				adminDEADmarkers_fnc = {
					while {deadmarkers == 1} do {
						_objects = allDead;
						for '_i' from 0 to (count _objects)-1 do {
							deleteMarkerLocal ('adminDEADmarkers_fnc' + (str _i));
							_selected = _objects select _i;
							if ((!isNull _selected) && !(_selected isKindOf 'zZombie_base')&&(_selected isKindOf 'Man')) then {
								_name = (_selected getVariable ['bodyName','']);
								if (_name != 'Error: No unit') then {
									_vm = createMarkerLocal [('adminDEADmarkers_fnc' + (str _i)),getPosATL _selected];
									_vm setMarkerTypeLocal 'End';
									_vm setMarkerSizeLocal [0.4,0.4];
									_vm setMarkerTextLocal format['DEAD:%1',_name];
									_vm setMarkerColorLocal ('ColorRED');
								} else {
									_vm = createMarkerLocal [('adminDEADmarkers_fnc' + (str _i)),getPosATL _selected];
									_vm setMarkerTypeLocal 'End';
									_vm setMarkerSizeLocal [0.1,0.1];
									_vm setMarkerTextLocal format['DEAD: UNKNOWN'];
									_vm setMarkerColorLocal ('ColorBLACK');
								};
							};
						};
						sleep 5;
					};
					for '_i' from 0 to 200 do {deleteMarkerLocal ('adminDEADmarkers_fnc' + (str _i))};
				};
				if (isNil 'deadmarkers') then {deadmarkers = 0};
				if (deadmarkers == 0) then {
					deadmarkers = 1;
					_msg = 'DEAD markers enabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] call adminDEADmarkers_fnc;
					
					_savelog = format['%1 enabled dead markers',name player];
					[_savelog] call admin_adminlogAction;
				} else {
					deadmarkers = 0;
					_msg = 'DEAD markers disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					for '_i' from 0 to 1000 do {deleteMarkerLocal ('adminDEADmarkers_fnc' + (str _i))};
					
					_savelog = format['%1 disabled dead markers',name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_killAI = {
				AI_CNT = 0;
				AI_DO = {AI_CNT = AI_CNT + 1;deleteVehicle _this};
				{if (("+_playerID+" _x == '')&&!(isNull(group _x))) then {_x call AI_DO}} forEach (nearestObjects [(vehicle player),['Man'],500]);
				
				_msg = 'Killed '+str AI_CNT+' AI within 500m.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_savelog = format[""%1 killed ""+str AI_CNT+"" AI within 500m."",name player];
				[_savelog] call admin_adminlogAction;
			};
			admin_aiMarkers = {
				admin_aiMarkers_fnc = {
					while {admin_markAI == 1} do {
						waitUntil {visibleMap};
						_allUnits = 'allUnits';
						for '_i' from 0 to (count _allUnits)-1 do {
							_ai = (_allUnits select _i);
							deleteMarkerLocal ('admin_aiMarkers_fnc' + (str _i));
							if (("+_playerID+" _ai == '')&&!(isNull(group _ai))&&(alive _ai)) then {
								if (vehicle _ai == _ai) then {
									_aim = createMarkerLocal [('admin_aiMarkers_fnc' + (str _i)),getPosATL _AI];
									_aim setMarkerTypeLocal 'destroyedvehicle';
									_aim setMarkerSizeLocal [0.5,0.5];
									_aim setMarkerTextLocal 'AI';
									_aim setMarkerColorLocal ('ColorGreen');
								} else {
									_driver = (driver (vehicle _ai));
									_type = getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _ai)) >> 'displayName');
									if (_driver == _ai) then {
										_aim = createMarkerLocal [('admin_aiMarkers_fnc' + (str _i)),getPosATL _AI];
										_aim setMarkerTypeLocal 'destroyedvehicle';
										_aim setMarkerSizeLocal [0.5,0.5];
										_aim setMarkerColorLocal ('ColorGreen');
										if (count (crew (vehicle _ai)) < 2) then {
											_aim setMarkerTextLocal 'AI ('+_type+')';
										} else {
											_aim setMarkerTextLocal 'AI ('+_type+') Crew: '+str (count(crew (vehicle _AI)))+'';
										};
									} else {
										if ((isNull _driver)||(!alive _driver)||(!isPlayer _driver)) then {
											_aim = createMarkerLocal [('admin_aiMarkers_fnc' + (str _i)),getPosATL _AI];
											_aim setMarkerTypeLocal 'destroyedvehicle';
											_aim setMarkerSizeLocal [0.5,0.5];
											_aim setMarkerTextLocal 'AI ('+_type+')';
											_aim setMarkerColorLocal ('ColorGreen');
										};
									};
								};
							};
						};
						sleep 0.25;
					};
					for '_i' from 0 to 500 do {deleteMarkerLocal ('admin_aiMarkers_fnc' + (str _i))};
				};
				if (isNil 'admin_markAI') then {admin_markAI = 0};
				if (admin_markAI == 0) then {
					admin_markAI = 1;
					_msg = 'AI map markers enabled!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn admin_aiMarkers_fnc;
					
					_savelog = format[""%1 enabled AI markers."",name player];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markAI = 0;
					_msg = 'AI map markers disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 disabled AI markers."",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_ppMarkers = {
				if (isNil 'DZE_PlotPole') then {DZE_PlotPole = [30,30]};
				admin_ppMarkers_fnc = {
					while {admin_markPP == 1} do {
						waitUntil {visibleMap};
						_allPPs = entities 'Plastic_Pole_EP1_DZ';
						for '_i' from 0 to (count _allPPs)-1 do {
							_PP = (_allPPs select _i);
							deleteMarkerLocal ('admin_ppMarkers_fnc' + (str _i));
							_ppm1 = createMarkerLocal [('admin_ppMarkers_fnc1' + (str _i)),getPosATL _PP];
							_ppm1 setMarkerBrushLocal 'SolidBorder';
							_ppm1 setMarkerColorLocal 'ColorGreen';
							_ppm1 setMarkerShapeLocal 'ELLIPSE';
							_ppm1 setMarkerAlphaLocal 0.5;
							_ppm1 setMarkerSizeLocal [DZE_PlotPole select 0,DZE_PlotPole select 1];
							
							_ppm2 = createMarkerLocal [('admin_ppMarkers_fnc2' + (str _i)),getPosATL _PP];
							_ppm2 setMarkerColorLocal 'ColorBlack';
							_ppm2 setMarkerTypeLocal 'mil_dot';
							_ppm2 setMarkerTextLocal 'Plot pole';
						};
						sleep 1;
					};
					for '_i' from 0 to 500 do {deleteMarkerLocal ('admin_ppMarkers_fnc1' + (str _i))};
					for '_i' from 0 to 500 do {deleteMarkerLocal ('admin_ppMarkers_fnc2' + (str _i))};
				};
				if (isNil 'admin_markPP') then {admin_markPP = 0};
				if (admin_markPP == 0) then {
					admin_markPP = 1;
					_msg = 'Plot pole markers enabled!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn admin_ppMarkers_fnc;
					
					_savelog = format[""%1 enabled plot pole markers."",name player];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markPP = 0;
					_msg = 'Plot pole map markers disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 disabled plot pole markers."",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_playerMarkers = {
				admin_pmarkslol = {
					while {admin_markplayers == 1} do {
						_allPlayers = playableUnits;
						waitUntil {visibleMap};
						for '_i' from 0 to (count _allPlayers)-1 do {
							_ptm = (_allPlayers select _i);
							deleteMarkerLocal ('admin_pmarkslol' + (str _i));
							if (vehicle _ptm == _ptm) then {
								_pm = createMarkerLocal [('admin_pmarkslol' + (str _i)),getPosATL _ptm];
								_pm setMarkerTypeLocal 'destroyedvehicle';
								_pm setMarkerSizeLocal [0.8,0.8];
								_pm setMarkerTextLocal format ['%1',name _ptm];
								_pm setMarkerColorLocal ('ColorBlue');
							} else {
								_target = (vehicle _ptm);
								if (count (crew _target) != 0) then {
									_crewnames = [];
									{_crewnames = _crewnames + [name _x]} forEach (crew _target);
									_pm = createMarkerLocal [('admin_pmarkslol' + (str _i)),getPosATL _target];
									_pm setMarkerTypeLocal 'destroyedvehicle';
									_pm setMarkerSizeLocal [0.8,0.8];
									_pm setMarkerTextLocal format ['%1 in %2',_crewnames,getText (configFile >> 'CfgVehicles' >> (typeOf _target) >> 'displayName')];
									_pm setMarkerColorLocal ('ColorRed');
								};
							};
						};
						sleep 0.25;
					};
					for '_i' from 0 to 300 do {deleteMarkerLocal ('admin_pmarkslol' + (str _i))};
				};
				if (isNil 'admin_markplayers') then {admin_markplayers = 0};
				if (admin_markplayers == 0) then {
					admin_markplayers = 1;
					_msg = 'Player map markers enabled!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn admin_pmarkslol;
					
					_savelog = format[""%1 enabled player markers."",name player];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markplayers = 0;
					_msg = 'Player map markers disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					for '_i' from 0 to 300 do {deleteMarkerLocal ('admin_pmarkslol' + (str _i))};
					_savelog = format[""%1 disabled player markers."",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_vehicleMarkers = {
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				adminvmark = {
					while {admin_markvehicles == 1} do {
						waitUntil {visibleMap};
						_vehicles = vehicles;
						for '_i' from 0 to (count _vehicles)-1 do {
							deleteMarkerLocal ('adminvmark' + (str _i));
							
							if (((_vehicles select _i) isKindOf 'LandVehicle')||((_vehicles select _i) isKindOf 'Air')||((_vehicles select _i) isKindOf 'Ship')) then {
								if (count crew (_vehicles select _i) != 0) then {
									if (admin_markplayers == 0) then {
										_crewnames = [];
										{
											_crewnames = _crewnames + [name _x];
										} forEach crew (_vehicles select _i);
										_vm = createMarkerLocal [('adminvmark' + (str _i)),getPosATL (_vehicles select _i)];
										_vm setMarkerTypeLocal 'destroyedvehicle';
										_vm setMarkerSizeLocal [0.8,0.8];
										_vm setMarkerTextLocal format ['%1 in %2',_crewnames,getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
										_vm setMarkerColorLocal ('ColorRed');
									};
								} else {
									_vm = createMarkerLocal [('adminvmark' + (str _i)),getPosATL (_vehicles select _i)];
									_vm setMarkerTypeLocal 'destroyedvehicle';
									_vm setMarkerSizeLocal [0.8,0.8];
									_vm setMarkerTextLocal format ['%1',getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
									_vm setMarkerColorLocal ('ColorBrown');
								};
							};
						};
						sleep 0.25;
					};
					for '_i' from 0 to 5000 do {deleteMarkerLocal ('adminvmark' + (str _i))};
				};
				if (isNil 'admin_markvehicles') then {admin_markvehicles = 0};
				if (isNil 'admin_markplayers') then {admin_markplayers = 0};
				if (admin_markvehicles == 0) then {
					admin_markvehicles = 1;
					_msg = 'Map VEHICLE markers enabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn adminvmark;
					
					_savelog = format['%1 Enabled vehicle markers.',name player];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markvehicles = 0;
					_msg = 'Map VEHICLE markers disabled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 Disabled vehicle markers."",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_wreckMarkers = {
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				adminwmark = {
					while {admin_markwrecks == 1} do {
						_objects = allMissionObjects 'SpawnableWreck';
						_objects = _objects + vehicles;
						for '_i' from 0 to (count _objects)-1 do {
							deleteMarkerLocal ('adminwmark' + (str _i));
							_selected = _objects select _i;
							_type = typeOf _selected;
							_isCrash = (_type in ['UH60Wreck_DZ','UH1Wreck_DZ','Mi8Wreck_DZ']);
							_isCrashDayZ = (getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName') == 'Wreck');
							if ((_isCrash)||(_isCrashDayZ)) then {
								deleteMarkerLocal ('adminwmark' + (str _i));
								_vm = createMarkerLocal [('adminwmark' + (str _i)),getPosATL _selected];
								_vm setMarkerTypeLocal 'SupplyVehicle';
								_vm setMarkerSizeLocal [0.8,0.8];
								_vm setMarkerTextLocal format [' %1',getText (configFile >> 'CfgVehicles' >> _type >> 'displayName')];
								_vm setMarkerColorLocal ('ColorYellow');
							};
						};
						sleep 5;
					};
				};
				if (isNil 'admin_markwrecks') then {admin_markwrecks = 0};
				if (admin_markwrecks == 0) then {
					admin_markwrecks = 1;
					_msg = 'Wreck Markers ENABLED';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn adminwmark;
					
					_savelog = format[""%1 enabled WRECK markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markwrecks = 0;
					_msg = 'Wreck Markers Disabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					for '_i' from 0 to 1000 do {deleteMarkerLocal ('adminwmark' + (str _i))};
					
					_savelog = format[""%1 disabled WRECK markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_tentMarkers = {
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				admintents = {
					while {admin_marktents == 1} do {
						_objects = (nearestObjects [player,['TentStorage','StashSmall','StashMedium','WoodShack_DZ','StorageShed_DZ','TentStorageDomed','TentStorageDomed2'],18000]);
						for '_i' from 0 to (count _objects)-1 do {
							_selected = _objects select _i;
							_type = typeOf _selected;
							deleteMarkerLocal ('admin_tents' + (str _i));
							_vm = createMarkerLocal [('admin_tents' + (str _i)),getPosATL _selected];
							_vm setMarkerTypeLocal 'Camp';
							_vm setMarkerSizeLocal [0.25,0.25];
							_vm setMarkerTextLocal format [' %1',getText (configFile >> 'CfgVehicles' >> _type >> 'displayName')];
							_vm setMarkerColorLocal ('ColorGreen');
						};
						sleep 10;
					};
				};
				if (isNil 'admin_marktents') then {admin_marktents = 0};
				if (admin_marktents == 0) then {
					admin_marktents = 1;
					_msg = 'Tent Markers Enabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn admintents;
					
					_savelog = format[""%1 enabled TENT markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_marktents = 0;
					_msg = 'Tent Markers Disabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					for '_i' from 0 to 1000 do {deleteMarkerLocal ('admin_tents' + (str _i))};
					
					_savelog = format[""%1 disabled TENT markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_vaultMarkers = {
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				adminvaultz = {
					while {admin_markvaults == 1} do {
						_objects = (nearestObjects [player,['VaultStorage','VaultStorageLocked'],18000]);
						for '_i' from 0 to (count _objects)-1 do {
							_selected = _objects select _i;
							_type = typeOf _selected;
							deleteMarkerLocal ('admin_vaultmarkers' + (str _i));
							_vm = createMarkerLocal [('admin_vaultmarkers' + (str _i)),getPosATL _selected];
							_vm setMarkerTypeLocal 'Camp';
							_vm setMarkerSizeLocal [0.5,0.5];
							_vm setMarkerTextLocal format ['%1',getText (configFile >> 'CfgVehicles' >> _type >> 'displayName')];
							_vm setMarkerColorLocal ('ColorBlack');
						};
						sleep 10;
					};
				};
				if (isNil 'admin_markvaults') then {admin_markvaults = 0};
				if (admin_markvaults == 0) then {
					admin_markvaults = 1;
					_msg = 'Vault Markers Enabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn adminvaultz;
					
					_savelog = format[""%1 enabled vault markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markvaults = 0;
					_msg = 'Vault Markers Disabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					for '_i' from 0 to 5000 do {deleteMarkerLocal ('admin_vaultmarkers' + (str _i))};
					
					_savelog = format[""%1 disabled vault markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_stashMarkers = {
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				adminsmark = {
					while {admin_markstashes == 1} do {
						_objects = (nearestObjects [player,['LockboxStorage','LockboxStorageLocked'],18000]);
						for '_i' from 0 to (count _objects)-1 do {
							deleteMarkerLocal ('adminsmark' + (str _i));
							
							_selected = _objects select _i;
							_type = typeOf _selected;
							deleteMarkerLocal ('adminsmark' + (str _i));
							_sm = createMarkerLocal [('adminsmark' + (str _i)),getPosATL _selected];
							_sm setMarkerTypeLocal 'Camp';
							_sm setMarkerSizeLocal [0.5,0.5];
							_sm setMarkerTextLocal format [' %1',getText (configFile >> 'CfgVehicles' >> _type >> 'displayName')];
							_sm setMarkerColorLocal ('ColorGreen');
						};
						sleep 10;
					};
				};
				if (isNil 'admin_markstashes') then {admin_markstashes = 0};
				if (admin_markstashes == 0) then {
					admin_markstashes = 1;
					_msg = 'Stash Markers Enabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					[] spawn adminsmark;
					
					_savelog = format[""%1 enabled stash markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_markstashes = 0;
					_msg = 'Stash Markers Disabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					for '_i' from 0 to 1000 do {deleteMarkerLocal ('adminsmark' + (str _i))};
					
					_savelog = format[""%1 enabled stash markers with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_alpIcons = {
				comment 'Credits to AlPmaker';
				if !('ItemMap' in items player) then {
					_p4rt_0ut = 'itemMap';
					player addWeapon _p4rt_0ut;
					_p4rt_0ut = 'itemGPS';
					player addWeapon _p4rt_0ut;
				};
				
				disableSerialization;
				_minimap = (uinamespace getvariable ""BIS_RscMiniMap"") displayCtrl 101;
				if (isnil ""admin_micons"") then {
					admin_micons = true;
					map_mapdraw = ((findDisplay 12) displayCtrl 51) ctrlSetEventHandler [""Draw"",""_this call Draw_map_icons;""];
					_minimapdraw = _minimap ctrlSetEventHandler [""Draw"",""_this call Draw_map_icons;""];
					_msg = 'Map icons enabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 enabled MAP icons with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				} else {
					admin_micons = nil;
					((findDisplay 12) displayCtrl 51) ctrlremoveeventhandler [""Draw"",map_mapdraw];
					_msg = 'Map icons disabled';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""%1 disabled MAP icons with %2 players within 50 meters. %1 has %3 plus %4 kills."",name player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0])];
					[_savelog] call admin_adminlogAction;
				};
				
				Draw_map_icons = {
					if (!isnil ""admin_micons"") then {
						private[""_ctrl""];
						_ctrl =  _this select 0;
						_iscale = (1 - ctrlMapScale _ctrl) max .2;
						_irad = 30;
						_color = [0,0,0,1];
						_icon = ""\ca\ui\data\icon_zora_ca.paa"";
						
						_objects = vehicles;
						_allPlayers = playableUnits;
						{
							_type = typeOf _x;
							if !((getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName') == 'Wreck')||(_type in [""ClutterCutter_small_2_EP1"",""UH60Wreck_DZ"",""UH1Wreck_DZ"",""Mi8Wreck_DZ""])) then {
								_icon = getText(configFile >> ""CfgVehicles"" >> typeOf _x >> ""icon"");
								_irad = 30;
								
								if ((_x iskindof ""Air"")||(_x iskindof ""Tank"")) then {
									_irad = 35;
									_ctrl drawIcon [_icon,[1,0,1,1],getPosASL _x,_iscale*_irad,_iscale*_irad,getDir _x,"""",1];
								} else {
									if (_x iskindof ""house"") then {
										_irad = 30;
										_ctrl drawIcon [_icon,[0,0.4,0.6,1],getPosASL _x,_iscale*_irad,_iscale*_irad,getDir _x,"""",0.2];
									} else {
										_irad = 30;
										_ctrl drawIcon [_icon,[0,0,0.4,1],getPosASL _x,_iscale*_irad,_iscale*_irad,getDir _x,"""",1];
									};
								};
							};
						} forEach _objects;
						{
							if ((!isnull _x) and !(vehicle _x != _x)) then {
								if (_x == player) then {
									_color = [0,0,0,1];
								} else {
									_color = [1,0,0,1];
								};
								_ctrl drawIcon [""\ca\ui\data\iconman_ca.paa"",_color,getPosASL _x,_iscale*30,_iscale*30,getDir _x,"""",1];
							};
						} forEach _allPlayers;
					};
				};		
			};
			admin_slapTarget = {
				_name = _this select 0;
				_remoex = format ['
					if (name player == ""%1"") then {
						[] spawn {
							_msg = format [""[ADMIN]'+name player+' has slapped you!!""];
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							playsound ""Ivn_notscared"";
							playsound ""Ivn_notscared"";
							sleep 2;
							playSound ""Gul_youshouldbe"";
							playSound ""Gul_youshouldbe"";
							uiSleep 4;
							_randomNess = [2,-1] call BIS_fnc_selectRandom;
							playSound ""beat04"";playSound ""beat04"";
							playSound ""beat04"";playSound ""beat04"";
							(vehicle player) SetVelocity [_randomNess * random(10)* cos getdir (vehicle player),_randomNess * random(10)* cos getdir (vehicle player),random(5)];
							[] spawn {
								[60,1] call fnc_usec_pitchWhine;
								sleep 1.5;
								[1,5] call fnc_usec_pitchWhine;
							};
							sleep 1.25;
							playSound ""beat04"";
							playSound ""beat04"";
							playSound ""beat04"";
							playSound ""beat04"";
							(vehicle player) SetVelocity [_randomNess * random(10)* cos getdir (vehicle player),_randomNess * random(10)* cos getdir (vehicle player),random(5)];
							sleep 1.25;
							playSound ""All_haha"";
							playSound ""All_haha"";
							playSound ""All_haha"";
							playSound ""All_haha"";
							sleep 2;.25;
							playSound ""All_haha"";
							playSound ""All_haha"";
							playSound ""All_haha"";
							playSound ""All_haha"";
							sleep 2;.25;
						};
					};
				',_name];
				[_remoex] spawn admin_dothis;
				_savelog = format[""%1 slapped %2."",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_disableAggro = {
				if (isNil ""player_nozaggro"") then {player_nozaggro = 0};
				if (player_nozaggro == 0) then {
					player_zombieCheck = {};
					_msg = format [""Zombie aggro disabled.""];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					player_nozaggro = 1;
					_savelog = format[""%1 disabled their zombie aggro @ %2."",name player,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				} else {
					player_zombieCheck = compile preprocessFileLineNumbers ""\z\addons\dayz_code\compile\player_zombieCheck.sqf"";
					_msg = format [""Zombie aggro enabled.""];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					player_nozaggro = 0;
					_savelog = format[""%1 re-enabled their zombie aggro @ %2."",name player,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_zedShield = {
				zombie_shield_thread = {
					while {admin_zombieShield} do {
						_pos = (vehicle player) call AH_fnc_getPos;
						{deleteVehicle _x} forEach ((getPosATL (vehicle player)) nearEntities [""zZombie_Base"",ZombieDistance]);
						sleep 0.5;
					};
					_msg = format ['Zombie shield deactivated.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_savelog = format['%1 disabled zombie shield @ %2',name player,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
				closeDialog 0;
				if (isNil 'admin_zombieShield') then {admin_zombieShield = false};
				if !(admin_zombieShield) then {
					admin_zombieshieldmenu = [
						["""",true],
						[""Distance"",[-1],"""",-5,[[""expression"",""""]],""1"",""1""],	
						[""10"",[2],"""",-5,[[""expression"",""ZombieDistance=10;admin_zombieShield=true;""]],""1"",""1""],
						[""20"",[3],"""",-5,[[""expression"",""ZombieDistance=20;admin_zombieShield=true;""]],""1"",""1""],
						[""30"",[4],"""",-5,[[""expression"",""ZombieDistance=30;admin_zombieShield=true;""]],""1"",""1""],
						[""40"",[5],"""",-5,[[""expression"",""ZombieDistance=40;admin_zombieShield=true;""]],""1"",""1""],
						[""50"",[6],"""",-5,[[""expression"",""ZombieDistance=50;admin_zombieShield=true;""]],""1"",""1""],
						[""100"",[7],"""",-5,[[""expression"",""ZombieDistance=100;admin_zombieShield=true;""]],""1"",""1""],
						[""200"",[8],"""",-5,[[""expression"",""ZombieDistance=200;admin_zombieShield=true;""]],""1"",""1""],	
						[""10000"",[9],"""",-5,[[""expression"",""ZombieDistance=10000;admin_zombieShield=true;""]],""1"",""1""],	
						[""Exit"",[13],"""",-3,[[""expression"",""admin_zombieShield = false;""]],""1"",""1""]	
					];
					showCommandingMenu ""#USER:admin_zombieshieldmenu"";
					waitUntil {commandingMenu == ''};
					if (admin_zombieShield) then {
						_msg = format [""Zombie shield activated with a %1m radius!"",ZombieDistance];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						_savelog = format[""%1 enabled zombie shield with a %2m radius @ %3"",name player,ZombieDistance,mapGridPosition getPosATL (vehicle player)];
						[_savelog] call admin_adminlogAction;
						[] spawn zombie_shield_thread;
					} else {
						_msg = 'Zombie shield canceled because the distance menu was closed.';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
				} else {
					admin_zombieShield=false;
				};
			};
			admin_vehicleGodmode = {
				admin_cargodmode = {
					while {vehicle_cargodmode == 1} do {
						(vehicle player) setFuel 1;
						(vehicle player) setVehicleAmmo 1;
						(vehicle player) setDamage 0;
						sleep 0.1;
					};
					_msg = format ['Car godmode disabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (isNil ""vehicle_cargodmode"") then {vehicle_cargodmode = 0};
				if (vehicle_cargodmode == 0) then {
					_msg = format ['Car godmode enabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					vehicle_cargodmode = 1;
					[] spawn admin_cargodmode;
					_savelog = format[""%1 enabled car godmode."",name player];
					[_savelog] call admin_adminlogAction;
				} else {
					vehicle_cargodmode = 0;
					_savelog = format[""%1 disabled car godmode."",name player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_vehiclespeedhack = {
				if (isNil ""adminvehiclespeedz"") then {adminvehiclespeedz = 0};
				if (adminvehiclespeedz == 0) then {
					_savelog = format['%1 enabled speed hack @ %2',name player,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
					_msg = format ['speed hack enabled!'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_msg = format ['Hold shift and W at the same time in order to use the speed hack.'];
					systemChat ('"+_AH_CHAT+": '+str _msg);
					waitUntil {!isnull (finddisplay 46)};
					adminvehiclespeedy = (findDisplay 46) displayAddEventHandler [""KeyDown"",""_this select 1 call MY_KEYDOWN_FNC_xx1;false;""];
					MY_KEYDOWN_FNC_xx1 = {

						_vcl = vehicle player;
						if (_vcl == player)exitwith{};

						_nos = _vcl getvariable ""nitro"";
						_supgrade = _vcl getvariable ""supgrade"";

						if (isEngineOn _vcl) then {
							switch (_this) do {
								case 17: {
									if (isEngineOn _vcl and !isnil ""_supgrade"") then {
										_vcl SetVelocity [(velocity _vcl select 0) * 1.011,(velocity _vcl select 1) *1.011,(velocity _vcl select 2) * 0.99];
									} else {
										_vcl setvariable [""supgrade"",1,true];
									};
								};
								case 42: {
									if (isEngineOn _vcl and !isnil ""_nos"") then {
										_vcl setVelocity [(velocity _vcl select 0) * 1.01,(velocity _vcl select 1) * 1.01,(velocity _vcl select 2) * 0.99];
									} else {
										_vcl setvariable [""nitro"",1,true];
									};
								};
							};
						};
					};
					adminvehiclespeedz = 1;
				} else {
					_savelog = format['%1 disabled speed hack @ %2',name player,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
					(findDisplay 46) displayRemoveEventHandler [""KeyDown"",adminvehiclespeedy];
					adminvehiclespeedz = 0;
				};
			};
			admin_tpFWRD = {
				_obj = (vehicle player);
				_pos = getPosATL _obj;
				_dir = getDir _obj;
				_obj setPosATL [(_pos select 0)+_this*sin(_dir),(_pos select 1)+_this*cos(_dir),(_pos select 2)];
			};
			admin_teleportToggle = {
				AH_teleport = {
					openMap [false,false];
					_mousePOS = (_this select 0);
					if (player != (vehicle player)) then {
						(vehicle player) setVelocity [0,0,0];
						_mousePOS = [(_mousePOS select 0),(_mousePOS select 1),1];
						if ((vehicle player) isKindOf 'AIR') then {
							_mousePOS = [(_mousePOS select 0),(_mousePOS select 1),100];
						};
					};
					
					(vehicle player) setPos _mousePOS;
					
					_msg = format ['Teleported to %1',mapGridPosition getPosATL (vehicle player)];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format['%1 teleported to %2',name player,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
				if (isNil 'admin_teleportfunc') then {admin_teleportfunc = false};
				if !(admin_teleportfunc) then {
					admin_teleportfunc = true;
					if !('ItemMap' in items player) then {
						_p4rt_0ut = 'itemMap';
						player addWeapon _p4rt_0ut;
						_p4rt_0ut = 'itemGPS';
						player addWeapon _p4rt_0ut;
					};
					admin_altEH = (findDisplay 46) displayAddEventHandler ['KeyDown','altstate = _this select 4'];
					admin_mbdEH = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['MouseButtonDown','if (((_this select 1) == 0) && altstate) then {_mousePOS = (_this select 0) posScreenToWorld [_this select 2,_this select 3];[_mousePOS] spawn AH_teleport};'];
					_msg = 'Teleport enabled!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					admin_teleportfunc = false;
					(findDisplay 46) displayRemoveEventHandler ['KeyDown',admin_altEH];
					((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ['MouseButtonDown',admin_mbdEH];
					_msg = 'Teleport disabled!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
			};
			admin_3Dtoggle = {
				if (isNil 'admin_3Dtags') then {admin_3Dtags = false};
				if (!admin_3Dtags) then {
					_msg = format ['3D Player ESP enabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 enabled 3D ESP at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
					
					admin_3Dtags = true;
					_arr = [];
					while {admin_3Dtags} do {
						_allPlayers = playableUnits;
						{
							if (((_x in _arr) && !(alive _x)) or ((_x in _arr) && ((player distance _x) > 1000))) then {_arr = _arr - [_x]};
							if ((_x != player) && !(_x in _arr) && ((player distance _x) < 1000)) then {
								_arr = _arr + [_x];
								_x spawn {
									disableSerialization;
									if (isNil 'admin_creditsm8') then {admin_creditsm8 = 2733};
									admin_creditsm8 cutRsc ['rscDynamicText', 'PLAIN'];
									admin_creditsm8 = admin_creditsm8 + 1;
									_ctrl = ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999);
									_ctrl ctrlShow true;
									_ctrl ctrlEnable true;
									_ctrl ctrlSetFade 0;
									while {(alive _this) && ((player distance _this) < 1000)} do {
										if (!admin_3Dtags) exitWith {
											_ctrl ctrlShow false;
											_ctrl ctrlEnable false;
										};
										_pos2D = worldToScreen [(getPosATL _this) select 0, (getPosATL _this) select 1, ((getPosATL _this) select 2) + 2];
										if (count _pos2D > 0) then {
											_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
											_ctrl ctrlSetStructuredText parseText format ['<t size=''0.25'' color=''#ffffff'' shadow=''2''>%1 (%2m)</t>', name _this, round (player distance _this)];
											_ctrl ctrlCommit 0;
										};
									};
									_ctrl ctrlShow false;
									_ctrl ctrlEnable false;
								};
							};
						} forEach _allPlayers;
						uiSleep 1;
					};
				} else {
					admin_3Dtags = false;
					_msg = format ['3D Player ESP disabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 disabled 3D ESP at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_3DAItoggle = {
				if (isNil 'admin_3DAItags') then {admin_3DAItags = false};
				if (!admin_3DAItags) then {
					_msg = format ['3D Player ESP enabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 enabled 3D ESP at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
					
					admin_3DAItags = true;
					_arr = [];
					while {admin_3DAItags} do {
						_allUnits = 'allUnits';
						{
							if (((_x in _arr) && !(alive _x)) or ((_x in _arr) && ((player distance _x) > 1000))) then {_arr = _arr - [_x]};
							if ((_x != player) && ("+_playerID+" _x == '') && !(isNull(group _x)) && (alive _x) && !(_x in _arr) && ((player distance _x) < 1000)) then {
								_arr = _arr + [_x];
								_x spawn {
									disableSerialization;
									if (isNil 'admin_creditsm8') then {admin_creditsm8 = 2733};
									admin_creditsm8 cutRsc ['rscDynamicText', 'PLAIN'];
									admin_creditsm8 = admin_creditsm8 + 1;
									_ctrl = ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999);
									_ctrl ctrlShow true;
									_ctrl ctrlEnable true;
									_ctrl ctrlSetFade 0;
									while {(alive _this) && ((player distance _this) < 1000)} do {
										if (!admin_3DAItags) exitWith {
											_ctrl ctrlShow false;
											_ctrl ctrlEnable false;
										};
										_pos2D = worldToScreen [(getPosATL _this) select 0, (getPosATL _this) select 1, ((getPosATL _this) select 2) + 2];
										if (count _pos2D > 0) then {
											_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
											_ctrl ctrlSetStructuredText parseText format ['<t size=''0.25'' color=''#ffffff'' shadow=''2''>%1 (%2m)</t>', name _this, round (player distance _this)];
											_ctrl ctrlCommit 0;
										};
									};
									_ctrl ctrlShow false;
									_ctrl ctrlEnable false;
								};
							};
						} forEach _allUnits;
						uiSleep 1;
					};
				} else {
					admin_3DAItags = false;
					_msg = format ['3D Player ESP disabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 disabled 3D ESP at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_espToggle = {
				if (isnil '"+_RND+"_adminESPmarkers') then {"+_RND+"_adminESPmarkers = 0};
				if ("+_RND+"_adminESPmarkers == 0) then {
					"+_RND+"_adminESPmarkers = 1;
					_msg = format ['Player markers/Player ESP enabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 enabled ESP at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				} else {
					"+_RND+"_adminESPmarkers = 0;
					_msg = format ['Player markers/Player ESP disabled.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 disabled ESP at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
				_AHT_SGIV = true;
				setGroupIconsVisible [_AHT_SGIV,_AHT_SGIV];
				while {"+_RND+"_adminESPmarkers == 1} do {
					_allPlayers = playableUnits;
					if (isNull admin_AHactiveTarget) then {admin_centerUnit = (vehicle player)} else {admin_centerUnit = admin_AHactiveTarget};
					{
						if ("+_playerID+" _x != "+_playerID+" player) then {
							if (vehicle _x != _x) then {
								_friend = (group _x);clearGroupIcons _friend;
								_driver = (driver (vehicle _x));
								if (_driver == _x) then {
									_crew = [];
									_driver = _x;
									{
										if (_x != _driver) then {
											_crew = _crew + [name _x];
										};
									} forEach (crew (vehicle _x));
									(group _x) addGroupIcon ['b_inf'];
									if (count _crew < 1) then {
										_veh = (getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'));
										(group _x) setGroupIconParams [[0,0,1 ,1],format ['%1 (%3 - %2m)',name _x,round (_x distance admin_centerUnit),_veh],0.7,true];
									} else {
										(group _x) setGroupIconParams [[0,0,1 ,1],format ['D: %1 (%2m) P: %3',name _x,round (_x distance admin_centerUnit),_crew],0.7,true];
									};
								} else {
									if ((isNull _driver)||(!alive _driver)||(!isPlayer _driver)) then {
										_crew = [];
										{_crew = _crew + [name _x]} forEach (crew (vehicle _x));
										_veh = (getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'));
										(group _x) addGroupIcon ['b_inf'];
										(group _x) setGroupIconParams [[0,0,1 ,1],format ['D: None (%3 - %1m) P: %2',round (_x distance admin_centerUnit),_crew,_veh],0.7,true];
									};
								};
							} else {
								_friend = (group _x);clearGroupIcons _friend;
								(group _x) addGroupIcon ['x_art'];
								(group _x) setGroupIconParams [[0,0,1 ,1],format ['%1 (%2m)',name _x,round (_x distance admin_centerUnit)],0.7,true];
							};
						} else {
							_friend = (group _x);clearGroupIcons _friend;
							(group _x) addGroupIcon ['b_inf'];
							(group _x) setGroupIconParams [[1,1,0 ,1],'You',0.7,true];
						};
					} forEach _allPlayers;
					sleep 1;
				};
				{_friend = _x;clearGroupIcons _friend} forEach allGroups;
			};
			admin_repairVehicle = {
				if (vehicle player != player) then {
					_obj = [];
					_vehicle = vehicle player;
					_type = typeOf _vehicle;
					
					_savelog = format[""%1 repaired %2"",name player,_type];
					[_savelog] call admin_adminlogAction;
					
					_hitpoints = _vehicle call vehicle_getHitpoints;
					_allFixed = true;
					{
						_damage = [_vehicle,_x] call object_getHit;
						_selection = getText(configFile >> ""cfgVehicles"" >> _type >> ""HitPoints"" >> _x >> ""name"");
						if (_damage > 0) then {_obj set [count _obj,[str _selection]]};
						if (!isNil 'fnc_veh_handleRepair') then {
							[_vehicle,_selection,0,true] call fnc_veh_handleRepair;
							[_vehicle,_x,0,true] call fnc_veh_handleRepair;
						};
						if (AM_EPOCH) then {
							PVDZE_veh_SFix = [_vehicle,_selection,0];
							publicVariable 'PVDZE_veh_SFix';
						};
					} forEach _hitpoints;
					_msg = format [""Repaired ""+str _obj+""""];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_vehicle setDamage 0;
					_vehicle setfuel 1;
					_vehicle setvehicleammo 1;
				} else {
					_obj = [];
					_vehicle = (cursorTarget);
					if (isNull _vehicle) exitWith {
						_msg = format ['No object selected, please try again.'];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					_type = typeOf _vehicle;
					_hitpoints = _vehicle call vehicle_getHitpoints;
					_allFixed = true;
					{
						_damage = [_vehicle,_x] call object_getHit;
						_selection = getText(configFile >> ""cfgVehicles"" >> _type >> ""HitPoints"" >> _x >> ""name"");
						if (_damage > 0) then {
							_obj = _obj + [str _selection];
						};
						if (!isNil 'fnc_veh_handleRepair') then {
							[_vehicle,_selection,0,true] call fnc_veh_handleRepair;
							[_vehicle,_x,0,true] call fnc_veh_handleRepair;
						};
						if (AM_EPOCH) then {
							PVDZE_veh_SFix = [_vehicle,_selection,0];
							publicVariable 'PVDZE_veh_SFix';
						};
					} forEach _hitpoints;
					_msg = format [""Repaired ""+str _obj+""""];
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_vehicle setDamage 0;
					_vehicle setfuel 1;
					_vehicle setvehicleammo 1;
				};
			};
			admin_advancedMenu = {
				diag_log ('(GG-AntiHack): SPECIAL HOTKEYS LOADED.');
				_msg = 'Special hotkeys added.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				AH_keyBinds = compile ('
					_key = (_this select 1);
					if (_key == 0x3B) then {call admin_init};
					if (_key == 0xC7) then {DZE_togglesnap=true};
					if (_key == 0x44) then {[] spawn admin_unspectate};
					if (_key == 0x45) then {if (!isNull admin_AHactiveTarget) then {createGearDialog [(admin_AHactiveTarget),''RscDisplayGear'']}};
				');
				
				_savelog = format[""%1 opened the ADVANCED menu."",name player];
				[_savelog] call admin_adminlogAction;
				
				closeDialog 0;
				execVM 'keyz\keyctrlz.sqf';
			};
			admin_fixServerLag = {
				_savelog = format[""%1 used Fix Server Lag."",name player];
				[_savelog] call admin_adminlogAction;
				_itemclasses =
				[
					""GraveCrossHelmet_EP1"",""GraveCrossHelmet_DZ"",""wreck"",""crater"",""craterlong"",""PartWoodPile"",
					""SeaGull"",""Rabbit"",""WildBoar"",""Cow"",""Goat"",""Sheep"",""Bird"",""wire_cat1"",
					""CAAnimalBase"",""Land_fire"",""Sound_Flies""
				];
				{
					_itemlist 	= allMissionObjects _x;
					_itemCount 	= (count _itemlist);
					{
						if ((typeOf _x != ""DZ_fin"")||(typeOf _x != ""DZ_pastor"")||(typeOf _x != ""SHEEP"")) then {
							_x spawn admin_objectDelete;
						};
					} forEach (allMissionObjects _x);
					_msg = format [""DELETING %1 %2(s)"",_itemCount,_x];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
				} forEach _itemclasses;
				_ltQty = 0;
				{
					if (!isNull _x) then {
						_near = {isPlayer _x} count (_x nearentities [[""CAManBase""],450]);
						_keep = _x getVariable [""permaLoot"",false];
						if ((_near == 0)&&(!_keep)) then {deleteVehicle _x;_ltQty = _ltQty + 1};
					};
				} foreach ((allMissionObjects ""WeaponHolder"")+(allMissionObjects ""WeaponHolderBase""));
				_msg = format [""%1 loot items were deleted.*"",_ltQty];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg = format [""NOTE * Represents loot that is not marked as 'permanent' and has no players within 450m.""];
				systemChat ('"+_AH_CHAT+": '+str _msg);
				_cake = 0;
				_vehs = [];
				{
					_garage = (getPosATL _x) nearObjects [""Land_sara_hasic_zbroj"",7];
					if !((count _garage) > 1) then {
						if (((damage _x)>0.90)&&!(_x isKindOf ""MAN"")&&!(_x isKindOf ""CAAnimalBase"")&&!(_x isKindOf ""zZombie_Base"")&&!(_x isKindOf ""static"")&&!(_x isKindOf ""building"")) then {
							if (typeOf _x != ""SHEEP"") then {
								_x spawn admin_objectDelete;
								_cake = _cake + 1;
								_vehs = _vehs + [typeOf _x];
							};
						};
					};
				} forEach (vehicles);
				_msg = format [""%1 blown up vehicles were deleted: %2"",_cake,_vehs];
				systemChat ('"+_AH_CHAT+": '+str _msg);
				_msg = format [""Press /, and use page up or page down if you want to view what was deleted."",_cake];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_healPlayers = {
				disableSerialization;
				_healed = [];
				_allPlayers = playableUnits;
				{if ((_x distance (vehicle player)) < 20) then {_healed = _healed + [name _x]}} foreach _allPlayers;
				_msg = 'Healed: '+str(_healed);
				systemChat ('"+_AH_CHAT+": '+str _msg);
				_plzhealfirends = ""
					if ((player distance ""+str (getPosATL (vehicle player))+"") < 20) then {
						disableSerialization;
						[0,0] call fnc_usec_pitchWhine;
						0 fadeSound 1;
						dayz_sourceBleeding = objNull;
						r_player_blood = 12000;
						r_player_inpain = false;
						r_player_infected = false;
						r_player_injured = false;
						dayz_hunger = 0;
						dayz_thirst = 0;
						dayz_temperatur = 40;
						r_fracture_legs = false;
						r_fracture_arms = false;
						r_player_dead = false;
						r_player_unconscious = false;
						r_player_loaded = false;
						r_player_cardiac = false;
						r_player_lowblood = false;
						r_player_timeout = 0;
						r_handlercount = 0;
						r_interrupt = false;
						r_doLoop = false;
						r_drag_sqf = false;
						r_self = false;
						r_action = false;
						r_action_unload = false;
						r_player_handler = false;
						r_player_handler1 = false;
						disableUserInput false;
						player setHit['head',0];
						player setHit['body',0];
						player setHit['hands',0];
						player setHit['legs',0];
						player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
						player setVariable ['hit_legs',0,true];
						player setVariable ['hit_arms',0,true];
						player setVariable ['hit_hands',0,true];
						player setVariable ['USEC_injured',false,true];
						player setVariable ['USEC_inPain',false,true];
						player setVariable ['USEC_lowBlood',false,true];
						player setVariable ['USEC_BloodQty',r_player_blood,true];
						player setVariable ['NORRN_unconscious', false, true];
						player setVariable ['unconsciousTime', 0, true];
						player setVariable ['USEC_isCardiac',false,true];
						player setVariable ['startcombattimer', 0, true];
						player setVariable ['combattimeout', 0, true];
						player setVariable ['medForceUpdate',true];
						player setVariable ['USEC_infected',false,true];
						1 cutRsc ['default','PLAIN',0];
						4 cutRsc ['default','PLAIN',0];
						((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl  1303) ctrlShow false;
						((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl 1203) ctrlShow false;
						if (vehicle player == player) then {[objNull,player,rSwitchMove,''] spawn RE};
						0 fadeSound 1;
						[0,0] call fnc_usec_pitchWhine;
					};
				"";
				[_plzhealfirends] spawn admin_dothis;
			};
			admin_healTarget = {
				_name = _this select 0;
				
				_msg = 'Healing '+str _name+'';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has healed you.',name player];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				_plzhealfirends = ""
					if (name player == ""+str _name+"") then {
						disableSerialization;
						[0,0] call fnc_usec_pitchWhine;
						0 fadeSound 1;
						dayz_sourceBleeding = objNull;
						r_player_blood = 12000;
						r_player_inpain = false;
						r_player_infected = false;
						r_player_injured = false;
						dayz_hunger = 0;
						dayz_thirst = 0;
						dayz_temperatur = 40;
						r_fracture_legs = false;
						r_fracture_arms = false;
						r_player_dead = false;
						r_player_unconscious = false;
						r_player_loaded = false;
						r_player_cardiac = false;
						r_player_lowblood = false;
						r_player_timeout = 0;
						r_handlercount = 0;
						r_interrupt = false;
						r_doLoop = false;
						r_drag_sqf = false;
						r_self = false;
						r_action = false;
						r_action_unload = false;
						r_player_handler = false;
						r_player_handler1 = false;
						disableUserInput false;
						player setHit['head',0];
						player setHit['body',0];
						player setHit['hands',0];
						player setHit['legs',0];
						player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
						player setVariable ['hit_legs',0,true];
						player setVariable ['hit_arms',0,true];
						player setVariable ['hit_hands',0,true];
						player setVariable ['USEC_injured',false,true];
						player setVariable ['USEC_inPain',false,true];
						player setVariable ['USEC_lowBlood',false,true];
						player setVariable ['USEC_BloodQty',r_player_blood,true];
						player setVariable ['NORRN_unconscious', false, true];
						player setVariable ['unconsciousTime', 0, true];
						player setVariable ['USEC_isCardiac',false,true];
						player setVariable ['startcombattimer', 0, true];
						player setVariable ['combattimeout', 0, true];
						player setVariable ['medForceUpdate',true];
						player setVariable ['USEC_infected',false,true];
						1 cutRsc ['default','PLAIN',0];
						4 cutRsc ['default','PLAIN',0];
						((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl  1303) ctrlShow false;
						((uiNamespace getVariable 'DAYZ_GUI_display') displayCtrl 1203) ctrlShow false;
						if (vehicle player == player) then {[objNull,player,rSwitchMove,''] spawn RE};
						0 fadeSound 1;
						[0,0] call fnc_usec_pitchWhine;
					};
				"";
				[_plzhealfirends] spawn admin_dothis;
				
				_savelog = format['%1 healed %2',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			donorsafe1 = {
				_weapons = [
					['ItemCrowbar',2],
					['ItemToolbox',2],
					['ItemEtool',2]
				];
				_magazines = [
					['CinderBlocks',50],
					['metal_floor_kit',20],
					['MortarBucket',20],
					['ItemPole',20],
					['ItemTankTrap',15],
					['cinder_wall_kit',10],
					['ItemComboLock',10],
					['cinder_door_kit',5],
					['cinder_garage_kit',5],
					['light_pole_kit',4],
					['ItemWoodStairsSupport',3],
					['ItemWoodLadder',3],
					['desert_large_net_kit',3],
					['desert_net_kit',3],
					['forest_large_net_kit',3],
					['forest_net_kit',3],
					['fuel_pump_kit',3],
					['park_bench_kit',3],
					['storage_shed_kit',3],
					['stick_fence_kit',3],
					['ItemGenerator',3],
					['30m_plot_kit',3],
					['ItemVault',2]
				];
				_backpack = [['DZ_LargeGunbag_EP1',2]];
				
				_weparray1 = [];
				_weparray2 = [];
				{_weparray1 set [count _weparray1,_x select 0];_weparray2 set [count _weparray2,_x select 1]} forEach _weapons;
				_weparray = [_weparray1,_weparray2];
				
				_magarray1 = [];
				_magarray2 = [];
				{_magarray1 set [count _magarray1,_x select 0];_magarray2 set [count _magarray2,_x select 1]} forEach _magazines;
				_magarray = [_magarray1,_magarray2];
				
				_bakarray1 = [];
				_bakarray2 = [];
				{_bakarray1 set [count _bakarray1,_x select 0];_bakarray2 set [count _bakarray2,_x select 1]} forEach _backpack;
				_bakarray = [_bakarray1,_bakarray2];
				
				don8_code = nil;
				['Donator safe','Code:','Set','don8_code'] call AH_fnc_displayCreate;
				if (isNil 'don8_code') then {
					_msg = 'Code not set, donor safe cancelled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_msg = 'Spawning donor safe...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_dir = (getDir player);
					_offset_x = 0; 
					_offset_y = 1.5;
					_offset_z = 0;
					_location = player modeltoworld [_offset_x,_offset_y,_offset_z];
					_building = nearestObject [(vehicle player), 'HouseBase'];
					if([(vehicle player),_building] call fnc_isInsideBuilding) then {
						_location = _building modelToWorld (_building worldToModel _location);
					} else {
						_location = player modelToWorld [_offset_x,_offset_y,_offset_z];
					};
					
					_t3mp0v4ult = createVehicle ['VaultStorageLocked', _location, [], 0, 'CAN_COLLIDE'];
					_t3mp0v4ult setdir _dir;
					_t3mp0v4ult setpos _location;
					player reveal _t3mp0v4ult;
					_t3mp0v4ult setVariable ['CharacterID',don8_code,true];
					_t3mp0v4ult setVariable ['OEMPos',_location,true];
					
					PVDZE_obj_Publish = [don8_code,_t3mp0v4ult,[_dir,_location,[(vectorDir _t3mp0v4ult),(vectorUp _t3mp0v4ult)]],'VaultStorageLocked'];
					publicVariableServer  'PVDZE_obj_Publish';
					
					_t3mp0v4ult setVariable ['WeaponCargo',_weparray,true];
					_t3mp0v4ult setVariable ['BackpackCargo',_bakarray,true];
					_t3mp0v4ult setVariable ['MagazineCargo',_magarray,true];
					
					_location2 = [_location select 0,_location select 1,(_location select 2) + 1.25];
					
					_t3mp0v4ult = createVehicle ['VaultStorageLocked', _location2, [], 0, 'CAN_COLLIDE'];
					_t3mp0v4ult setdir _dir;
					_t3mp0v4ult setpos _location2;
					player reveal _t3mp0v4ult;
					_t3mp0v4ult setVariable ['CharacterID',don8_code,true];
					_t3mp0v4ult setVariable ['OEMPos',_location2,true];
					
					PVDZE_obj_Publish = [don8_code,_t3mp0v4ult,[_dir,_location2],'VaultStorageLocked'];
					publicVariableServer 'PVDZE_obj_Publish';
					
					_magarray = [['CinderBlocks','cinder_wall_kit'],[30,20]];
					_t3mp0v4ult setVariable ['MagazineCargo',_magarray,true];
				};
			};
			donorsafe2 = {
				_weapons = [
					['ItemCrowbar',2],
					['ItemToolbox',2],
					['ItemEtool',2]
				];
				_magazines = [
					['CinderBlocks',30],
					['metal_floor_kit',40],
					['cinder_wall_kit',30],
					['cinder_garage_kit',10],
					['cinder_door_kit',10],
					['ItemComboLock',10],
					['MortarBucket',20],
					['ItemPole',20],
					['ItemTankTrap',5],
					['ItemWoodStairsSupport',5],
					['ItemWoodLadder',3],
					['30m_plot_kit',3],
					['ItemVault',3]
				];
				_magazines2 = [
					['CinderBlocks',90]
				];
				_backpack = [['DZ_LargeGunbag_EP1',2]];
				
				_weparray1 = [];
				_weparray2 = [];
				{_weparray1 set [count _weparray1,_x select 0];_weparray2 set [count _weparray2,_x select 1]} forEach _weapons;
				_weparray = [_weparray1,_weparray2];
				
				_magarray1 = [];
				_magarray2 = [];
				{_magarray1 set [count _magarray1,_x select 0];_magarray2 set [count _magarray2,_x select 1]} forEach _magazines;
				_magarray = [_magarray1,_magarray2];
				
				_bakarray1 = [];
				_bakarray2 = [];
				{_bakarray1 set [count _bakarray1,_x select 0];_bakarray2 set [count _bakarray2,_x select 1]} forEach _backpack;
				_bakarray = [_bakarray1,_bakarray2];
				_magarray21 = [];
				_magarray22 = [];
				{_magarray21 set [count _magarray21,_x select 0];_magarray22 set [count _magarray22,_x select 1]} forEach _magazines2;
				_magarray2 = [_magarray21,_magarray22];
				
				don8_code = nil;
				['Donator safe','Code:','Set','don8_code'] call AH_fnc_displayCreate;
				if (isNil 'don8_code') then {
					_msg = 'Code not set, donor safe cancelled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_msg = 'Spawning donor safe...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_dir = (getDir player);
					_offset_x = 0; 
					_offset_y = 1.5;
					_offset_z = 0;
					_location = player modeltoworld [_offset_x,_offset_y,_offset_z];
					_building = nearestObject [(vehicle player), 'HouseBase'];
					if([(vehicle player),_building] call fnc_isInsideBuilding) then {
						_location = _building modelToWorld (_building worldToModel _location);
					} else {
						_location = player modelToWorld [_offset_x,_offset_y,_offset_z];
					};
					
					_t3mp0v4ult = createVehicle ['VaultStorageLocked', _location, [], 0, 'CAN_COLLIDE'];
					_t3mp0v4ult setdir _dir;
					_t3mp0v4ult setpos _location;
					player reveal _t3mp0v4ult;
					_t3mp0v4ult setVariable ['CharacterID',don8_code,true];
					_t3mp0v4ult setVariable ['OEMPos',_location,true];
					
					PVDZE_obj_Publish = [don8_code,_t3mp0v4ult,[_dir,_location,[(vectorDir _t3mp0v4ult),(vectorUp _t3mp0v4ult)]],'VaultStorageLocked'];
					publicVariableServer  'PVDZE_obj_Publish';
					
					_t3mp0v4ult setVariable ['WeaponCargo',_weparray,true];
					_t3mp0v4ult setVariable ['BackpackCargo',_bakarray,true];
					_t3mp0v4ult setVariable ['MagazineCargo',_magarray,true];
					
					_location2 = [_location select 0,_location select 1,(_location select 2) + 1.25];
					
					_t3mp0v4ult = createVehicle ['VaultStorageLocked', _location2, [], 0, 'CAN_COLLIDE'];
					_t3mp0v4ult setdir _dir;
					_t3mp0v4ult setpos _location2;
					player reveal _t3mp0v4ult;
					_t3mp0v4ult setVariable ['CharacterID',don8_code,true];
					_t3mp0v4ult setVariable ['OEMPos',_location2,true];
					
					PVDZE_obj_Publish = [don8_code,_t3mp0v4ult,[_dir,_location2],'VaultStorageLocked'];
					publicVariableServer 'PVDZE_obj_Publish';
					
					_magarray = _magarray2;
					_t3mp0v4ult setVariable ['MagazineCargo',_magarray,true];
				};
			};
			donorsafe3 = {
				_weapons = [
					['ItemCrowbar',2],
					['ItemToolbox',2],
					['ItemEtool',2]
				];
				_magazines = [
					['CinderBlocks',100],
					['metal_floor_kit',50],
					['cinder_wall_kit',50]
				];
				_backpack = [['DZ_LargeGunbag_EP1',2]];
				_magazines2 = [
					['MortarBucket',20],
					['ItemPole',20],
					['ItemTankTrap',20],
					['cinder_door_kit',20 ],
					['cinder_garage_kit',10],
					['ItemComboLock',10],
					['ItemWoodLadder',10]
				];
				
				_weparray1 = [];
				_weparray2 = [];
				{_weparray1 set [count _weparray1,_x select 0];_weparray2 set [count _weparray2,_x select 1]} forEach _weapons;
				_weparray = [_weparray1,_weparray2];
				
				_magarray1 = [];
				_magarray2 = [];
				{_magarray1 set [count _magarray1,_x select 0];_magarray2 set [count _magarray2,_x select 1]} forEach _magazines;
				_magarray = [_magarray1,_magarray2];
				
				_bakarray1 = [];
				_bakarray2 = [];
				{_bakarray1 set [count _bakarray1,_x select 0];_bakarray2 set [count _bakarray2,_x select 1]} forEach _backpack;
				_bakarray = [_bakarray1,_bakarray2];
				_magarray21 = [];
				_magarray22 = [];
				{_magarray21 set [count _magarray21,_x select 0];_magarray22 set [count _magarray22,_x select 1]} forEach _magazines2;
				_magarray2 = [_magarray21,_magarray22];
				
				don8_code = nil;
				['Donator safe','Code:','Set','don8_code'] call AH_fnc_displayCreate;
				if (isNil 'don8_code') then {
					_msg = 'Code not set, donor safe cancelled.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					_msg = 'Spawning donor safe...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_dir = (getDir player);
					_offset_x = 0; 
					_offset_y = 1.5;
					_offset_z = 0;
					_location = player modeltoworld [_offset_x,_offset_y,_offset_z];
					_building = nearestObject [(vehicle player), 'HouseBase'];
					if([(vehicle player),_building] call fnc_isInsideBuilding) then {
						_location = _building modelToWorld (_building worldToModel _location);
					} else {
						_location = player modelToWorld [_offset_x,_offset_y,_offset_z];
					};
					
					_t3mp0v4ult = createVehicle ['VaultStorageLocked', _location, [], 0, 'CAN_COLLIDE'];
					_t3mp0v4ult setdir _dir;
					_t3mp0v4ult setpos _location;
					player reveal _t3mp0v4ult;
					_t3mp0v4ult setVariable ['CharacterID',don8_code,true];
					_t3mp0v4ult setVariable ['OEMPos',_location,true];
					
					PVDZE_obj_Publish = [don8_code,_t3mp0v4ult,[_dir,_location,[(vectorDir _t3mp0v4ult),(vectorUp _t3mp0v4ult)]],'VaultStorageLocked'];
					publicVariableServer  'PVDZE_obj_Publish';
					
					_t3mp0v4ult setVariable ['WeaponCargo',_weparray,true];
					_t3mp0v4ult setVariable ['BackpackCargo',_bakarray,true];
					_t3mp0v4ult setVariable ['MagazineCargo',_magarray,true];
					
					_location2 = [_location select 0,_location select 1,(_location select 2) + 1.25];
					
					_t3mp0v4ult = createVehicle ['VaultStorageLocked', _location2, [], 0, 'CAN_COLLIDE'];
					_t3mp0v4ult setdir _dir;
					_t3mp0v4ult setpos _location2;
					player reveal _t3mp0v4ult;
					_t3mp0v4ult setVariable ['CharacterID',don8_code,true];
					_t3mp0v4ult setVariable ['OEMPos',_location2,true];
					
					PVDZE_obj_Publish = [don8_code,_t3mp0v4ult,[_dir,_location2],'VaultStorageLocked'];
					publicVariableServer 'PVDZE_obj_Publish';
					
					_magarray = _magarray2;
					_t3mp0v4ult setVariable ['MagazineCargo',_magarray,true];
				};
			};
			donorcrate_init = {
				DelaySelected 		= nil;
				SelectDelay 		= 13337;
				box_dnrTierSelected = false;
				box_donorTier 		= 1;
				closeDialog 0;
				_msg = 'Please select tier.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				box_tierselect = 
				[
					["""",true],
					[""Donor Crate - Tier Select"",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""TIER 1"",[2],"""",-5,[[""expression"",""box_donorTier=1;box_dnrTierSelected=true;""]],""1"",""1""],
					[""TIER 2"",[3],"""",-5,[[""expression"",""box_donorTier=2;box_dnrTierSelected=true;""]],""1"",""1""],
					[""TIER 3"",[4],"""",-5,[[""expression"",""box_donorTier=3;box_dnrTierSelected=true;""]],""1"",""1""],
					[""TIER 4"",[5],"""",-5,[[""expression"",""box_donorTier=4;box_dnrTierSelected=true;""]],""1"",""1""],
					[""TIER 5"",[6],"""",-5,[[""expression"",""box_donorTier=5;box_dnrTierSelected=true;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Cancel"",[11],"""",-5,[[""expression"",""box_donorTier=0;box_dnrTierSelected=true;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:box_tierselect"";
				waitUntil {((box_dnrTierSelected)||(commandingMenu == ''))};
				if ((box_donorTier == 0)||(!box_dnrTierSelected)) exitWith {
					_msg = 'Box creation cancelled! MAG COUNT == 0!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (box_dnrTierSelected) then {
					_msg = 'Tier selected: '+str box_donorTier+'';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				_msg = 'Please select delete timer.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				boxdelay_DAMI = 
				[
					["""",true],
					[""Admin Crate - Delete timer"",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""DELETE TIMER: 5 minute(s)"",[2],"""",-5,[[""expression"",""SelectDelay=300;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 10 minute(s)"",[3],"""",-5,[[""expression"",""SelectDelay=600;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 15 minute(s)"",[4],"""",-5,[[""expression"",""SelectDelay=900;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 20 minute(s)"",[5],"""",-5,[[""expression"",""SelectDelay=1200;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 25 minute(s)"",[6],"""",-5,[[""expression"",""SelectDelay=1500;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 30 minute(s)"",[7],"""",-5,[[""expression"",""SelectDelay=1800;DelaySelected=true;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""No timer"",[11],"""",-5,[[""expression"",""SelectDelay=13337;DelaySelected=false;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:boxdelay_DAMI"";
				waitUntil {((!isNil 'DelaySelected')||(commandingMenu == ''))};
				if (isNil 'DelaySelected') then {DelaySelected=false};
				
				_dir = getDir (vehicle player);
				_pos = (vehicle player) call AH_fnc_getPos;
				_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)+1];
				
				[10010,player,[_dir,_pos],box_donorTier,SelectDelay] call admin_adminREexec;
				
				_msg = format ['Donor crate spawned! DEL TIMER: %1 seconds. TIER: %2',SelectDelay,box_donorTier];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				if (DelaySelected) then {
					[] spawn {
						_pos = (vehicle player) call AH_fnc_getPos;
						_total = SelectDelay;
						_msg = format ['%1 minute(s) left until Donor box is deleted...',_total / 60];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						_i = 1;
						_s = 60;
						for '_i' from 1 to _total do {
							sleep 1;
							if ((_s / _i) == 1) then {
								_s = _s + 60;
								_total = _total - 60;
								if !(_total < 50) then {
									_msg = format ['%1 minute(s) left until Donor box is deleted...',_total / 60];
									systemChat ("""+_AH_CHAT+": "" + str _msg);
									_msg call AH_fnc_dynTextMsg;
								};
							};
						};
						_msg = 'Donor box has been deleted!';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						_boxs = nearestObjects [_pos,[""USBasicAmmunitionBox"",""ClutterCutter_EP1""],12];
						{deleteVehicle _x} forEach _boxs;
					};
					_savelog = format[""%1 spawned Donor BOX at %2,holding a %3,with %4 players within 50 meters. DELETE TIMER: %5 Tier: %5"",name player,mapGridPosition getPosATL (vehicle player),currentWeapon player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),SelectDelay,box_donorTier];
					[_savelog] call admin_adminlogAction;
				} else {
					_savelog = format[""%1 spawned Donor BOX at %2,holding a %3,with %4 players within 50 meters. DELETE TIMER: none Tier: %5"",name player,mapGridPosition getPosATL (vehicle player),currentWeapon player,(({isplayer _x} count (getPosATL (vehicle player) nearentities [[""CaManBase""],50]))-1),box_donorTier];
					[_savelog] call admin_adminlogAction;
				};
			};
			admincrate_init = {
				_msg = 'Please select weapon count.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				box_wepcount = 
				[
					["""",true],
					[""Admin Crate"",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""WEAPON COUNT: 5"",[2],"""",-5,[[""expression"",""box_WeaponCNT=5;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 10"",[3],"""",-5,[[""expression"",""box_WeaponCNT=10;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 15"",[4],"""",-5,[[""expression"",""box_WeaponCNT=15;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 20"",[5],"""",-5,[[""expression"",""box_WeaponCNT=20;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 25"",[6],"""",-5,[[""expression"",""box_WeaponCNT=25;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 30"",[7],"""",-5,[[""expression"",""box_WeaponCNT=30;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 40"",[8],"""",-5,[[""expression"",""box_WeaponCNT=40;WepCntSelected=true;""]],""1"",""1""],
					[""WEAPON COUNT: 50"",[9],"""",-5,[[""expression"",""box_WeaponCNT=50;WepCntSelected=true;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Cancel"",[11],"""",-5,[[""expression"",""box_WeaponCNT=0;WepCntSelected=true;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:box_wepcount"";
				waitUntil {((WepCntSelected)||(commandingMenu == ''))};
				if ((box_WeaponCNT == 0)||(!WepCntSelected)) exitWith {systemChat ('Box creation cancelled! WEP COUNT == 0!')};
				if (WepCntSelected) then {
					_msg = 'Weapon count selected: '+str box_WeaponCNT+'';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				_msg = 'Please select magazine count.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				box_magcount = 
				[
					["""",true],
					[""Admin Crate - Mag count"",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""MAGAZINE COUNT: 5"",[2],"""",-5,[[""expression"",""box_MagazineCNT=5;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 10"",[3],"""",-5,[[""expression"",""box_MagazineCNT=10;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 15"",[4],"""",-5,[[""expression"",""box_MagazineCNT=15;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 20"",[5],"""",-5,[[""expression"",""box_MagazineCNT=20;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 25"",[6],"""",-5,[[""expression"",""box_MagazineCNT=25;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 30"",[7],"""",-5,[[""expression"",""box_MagazineCNT=30;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 40"",[8],"""",-5,[[""expression"",""box_MagazineCNT=40;MagCntSelected=true;""]],""1"",""1""],
					[""MAGAZINE COUNT: 50"",[9],"""",-5,[[""expression"",""box_MagazineCNT=50;MagCntSelected=true;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""Cancel"",[11],"""",-5,[[""expression"",""box_MagazineCNT=0;MagCntSelected=true;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:box_magcount"";
				waitUntil {((MagCntSelected)||(commandingMenu == ''))};
				if ((box_MagazineCNT == 0)||(!MagCntSelected)) exitWith {systemChat ('Box creation cancelled! MAG COUNT == 0!')};
				if (MagCntSelected) then {
					_msg = 'Magazine count selected: '+str box_MagazineCNT+'';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				_msg = 'Please select delete timer.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				boxdelay_DAMI = 
				[
					["""",true],
					[""Admin Crate - Delete timer"",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""DELETE TIMER: 5 minute(s)"",[2],"""",-5,[[""expression"",""SelectDelay=300;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 10 minute(s)"",[3],"""",-5,[[""expression"",""SelectDelay=600;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 15 minute(s)"",[4],"""",-5,[[""expression"",""SelectDelay=900;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 20 minute(s)"",[5],"""",-5,[[""expression"",""SelectDelay=1200;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 25 minute(s)"",[6],"""",-5,[[""expression"",""SelectDelay=1500;DelaySelected=true;""]],""1"",""1""],
					[""DELETE TIMER: 30 minute(s)"",[7],"""",-5,[[""expression"",""SelectDelay=1800;DelaySelected=true;""]],""1"",""1""],
					["""",[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					[""No timer"",[11],"""",-5,[[""expression"",""SelectDelay=13337;DelaySelected=false;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:boxdelay_DAMI"";
				waitUntil {((DelaySelected)||(commandingMenu == ''))};
				if (!DelaySelected) then {SelectDelay=13337};
				
				_dir = getDir (vehicle player);
				_pos = (vehicle player) call AH_fnc_getPos;
				_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)+1];
				
				[ADMIN_BOX,player,[_dir,_pos],box_WeaponCNT,box_MagazineCNT,SelectDelay] call admin_adminREexec;
				
				_msg = format ['Admin crate spawned! DEL TIMER: %1 seconds. WEP COUNT: %2 MAG COUNT: %3',SelectDelay,box_WeaponCNT,box_MagazineCNT];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				if (DelaySelected) then {
					[] spawn {
						_pos = (vehicle player) call AH_fnc_getPos;
						_total = SelectDelay;
						_msg = format ['%1 minute(s) left until admin box is deleted...',_total / 60];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						_i = 1;
						_s = 60;
						for '_i' from 0 to _total do {
							sleep 1;
							if ((_s / _i) == 1) then {
								_s = _s + 60;
								_total = _total - 60;
								if !(_total < 50) then {
									_msg = format ['%1 minute(s) left until admin box is deleted...',_total / 60];
									systemChat ("""+_AH_CHAT+": "" + str _msg);
									_msg call AH_fnc_dynTextMsg;
								};
							};
						};
						_msg = 'Admin box has been deleted!';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						_boxs = nearestObjects [_pos,[""USBasicAmmunitionBox"",""ClutterCutter_EP1""],12];
						{deleteVehicle _x} forEach _boxs;
					};
					_near = (getPosATL (vehicle player) nearentities [[""CaManBase""],200]);
					_savelog = format[""%1 spawned BOX at %2, holding a %3, with %4 players within 200 meters. DELETE TIMER: %5 WEP CNT: %5 MAG CNT: %6"",name player,mapGridPosition getPosATL (vehicle player),currentWeapon player,(({isplayer _x} count _near)-1),SelectDelay,box_WeaponCNT,box_MagazineCNT,_near];
					[_savelog] call admin_adminlogAction;
				} else {
					_near = (getPosATL (vehicle player) nearentities [[""CaManBase""],200]);
					_savelog = format[""%1 spawned BOX at %2, holding a %3, with %4 players within 200 meters. DELETE TIMER: none WEP CNT: %5 MAG CNT: %6"",name player,mapGridPosition getPosATL (vehicle player),currentWeapon player,(({isplayer _x} count _near)-1),box_WeaponCNT,box_MagazineCNT];
					[_savelog] call admin_adminlogAction;
				};
			};
			admincrate = {
				ADMIN_BOX = 6;
				DelaySelected 	= false;
				SelectDelay 	= false;
				MagCntSelected 	= false;
				WepCntSelected  = false;
				box_WeaponCNT 	= 1;
				box_MagazineCNT = 1;
				closeDialog 0;
				call admincrate_init;
			};
			admincrate_epoch_2 = {
				ADMIN_BOX = 13;
				DelaySelected 	= false;
				SelectDelay = false;
				MagCntSelected 	= false;
				WepCntSelected  = false;
				box_WeaponCNT 	= 1;
				box_MagazineCNT = 1;
				closeDialog 0;
				call admincrate_init;
			};
			admincrate_epoch_3 = {
				ADMIN_BOX = 14;
				DelaySelected 	= false;
				SelectDelay = false;
				MagCntSelected 	= false;
				WepCntSelected  = false;
				box_WeaponCNT 	= 1;
				box_MagazineCNT = 1;
				closeDialog 0;
				call admincrate_init;
			};
			admincrate_epoch_4 = {
				ADMIN_BOX = 15;
				DelaySelected 	= false;
				SelectDelay = false;
				MagCntSelected 	= false;
				WepCntSelected  = false;
				box_WeaponCNT 	= 1;
				box_MagazineCNT = 1;
				closeDialog 0;
				call admincrate_init;
			};
			admin_godmodeToggle = {
				if (isNil ""gmdadmin"") then {gmdadmin = 0};
				if (gmdadmin == 0) then {
					gmdadmin = 1;
					[] spawn {
						dami_zombiecheck 		= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
						dami_damageHandler 		= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
						dami_death 				= (if (preProcessFile 'DamiMods\Epoch\dami_PD.sqf' != '') then [{compile preprocessFileLineNumbers 'DamiMods\Epoch\dami_PD.sqf'},{compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf'}]);
						dami_RespawnTime 		= playerRespawnTime;
						dami_UnconFunc 			= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
						fnc_usec_damageHandler 	= {};
						fnc_usec_unconscious  	= {};
						player_death 			= {};
						playerRespawnTime 		= {};
						player_zombieCheck 		= {};
						dayz_hunger 			= -100;
						dayz_thirst 			= -100;
						dayz_temperatur 		= 37;
						r_player_inpain 		= false;
						r_player_infected 		= false;
						r_player_injured 		= false;
						player removeAllEventHandlers ""handleDamage"";
						player addEventHandler [""handleDamage"",{false}];
						player allowDamage false;
						while {gmdadmin == 1} do {
							fnc_usec_damageHandler 	= {};
							fnc_usec_unconscious  	= {};
							player_death 			= {};
							playerRespawnTime 		= {};
							player_zombieCheck 		= {};
							dayz_hunger 			= -100;
							dayz_thirst 			= -100;
							dayz_temperatur 		= 37;
							r_player_inpain 		= false;
							r_player_infected 		= false;
							r_player_injured 		= false;
							player removeAllEventHandlers ""handleDamage"";
							player addEventHandler [""handleDamage"",{false}];
							player allowDamage false;
							sleep 0.2;
						};
						player removeAllEventHandlers ""handleDamage"";
						player allowDamage true;
						
						fnc_usec_damageHandler 	= dami_damageHandler;
						fnc_usec_unconscious 	= dami_UnconFunc;
						player_death 			= dami_death;
						playerRespawnTime 		= dami_RespawnTime;
						player_zombieCheck 		= dami_zombiecheck;
						
						player addEventHandler ['HandleDamage',{_this call fnc_usec_damageHandler}];
					};
					_msg = 'Godmode Activated.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 enabled godmode at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				} else {
					gmdadmin = 0;
					_msg = 'Godmode Deactivated.';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_near = (getPosATL (vehicle player) nearentities [['CaManBase'],200]);
					_savelog = format ['%1 disabled godmode at %5, with %2 players within 200m. %1 has %3 plus %4 kills.',name player,(({isplayer _x} count _near)-1),(player getVariable['humanKills',0]),(player getVariable['banditKills',0]),mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_invisibleToggle = {
				if (isNil 'inv1') then {inv1 = 0};
				if (inv1 == 0) then {
					if (vehicle player != player) then {
						type_of_player_invis = ""Survivor_2_DZ"";
					} else {type_of_player_invis = typeOf player};
					[dayz_playerUID,dayz_characterID,'Survivor1_DZ'] spawn player_humanityMorph;
					
					[4,player,1] call admin_adminREexec;
					inv1 = 1;
					_msg = ""Invisibility Enabled"";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					closeDialog 0;
					
					_savelog = format[""%1 enabled invisibility."",name player,_this select 0];
					[_savelog] call admin_adminlogAction;
				} else {
					if !(isNil ""type_of_player_invis"") then {
						[dayz_playerUID,dayz_characterID,type_of_player_invis] spawn player_humanityMorph;
					};
					[4,player,0] call admin_adminREexec;
					inv1 = 0;
					_msg = ""Invisibility Disabled"";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					closeDialog 0;
					
					_savelog = format[""%1 disabled invisibility."",name player,_this select 0];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_breaklegsTarget = {
				_name = _this select 0;
				_msg = format ['Breaking %1''s legs',_name];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[format ['if (name player == ''%1'') then {player setHit [''legs'',1]};',_name]] spawn admin_dothis;
				
				_savelog = format[""%1 broke %2's legs"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_specESP = {
				_allPlayers = playableUnits;
				if (isnil '"+_RND+"_adminspecESP') then {"+_RND+"_adminspecESP = 0};
				if ("+_RND+"_adminspecESP == 0) then {
					"+_RND+"_adminspecESP = 1;
				} else {
					"+_RND+"_adminspecESP = 0;
					{_friend = _x;clearGroupIcons _friend} forEach allGroups;
				};
				_AHT_SGIV = true;
				setGroupIconsVisible [_AHT_SGIV,_AHT_SGIV];
				while {"+_RND+"_adminspecESP == 1} do {
					admin_centerUnit = admin_AHactiveTarget;
					{
						if ("+_playerID+" _x != "+_playerID+" player) then {
							if (vehicle _x != _x) then {
								_friend = (group _x);clearGroupIcons _friend;
								_driver = (driver (vehicle _x));
								if (_driver == _x) then {
									_crew = [];
									_driver = _x;
									{
										if (_x != _driver) then {
											_crew = _crew + [name _x];
										};
									} forEach (crew (vehicle _x));
									(group _x) addGroupIcon ['b_inf'];
									if (count _crew < 1) then {
										_veh = (getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'));
										(group _x) setGroupIconParams [[0,0,1 ,1],format ['%1 (%3 - %2m)',name _x,round (_x distance admin_centerUnit),_veh],0.7,true];
									} else {
										(group _x) setGroupIconParams [[0,0,1 ,1],format ['D: %1 (%2m) P: %3',name _x,round (_x distance admin_centerUnit),_crew],0.7,true];
									};
								} else {
									if ((isNull _driver)||(!alive _driver)||(!isPlayer _driver)) then {
										_crew = [];
										{_crew = _crew + [name _x]} forEach (crew (vehicle _x));
										_veh = (getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _x)) >> 'displayName'));
										(group _x) addGroupIcon ['b_inf'];
										(group _x) setGroupIconParams [[0,0,1 ,1],format ['D: None (%3 - %1m) P: %2',round (_x distance admin_centerUnit),_crew,_veh],0.7,true];
									};
								};
							} else {
								_friend = (group _x);clearGroupIcons _friend;
								(group _x) addGroupIcon ['x_art'];
								(group _x) setGroupIconParams [[0,0,1 ,1],format ['%1 (%2m)',name _x,round (_x distance admin_centerUnit)],0.7,true];
							};
						} else {
							_friend = (group _x);clearGroupIcons _friend;
							(group _x) addGroupIcon ['b_inf'];
							(group _x) setGroupIconParams [[1,1,0 ,1],'You',0.7,true];
						};
					} forEach _allPlayers;
					sleep 1;
				};
				{_friend = _x;clearGroupIcons _friend} forEach allGroups;
			};
			admin_unspectate = {
				(vehicle player) switchCamera 'EXTERNAL';
				['',safezoneX+0.4,safezoneY+0.5,5,0,0,3031] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.55,1,0,0,3032] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.6,1,0,0,3033] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.65,1,0,0,3034] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.7,1,0,0,3035] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.75,1,0,0,3036] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.8,1,0,0,3037] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.8,1,0,0,3038] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.8,1,0,0,3039] spawn AH_fnc_dynamictext;
				['',safezoneX+0.2,safezoneY+0.8,1,0,0,3040] spawn AH_fnc_dynamictext;
				['',safeZoneX,safezoneY,1,0,0,3090] spawn AH_fnc_dynamictext;
				admin_AHactiveTarget = objNull;
				admin_AHactiveTargetState = objNull;
				spectating_player = false;
				if !(isNil 'admin_AHtarget') then {
					[format ['<t size=''1''color=''#FF3300''font=''Zeppelin33''align=''center''>Unspectated</t> %1',admin_AHtarget],safezoneX+0.4,safezoneY+0.5,5,0,0,3031] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.55,1,0,0,3032] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.6,1,0,0,3033] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.65,1,0,0,3034] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.7,1,0,0,3035] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.75,1,0,0,3036] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.8,1,0,0,3037] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.8,1,0,0,3038] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.8,1,0,0,3039] spawn AH_fnc_dynamictext;
					['',safezoneX+0.2,safezoneY+0.8,1,0,0,3040] spawn AH_fnc_dynamictext;
					['',safeZoneX,safezoneY,1,0,0,3090] spawn AH_fnc_dynamictext;
					
					"+_RND+"_adminspecESP = 0;
					{_friend = _x;clearGroupIcons _friend} forEach allGroups;
					_msg = 'Unspectating player '+str admin_AHtarget+'';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_savelog = format[""%1 Unspectated %2"",name player,admin_AHtarget];
					[_savelog] call admin_adminlogAction;
					
					admin_AHtarget = nil;
					admin_AHactiveTarget = objNull;
					spectating_player = false;
				};
			};
			admin_spectateTarget = {
				admin_AHtarget = _this select 0;
				
				if (admin_AHtarget == name player) exitWith {call admin_unspectate};
				if (admin_AHtarget == name admin_AHactiveTarget) exitWith {};
				
				admin_AHactiveTarget = _this select 1;
				
				_savelog = format['%1 spectated %2',name player,admin_AHtarget];
				[_savelog] call admin_adminlogAction;
				
				_msg = 'Spectating player '+str admin_AHtarget+'';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				if (spectating_player) exitWith {};
				player_spectateInit = {
					if (isnil '"+_RND+"_adminESPmarkers') then {"+_RND+"_adminESPmarkers = 0};
					if ("+_RND+"_adminESPmarkers == 0) then {
						AH_spectateESP = true;
						[] spawn admin_specESP;
					};
					admin_AHactiveTargetState = (vehicle admin_AHactiveTarget);
					(vehicle admin_AHactiveTarget) switchCamera 'External';
					spectating_player = true;
					while {spectating_player} do {
						if ((isNil 'admin_AHtarget')||(isNull admin_AHactiveTarget)||(!spectating_player)) exitWith {call admin_unspectate};
						if ((admin_AHactiveTargetState != (vehicle admin_AHactiveTarget))||(cameraOn != (vehicle admin_AHactiveTarget))) then {
							admin_AHactiveTargetState = (vehicle admin_AHactiveTarget);
							admin_AHactiveTargetState switchCamera 'External';
						};
						_name 	= name admin_AHactiveTarget;
						_uid 	= "+_playerID+" admin_AHactiveTarget;
						_blood 	= admin_AHactiveTarget getVariable['USEC_BloodQty','Not yet synced'];
						_humty 	= admin_AHactiveTarget getVariable['humanity',0];
						_GPSpos = mapGridPosition getPosATL (vehicle admin_AHactiveTarget);
						_speedzr = round(speed (vehicle admin_AHactiveTarget));
						_nrplyr = ({isPlayer _x} count (getPosATL (vehicle admin_AHactiveTarget) nearentities [['CAManBase'],300]));
						if (vehicle admin_AHactiveTarget == admin_AHactiveTarget) then {_nrplyr = _nrplyr - 1};
						if (isNil 'spectating_player') exitWith {};
						['<t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+_name+' (<t size=''0.55''color=''#FF3300''font=''Zeppelin33''align=''left''>'+_uid+'</t><t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>)</t>',safezoneX+0.2,safezoneY+0.5,4,0,0,3031] spawn AH_fnc_dynamictext;
						['<t size=''0.55''color=''#FF3300''font=''Zeppelin33''align=''left''>Blood: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _blood+'</t>',safezoneX+0.2,safezoneY+0.55,4,0,0,3032] spawn AH_fnc_dynamictext;
						['<t size=''0.55''color=''#FF3300''font=''Zeppelin33''align=''left''>Humanity: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _humty+'</t>',safezoneX+0.2,safezoneY+0.6,4,0,0,3033] spawn AH_fnc_dynamictext;
						if (vehicle admin_AHactiveTarget != admin_AHactiveTarget) then {
							_crew = [];
							_drvr = (driver (vehicle admin_AHactiveTarget));
							_driver = 'None.';
							{if (_x != _drvr) then {_crew = _crew + [name _x]} else {_driver = name _x}} forEach (crew (vehicle admin_AHactiveTarget));
							['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>D: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _driver+'</t>',safezoneX+0.2,safezoneY+0.65,4,0,0,3034] spawn AH_fnc_dynamictext;
							['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>P:</t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _crew+'</t>',safezoneX+0.2,safezoneY+0.7,4,0,0,3035] spawn AH_fnc_dynamictext;
						} else {
							_wep 	= currentWeapon (vehicle admin_AHactiveTarget);
							_ammo 	= (vehicle admin_AHactiveTarget) ammo _wep;
							['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>Weapon: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+_wep+'</t>',safezoneX+0.2,safezoneY+0.65,4,0,0,3034] spawn AH_fnc_dynamictext;
							['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>Ammo in clip: </t> <t size=''0.45''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _ammo+'</t>',safezoneX+0.2,safezoneY+0.7,4,0,0,3035] spawn AH_fnc_dynamictext;
						};
						['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>Players within 300m: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _nrplyr+'</t>',safezoneX+0.2,safezoneY+0.75,4,0,0,3036] spawn AH_fnc_dynamictext;
						['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>speed: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str _speedzr+'</t>',safezoneX+0.2,safezoneY+0.8,4,0,0,3037] spawn AH_fnc_dynamictext;
						['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>GPS POS: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+_GPSpos+'</t>',safezoneX+0.2,safezoneY+0.85,4,0,0,3038] spawn AH_fnc_dynamictext;
						if (admin_AHactiveTarget getVariable ['bankMoney',97532468] != 97532468) then {
							['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>Cash: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str(admin_AHactiveTarget getVariable ['cashMoney',0])+'</t>',safezoneX+0.2,safezoneY+0.90,4,0,0,3039] spawn AH_fnc_dynamictext;
							['<t size=''0.45''color=''#FF3300''font=''Zeppelin33''align=''left''>Bank: </t> <t size=''0.55''color=''#ffffff''font=''Zeppelin33''align=''left''>'+str(admin_AHactiveTarget getVariable ['bankMoney',0])+'</t>',safezoneX+0.2,safezoneY+0.95,4,0,0,3040] spawn AH_fnc_dynamictext;
						};
						sleep 1;
					};
				};
				call player_spectateInit;
			};
			admin_viewgearTarget = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				createGearDialog [_plyr,""RscDisplayGear""];
				_msg = format [""Viewing %1's gear"",name _plyr];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_killTarget = {
				_allPlayers = playableUnits;
				_name = _this select 0;
				_plyr = _this select 1;
				
				if (_name == name player) exitWith {[] spawn player_death};
				
				if ("+_playerID+" _plyr in levelthree) exitWith {
					[] spawn {
						_msg = (name player+'! Why would you try to kill an admin?');
						systemChat ('"+_AH_CHAT+": '+str _msg);
						_msg call AH_fnc_dynTextMsg;
						player selectWeapon (secondaryWeapon player);
						player playMoveNow 'ActsPercMstpSnonWpstDnon_suicide1B';
						waitUntil {animationState player == 'ActsPercMstpSnonWpstDnon_suicide1B'};
						uiSleep 4.15;
						player fire (currentWeapon player);
						sleep 1.4;
						r_player_blood = 0;
						[] spawn player_death;
					};
					_savelog = format[""%1 tried to admin-kill %2"",name player,_name];
					[_savelog] call admin_adminlogAction;
				};
				_exec = format [""if (name player == '%1') then {[] spawn player_death};"",_name,name player];
				[_exec] spawn admin_dothis;
				
				_msg = (""Killed ""+str _name);
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_savelog = format[""%1 admin-killed %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_disconnectTarget = {
				_name = _this select 0;
				
				_msg = ""Disconnecting ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_forceDisc = ""
				if (name player == '""+_name+""') then {
					_msg = 'You have been disconnected by ""+name player+""';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_msg call AH_fnc_dynTextMsg;
					endMission 'LOSER';
				};"";
				[_forceDisc] spawn admin_dothis;
				
				_savelog = format[""%1 disconnected %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			admin_muteTarget = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_muteCheck = _plyr getVariable ['AH_MUTED',false];
				if !(_muteCheck) then {
					_msg = format ['%1 has muted you.',name player];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					_msg = 'Muting '+_name+'';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_plyr setVariable ['AH_MUTED',true,true];
					
					_savelog = format[""%1 muted %2"",name player,_name];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = format ['%1 has unmuted you.',name player];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					_msg = 'Unmuting '+_name+'';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_plyr setVariable ['AH_MUTED',false,true];
					
					_savelog = format[""%1 unmuted %2"",name player,_name];
					[_savelog] call admin_adminlogAction;
				};
				
				call admin_fillPlayers;
				_muteClient = ""if (name player == '""+_name+""') then {
					[] spawn {
						disableSerialization;
						if (isNil 'DAMI_IS_GOD') then {DAMI_IS_GOD = false};
						if (DAMI_IS_GOD) then {DAMI_IS_GOD = false} else {
							DAMI_IS_GOD = true;
							while {DAMI_IS_GOD} do {
								_display1 = findDisplay 55;
								_display2 = findDisplay 63;
								_display3 = findDisplay 24;
								if ((!isNull _display1)||(!isNull _display2)||(!isNull _display3)) then {
									_msg1 = ctrlText ((findDisplay 55) displayCtrl 101);
									_msg2 = ctrlText ((findDisplay 63) displayCtrl 101);
									_msgchk1 = '\ca\ui\textures\mikrak.paa';
									_msgchk2 = 'Side channel';
									if (_msg1 == _msgchk1) then {	
										(findDisplay 55) closeDisplay 0;
										(findDisplay 24) closeDisplay 0;
										player setVelocity [0,0,2];
										systemChat ('NO VOICE CHAT EITHER! PREPARE TO FLY!');
									};
									if (_msg2 == _msgchk2) then {
										(findDisplay 63) closeDisplay 0;
										(findDisplay 24) closeDisplay 0;
										systemChat ('Please stop trying to talk, you have been muted by an admin!!');
									};
									if (!isNull (findDisplay 24)) then {(findDisplay 24) closeDisplay 0};
								};
								sleep 0.1;
							};
						};
					};
				};"";
				[_muteClient] spawn admin_dothis;
			};
			admin_crashTarget = {
				if (isNil 'CRASH_CLIENT_IN_PROGRESS') then {CRASH_CLIENT_IN_PROGRESS=false};
				if (CRASH_CLIENT_IN_PROGRESS) exitWith {
					_msg = ""Please wait,crash already in progress."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				_name = _this select 0;
				
				_msg = ""Crashing ""+str _name+""'s client..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_savelog = format[""%1 client-crashed %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
				
				CRASH_CLIENT_IN_PROGRESS = true;
				CRASH_CLIENT_LOOP = 1;
				[] spawn {
					sleep 2;
					CRASH_CLIENT_LOOP = 0;
				};
				while {CRASH_CLIENT_LOOP == 1} do {
					_crash_CLIENT = ""if (local player) then {
						if (name player == '""+_name+""') then {
							[] spawn {
								while {1 == 1} do {
									[] spawn {while {true} do {systemChat ('CRASH')}};
									[] spawn {'Old_bike_TK_CIV_EP1' createVehicleLocal (getPosATL (vehicle player)};
									terminate dayz_slowcheck;
									[] spawn {
										_crash = '#particlesource' createVehicleLocal (getPosATL (vehicle player));
										_crash setParticleParams [['\ca\data\flare00.p3d',16,10,48,0],'','SpaceObject',1,10,[0,0,0],[0,0,5],1,2,1,0,[5],[[0.5,0.5,0.5,0.3],[0.75,0.75,0.75,0.15],[1,1,1,0]],[1],0.1,5,'','',(vehicle player)];
										_crash setParticleCircle [2,[0,0,0]];
										_crash setDropInterval 0.00000000000001;
									};
									[] spawn {
										_cr4sh = '#particlesource' createVehicleLocal (getPosATL (vehicle player));
										_cr4sh setParticleParams [['\CA\air2\C130J\C130J.p3d',16,10,48,0],'','SpaceObject',1,10,[0,0,0],[0,0,5],1,2,1,0,[1],[[0.5,0.5,0.5,0.3],[0.75,0.75,0.75,0.15],[1,1,1,0]],[1],0.1,5,'','',(vehicle player)];
										_cr4sh setParticleCircle [2,[0,0,0]];
										_cr4sh setDropInterval 0.00000000000001;
									};
									endloadingscreen;
									closeDialog 0;
									_i = 0;
									for '_i' from 0 to 50 do {player removeAction _i};
									hint parseText format ['<t size=''1.5'' color=''#FF33FF''>CRASH %1!!!</t><br/>'];
									sleep 0.01;
								};
							};
						};
					};"";
					[_crash_CLIENT] spawn admin_dothis;
					sleep 0.1;
				};
				
				CRASH_CLIENT_IN_PROGRESS = false;
			};
			admin_removegearTarget = {
				_name = _this select 0;
				_msg = ""Deleting ""+str _name+""'s gear..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has deleted your gear.',name player];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				_remvgear = ""
				if (name player == '""+_name+""') then {
					removeAllWeapons player;
					removeAllItems player;
					removeBackpack player;
				};"";
				[_remvgear] spawn admin_dothis;
				
				_savelog = format[""%1 deleted %2's Gear"",name player,_this select 0];
				[_savelog] call admin_adminlogAction;
			};
			admin_targetTPhere = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = 'Teleporting '+_name+' here!';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_admintp = 'if (name player == '+str _name+') then {player setVariable [''AH_currentPos'',((vehicle player) call AH_fnc_getPos),true]};';
				[_admintp] spawn admin_dothis;
				
				_savelog = format['%1 teleported %2 to themself.',name player,_this select 0];
				[_savelog] call admin_adminlogAction;
				
				waitUntil {(typeName(_plyr getVariable ['AH_CurrentPos','bad']) == 'ARRAY')};
				
				_oldpos = _plyr getVariable ['AH_CurrentPos','bad'];
				if (typeName(_oldPos) != 'ARRAY') exitWith {systemChat ('ERROR!')};
				
				if (count admin_TPlog >= admin_maxTPlogs) then {
					admin_TPlog set [0,objNUll];
					admin_TPlog = admin_TPlog - [objNull];
				};
				
				admin_TPlog = admin_TPlog + [format['[''%1'',''%2'']',_name,_oldpos]];
				
				profileNamespace setVariable ['AHT_TPlogArr',admin_TPlog];
				saveProfileNamespace;
				
				_plyr setVariable ['AH_CurrentPos','bad',true];
				
				_pos = (vehicle player) call AH_fnc_getPos;
				_dir = getDir (vehicle player);
				_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir),(_pos select 2)+1];
				if (_plyr != (vehicle _plyr)) then {
					_pos = [(_pos select 0)+5*sin(_dir),(_pos select 1)+5*cos(_dir),(_pos select 2)+1];
					if ((vehicle _plyr) isKindOf 'AIR') then {
						_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),(_pos select 2)+4];
					};
				};
				
				_msg = format ['%1 is teleporting you to them.',name player];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				_admintp = 'if (name player == '+str _name+') then {
					if (vehicle player != player) then {
						_crew = (crew (vehicle player));
						if (count _crew > 0) then {
							{_x setVariable [''AdminTempTele"+_RND+"'',true,true]} forEach _crew;
							_crew spawn {
								sleep 5;
								{_x setVariable [''AdminTempTele"+_RND+"'',false,true]} forEach _this;
							};
						};
					} else {
						player setVariable [''AdminTempTele"+_RND+"'',true];
						player allowDamage false;
						[] spawn {
							sleep 5;
							player allowDamage true;
							player setVariable [''AdminTempTele"+_RND+"'',false];
						}
					};
					(vehicle player) setVelocity [0,0,1];
					[(vehicle player),'+str _pos+'] call AH_fnc_setPos;
				};';
				[_admintp] spawn admin_dothis;
			};
			admin_teleportToTarget = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				if (count admin_TPlog >= admin_maxTPlogs) then {
					admin_TPlog set [0,objNUll];
					admin_TPlog = admin_TPlog - [objNull];
				};
				
				admin_TPlog = admin_TPlog + [format['[''%1'',''%2'']',name player,(getPosATL player)]];
				
				profileNamespace setVariable ['AHT_TPlogArr',admin_TPlog];
				saveProfileNamespace;
				
				_savelog = format[""%1 teleported to %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
				
				_msg = format ['%1 is teleporting to you.',name player];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_val = [0,-1,0];
				if ((vehicle player) != player) then {_val = [0,-4.5,1]};
				if ((vehicle player) isKindOf ""AIR"") then {_val = [0,-4,10]};
				(vehicle player) attachTo [(vehicle _plyr),_val,''];
				
				_msg = format [""Moving to %1"",_name];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				sleep 1;
				detach (vehicle player);
				(vehicle player) setVelocity [0,0,1];
			};
			admin_revertPos = {
				_name = _this select 0;
				_ppos = _this select 1;
				
				admin_TPlog = admin_TPlog - [format['[''%1'',''%2'']',_name,_ppos]];
				profileNamespace setVariable ['AHT_TPlogArr',admin_TPlog];
				saveProfileNamespace;
				
				if (_name != name player) then {
					_msg = format ['Reverted TP for %1 (GPS: %2).',_name,mapGridPosition _ppos];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_msg = format ['%1 has reverted you to position %2',name player,mapGridPosition _ppos];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					
					_admintp = 'if (name player == '+str _name+') then {
						if (vehicle player != player) then {
							_crew = (crew (vehicle player));
							if (count _crew > 0) then {
								{_x setVariable [''AdminTempTele"+_RND+"'',true,true]} forEach _crew;
								_crew spawn {
									sleep 5;
									{_x setVariable [''AdminTempTele"+_RND+"'',false,true]} forEach _this;
								};
							};
						} else {
							player setVariable [''AdminTempTele"+_RND+"'',true];
							player allowDamage false;
							[] spawn {
								sleep 5;
								player allowDamage true;
								player setVariable [''AdminTempTele"+_RND+"'',false];
							}
						};
						(vehicle player) setVelocity [0,0,1];
						[(vehicle player),'+str _ppos+'] call AH_fnc_setPos;
					};';
					[_admintp] spawn admin_dothis;
					
					_savelog = format['%1 revert-teleported %2 back to %3.',name player,_name,_ppos];
					[_savelog] call admin_adminlogAction;
				} else {
					if (vehicle player != player) then {
						_crew = (crew (vehicle player));
						if (count _crew > 0) then {
							_crew spawn {
								{_x setVariable ['AdminTempTele"+_RND+"',true,true]} forEach _this;
								sleep 5;
								{_x setVariable ['AdminTempTele"+_RND+"',false,true]} forEach _this;
							};
						};
					};
					[(vehicle player),_ppos] call AH_fnc_setPos;
					(vehicle player) setVelocity [0,0,1];
					_msg = format ['Moving to your old position at %1 (GPS: %2).',_ppos,mapGridPosition _ppos];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				call admin_fillList;
			};
			admin_clearTPlog = {
				admin_TPlog = [];
				profileNamespace setVariable ['AHT_TPlogArr',admin_TPlog];
				saveProfileNamespace;
				_msg = format ['TP log cleared!'];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				call admin_fillList;
			};
			admin_playerMorph = {
				_name = _this select 0;
				_skin = _this select 1;
				if (_name == '') then {
					_skin spawn {
						_skin = _this;
						_msg = 'Skin changed to '+str _skin+'';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						0 fadeSound 1;
						disableUserInput false;
						if ((_skin isKindOf 'CAAnimalBase')||(_skin isKindOf 'zZombie_Base')) then {
							removeAllWeapons player;
							_msg = 'Zombie/Animal skin detected! All weapons temporarily removed.';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
						};
						if (isNil 'dayz_characterID') then {dayz_characterID = ("+_playerID+" player)};
						[dayz_playerUID,dayz_characterID,_skin] spawn player_humanityMorph;
						waitUntil {(typeOf player == _skin)};
						player switchCamera 'EXTERNAL';
					};
					_savelog = format ['%1 changed their skin to %2',name player,_skin];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = 'Changed '+str _name+' ''s skin to '+str _skin+'';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_msg = format ['%1 has changed your skin to %2',name player,_skin];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					
					_playerMorph = format ['
					if (name player == ''%1'') then {
						[] spawn {
							if ((''%2'' isKindOf ''CAAnimalBase'')||(''%2'' isKindOf ''zZombie_Base'')) then {
								removeAllWeapons player;
								_msg = ''Zombie/Animal skin detected! All weapons removed.'';
								systemChat (''"+_AH_CHAT+": ''+str _msg);
							};
							[dayz_playerUID,dayz_characterID,''%2''] spawn player_humanityMorph;
							waitUntil {(typeOf player == ''%2'')};
							player switchCamera ''EXTERNAL'';
						};
					};',_name ,_skin];
					[_playerMorph] spawn admin_dothis;
					
					_savelog = format ['%1 changed %2''s skin to %3',name player,_name,_skin];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_colorChange = {
				_color 	= _this select 0;
				_name 	= _this select 1;
				_plyr 	= _this select 2;
				
				event_pclr = switch (_color) do {
					default {'#(argb,112.91,1.33,0.1291)color(311,0,1,0.2)'};
					case 'c_red': {'#(argb,1,1,1)color(1,0,0,5)'};
					case 'c_green': {'#(argb,1,1,1)color(0,1,0,5)'};
					case 'c_darkgreen': {'#(argb,1,1,1)color(0.01,0.15,0.01,1)'};
					case 'c_blue': {'#(argb,1,1,1)color(0,0,1,5)'};
					case 'c_yellow': {'#(argb,1,1,1)color(1,1,0,1)'};
					case 'c_orange': {'#(argb,1,1,1)color(1,0.4,0.15,1)'};
					case 'c_lightpink': {'#(argb,1,1,1)color(1.514125,0.51231,0.45232,612.111)'};
					case 'c_pink': {'#(argb,1,1,1)color(1,0.5,1,1)'};
					case 'c_lpurple': {'#(argb,1,1,1)color(1.514125,0.51231,5.45232,612.111)'};
					case 'c_purple': {'#(argb,1,1,1)color(1,0,1,1)'};
					case 'c_darkpurple': {'#(argb,1,1,1)color(1,0,1,0.2)'};
					case 'c_cyan': {'#(argb,1,1,1)color(0,1,1,1)'};
					case 'c_white': {'#(argb,1,1,1)color(1,1,1,1)'};
					case 'c_black': {'#(argb,1,1,1)color(0,0,0,1)'};
					case 'c_invisible': {'#(argb,112.91,1.33,0.1291)color(311,0,1,0.2)'};
				};
				
				_msg = format ['%1 has changed your color to %2',name player,_color];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				"+_RND+"_colorme = [_plyr,event_pclr,'join'];
				publicVariableServer '"+_RND+"_colorme';
				
				_savelog = format ['%1 changed %2''s color to %3',name player,_name,_color];
				[_savelog] call admin_adminlogAction;
			};
			admin_changecolor_NONE = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = 'Disabled colour for '+_name+', player must change skin or rejoin to remove colour from current skin (it''s not possible to remove colours from vehicles).';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				"+_RND+"_colorme = [_plyr,'','leave'];
				publicVariableServer '"+_RND+"_colorme';
			};
			admin_changecolor_RED 		= {['c_red',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_PINK 		= {['c_pink',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_LPINK 	= {['c_lightpink',_this select 0,_this select 1] 	call admin_colorChange};
			admin_changecolor_DPURPLE 	= {['c_darkpurple',_this select 0,_this select 1] 	call admin_colorChange};
			admin_changecolor_PURPLE 	= {['c_purple',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_LPURPLE 	= {['c_lpurple',_this select 0,_this select 1] 	call admin_colorChange};
			admin_changecolor_DGREEN 	= {['c_darkgreen',_this select 0,_this select 1] 	call admin_colorChange};
			admin_changecolor_GREEN 	= {['c_green',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_CYAN 		= {['c_cyan',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_BLUE 		= {['c_blue',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_ORANGE 	= {['c_orange',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_YELLOW 	= {['c_yellow',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_WHITE 	= {['c_white',_this select 0,_this select 1] 		call admin_colorChange};
			admin_changecolor_BLACK 	= {['c_black',_this select 0,_this select 1] 		call admin_colorChange};
			manipulate_instantbuild = {
				_allPlayers = playableUnits;
				_name = _this select 0;
				
				_plrtgle = toArray _name;
				_varcnvt = _plrtgle;
				{_varcnvt = _varcnvt - [_x]} forEach [32,91,93,123,125,40,41,39,34,59,92,47,45,58,59,60,62,43,61,42,38,94,37,36,35,64,33,96,126,124,63,46,44];
				_toggled = toString _varcnvt;
				
				{
					if (name _x == _name) then {
						_muteCheck = _x getVariable ['AH_INSTNTBLD',false];
						if !(_muteCheck) then {
							_msg = 'Enabling instant build for '+_name+'';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
							_x setVariable ['AH_INSTNTBLD',true,true];
							
							_savelog = format[""%1 enabled instant build for %2"",name player,_name];
							[_savelog] call admin_adminlogAction;
						} else {
							_msg = 'Disabling instant build for '+_name+'';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
							_x setVariable ['AH_INSTNTBLD',false,true];
							
							_savelog = format[""%1 disabled instant build for %2"",name player,_name];
							[_savelog] call admin_adminlogAction;
						};
					};
				} forEach _allPlayers;
				
				_savelog = format[""%1 toggled instant build for %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
				
				_instntbd = format [""if (name player == '%1') then {
					if (!isNil 'AM_Epoch_ADMIN') then {
						_msg = 'Instant build is now disabled.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
						_msg call AH_fnc_dynTextMsg;
						AM_Epoch_ADMIN = nil;
					} else {
						_msg = 'Instant build is now enabled.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
						_msg call AH_fnc_dynTextMsg;
						AM_Epoch_ADMIN = true;
					};
				};"",_name,name player];
				[_instntbd] spawn admin_dothis;
			};
			manipulate_norestrictions = {
				_allPlayers = playableUnits;
				_name = _this select 0;
				
				_plrtgle = toArray _name;
				_varcnvt = _plrtgle;
				{_varcnvt = _varcnvt - [_x]} forEach [32,91,93,123,125,40,41,39,34,59,92,47,45,58,59,60,62,43,61,42,38,94,37,36,35,64,33,96,126,124,63,46,44];
				_toggled = toString _varcnvt;
				
				{
					if (name _x == _name) then {
						_muteCheck = _x getVariable ['AH_EPOCH_NORESTRICT',false];
						if !(_muteCheck) then {
							_msg = 'Enabling no restrictions for '+_name+'';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
							_x setVariable ['AH_EPOCH_NORESTRICT',true,true];
							
							_savelog = format[""%1 enabled no restrictions for %2"",name player,_name];
							[_savelog] call admin_adminlogAction;
						} else {
							_msg = 'Disabling no restrictions for '+_name+'';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
							_x setVariable ['AH_EPOCH_NORESTRICT',false,true];
							
							_savelog = format[""%1 disabled no restrictions for %2"",name player,_name];
							[_savelog] call admin_adminlogAction;
						};
					};
				} forEach _allPlayers;
				
				_savelog = format[""%1 toggled no building restrictions for %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
				
				_norestrc = format [""if (name player == '%1') then {
					if (!isNil 'AM_Epoch_ADMIN_norestrict') then {
						_msg = 'No building restrictions disabled.';
						systemChat ("""""+_AH_CHAT+": """" + str _msg);
						AM_Epoch_ADMIN_norestrict = nil;
					} else {
						_msg = 'No building restrictions enabled.';
						systemChat ("""""+_AH_CHAT+": """" + str _msg);
						AM_Epoch_ADMIN_norestrict = true;
					};
				};"",_name,name player];
				[_norestrc] spawn admin_dothis;
			};
			manipulate_godmode = {
				_allPlayers = playableUnits;
				_name = _this select 0;
				
				_plrtgle = toArray _name;
				_varcnvt = _plrtgle;
				{_varcnvt = _varcnvt - [_x]} forEach [32,91,93,123,125,40,41,39,34,59,92,47,45,58,59,60,62,43,61,42,38,94,37,36,35,64,33,96,126,124,63,46,44];
				_toggled = toString _varcnvt;
				
				{
					if (name _x == _name) then {
						_godCheck = _x getVariable ['AH_MANIGOD',false];
						if !(_godCheck) then {
							_msg = 'Enabling godmode for '+_name+'';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
							_x setVariable ['AH_MANIGOD',true,true];
							
							_savelog = format[""%1 godmoded %2"",name player,_name];
							[_savelog] call admin_adminlogAction;
						} else {
							_msg = 'Disabling godmode for '+_name+'';
							systemChat ("""+_AH_CHAT+": "" + str _msg);
							_msg call AH_fnc_dynTextMsg;
							_x setVariable ['AH_MANIGOD',false,true];
							
							_savelog = format[""%1 ungodmoded %2"",name player,_name];
							[_savelog] call admin_adminlogAction;
						};
					};
				} forEach _allPlayers;
				
				_morphtarget= format [""if (name player == '%1') then {
					_godCheck = player getVariable ['AH_MANIGOD',false];
					if !(_godCheck) then {
						0 fadesound 1;
						player setHit ['legs',0];
						player removeAllEventHandlers 'handleDamage';
						player addEventHandler ['handleDamage',{false}];
						player allowDamage false;
						fnc_usec_damageHandler = {};
						fnc_usec_unconscious = {};
						player setUnitRecoilCoefficient 0;
					
						_msg = 'Godmode is now enabled.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					} else {
						player addEventHandler ['handleDamage',{true}];
						player removeAllEventHandlers 'handleDamage';
						fnc_usec_damageHandler 	= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
						fnc_usec_unconscious 	= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
						player allowDamage true;
						
						_msg = 'Godmode is now disabled.';
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
				};"",_name];
				[_morphtarget] spawn admin_dothis;
				_savelog = format [""%1 used toggle godmode on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_boom = {
				_name = _this select 0;
				_msg = ""Spawning explosion on ""+str _name+""'..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_mani_BOOM = format [""if (name player == '%1') then {
					_spwnVeh = 'HelicopterExploBig';
					_spwnVeh createVehicleLocal (getPosATL (vehicle player));
				};"",_name];
				[_mani_BOOM] spawn admin_dothis;
				_savelog = format [""%1 used (manipulate_boom) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_pitchwhine = {
				_name = _this select 0;
				_msg = ""Spawning high pitched whine on ""+str _name+""'..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				_mani_WHINE = format [""if (name player == '%1') then {2 fademusic 10;2 fadesound 10;playMusic ['PitchWhine',0]};"",_name];
				[_mani_WHINE] spawn admin_dothis;
				_savelog = format [""%1 spawned high pitch whine on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_spawnzed = {
				_msg = ""Spawning 5 zombies on ""+str (_this select 0)+""'..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_savelog = format [""%1 spawned 10 zombies on %2"",name player,_this select 0];
				[_savelog] call admin_adminlogAction;
				for '_i' from 1 to 10 do {
					_zarr = [
						'z_hunter',
						'z_suit1',
						'z_suit2',
						'z_teacher',
						'z_villager1',
						'z_villager2',
						'z_villager3',
						'z_worker1',
						'z_worker2',
						'z_worker3'
					];
					_name = _this select 0;
					_mani_ZEDS = format ['if (name player == ''%1'') then {
						[player,''scream'',0,false] call dayz_zombieSpeak;
						player_checkStealth = {
							DAYZ_disAudial = 10000;
							DAYZ_disVisual = 10000;
						};
						dayz_losChance = {1.1};
						dayz_losCheck = {false};
						[(getPosATL (vehicle player)),(createAgent [''%2'',getPosATL (vehicle player),[],30,''NONE''])] execFSM ''\z\AddOns\dayz_code\system\zombie_agent.fsm'';
					};',_name,(_zarr select (random ((count _zarr)-1)))];
					[_mani_ZEDS] spawn admin_dothis;
				};
				_mani_AGGR = format ['if (name player == ''%1'') then {[player,500,true,(getPosATL (vehicle player))] spawn player_alertZombies;[player,''scream'',0,false] call dayz_zombieSpeak};',_name,(_zarr select (random ((count _zarr)-1)))];
				[_mani_AGGR] spawn admin_dothis;
			};
			manipulate_aggro = {
				_name = _this select 0;
				_msg = ""Disabling ""+str _name+""'s zombie aggro..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has disabled your zombie aggro.',name player];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_mani_AGGRO= format [""
				if (name player == '%1') then {
					player_zombieCheck = {};
				};
				"",_name];
				[_mani_AGGRO] spawn admin_dothis;
				_savelog = format [""%1 used (manipulate_aggro) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_fly50 = {
				_name = _this select 0;
				_msg = ""Sending ""+str _name+"" flying..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_mani_FLY= format [""
				if (name player == '%1') then {
					_speed = 1;
					_vel = velocity (vehicle player);
					vehicle player setVelocity [(_vel select 0),(_vel select 1),(50)];
				};
				"",_name];
				[_mani_FLY] spawn admin_dothis;
				_savelog = format [""%1 used (manipulate_fly50) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_fly100 = {
				_name = _this select 0;
				_msg = ""Sending ""+str _name+"" flying..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_mani_FLY= format [""
				if (name player == '%1') then {
					_speed = 1;
					_vel = velocity (vehicle player);
					vehicle player setVelocity [(_vel select 0),(_vel select 1),(100)];
				};
				"",_name];
				[_mani_FLY] spawn admin_dothis;
				_savelog = format [""%1 used (manipulate_fly100) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_moveinveh = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				if (vehicle player == player) exitWith {
					_msg = 'You must be in a vehicle to do this!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				_msg = format ['Moving %1 into your %2.',_name,typeOf (vehicle player)];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 is teleporting you into their %2.',name player,typeOf (vehicle player)];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				if (typeOf(vehicle player) in ['ParachuteWest','ParachuteC']) then {
					_plyr action ['EJECT',vehicle _plyr];
					sleep 1;
				};
				_plyr moveInCargo (vehicle player);
				_plyr action ['getInCargo',(vehicle player)];
				
				_savelog = format['%1 moved %2 into their vehicle.',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_joinvehicle = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				if (typeOf(vehicle player) in ['ParachuteWest','ParachuteC']) then {
					player action ['eject',vehicle player];
					sleep 1;
				};
				if (vehicle player != player) exitWith {
					closeDialog 0;
					_msg = format ['You can''t join vehicles while in a vehicle!'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				closeDialog 0;
				
				_msg = format ['Joining '+str _name+'''s '+typeOf (vehicle _plyr)+'!'];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				player moveInCargo (vehicle _plyr);
				
				_savelog = format['%1 joined %2''s vehicle',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			manipulate_stealVehicle = {
				_target = cursorTarget;
				if (isNull _target) exitWith {
					_msg = format ['No object selected, please try again.'];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (_target isKindOf 'CAManBase') exitWith {
					_msg = format ['%1 is not a vehicle.',typeOf _target];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				
				PVOZ_myVEHICLE = _target;
				publicVariable 'PVOZ_myVEHICLE';
				if (locked _target) then {
					_msg = format ['Unlocked %1',typeOf _target];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				_unlockANDon = '
					PVOZ_myVEHICLE engineOn true;
					PVOZ_myVEHICLE setVehicleLock ''UNLOCKED'';
					PVOZ_myVEHICLE setVectorUp [0,0,1];
				';
				[_unlockANDon] spawn admin_dothis;
				
				if !(isNull (driver _target)) then {
					_driver = (driver _target);
					_msg = format ['Moving %1 to back seat...',name _driver];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_driver action ['eject',_target];
					waitUntil {sleep 0.1;(isNull (driver _target))};
					_driver action ['getInCargo',	_target];
					_driver action ['getInCargo',	_target];
				};

				_msg = format ['Joining vehicle: %1',typeOf _target];
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				sleep 0.25;
				player moveInDriver _target;
				
				if (isNull (driver _target)) then {
					_savelog = format['%1 stole a vehicle (%2)',name player,typeOf _target];
					[_savelog] call admin_adminlogAction;
				} else {
					_savelog = format['%1 stole %2''s vehicle (%3)',name player,name (driver _target),typeOf _target];
					[_savelog] call admin_adminlogAction;
				};
			};
			manipulate_eject = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = 'Ejecting '+str _name+' from '+typeOf (vehicle _plyr)+'';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_plyr action ['eject',vehicle _plyr];
				
				_savelog = format ['%1 used (manipulate_eject) on %2',name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_end = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Ending all animations on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[objNull,_plyr,rSwitchMove,'gear'] call RE;
				_plyr switchMove '';
				_plyr playActionNow 'stop';
			};
			anim_dance1 = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing dance1 animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[objNull,_plyr,rPlayMove,'ActsPercMstpSnonWnonDnon_DancingStefan'] call RE;
				
				_savelog = format [""%1 used (anim_dance1) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_dance2 = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing dance2 animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[objNull,_plyr,rPlayMove,'ActsPercMstpSnonWnonDnon_DancingDuoStefan'] call RE;
				
				_savelog = format [""%1 used (anim_dance2) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_dance3 = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing dance3 animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[objNull,_plyr,rPlayMove,'ActsPercMstpSnonWnonDnon_DancingDuoIvan'] call RE;
				
				_savelog = format [""%1 used (anim_dance3) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_boxing = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing boxing animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[objNull,_plyr,rSwitchMove,'AmovPercMstpSnonWnonDnon_idle68boxing'] call RE;
				
				_savelog = format [""%1 used (anim_boxing) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_handstand = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing handstand animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				[objNull,_plyr,rSwitchMove,'AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou'] call RE;
				
				_savelog = format [""%1 used (anim_handstand) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_laydown = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing laydown animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_plyr spawn {
					[objNull,_this,rSwitchMove,'AidlPpneMstpSnonWnonDnon_SleepC_layDown'] call RE;
					uiSleep 4;
					[objNull,_this,rSwitchMove,'AidlPpneMstpSnonWnonDnon_SleepC_standUp'] call RE;
				};
				
				_savelog = format [""%1 used (anim_laydown) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			anim_suicide = {
				_name = _this select 0;
				_plyr = _this select 1;
				
				_msg = ""Playing suicide animation on ""+str _name+""..."";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_plyr spawn {
					_this selectWeapon (secondaryWeapon _this);
					_this removeWeapon (primaryWeapon _this);
					[objNull,_plyr,rPlayMove,'ActsPercMstpSnonWpstDnon_suicide1B'] call RE;
					waitUntil {animationState _this == 'ActsPercMstpSnonWpstDnon_suicide1B'};
					uiSleep 4.15;
					_this fire (currentWeapon _this);
					_this setDamage 1;
				};
				
				_savelog = format [""%1 used (anim_suicide) on %2"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_largegunbag = {
				_name = _this select 0;
				_loadout_select 	= ""Large gunbag"";
				_loadout_backpack 	= ""DZ_LargeGunbag_EP1"";
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2! Old backpack dropped on the ground.',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_loadout_exec = ""if (name player == ""+str _NAME+"") then {
					player addBackpack ""+str _loadout_backpack+"";
				};"";
				[_loadout_exec] spawn admin_dothis;
				_savelog = format [""%1 gave %2 loadout_largegunbag"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_coyote = {
				_name = _this select 0;
				_loadout_select 	= ""coyote backpack"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2! Old backpack dropped on the ground.',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_loadout_exec = ""if (name player == ""+str _NAME+"") then {
					player addBackpack ""+str _loadout_backpack+"";
				};"";
				[_loadout_exec] spawn admin_dothis;
				_savelog = format [""%1 gave %2 loadout_coyote"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_alice = {
				_name = _this select 0;
				_loadout_select 	= ""alice backpack"";
				_loadout_backpack = ""DZ_ALICE_Pack_EP1"";
				
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2! Old backpack dropped on the ground.',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_loadout_exec = ""if (name player == ""+str _NAME+"") then {
					player addBackpack ""+str _loadout_backpack+"";
				};"";
				[_loadout_exec] spawn admin_dothis;
				_savelog = format [""%1 gave %2 loadout_alice"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_MAAWS = {
				_name = _this select 0;
				_loadout_select 	= ""MAAWS loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""MAAWS"",""MAAWS_HEAT"",""MAAWS_HEAT"",""MAAWS_HEAT"",
					
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2!',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_loadout_exec = ""if (name player == ""+str _NAME+"") then {
					removeAllWeapons player;
					removeAllItems player;
					
					[] spawn {
						{
							_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
							_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
							if (_isMag) then {player addMagazine _x};
							if (_isWep) then {_dcwep = _x;player addWeapon _dcwep;};
						} forEach ""+str _loadout_inventory+"";
					};
					[] spawn {
						player addBackpack ""+str _loadout_backpack+"";
						waitUntil {(!isNull UnitBackPack player)};
						if (count ""+str _loadout_bpinvent+"" > 0) then {
							player_bag = (UnitBackPack player);
							{
								_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
								_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
								if (_isMag) then {player_bag addMagazineCargoGlobal [_x,1]};
								if (_isWep) then {_item = player_bag;_dcarr = [_x,1];_item addWeaponCargoGlobal _dcarr;};
							} forEach ""+str _loadout_bpinvent+"";
						};
					};
				};"";
				[_loadout_exec] spawn admin_dothis;
				_savelog = format [""%1 gave %2 loadout_l85"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_IGLA = {
				_name = _this select 0;
				_loadout_select 	= ""IGLA loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2!',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_loadout_exec = ""if (name player == ""+str _NAME+"") then {
					removeAllWeapons player;
					removeAllItems player;
					
					_p4rt_0ut = 'IGLA';
					player addWeapon _p4rt_0ut;
					player addMagazine _p4rt_0ut;
					player addMagazine _p4rt_0ut;
					player addMagazine _p4rt_0ut;
					[] spawn {
						{
							_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
							_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
							if (_isMag) then {player addMagazine _x};
							if (_isWep) then {_dcwep = _x;player addWeapon _dcwep;};
						} forEach ""+str _loadout_inventory+"";
					};
					[] spawn {
						player addBackpack ""+str _loadout_backpack+"";
						waitUntil {(!isNull UnitBackPack player)};
						if (count ""+str _loadout_bpinvent+"" > 0) then {
							player_bag = (UnitBackPack player);
							{
								_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
								_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
								if (_isMag) then {player_bag addMagazineCargoGlobal [_x,1]};
								if (_isWep) then {_item = player_bag;_dcarr = [_x,1];_item addWeaponCargoGlobal _dcarr;};
							} forEach ""+str _loadout_bpinvent+"";
						};
					};
				};"";
				[_loadout_exec] spawn admin_dothis;
				_savelog = format [""%1 gave %2 loadout_l85"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_JAVELIN = {
				_name = _this select 0;
				_loadout_select 	= ""JAVELIN loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2!',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				_loadout_exec = ""if (name player == ""+str _NAME+"") then {
					removeAllWeapons player;
					removeAllItems player;
					
					_p4rt_0ut = 'JAVELIN';
					player addWeapon _p4rt_0ut;
					player addMagazine _p4rt_0ut;
					player addMagazine _p4rt_0ut;
					[] spawn {
						{
							_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
							_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
							if (_isMag) then {player addMagazine _x};
							if (_isWep) then {_dcwep = _x;player addWeapon _dcwep;};
						} forEach ""+str _loadout_inventory+"";
					};
					[] spawn {
						player addBackpack ""+str _loadout_backpack+"";
						waitUntil {(!isNull UnitBackPack player)};
						if (count ""+str _loadout_bpinvent+"" > 0) then {
							player_bag = (UnitBackPack player);
							{
								_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
								_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
								if (_isMag) then {player_bag addMagazineCargoGlobal [_x,1]};
								if (_isWep) then {_item = player_bag;_dcarr = [_x,1];_item addWeaponCargoGlobal _dcarr;};
							} forEach ""+str _loadout_bpinvent+"";
						};
					};
				};"";
				[_loadout_exec] spawn admin_dothis;
				_savelog = format [""%1 gave %2 loadout_l85"",name player,_name];
				[_savelog] call admin_adminlogAction;
			};
			loadout_init = {
				_loadout_select 	= _this select 0;
				_loadout_backpack 	= _this select 1;
				_loadout_bpinvent 	= _this select 2;
				_loadout_inventory 	= _this select 3;
				_name 				= _this select 4;
				if (AM_EPOCH) then {_loadout_backpack = 'DZ_LargeGunbag_EP1'};
				
				_msg = ""Spawning ""+str _loadout_select+"" for ""+str _name+"""";
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				
				_msg = format ['%1 has given you %2!',name player,_loadout_select];
				[_name,_msg] spawn admin_fnc_dynTextSend;
				
				_loadout_exec = format [""if (name player == '%1') then {
					removeAllWeapons player;
					removeAllItems player;
					{
						if (isClass(configFile >> 'CfgMagazines' >> _x)) then {player addMagazine _x};
						if (isClass(configFile >> 'CfgWeapons' >> _x)) then {_dcwep = _x;player addWeapon _dcwep;};
					} forEach %4;
					[] spawn {
						player addBackpack '%2';
						waitUntil {(!isNull UnitBackPack player)};
						player_bag = (UnitBackPack player);
						{
							if (isClass(configFile >> 'CfgMagazines' >> _x)) then {player_bag addMagazineCargoGlobal [_x,1]};
							if (isClass(configFile >> 'CfgWeapons' >> _x)) then {_item = player_bag;_dcarr = [_x,1];_item addWeaponCargoGlobal _dcarr;};
						} forEach %3;
					};
				};"",_name,_loadout_backpack,_loadout_bpinvent,_loadout_inventory];
				[_loadout_exec] spawn admin_dothis;
				
				_savelog = format [""%1 gave %2 %3"",name player,_name,_loadout_select];
				[_savelog] call admin_adminlogAction;
			};
			loadout_dmr = {
				_name = _this select 0;
				_loadout_select 	= ""DMR loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""DMR"",""20Rnd_762x51_DMR"",""20Rnd_762x51_DMR"",""20Rnd_762x51_DMR"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_M107 = {
				_name = _this select 0;
				_loadout_select 	= ""M107 loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M107_DZ"",""10Rnd_127x99_m107"",""10Rnd_127x99_m107"",""10Rnd_127x99_m107"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_as50 = {
				_name = _this select 0;
				_loadout_select 	= ""AS50 loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""BAF_AS50_scoped"",""5Rnd_127x99_as50"",""5Rnd_127x99_as50"",""5Rnd_127x99_as50"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_dmr_DZ = {
				_name = _this select 0;
				_loadout_select 	= ""DMR_DZ loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""DMR_DZ"",""20Rnd_762x51_DMR"",""20Rnd_762x51_DMR"",""20Rnd_762x51_DMR"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_SCARh = {
				_name = _this select 0;
				_loadout_select 	= ""SCAR H loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""SCAR_H_STD_EGLM_SPECT"",""20Rnd_762x51_B_SCAR"",""20Rnd_762x51_B_SCAR"",""20Rnd_762x51_B_SCAR"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_SCARhSD = {
				_name = _this select 0;
				_loadout_select 	= ""SCAR H SD loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""SCAR_H_LNG_SNIPER_SD"",""20Rnd_762x51_SB_SCAR"",""20Rnd_762x51_SB_SCAR"",""20Rnd_762x51_SB_SCAR"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_SCARl = {
				_name = _this select 0;
				_loadout_select 	= ""SCAR L loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""SCAR_L_STD_Mk4CQT"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_SCARlHOLO = {
				_name = _this select 0;
				_loadout_select 	= ""SCAR L HOLO loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""scar_L_cqc_eglm_HOLO"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_m14 = {
				_name = _this select 0;
				_loadout_select 	= ""M14 AIM loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M14_EP1"",""20Rnd_762x51_DMR"",""20Rnd_762x51_DMR"",""20Rnd_762x51_DMR"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_fnfal = {
				_name = _this select 0;
				_loadout_select 	= ""FN-FAL loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""FN_FAL"",""20Rnd_762x51_FNFAL"",""20Rnd_762x51_FNFAL"",""20Rnd_762x51_FNFAL"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_m4a1sd = {
				_name = _this select 0;
				_loadout_select 	= ""M4A1 CCO SD loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M4A1_AIM_SD_camo"",""30Rnd_556x45_StanagSD"",""30Rnd_556x45_StanagSD"",""30Rnd_556x45_StanagSD"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_m4a3holo = {
				_name = _this select 0;
				_loadout_select 	= ""M4A3 HOLO loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M4A3_CCO_EP1"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_m4a1holo = {
				_name = _this select 0;
				_loadout_select 	= ""M4A1 HOLO loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M4A1_HWS_GL"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_m16acog = {
				_name = _this select 0;
				_loadout_select 	= ""M16 ACOG loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""m16a4_acg"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_m16m203 = {
				_name = _this select 0;
				_loadout_select 	= ""M16 M203 loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""M16A2GL"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_g36 = {
				_name = _this select 0;
				_loadout_select 	= ""G36K loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""G36K"",""30Rnd_556x45_G36"",""30Rnd_556x45_G36"",""30Rnd_556x45_G36"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			loadout_l85 = {
				_name = _this select 0;
				_loadout_select 	= ""L85 CWS loadout"";
				_loadout_backpack  = ""DZ_Backpack_EP1"";
				_loadout_bpinvent 	= [""FoodCanFrankBeans"",""FoodCanFrankBeans"",""ItemSodaMdew"",""ItemSodaMdew"",""ItemBloodbag"",""ItemBloodbag""];
				_loadout_inventory 	= [
					""BAF_L85A2_RIS_CWS"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",""30Rnd_556x45_Stanag"",
					""M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",""15Rnd_9x19_M9SD"",
					""ItemGPS"",""ItemToolbox"",""ItemWatch"",""NVGoggles"",""ItemMatchbox"",
					""ItemMap"",""ItemHatchet"",""ItemFlashlightRed"",""ItemEtool"",""ItemCompass"",""Binocular_Vector"",
					""ItemHeatPack"",""ItemAntibiotic"",""FoodSteakCooked"",""ItemSodaPepsi"",""ItemEpinephrine"",
					""ItemPainkiller"",""ItemBloodbag"",""ItemBandage"",""ItemBandage"",""Skin_Sniper1_DZ"",
					""ItemMorphine"",""ItemMorphine""
				];
				[_loadout_select,_loadout_backpack,_loadout_bpinvent,_loadout_inventory,_name] spawn loadout_init;
			};
			admin_fillList = {
				inSub = false;
				_isSpawnMenu = false;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				_ctrl ctrlSetEventHandler ['LBDblClick','call admin_dbclick;'];
				_ctrl ctrlRemoveAllEventHandlers 'LBSelChanged';
				adminadd = [];
				call admin_menuHeader;
				if ("+_playerID+" player in levelone) then {call Level1_menu};
				if ("+_playerID+" player in leveltwo) then {call Level2_menu};
				if ("+_playerID+" player in levelthree) then {call Level3_menu};
				call admin_advancedfiller;
				lbclear _ctrl;
				call admin_populateMenu;
				['',0,safezoneY,0,0,0,3037] spawn AH_fnc_dynamictext;
				['',0,safezoneY,0,0,0,3038] spawn AH_fnc_dynamictext;
			};
			AH_fnc_parseName = {
				_return = _this;
				
				_test = toArray _return;
				_test resize 3;
				_test;
				_test = toString _test;
				
				if ((_return == '')||(_test in ['Pla','[-l','[-P','[-I','-- ',' ','','   '])) then {_return = 'FAIL'};
				if (_test in ['D: ','P: ']) then {
					_arr = toArray _return;
					{_arr set [_x,objNull]} forEach [0,1,2];
					_return = toString (_arr - [objNull]);
				};
				_return;
			};
			admin_playerInfo = {
				_allPlayers = playableUnits;
				_name = (lbtext [1,(lbCurSel 1)]) call AH_fnc_parseName;
				if (_name == 'FAIL') exitWith {};
				_plyr = objNull;
				
				{if (name _x == _name) exitWith {_plyr = _x}} forEach _allPlayers;
				
				_ctrl = 1003 call getControl;
				plyrinfoloop = true;
				_text = '<t color=''#800000''>Player info</t><br/>';
				while {plyrinfoloop} do {
					if (((lbtext [1,(lbCurSel 1)]) call AH_fnc_parseName) != _name) exitWith {};
					_text = '<t color=''#800000''>Player info</t><br/>';
					if !(isNull _plyr) then {
						_text = _text + '<t color=''#FF3300''>Name</t>: '+_name+'<br/>';
						_text = _text + '<t color=''#FF3300''>Blood</t>: '+str (_plyr getVariable['USEC_BloodQty','Not yet synced'])+'<br/>';
						_text = _text + '<t color=''#FF3300''>Humanity</t>: '+str (_plyr getVariable['humanity',0])+'<br/>';if (_plyr getVariable ['bankMoney',97532468] != 97532468) then {
						_text = _text + '<t color=''#FF3300''>Cash</t>: '+str(_plyr getVariable ['cashMoney',0])+'<br/>';
						_text = _text + '<t color=''#FF3300''>Bank</t>: '+str(_plyr getVariable ['bankMoney',0])+'<br/>';};
						_nrplyr = ({isPlayer _x} count (getPosATL (vehicle _plyr) nearentities [['CAManBase'],300])) - 1;
						if (_plyr != vehicle _plyr) then {
							_crew = '<br/>';
							_driver = 'None.';
							{if (_x != (driver (vehicle _plyr))) then {_crew = _crew + ((name _x)+'<br/>')} else {_driver = name _x}} forEach (crew (vehicle _plyr));
							_text = _text + '<t color=''#FF3300''>Vehicle</t>: <t color=''#FFFFFF''>'+(getText (configFile >> 'CfgVehicles' >> (typeOf (vehicle _plyr)) >> 'displayName'))+'</t><br/>';
							_text = _text + '<t color=''#FF3300''> -Speed</t>: <t color=''#FFFFFF''>'+str (round (speed (vehicle _plyr)))+'</t><br/>';
							_text = _text + '<t color=''#FF3300''> -Fuel</t>: <t color=''#FFFFFF''>'+str(round(fuel (vehicle _plyr)))+'</t><br/>';
							_text = _text + '<t color=''#FF3300''> -Damage</t>: <t color=''#FFFFFF''>'+str(damage (vehicle _plyr))+'</t><br/>';
							_text = _text + '<t color=''#FF3300''> -Driver</t>: <t color=''#FFFFFF''>'+str _driver+'</t><br/>';
							_text = _text + '<t color=''#FF3300''> -Crew</t>: <t color=''#FFFFFF''>'+_crew+'</t>';
						} else {
							_wep 	= currentWeapon _plyr;
							_ammo 	= _plyr ammo _wep;
							_ammocl = (getArray(configfile >> 'cfgWeapons' >> currentMuzzle _plyr >> 'magazines'));
							if (_wep != '') then {
								_text = _text + '<t color=''#FF3300''>Weapon</t><br/>';
								_text = _text + '<t color=''#FF3300''> -Name</t>: <br/><t color=''#FFFFFF'' size=''0.8''>'+(getText (configFile >> 'CfgWeapons' >> _wep >> 'displayName'))+'</t><br/>';
								_text = _text + '<t color=''#FF3300''> -Classname</t>: <br/><t color=''#FFFFFF'' size=''0.8''>'+_wep+'</t><br/>';
								_text = _text + '<t color=''#FF3300''> -Ammo</t>: <t color=''#FFFFFF''>'+str(_plyr ammo _wep)+'</t><br/>';
							} else {
								_text = _text + '<t color=''#FF3300''>Weapon</t>: <t color=''#FFFFFF''>No weapon.</t><br/>';
							};
						};
						_text = _text + '<t color=''#FF3300''>Miscellaneous</t><br/>';
						_text = _text + '<t color=''#FF3300''> -Near</t>: <t color=''#FFFFFF''>'+str _nrplyr+'</t><br/>';
						_text = _text + '<t color=''#FF3300''> -GPS</t>: <t color=''#FFFFFF''>'+(mapGridPosition (getPos _plyr))+'</t><br/>';
						_text = _text + '<t color=''#FF3300''> -POS</t>:<br/><t color=''#FFFFFF'' size=''0.75''>'+str (getPosAtl _plyr)+'</t><br/>';
						_text = _text + '<t color=''#FF3300''> -PUID</t>:<br/><t color=''#FFFFFF'' size=''0.75''>'+str ("+_playerID+" _plyr)+'</t><br/>';
					} else {_text = _text + '<t color=''#FF3300''>PLAYER IS NULL</t>'};
					_ctrl ctrlSetStructuredText parseText _text;
				};
				plyrinfoloop = false;
				_ctrl ctrlSetStructuredText parseText '';
			};
			admin_fillPlayers = {
				disableSerialization;
				_ctrl = 1 call getControl;
				_ctrl ctrlSetEventHandler ['LBSelChanged','[] spawn admin_playerInfo;'];
				lbclear _ctrl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.027 + admin_font_size);
				
				_allPlayers = playableUnits;
				_ctrl lbAdd format [""""];
				_ctrl lbAdd format [""Players online: %1"",count _allPlayers];
				_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
				_ctrl lbSetColor [(lbsize _ctrl)-1,[1,1,0.5,1]];
				_ctrl lbAdd format [""""];
				
				_allPlayers call dami_alphaSort;
				_playerList = aht_plrs;
				
				_isLvl3 = 0;
				{_PUID = ("+_playerID+" _x);if (_PUID in levelthree) then {_isLvl3 = _isLvl3 + 1}} forEach _playerList;
				_ctrl lbAdd format [""[-level 3 admins-] (%1)"",_isLvl3];
				_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
				_ctrl lbSetColor [(lbsize _ctrl)-1,APCLR];
				{
					_PUID = ("+_playerID+" _x);
					if (_PUID in levelthree) then {
						if (vehicle _x == _x) then {
							_ctrl lbAdd format [""%1"",name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,""\ca\ca_e\data\flag_opfor_co.paa""];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (currentweapon _x) >> ""picture""))];
						} else {
							if (driver(vehicle _x) == _x) then {
								_ctrl lbAdd format[""D: %1"",name _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
							} else {
								_ctrl lbAdd format[""P: %1"",name _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0.25,1]];
							};
							_plrpic = (getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""));
							_ctrl lbSetPicture [(lbsize _ctrl)-1,_plrpic];
						};
						if (_x getVariable ['intheevent',false]) then {
							if (isNil 'event_red_team') then {event_red_team = []};
							_color = if (name _x in event_red_team) then {[(lbsize _ctrl)-1,[1,0.2,0.2,1]]} else {[(lbsize _ctrl)-1,[0,0.7,1,1]]};
							_ctrl lbSetColor _color
						};
						_isMuted = _x getVariable ['AH_MUTED',false];
						if (_isMuted) then {
							_ctrl lbAdd ""-- MUTED --"";
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
						if (admin_DispPUIDs) then {
							_ctrl lbAdd format[""Player ID: %1"","+_playerID+" _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
					};
				} forEach _playerList;
				
				_isLvl2 = 0;
				{_PUID = ("+_playerID+" _x);if (_PUID in leveltwo) then {_isLvl2 = _isLvl2 + 1}} forEach _playerList;
				_ctrl lbAdd format [""""];
				_ctrl lbAdd format [""[-level 2 admins-] (%1)"",_isLvl2];
				_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
				_ctrl lbSetColor [(lbsize _ctrl)-1,APCLR];
				{
					_PUID = ("+_playerID+" _x);
					if (_PUID in leveltwo) then {
						if (vehicle _x == _x) then {
							_ctrl lbAdd format [""%1"",name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,""\ca\ca_e\data\flag_opfor_co.paa""];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""))];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (primaryweapon _x) >> ""picture""))];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (currentweapon _x) >> ""picture""))];
						} else {
							if (driver(vehicle _x) == _x) then {
								_ctrl lbAdd format[""D: %1"",name _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
							} else {
								_ctrl lbAdd format[""P: %1"",name _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0.25,1]];
							};
							_plrpic = (getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""));
							_ctrl lbSetPicture [(lbsize _ctrl)-1,_plrpic];
						};
						if (_x getVariable ['intheevent',false]) then {
							if (isNil 'event_red_team') then {event_red_team = []};
							_color = if (name _x in event_red_team) then {[(lbsize _ctrl)-1,[1,0.2,0.2,1]]} else {[(lbsize _ctrl)-1,[0,0.7,1,1]]};
							_ctrl lbSetColor _color
						};
						_isMuted = _x getVariable ['AH_MUTED',false];
						if (_isMuted) then {
							_ctrl lbAdd ""-- MUTED --"";
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
						if (admin_DispPUIDs) then {
							_ctrl lbAdd format[""Player ID: %1"","+_playerID+" _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[0.2,1,0.2,1]];
						};
					};
				} forEach _playerList;
				
				_isLvl1 = 0;
				{_PUID = ("+_playerID+" _x);if (_PUID in levelone) then {_isLvl1 = _isLvl1 + 1}} forEach _playerList;
				_ctrl lbAdd format [""""];
				_ctrl lbAdd format [""[-level 1 admins-] (%1)"",_isLvl1];
				_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
				_ctrl lbSetColor [(lbsize _ctrl)-1,APCLR];
				{
					_PUID = ("+_playerID+" _x);
					if (_PUID in levelone) then {
						if (vehicle _x == _x) then {
							_ctrl lbAdd format [""%1"",name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,""\ca\ca_e\data\flag_opfor_co.paa""];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""))];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (primaryweapon _x) >> ""picture""))];
							_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (currentweapon _x) >> ""picture""))];
						} else {
							if (driver(vehicle _x) == _x) then {
								_ctrl lbAdd format[""D: %1"",name _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
							} else {
								_ctrl lbAdd format[""P: %1"",name _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0.25,1]];
							};
							_plrpic = (getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""));
							_ctrl lbSetPicture [(lbsize _ctrl)-1,_plrpic];
						};
						if (_x getVariable ['intheevent',false]) then {
							if (isNil 'event_red_team') then {event_red_team = []};
							_color = if (name _x in event_red_team) then {[(lbsize _ctrl)-1,[1,0.2,0.2,1]]} else {[(lbsize _ctrl)-1,[0,0.7,1,1]]};
							_ctrl lbSetColor _color
						};
						_isMuted = _x getVariable ['AH_MUTED',false];
						if (_isMuted) then {
							_ctrl lbAdd ""-- MUTED --"";
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
						if (admin_DispPUIDs) then {
							_ctrl lbAdd format[""Player ID: %1"","+_playerID+" _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
					};
				} forEach _playerList;
				
				_isPlyr = 0;
				{_PUID = ("+_playerID+" _x);if ((vehicle _x == _x) && !(_PUID in (levelone+leveltwo+levelthree))) then {_isPlyr = _isPlyr + 1}} forEach _playerList;
				_ctrl lbAdd format [""""];
				_ctrl lbAdd format [""[-Players-] (%1)"",_isPlyr];
				_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
				_ctrl lbSetColor [(lbsize _ctrl)-1,[0.2,0.4,1,1]];
				{
					_PUID = ("+_playerID+" _x);
					if ((vehicle _x == _x) && !(_PUID in (levelone+leveltwo+levelthree))) then {
						_ctrl lbAdd format [""%1"",name _x];
						_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
						_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
						if (_x getVariable ['intheevent',false]) then {
							if (isNil 'event_red_team') then {event_red_team = []};
							_color = if (name _x in event_red_team) then {[(lbsize _ctrl)-1,[1,0.2,0.2,1]]} else {[(lbsize _ctrl)-1,[0,0.7,1,1]]};
							_ctrl lbSetColor _color
						};
						_ctrl lbSetPicture [(lbsize _ctrl)-1,""\ca\ca_e\data\flag_rcrystal_co.paa""];
						_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""))];
						_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (primaryweapon _x) >> ""picture""))];
						_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> ""CfgWeapons"" >> (currentweapon _x) >> ""picture""))];
						_isMuted = _x getVariable ['AH_MUTED',false];
						if (_isMuted) then {
							_ctrl lbAdd ""-- MUTED --"";
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
						if (admin_DispPUIDs) then {
							_ctrl lbAdd format[""Player ID: %1"","+_playerID+" _x];
							_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
							_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
						};
					};
				} forEach _playerList;
				
				_inVeh = 0;
				{_PUID = ("+_playerID+" _x);if ((vehicle _x != _x) && !(_PUID in (levelone+leveltwo+levelthree))) then {_inVeh = _inVeh + 1}} forEach _playerList;
				_ctrl lbAdd format [""""];
				_ctrl lbAdd format [""[-In Vehicle-] (%1)"",_inVeh];
				_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
				_ctrl lbSetColor [(lbsize _ctrl)-1,[0.2,0.4,1,1]];
				{
					_PUID = ("+_playerID+" _x);
					if ((vehicle _x != _x) && !(_PUID in (levelone+leveltwo+levelthree))) then {
						if ((vehicle _x isKindOf ""LandVehicle"")||(vehicle _x isKindOf ""Air"")||(vehicle _x isKindOf ""Ship"")) then {
							{
								if (driver(vehicle _x) == _x) then {
									_ctrl lbAdd format[""D: %1"",name _x];
									_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
									_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
								} else {
									_ctrl lbAdd format[""P: %1"",name _x];
									_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
									_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0.25,1]];
								};
								if (_x getVariable ['intheevent',false]) then {
									if (isNil 'event_red_team') then {event_red_team = []};
									_color = if (name _x in event_red_team) then {[(lbsize _ctrl)-1,[1,0.2,0.2,1]]} else {[(lbsize _ctrl)-1,[0,0.7,1,1]]};
									_ctrl lbSetColor _color
								};
								_plrpic = (getText (configFile >> ""CfgVehicles"" >> (typeof vehicle _x) >> ""picture""));
								_ctrl lbSetPicture [(lbsize _ctrl)-1,_plrpic];
							} forEach crew _x;
							_isMuted = _x getVariable ['AH_MUTED',false];
							if (_isMuted) then {
								_ctrl lbAdd ""-- MUTED --"";
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							};
							if (admin_DispPUIDs) then {
								_ctrl lbAdd format[""Player ID: %1"","+_playerID+" _x];
								_ctrl lbSetData [(lbsize _ctrl)-1,""1""];
								_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0,0,1]];
							};
						};
					};
				} forEach _playerList;
				_ctrl = 1 call getControl;
				_ctrl ctrlSetEventHandler [""LBDblClick"",""call admin_dbclick_2;""];
				for '_i' from 0 to 1000 do {if ((_ctrl lbText _i) in [name player,('D: '+name player),('P: '+name player)]) then {_ctrl lbSetCurSel _i}};
			};
			admin_spawnHive = {
				_allPlayers = playableUnits;
				_name 	= _this select 0;
				_class 	= _this select 1;
				_selvehbrah = _class;
				if (isNil ""AM_EPOCH"") then {AM_EPOCH = false};
				if ((_name == name player)||(_name == """")) then {
					_dir = getdir vehicle player;
					_pos = (vehicle player) call AH_fnc_getPos;
					_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),(_pos select 2)+1];
					_worldspace = [_dir,_pos];
					_msg = format ['Spawned a(n) %1.',_selvehbrah];
					_msg call AH_fnc_dynTextMsg;
					if (AM_EPOCH) then {
						_keyColor 	= [""Green"",""Red"",""Blue"",""Yellow"",""Black""] call BIS_fnc_selectRandom;
						_keyNumber 	= (floor(random 2500)) + 1;
						_select 	= (""ItemKey""+(_keyColor)+""""+(str _keyNumber)+"""");
						[player,_select] call BIS_fnc_invAdd;
						
						[2,player,_class,_worldspace,_select] call admin_adminREexec;
						_msg = format [""Vehicle(%1) spawned to database. KEY: %2 added to toolbelt."",_class,_select];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					} else {
						_msg = format [""Vehicle(%1) spawned to database."",_class];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						
						[3,player,_class,_pos] call admin_adminREexec;
					};
					_savelog = format[""V SPAWN: %1 hive-spawned %2 at %3! //\\SPAWN LOG//\\"",name player,_selvehbrah,mapGridPosition getPosATL (vehicle player)];
					[_savelog] call admin_adminlogAction;
				} else {
					{
						if (name _x == _name) then {
							SP_dir = getdir _x;
							SP_pos = _x call AH_fnc_getPos;
							SP_pos = [(SP_pos select 0)+8*sin(SP_dir),(SP_pos select 1)+8*cos(SP_dir),(SP_pos select 2)+1];
							selected_player = _x;
						};
					} forEach _allPlayers;
					
					if (isNil 'selected_player') exitWith {
						_msg = format [""Could not find %1!"",_name];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					
					_msg = format ['%1 spawned you a(n) %2! This vehicle is saved to the database, and will stay after a restart.',name player,_selvehbrah];
					[_name,_msg] spawn admin_fnc_dynTextSend;
					
					_msg = format[""Please wait... Spawning %1 a %2."",_name,_selvehbrah];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					if (AM_EPOCH) then {
						_keyColor 	= [""Green"",""Red"",""Blue"",""Yellow"",""Black""] call BIS_fnc_selectRandom;
						_select 	= (""ItemKey""+(_keyColor)+""""+(str ((floor(random 2500)) + 1))+"""");
						_hivespawn = format [""if (name player == '%3') then {
							[] spawn {
								_p4rt_0ut = '%1';
								player addWeapon _p4rt_0ut;
								systemChat ("""""+_AH_CHAT+": """" + str _msg);
								sleep 5;
								_msg = 'The vehicle you were spawned will save after restart! Enjoy your new vehicle!';
								systemChat ("""""+_AH_CHAT+": """" + str _msg);
							};
						};"",_select,_selvehbrah,_name];
						[_hivespawn] spawn admin_dothis;
						_worldspace = [SP_dir,SP_pos];
						[2,player,_class,_worldspace,_select] call admin_adminREexec;
					} else {
						_hivespawn = format [""if (name player == '%3') then {
							[] spawn {
								_msg = '[ADMIN]""+name player+"" spawned you a permanent vehicle(%2).';
								systemChat ('"+_AH_CHAT+": '+str _msg);
								sleep 5;
								_msg = 'The vehicle you were spawned will save after restart! Enjoy your new vehicle!';
								systemChat ('"+_AH_CHAT+": '+str _msg);
							};
						};"",nil,_selvehbrah,_name];
						[_hivespawn] spawn admin_dothis;
						_worldspace = [SP_dir,SP_pos];
						[3,player,_class,SP_pos] call admin_adminREexec;
					};
					
					_msg = format [""Vehicle(%1) spawned to database, for %2."",_class,_name];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_savelog = format[""V SPAWN: %1 hive-spawned %2 for %3 @ %4! //\\SPAWN LOG//\\"",name player,_selvehbrah,_name,mapGridPosition getPosATL selected_player];
					[_savelog] call admin_adminlogAction;
				};
				SP_dir = nil;
				SP_pos = nil;
				selected_player = nil;
			};
			admin_spawnVehicle = {
				_name = _this select 0;
				_selvehbrah = _this select 1;
				if ((_name == name player)||(_name == """")) then {
					_msg = 'Spawning a(n) '+str _selvehbrah+'...';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					_dir = getdir vehicle player;
					_pos = (vehicle player) call AH_fnc_getPos;
					_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),(_pos select 2)+1];
					
					_action = if (admin_flyspawn) then [{'FLY'},{''}];
					if ((_action == 'FLY')&&(_selvehbrah isKindOf 'AIR')) then {
						if (_selvehbrah isKindOf 'Plane') then {
							_pos set [2,(_pos select 2)+100];
						} else {
							_pos set [2,(_pos select 2)+10];
						};
					};
					
					[1,player,_selvehbrah,_pos,_dir,_action] call admin_adminREexec;
					
					_savelog = format[""V SPAWN: %1 spawned %2 at %3! //\\SPAWN LOG//\\"",name player,_selvehbrah,mapGridPosition ((vehicle player) call AH_fnc_getPos)];
					[_savelog] call admin_adminlogAction;
				} else {
					_allPlayers = playableUnits;
					{
						if (name _x == _name) then {
							SP_dir = getdir _x;
							SP_pos = _x call AH_fnc_getPos;
							SP_pos = [(SP_pos select 0)+8*sin(SP_dir),(SP_pos select 1)+8*cos(SP_dir),(SP_pos select 2)+1];
							selected_player = _x;
						};
					} forEach _allPlayers;
					
					if (isNil 'selected_player') exitWith {
						_msg = format [""Could not find %1!"",_name];
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
					
					_msg = format[""Please wait... Spawning %1 a %2."",_name,_selvehbrah];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_vehspawn = ""if (name player == '""+_name+""') then {
						[] spawn {
							_msg = '[ADMIN]""+name player+"" spawned you a ""+str _selvehbrah+""!';
							systemChat ('"+_AH_CHAT+": '+str _msg);
							_msg call AH_fnc_dynTextMsg;
							sleep 5;
							_msg = 'The vehicle you were spawned will disappear after a restart.';
							systemChat ('"+_AH_CHAT+": '+str _msg);
							_msg call AH_fnc_dynTextMsg;
						};
					};"";
					[_vehspawn] spawn admin_dothis;
					
					_msg = format[""Spawned %1 for %2 @ %3!"",_name,_selvehbrah,mapGridPosition getPosATL selected_player];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_pos = SP_pos;
					_dir = SP_dir;
					_action = '';
					[1,player,_selvehbrah,_pos,_dir,_action] call admin_adminREexec;
					
					_savelog = format[""V SPAWN: %1 spawned %2 for %3 @ %4! //\\SPAWN LOG//\\"",name player,_selvehbrah,_name,mapGridPosition getPosATL selected_player];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_spawnWeapon = {
				_name = _this select 0;
				_p4rt_0ut = _this select 1;
				
				_test = toArray _name;
				_test resize 3;
				_test;
				if ((toString _test) in ['[-l','[-P','[-I','-- ',' ','   ']) exitWith {
					_msg = ""Select a player from the left!"";
					systemChat ("""+_AH_CHAT+": ""+str _msg);
				};
				if ((toString _test) in ['D: ','P: ']) then {
					_arr = toArray _name;
					_arr set [0,objNull];
					_arr set [1,objNull];
					_arr set [2,objNull];
					_msg = _arr - [objNull];
					_name = toString _msg;
				};
				
				if ((_name == name player)||(_name == '')) then {
					_isMag = isClass(configFile >> 'CfgMagazines' >> _p4rt_0ut);
					_isWep = isClass(configFile >> 'CfgWeapons' >> _p4rt_0ut);
					if (_isMag) then {player addMagazine _p4rt_0ut};
					if (_isWep) then {player addWeapon _p4rt_0ut};
					
					_msg = format ['Spawned %1',_p4rt_0ut];
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					_mags = getArray(configfile >> 'cfgWeapons' >> _p4rt_0ut >> 'magazines');
					if (str(_mags) != '[]') then {
						_config = _mags select 0;
						_isOK = [player,_config] call BIS_fnc_invAdd;
						_isOK = [player,_config] call BIS_fnc_invAdd;
						_isOK = [player,_config] call BIS_fnc_invAdd;
						player selectWeapon _p4rt_0ut;
						reload player;
						_msg = format ['Spawned 3 %1 for your %2',_config,_p4rt_0ut];
						systemChat ('"+_AH_CHAT+": '+str _msg);
					};
					_savelog = format['%1 spawned %2',name player,_p4rt_0ut];
					[_savelog] call admin_adminlogAction;
				} else {
					_msg = format ['Spawned %1 for %2.',_p4rt_0ut,_name];
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_msg call AH_fnc_dynTextMsg;
					_morph_exec = format [""if (name player == '%1') then {
						systemChat ('"+_AH_CHAT+": %3 spawned %2 on you.');
						cutText ['%3 spawned %2 on you.','plain down'];
						_p4rt_0ut = '%2';
						_isMag = isClass(configFile >> 'CfgMagazines' >> _p4rt_0ut);
						_isWep = isClass(configFile >> 'CfgWeapons' >> _p4rt_0ut);
						if (_isMag) then {player addMagazine _p4rt_0ut};
						if (_isWep) then {player addWeapon _p4rt_0ut};
						
						_mags = getArray(configfile >> 'cfgWeapons' >> _p4rt_0ut >> 'magazines');
						if (str(_mags) != '[]') then {
							_config = _mags select 0;
							_isOK = [player,_config] call BIS_fnc_invAdd;
							_isOK = [player,_config] call BIS_fnc_invAdd;
							_isOK = [player,_config] call BIS_fnc_invAdd;
							_msg = 'Spawned 3 '+str _config+' for your '+str _p4rt_0ut+'';
							systemChat ('"+_AH_CHAT+": '+str _msg);
							player selectWeapon '%2';
							reload player;
						};
					};"",_name,_p4rt_0ut,name player];
					[_morph_exec] spawn admin_dothis;
					_savelog = format['%1 spawned %2 on %3',name player,_p4rt_0ut,_name];
					[_savelog] call admin_adminlogAction;
				};
			};
			admin_passget = {
				_cursorTarget = cursorTarget;
				_ownerID 	= _cursorTarget getVariable [""CharacterID"",""0""];
				if (isNull _cursorTarget) exitWith {
					_msg = ""No object detected, please try again."";
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				_msg = """"+typeOf _cursorTarget+""s password is ""+str _ownerID+""..."";
				systemChat ("""+_AH_CHAT+": ""+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_deleteTarget = {
				closeDialog 0;
				delete_object = false;
				_temp = cursorTarget;
				_type_of = typeOf _temp;
				if (isNull cursorTarget) exitWith {
					_msg = 'Object not found. Try again.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				delete_object_k = [
					["""",true],
					[format [""Delete %1 from DB?"",_type_of],[-1],"""",-5,[[""expression"",""""]],""1"",""0""],
					["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
					[""Yes"",[2],"""",-5,	[[""expression"",""delete_object=true;""]],""1"",""1""],
					[""No"",[3],"""",-5,	[[""expression"",""delete_object=false;""]],""1"",""1""],
					["""",[-1],"""",-5,		[[""expression"",""""]],""1"",""0""],
					[""Exit"",[-1],"""",-3,	[[""expression"",""delete_object=false;""]],""1"",""1""]
				];
				showCommandingMenu ""#USER:delete_object_k"";
				waitUntil {(commandingMenu == '')};
				if !(delete_object) exitWith {
					_msg = 'Delete object cancelled.';
					systemChat ('"+_AH_CHAT+": '+str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				_temp spawn admin_objectDelete;
				
				_msg = ''+typeOf _temp+' was deleted from the database.';
				systemChat ('"+_AH_CHAT+": '+str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			admin_generatekey = {
				private [""_temp"",""_id"",""_p4rt_0ut""];
				_temp = cursorTarget;
				_id = parseNumber(_temp getVariable [""CharacterID"",""0""]);
				if !((_temp isKindOf ""LandVehicle"")||(_temp isKindOf ""Air"")||(_temp isKindOf ""Ship"")||(_temp isKindof ""Bike"")) exitWith {
					_msg = format[""%1 is not a vehicle.."",typeOF _temp];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (_id == 0) exitWith {
					_msg = format[""%1 has no key..."",typeOF _temp];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if (_temp distance player > 50) exitWith {
					_msg = format[""%1 is to far away."",typeOF _temp];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
				if ((_id > 0)&&(_id <= 2500)) then {_p4rt_0ut = format[""ItemKeyGreen%1"",_id]};
				if ((_id > 2500)&&(_id <= 5000)) then {_p4rt_0ut = format[""ItemKeyRed%1"",_id - 2500]};
				if ((_id > 5000)&&(_id <= 7500)) then {_p4rt_0ut = format[""ItemKeyBlue%1"",_id - 5000]};
				if ((_id > 7500)&&(_id <= 10000)) then {_p4rt_0ut = format[""ItemKeyYellow%1"",_id - 7500]};
				if ((_id > 10000)&&(_id <= 12500)) then {_p4rt_0ut = format[""ItemKeyBlack%1"",_id - 10000]};
				if (_p4rt_0ut in (weapons player)) then {
					_msg = format[""%1 is already in your inventory!"",_p4rt_0ut];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				} else {
					player addweapon _p4rt_0ut;
					_msg = format[""%1 added to inventory!"",_p4rt_0ut];
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
			};
			admin_logload = {
				call compile ('
					inSub = false;
					_isSpawnMenu = false;
					_ctrl = 2 call getControl;
					_ctrl ctrlSetFont admin_font_style;
					_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
					lbclear _ctrl;
					adminadd = [];
					call admin_menuHeader;
					call admin_populateMenu;
					
					if (!(admin_LGRCV)&&("+str _LG_PVC+")) then {
						_msg = ''Requesting logs...'';
						systemChat (''"+_AH_CHAT+": ''+str _msg);
						
						"+_rnd+"_VarReceive = false;
						"+_rnd+"_RequestAHFL = [player,name player];
						publicVariableServer ''"+_rnd+"_RequestAHFL'';
						waitUntil {("+_rnd+"_VarReceive)};
						
						_msg = ''Logs received from server!'';
						systemChat (''"+_AH_CHAT+": ''+str _msg);
						
						[] spawn {
							if !(admin_LGRCV) then {
								admin_LGRCV = true;
								sleep 5;
								admin_LGRCV = false;
							};
						};
					};
					for ""_i"" from (count '+_this+')-1 to 0 step -1 do {
						_line 	= ('+_this+' select _i);
						_color 	= (_line select 6);
						
						_ctrl lbAdd (_line select 0);
						_ctrl lbSetColor [(lbsize _ctrl)-1,[1,1,1,1]];
						if (count _color > 0) then {_ctrl lbSetColor [(lbsize _ctrl)-1,_color]};
					};
				');
			};
			admin_fillwritelogs = {'"+_rnd+"_adminLog' spawn admin_logload};
			admin_fillhacklogs 	= {'"+_rnd+"_HackerLog' spawn admin_logload};
			admin_fillkeylogs 	= {'"+_rnd+"_KeyLog' spawn admin_logload};
			admin_fillLoglogs 	= {'PVOZ_loglog' spawn admin_logload};
			admin_fillkilllogs 	= {'PVOZ_hitlog' spawn admin_logload};
			admin_fillmisclogs 	= {'PVOZ_Misclog' spawn admin_logload};
			admin_fillSkins = {
				inSub = true;
				_isSpawnMenu = true;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				lbclear _ctrl;
				_ctrl ctrlSetFont admin_font_style;
				_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_playerMorph;';
				adminadd = [];
				call admin_menuHeader;
				call admin_generateSkins;
				call admin_advancedfiller;
				call admin_populateMenu;
			};
			admin_generateSkins = {
				if (isNil 'adminadd_skins') then {
					add_mans = {
						_skn_type = _x;
						_skin_pic 	= (getText ( configFile >> 'cfgVehicles' >> _skn_type >> 'picture'));
						if (_skin_pic == '\Ca\characters\data\Ico\i_null_CA.paa') then {_skin_pic = '\ca\ui\data\icon_zora_ca.paa'};
						adminaddman set [count adminaddman,[_skn_type,format[_spwx,_skn_type],_skin_pic,'0','0','0',[0,0.8,1,1]]];
					};
					add_dazs = {
						_skn_type = _x;
						_skin_pic 	= (getText ( configFile >> 'cfgMagazines' >> 'Skin_'+_skn_type >> 'picture'));
						_skin_name 	= (getText ( configFile >> 'cfgMagazines' >> 'Skin_'+_skn_type >> 'displayName'));
						adminadddaz set [count adminadddaz,[_skin_name+' ('+_skn_type+')',format[_spwx,_skn_type],_skin_pic,'0','0','0',[0,1,0.1,1]]];
					};
					add_zomz = {
						_skn_type = _x;
						_skin_pic 	= (getText ( configFile >> 'cfgVehicles' >> _skn_type >> 'picture'));
						if (_skin_pic == '\Ca\characters\data\Ico\i_null_CA.paa') then {_skin_pic = '\ca\ui\data\icon_zora_ca.paa'};
						adminaddzom set [count adminaddzom,[_skn_type,format[_spwx,_skn_type],_skin_pic,'0','0','0',[0,0.65,0,1]]];
					};
					add_anis = {
						_skn_type = _x;
						_skin_pic 	= (getText ( configFile >> 'cfgVehicles' >> _skn_type >> 'picture'));
						if (_skin_pic == '\Ca\characters\data\Ico\i_null_CA.paa') then {_skin_pic = '\ca\ui\data\icon_zora_ca.paa'};
						adminaddani set [count adminaddani,[_skn_type,format[_spwx,_skn_type],_skin_pic,'0','0','0',[1,0,0.1,1]]];
					};
					_cfgvehicles = configFile >> 'cfgVehicles';
					_zomz = [];
					_mans = [];
					_dazs = [];
					_anis = [];
					_null = '\ca\ui\data\icon_zora_ca.paa';
					_nnul = '\dayz_equip\textures\equip_cloth_parcel_ca.paa';
					adminaddcom = [[' Morph ','','0','1','0','0',[]]];
					adminaddcom set [count adminaddcom,[' __________________________________','','0','1','0','0',[]]];
					adminaddcom set [count adminaddcom,['(You can select a target from the left)','','0','1','0','0',[]]];
					adminaddcom set [count adminaddcom,[' __________________________________','','0','1','0','0',[]]];
					adminaddcom set [count adminaddcom,['=== COMMON SKINS ===','','0','0','0','0',MMCLR]];
					adminaddcom set [count adminaddcom,[' __________________________________','','0','1','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Invisible skin',	format[_spwx,'Survivor1_DZ'],_null,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Survivor',		format[_spwx,'Survivor2_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Hero',			format[_spwx,'Survivor3_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Female Survivor',	format[_spwx,'SurvivorW2_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Ghillie',			format[_spwx,'Sniper1_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Camo',			format[_spwx,'Camo1_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Soldier',			format[_spwx,'Soldier1_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Rocket',			format[_spwx,'Rocket_DZ'],_nnul,'0','0','0',[]]];
					adminaddcom set [count adminaddcom,['    Bandit',			format[_spwx,'Bandit1_DZ'],_nnul,'0','0','0',[]]];
					adminadddaz = [['=== MOD BASED SKINS (DAYZ) ===','','0','0','0','0',MMCLR]];
					adminaddman = [['=== SCANNED SKINS (PLAYER) ===','','0','0','0','0',MMCLR]];
					adminaddzom = [['=== SCANNED SKINS (ZOMBIES) ===','','0','0','0','0',MMCLR]];
					adminaddani = [['=== SCANNED SKINS (ANIMALS) ===','','0','0','0','0',MMCLR]];
					
					admin_cfgSkins_MDZ call dami_alphaSortSTR;
					{_x call add_dazs} forEach aht_strarr;
					
					admin_cfgSkins_MAN call dami_alphaSortSTR;
					{_x call add_mans} forEach aht_strarr;
					
					admin_cfgSkins_ZOM call dami_alphaSortSTR;
					{_x call add_zomz} forEach aht_strarr;
					
					admin_cfgSkins_ANI call dami_alphaSortSTR;
					{_x call add_anis} forEach aht_strarr;
					adminadd_skins = (adminaddcom + adminadddaz + adminaddman + adminaddzom + adminaddani);
				};
				adminadd = adminadd + adminadd_skins;
			};
			admin_allSkins = {
				_cfgvehicles = configFile >> 'cfgVehicles';
				admin_cfgSkins_MAN = [];
				admin_cfgSkins_MDZ = [];
				admin_cfgSkins_ZOM = [];
				admin_cfgSkins_ANI = [];
				for '_i' from 0 to (count _cfgvehicles)-1 do {
					_skin = _cfgvehicles select _i;
					if (isClass _skin) then {
						_skn_type = configName _skin;
						if ((getNumber (_skin >> 'scope') == 2)&&(getText (_skin >> 'picture') != '')&&(_skn_type isKindOf 'Man') && !(_skn_type isKindOf 'zZombie_Base') && !(_skn_type == 'Survivor1_DZ')) then {
							if (isClass (configFile >> 'CfgMagazines' >> ('Skin_'+_skn_type))) then {
								admin_cfgSkins_MDZ = admin_cfgSkins_MDZ + [_skn_type];
							} else {
								admin_cfgSkins_MAN = admin_cfgSkins_MAN + [_skn_type];
							};
						};
						if ((getNumber (_skin >> 'scope') == 2)&&(getText (_skin >> 'picture') != '') && !(_skn_type == 'zZombie_Base') && (_skn_type isKindOf 'zZombie_Base')) then {
							admin_cfgSkins_ZOM = admin_cfgSkins_ZOM + [_skn_type];
						};
						if ((getNumber (_skin >> 'scope') == 2)&&(_skn_type isKindOf 'CAAnimalBase') && !(_skn_type == 'Cock')) then {
							admin_cfgSkins_ANI = admin_cfgSkins_ANI + [_skn_type];
						};
					};
				};
			};
			admin_allVehicles = {
				_badVehicles = [];
				{_badVehicles = _badVehicles + [toLower(_x)]} forEach "+str _BAD_VEHS+";
				_cfgvehicles2 = configFile >> 'cfgVehicles';
				admin_cfgvehicles = [];
				for '_i' from 0 to (count _cfgvehicles2)-1 do {
					_vehicle = (_cfgvehicles2 select _i);
					if (isClass _vehicle) then {
						_veh_type = configName _vehicle;
						if !(toLower(_veh_type) in _badVehicles) then {
							if ((getNumber (_vehicle >> 'scope') == 2)&&(getText (_vehicle >> 'picture') != '')&&!((_veh_type isKindOf 'ParachuteBase')||(_veh_type isKindOf 'BIS_Steerable_Parachute'))) then {
								admin_cfgvehicles = admin_cfgvehicles + [_veh_type];
							};
						};
					};
				};
			};
			admin_allMagazines = {
				_cfgMagazines2 = configFile >> 'cfgMagazines';
				admin_cfgMagazines = [];
				for '_i' from 0 to (count _cfgMagazines2)-1 do {
					_magazine = (_cfgMagazines2 select _i);
					if (isClass _magazine) then {
						_mag_type = configName _magazine;
						_isBad = _mag_type in AHT_badItems;
						if !(_isBad) then {
							if ((getNumber (_magazine >> 'scope') == 0)||(getNumber (_magazine >> 'scope') == 2)&&(getText (_magazine >> 'picture') != '')) then {
								admin_cfgMagazines = admin_cfgMagazines + [_mag_type];
							};
						};
					};
				};
			};
			admin_allWeapons = {
				_cfgweapons2 = configFile >> 'cfgWeapons';
				admin_cfgWeapons = [];
				for '_i' from 0 to (count _cfgweapons2)-1 do {
					_weapon = (_cfgweapons2 select _i);
					if (isClass _weapon) then {
						_wpn_type = configName _weapon;
						_arr = toArray _wpn_type;_arr resize 7;_arr;
						_isKey = ((toString(_arr)) == 'ItemKey');
						if !(_isKey) then {
							_isBad = _wpn_type in AHT_badItems;
							if !(_isBad) then {
								if ((getNumber (_weapon >> 'scope') == 0)||(getNumber (_weapon >> 'scope') == 2)&&(getText (_weapon >> 'picture') != '')) then {
									admin_cfgWeapons = admin_cfgWeapons + [_wpn_type];
								};
							};
						};
					};
				};
			};
			admin_allBuildings = {
				_cfgobjects = configFile >> ""cfgVehicles"";
				admin_cfgBuildings = [];
				for '_i' from 0 to (count _cfgobjects)-1 do {
					_object = _cfgobjects select _i;
					if (isClass _object) then {
						_obj_type = configName _object;
						if ((getNumber (_object >> 'scope') == 2) && (getText (_object >> 'picture') != '') && ((_obj_type isKindOf 'Building') || (_obj_type isKindOf 'House'))) then {
							admin_cfgBuildings = admin_cfgBuildings + [_obj_type];
						};
					};
				};
			};
			admin_generateWeapons = {
				_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnWeapon;';
				_spox = '[lbtext [1,(lbCurSel 1)]] spawn admin_giveAmmo;';
				adminadd = [];
				call admin_menuHeader;
				adminadd set [count adminadd,[' Spawn Weapon/Items ','','0','1','0','0',[]]];
				adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
				adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
				adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
				adminadd set [count adminadd,['Give ammo target',_spox,'0','0','0','1',SMCLR]];
				adminadd set [count adminadd,['Search menu','''WandM'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
				if (isNil 'adminadd_weapons') then {
					adminadd_weapons = [];
					_cfgweapons = configFile >> 'cfgWeapons';
					add_weps = {
						_wpn_type = _x;
						_weapon_name 	= (getText (_cfgweapons >> _wpn_type >> 'displayName'));
						_weapon_pic 	= (getText (_cfgweapons >> _wpn_type >> 'picture'));
						if !(admin_DispClassWPN) then {
							_chek = [_wpn_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE']) then {
								adminadd_weapons set [count adminadd_weapons,[format ['%1 [DZ]',_weapon_name,_wpn_type],format[_spwx,_wpn_type],_weapon_pic,_wpn_type,'0','0',[0,1,0,1]]];
							} else {
								adminadd_weapons set [count adminadd_weapons,[_weapon_name,format[_spwx,_wpn_type],_weapon_pic,_wpn_type,'0','0',[]]];
							};
						} else {
							_chek = [_wpn_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE']) then {
								adminadd_weapons set [count adminadd_weapons,[_wpn_type,format[_spwx,_wpn_type],_weapon_pic,_weapon_name,'0','0',[0,1,0,1]]];
							} else {
								adminadd_weapons set [count adminadd_weapons,[_wpn_type,format[_spwx,_wpn_type],_weapon_pic,_weapon_name,'0','0',[]]];
							};
						};
					};
					startLoadingScreen ['Searching, please wait...','DayZ_loadingScreen'];
					adminadd_weapons set [count adminadd_weapons,['[] ---- Weapons ---- []','','0','1','0','0',[]]];
					_weps = [];
					{if (isClass(configFile >> 'CfgWeapons' >> _x)) then {_weps = _weps + [_x]}} count _this;
					_weps call dami_alphaSortSTR;
					{_x call add_weps} forEach aht_strarr;
				};
			};
			admin_generateMagazines = {
				_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnWeapon;';
				_spox = '[lbtext [1,(lbCurSel 1)]] spawn admin_giveAmmo;';
				if (isNil 'adminadd_magazines') then {
					adminadd_magazines = [];
					_cfgMagazines = configFile >> 'cfgMagazines';
					add_mags = {
						_mag_type = _x;
						_magazine_name 	= (getText (_cfgMagazines >> _mag_type >> 'displayName'));
						_magazine_pic 	= (getText (_cfgMagazines >> _mag_type >> 'picture'));
						if !(admin_DispClassWPN) then {
							if (_magazine_name == 'Supply Crate') then {
								adminadd_magazines set [count adminadd_magazines,[format ['%1 - (%2)',_magazine_name,_mag_type],format[_spwx,_mag_type],_magazine_pic,'0','0','0',[]]];
							} else {
								adminadd_magazines set [count adminadd_magazines,[_magazine_name,format[_spwx,_mag_type],_magazine_pic,_mag_type,'0','0',[]]];
							};
						} else {
							adminadd_magazines set [count adminadd_magazines,[_mag_type,format[_spwx,_mag_type],_magazine_pic,_magazine_name,'0','0',[]]];
						};
					};
					adminadd_magazines set [count adminadd_magazines,['[] ---- Magazines ---- []','','0','1','0','0',[]]];
					_mags = [];
					{if (isClass(configFile >> 'CfgMagazines' >> _x)) then {_mags = _mags + [_x]}} count _this;
					_mags call dami_alphaSortSTR;
					{_x call add_mags} forEach aht_strarr;
					endLoadingScreen;
				};
			};
			admin_generateCurWepMags = {
				adminadd_swegs = [];
				_weapons2 = (weapons player);
				if !(isNull (unitBackpack player)) then {_weapons2 = _weapons2 + ((getWeaponCargo (unitBackpack player)) select 0)};
				_weapons = [];
				{if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'type')) in [1,2,3]) then {_weapons = _weapons + [_x]}} count _weapons2;
				if (count(_weapons) > 0) then {
					_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnWeapon;';
					adminadd_swegs set [count adminadd_swegs,['[] --- Ammo for weapons on player --- []','','0','1','0','0',[]]];
					{
						
						_cfgweapons 	= configFile >> 'cfgWeapons';
						_cfgMagazines 	= configFile >> 'cfgMagazines';
						_wpn_type 		= _x;
						_weapon_name 	= (getText (_cfgweapons >> _wpn_type >> 'displayName'));
						_weapon_pic 	= (getText (_cfgweapons >> _wpn_type >> 'picture'));
						if !(admin_DispClassWPN) then {
							adminadd_swegs set [count adminadd_swegs,[format ['%1',_weapon_name,_wpn_type],format[_spwx,_wpn_type],_weapon_pic,_wpn_type,'0','0',[0,1,0,1]]];
							{
								_mag_type = _x;
								_magazine_name 	= (getText (_cfgMagazines >> _mag_type >> 'displayName'));
								_magazine_pic 	= (getText (_cfgMagazines >> _mag_type >> 'picture'));
								adminadd_swegs set [count adminadd_swegs,[format ['  --> %1',_magazine_name],format[_spwx,_mag_type],_magazine_pic,_mag_type,'0','0',MMCLR]];
							} forEach (getArray (configfile >> 'cfgWeapons' >> _wpn_type >> 'magazines'));
						} else {
							adminadd_swegs set [count adminadd_swegs,[_wpn_type,format[_spwx,_wpn_type],_weapon_pic,_weapon_name,'0','0',[0,1,0,1]]];
							{
								_mag_type = _x;
								_magazine_name 	= (getText (_cfgMagazines >> _mag_type >> 'displayName'));
								_magazine_pic 	= (getText (_cfgMagazines >> _mag_type >> 'picture'));
								adminadd_swegs set [count adminadd_swegs,[format ['  --> %1',_mag_type],format[_spwx,_mag_type],_magazine_pic,_magazine_name,'0','0',MMCLR]];
							} forEach (getArray (configfile >> 'cfgWeapons' >> _wpn_type >> 'magazines'));
						};
					} forEach _weapons;
				};
			};
			admin_generateBuildings = {
				if (isNil 'adminadd_obj') then {
					adminadd = [];
					call admin_menuHeader;
					_spwx = ""[lbtext [1,(lbCurSel 1)],'%1'] call admin_spawnVehicle;"";
					adminadd = [];
					call admin_menuHeader;
					adminadd set [count adminadd,[' Spawn Building ','','0','1','0','0',[]]];
					adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
					adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
					adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
					adminadd set [count adminadd,['Search menu','''Buildings'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
					startLoadingScreen ['Searching, please wait...','DayZ_loadingScreen'];
					_objs = [];
					{
						_obj_type 	= _x;
						_obj_name 	= (getText (configFile >> 'CfgVehicles' >> _obj_type >> 'displayName'));
						_obj_pic 	= (getText (configFile >> 'CfgVehicles' >> _obj_type >> 'picture'));
						if (_obj_pic == '') then {_obj_pic = '\ca\ui\data\icon_zora_ca.paa'};
						if (admin_DispClassVEH) then {
							adminadd set [count adminadd,[_obj_type,format[_spwx,_obj_type],_obj_pic,_obj_name,'0','0',[]]];
						} else {
							adminadd set [count adminadd,[_obj_name,format[_spwx,_obj_type],_obj_pic,_obj_type,'0','0',[]]];
						};
					} forEach _this;
					endLoadingScreen;
					
					adminadd_obj = adminadd;
				};
				adminadd = adminadd_obj;
			};
			admin_generateVehicles = {
				if (isNil 'adminadd_veh') then {
					adminadd = [];
					call admin_menuHeader;
					_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnVehicle;';
					adminadd set [count adminadd,[' Spawn Vehicle ','','0','1','0','0',[]]];
					adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
					adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
					adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
					adminadd set [count adminadd,['Search menu','''Vehicles'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
					adminadd set [count adminadd,['Toggle spawn in driverseat','[] spawn admin_toggleFly;','1','0','0','0',[]]];
					add_menu = {
						_veh_type = _x;
						_vehicle_name 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'displayName'));
						_vehicle_pic 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'picture'));
						if (admin_DispClassVEH) then {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[]]];
							};
						} else {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[format ['%1 - [DZ]',_vehicle_name],format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_vehicle_name,format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[]]];
							};
						};
					};
					startLoadingScreen ['Searching, please wait...','DayZ_loadingScreen'];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['--------------Air-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Air') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Land-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'LandVehicle') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Ship-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Ship') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					adminadd_veh = adminadd;
					endLoadingScreen;
				};
				adminadd = adminadd_veh;
			};
			admin_generateVehiclesHIVE = {
				if (isNil 'adminadd_vehHIVE') then {
					adminadd = [];
					call admin_menuHeader;
					_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnHive;';
					adminadd set [count adminadd,[' Spawn Vehicle (HIVE)','','0','1','0','0',[]]];
					adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
					adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
					adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
					adminadd set [count adminadd,['Search menu','''Vehicles_H'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
					add_menu = {
						_veh_type = _x;
						_vehicle_name 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'displayName'));
						_vehicle_pic 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'picture'));
						if (admin_DispClassVEH) then {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[]]];
							};
						} else {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[format ['%1 - [DZ]',_vehicle_name],format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_vehicle_name,format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[]]];
							};
						};
					};
					startLoadingScreen ['Searching, please wait...','DayZ_loadingScreen'];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['--------------Air-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Air') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Land-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'LandVehicle') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Ship-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Ship') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					adminadd_vehHIVE = adminadd;
					endLoadingScreen;
				};
				adminadd = adminadd_vehHIVE;
			};
			admin_generateWeapons_SEARCH = {
				if (isNil 'adminadd_weapons_SEARCH') then {
					adminadd_weapons_SEARCH = [];
					_cfgweapons = configFile >> 'cfgWeapons';
					add_weps = {
						_wpn_type = _x;
						_weapon_name 	= (getText (_cfgweapons >> _wpn_type >> 'displayName'));
						_weapon_pic 	= (getText (_cfgweapons >> _wpn_type >> 'picture'));
						if !(admin_DispClassWPN) then {
							_chek = [_wpn_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE']) then {
								adminadd_weapons_SEARCH set [count adminadd_weapons_SEARCH,[format ['%1 [DZ]',_weapon_name,_wpn_type],format[_spwx,_wpn_type],_weapon_pic,_wpn_type,'0','0',[0,1,0,1]]];
							} else {
								adminadd_weapons_SEARCH set [count adminadd_weapons_SEARCH,[_weapon_name,format[_spwx,_wpn_type],_weapon_pic,_wpn_type,'0','0',[]]];
							};
						} else {
							_chek = [_wpn_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE']) then {
								adminadd_weapons_SEARCH set [count adminadd_weapons_SEARCH,[_wpn_type,format[_spwx,_wpn_type],_weapon_pic,_weapon_name,'0','0',[0,1,0,1]]];
							} else {
								adminadd_weapons_SEARCH set [count adminadd_weapons_SEARCH,[_wpn_type,format[_spwx,_wpn_type],_weapon_pic,_weapon_name,'0','0',[]]];
							};
						};
					};
					adminadd_weapons_SEARCH set [count adminadd_weapons_SEARCH,['[] ---- Weapons ---- []','','0','1','0','0',[]]];
					_weps = [];
					{if (isClass(configFile >> 'CfgWeapons' >> _x)) then {_weps = _weps + [_x]}} count _this;
					_weps call dami_alphaSortSTR;
					{_x call add_weps} forEach aht_strarr;
				};
			};
			admin_generateMagazines_SEARCH = {
				if (isNil 'adminadd_magazines_search') then {
					adminadd_magazines_search = [];
					_cfgMagazines = configFile >> 'cfgMagazines';
					add_mags = {
						_mag_type = _x;
						_magazine_name 	= (getText (_cfgMagazines >> _mag_type >> 'displayName'));
						_magazine_pic 	= (getText (_cfgMagazines >> _mag_type >> 'picture'));
						if !(admin_DispClassWPN) then {
							if (_magazine_name == 'Supply Crate') then {
								adminadd_magazines_search set [count adminadd_magazines_search,[format ['%1 - (%2)',_magazine_name,_mag_type],format[_spwx,_mag_type],_magazine_pic,'0','0','0',[]]];
							} else {
								adminadd_magazines_search set [count adminadd_magazines_search,[_magazine_name,format[_spwx,_mag_type],_magazine_pic,_mag_type,'0','0',[]]];
							};
						} else {
							adminadd_magazines_search set [count adminadd_magazines_search,[_mag_type,format[_spwx,_mag_type],_magazine_pic,_magazine_name,'0','0',[]]];
						};
					};
					adminadd_magazines_search set [count adminadd_magazines_search,['[] ---- Magazines ---- []','','0','1','0','0',[]]];
					_mags = [];
					{if (isClass(configFile >> 'CfgMagazines' >> _x)) then {_mags = _mags + [_x]}} count _this;
					_mags call dami_alphaSortSTR;
					{_x call add_mags} forEach aht_strarr;
				};
			};
			admin_generateBuildings_SEARCH = {
				if (isNil 'adminadd_obj_search') then {
					_objs = [];
					{
						_obj_type 	= _x;
						_obj_name 	= (getText (configFile >> 'CfgVehicles' >> _obj_type >> 'displayName'));
						_obj_pic 	= (getText (configFile >> 'CfgVehicles' >> _obj_type >> 'picture'));
						if (_obj_pic == '') then {_obj_pic = '\ca\ui\data\icon_zora_ca.paa'};
						if (admin_DispClassVEH) then {
							adminadd set [count adminadd,[_obj_type,format[_spwx,_obj_type],_obj_pic,_obj_name,'0','0',[]]];
						} else {
							adminadd set [count adminadd,[_obj_name,format[_spwx,_obj_type],_obj_pic,_obj_type,'0','0',[]]];
						};
					} forEach _this;
					adminadd_obj_search = adminadd;
				};
				adminadd = adminadd_obj_search;
			};
			admin_generateVehicles_SEARCH = {
				if (isNil 'adminadd_veh_search') then {
					add_menu = {
						_veh_type = _x;
						_vehicle_name 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'displayName'));
						_vehicle_pic 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'picture'));
						if (admin_DispClassVEH) then {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[]]];
							};
						} else {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[format ['%1 - [DZ]',_vehicle_name],format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_vehicle_name,format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[]]];
							};
						};
					};
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['--------------Air-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Air') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Land-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'LandVehicle') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Ship-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Ship') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					adminadd_veh_search = adminadd;
				};
				adminadd = adminadd_veh_search;
			};
			admin_generateVehiclesHIVE_SEARCH = {
				if (isNil 'adminadd_vehHIVE_search') then {
					add_menu = {
						_veh_type = _x;
						_vehicle_name 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'displayName'));
						_vehicle_pic 	= (getText (configFile >> 'CfgVehicles' >> _veh_type >> 'picture'));
						if (admin_DispClassVEH) then {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_veh_type,format[_spwx,_veh_type],_vehicle_pic,_vehicle_name,'0','0',[]]];
							};
						} else {
							_chek = [_veh_type,3] call KRON_StrRight;
							if (_chek in ['_DZ','DZE','ZE1','ZE2','ZE3','ZE4','ZE5','ZE6']) then {
								adminadd set [count adminadd,[format ['%1 - [DZ]',_vehicle_name],format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[0,1,0,1]]];
							} else {
								adminadd set [count adminadd,[_vehicle_name,format[_spwx,_veh_type],_vehicle_pic,_veh_type,'0','0',[]]];
							};
						};
					};
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['--------------Air-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Air') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Land-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'LandVehicle') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['-------------Ship-------------','','0','1','0','0',[]]];
					adminadd set [count adminadd,['------------------------------','','0','1','0','0',[]]];
					_vehs = [];
					{if (_x isKindOf 'Ship') then {_vehs = _vehs + [_x]}} count _this;
					_vehs call dami_alphaSortSTR;
					{_x call add_menu} forEach aht_strarr;
					adminadd_vehHIVE_search = adminadd;
				};
				adminadd = adminadd_vehHIVE_search;
			};
			admin_searchMenu = {
				_search = 'UNDEFINED';
				switch (_this) do {
					case 'Vehicles': 	{
						_search = 'Vehicles';
						admin_currentSearch = admin_cfgvehicles;
					};
					case 'Vehicles_H': 	{
						_search = 'Vehicles Hive';
						admin_currentSearch = admin_cfgvehicles;
					};
					case 'Buildings': 	{
						_search = 'Buildings';
						admin_currentSearch = admin_cfgBuildings;
					};
					case 'WandM': 		{
						_search = 'Weapons and Magazines';
						admin_currentSearch = (admin_cfgWeapons+admin_cfgMagazines);
					};
				};
				
				search_menu = {
					_text = _this select 0;
					_menu = _this select 1;
					_rtrn = _this select 2;
					
					startLoadingScreen ['Searching, please wait...','DayZ_loadingScreen'];
					_found = [];
					{
						_isMatch = [_text,_x] call fnc_inString;
						if (_isMatch) then {_found = _found + [_x]};
					} count admin_currentSearch;
					endLoadingScreen;
					
					if (count _found < 1) exitWith {
						_msg = 'Could not find '+_text+'! Try again.';
						systemChat ("""+_AH_CHAT+": "" + str _msg);
						_msg call AH_fnc_dynTextMsg;
						_rtrn spawn admin_searchMenu;
					};
					
					_msg = 'Found '+str(count(_found))+' instances of '+_text+' in '+_menu+' menu!';
					systemChat ("""+_AH_CHAT+": "" + str _msg);
					_msg call AH_fnc_dynTextMsg;
					
					switch (_menu) do {
						default {systemChat ('ERROR - COULD NOT LOAD MENU!')};
						case 'Vehicles': {
							inSub = true;
							_isSpawnMenu = true;
							_ctrl = 2 call getControl;
							_ctrl ctrlSetFont admin_font_style;
							_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
							_ctrl ctrlSetFont admin_font_style;
							_ctrl ctrlSetEventHandler ['LBSelChanged','[2.5,0.25] spawn admin_displayPAA;'];
							lbclear _ctrl;
							_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnVehicle;';
							adminadd = [];
							call admin_menuHeader;
							adminadd set [count adminadd,[' Spawn Vehicle (HIVE)','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['Search menu','''Vehicles'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
							adminadd set [count adminadd,['Toggle spawn in driverseat','[] spawn admin_toggleFly;','1','0','0','0',[]]];
							adminadd_veh_search = nil;
							startLoadingScreen ['Loading '+str(count (_found))+' items...','DayZ_loadingScreen'];
							_found call admin_generateVehicles_SEARCH;
							endLoadingScreen;
							call admin_advancedfiller;
							call admin_populateMenu;
						};
						case 'Vehicles Hive': {
							inSub = true;
							_isSpawnMenu = true;
							_ctrl = 2 call getControl;
							_ctrl ctrlSetFont admin_font_style;
							_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
							_ctrl ctrlSetFont admin_font_style;
							_ctrl ctrlSetEventHandler ['LBSelChanged','[2.5,0.25] spawn admin_displayPAA;'];
							lbclear _ctrl;
							_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnHive;';
							adminadd = [];
							call admin_menuHeader;
							adminadd set [count adminadd,[' Spawn Vehicle (HIVE)','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['Search menu','''Vehicles_H'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
							adminadd_vehHIVE_search = nil;
							startLoadingScreen ['Loading '+str(count (_found))+' items...','DayZ_loadingScreen'];
							_found call admin_generateVehiclesHIVE_SEARCH;
							endLoadingScreen;
							call admin_advancedfiller;
							call admin_populateMenu;
						};
						case 'Buildings': {
							inSub = true;
							_isSpawnMenu = true;
							_ctrl = 2 call getControl;
							_ctrl ctrlSetFont admin_font_style;
							_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
							lbclear _ctrl;
							_ctrl ctrlSetFont admin_font_style;
							_spwx = ""[lbtext [1,(lbCurSel 1)],'%1'] call admin_spawnVehicle;"";
							adminadd = [];
							call admin_menuHeader;
							adminadd set [count adminadd,[' Spawn Building ','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['Search menu','''Buildings'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
							adminadd_obj_search = nil;
							startLoadingScreen ['Loading '+str(count (_found))+' items...','DayZ_loadingScreen'];
							_found call admin_generateBuildings_SEARCH;
							endLoadingScreen;
							call admin_advancedfiller;
							call admin_populateMenu;
						};
						case 'Weapons and Magazines': {
							inSub = true;
							_isSpawnMenu = true;
							_ctrl = 2 call getControl;
							_ctrl ctrlSetFont admin_font_style;
							_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
							_ctrl ctrlSetEventHandler ['LBSelChanged','[4,0.5] spawn admin_displayPAA;'];
							lbclear _ctrl;
							_spwx = '[lbtext [1,(lbCurSel 1)],''%1''] call admin_spawnWeapon;';
							_spox = '[lbtext [1,(lbCurSel 1)]] spawn admin_giveAmmo;';
							adminadd = [];
							call admin_menuHeader;
							adminadd set [count adminadd,[' Spawn Weapon/Items ','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['(You can select a target from the left)','','0','1','0','0',[]]];
							adminadd set [count adminadd,[' __________________________________','','0','1','0','0',[]]];
							adminadd set [count adminadd,['Give ammo target',_spox,'0','0','0','1',SMCLR]];
							adminadd set [count adminadd,['Search menu','''WandM'' spawn admin_searchMenu','0','0','0','0',SMCLR]];
							call admin_generateCurWepMags;
							
							adminadd_weapons_SEARCH = nil;
							adminadd_magazines_SEARCH = nil;
							startLoadingScreen ['Loading '+str(count (_found))+' items...','DayZ_loadingScreen'];
							_found call admin_generateWeapons_SEARCH;
							_found call admin_generateMagazines_SEARCH;
							endLoadingScreen;
							adminadd = adminadd + (adminadd_swegs+adminadd_weapons_SEARCH+adminadd_magazines_SEARCH);
							call admin_advancedfiller;
							call admin_populateMenu;
						};
					};
				};
				
				disableSerialization;
				['Search Menu: '+_search,'Partial Name:','Search','search_menu',_search,_this] call AH_fnc_displayCreate;
			};
			admin_fillvehHIVE = {
				inSub = true;
				_isSpawnMenu = true;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetEventHandler ['LBSelChanged','[2.5,0.25] spawn admin_displayPAA;'];
				lbclear _ctrl;
				admin_cfgVehicles call admin_generateVehiclesHIVE;
				call admin_advancedfiller;
				call admin_populateMenu;
			};
			admin_fillveh = {
				inSub = true;
				_isSpawnMenu = true;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetEventHandler ['LBSelChanged','[2.5,0.25] spawn admin_displayPAA;'];
				lbclear _ctrl;
				admin_cfgVehicles call admin_generateVehicles;
				call admin_advancedfiller;
				call admin_populateMenu;
			};
			admin_fillobj = {
				inSub = true;
				_isSpawnMenu = true;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				lbclear _ctrl;
				_ctrl ctrlSetFont admin_font_style;
				admin_cfgBuildings call admin_generateBuildings;
				call admin_advancedfiller;
				call admin_populateMenu;
			};
			admin_fillwpn = {
				inSub = true;
				_isSpawnMenu = true;
				_ctrl = 2 call getControl;
				_ctrl ctrlSetFont admin_font_style;
				_ctrl ctrlSetFontHeight (0.025 + admin_font_size);
				_ctrl ctrlSetEventHandler ['LBSelChanged','[4,0.5] spawn admin_displayPAA;'];
				lbclear _ctrl;
				adminadd = [];
				call admin_menuHeader;
				call admin_generateCurWepMags;
				admin_cfgWeapons call admin_generateWeapons;
				admin_cfgMagazines call admin_generateMagazines;
				adminadd = adminadd + (adminadd_swegs+adminadd_weapons+adminadd_magazines);
				call admin_advancedfiller;
				call admin_populateMenu;
			};
			dami_alphaSortSTR = {
				if (count _this < 2) exitWith {aht_strarr = _this};
				private ['_array1','_array2','_tmp','_itemSorted'];
				for '_inc' from 0 to (count _this - 2) do {
					for '_dec' from _inc to 0 step -1 do {
						_objStr1 	= (_this select _dec);
						_objStr2 	= (_this select _dec + 1);
						_array1 	= toArray(toLower(_objStr1));
						_array2 	= toArray(toLower(_objStr2));
						_itemSorted = false;
						for '_i' from 0 to (count _array1) do {
							if (_i >= count _array2 || {_array1 select _i > _array2 select _i}) exitWith {
								_tmp = _this select _dec;
								_this set [_dec,_this select _dec +1];
								_this set [_dec +1,_tmp]
							};
							if (_array1 select _i < _array2 select _i) exitWith {_itemSorted = true};
						};
						if (_itemSorted) exitWith {};
					};
				};
				aht_strarr = _this;
			};
			dami_alphaSort = {
				if (count _this < 2) exitWith {aht_plrs = _this};
				private ['_array1','_array2','_tmp','_itemSorted'];
				for '_inc' from 0 to (count _this - 2) do {
					for '_dec' from _inc to 0 step -1 do {
						_objStr1 	= name (_this select _dec);
						_objStr2 	= name (_this select _dec + 1);
						_array1 	= toArray(toLower(_objStr1));
						_array2 	= toArray(toLower(_objStr2));
						_itemSorted = false;
						for '_i' from 0 to (count _array1) do {
							if (_i >= count _array2 || {_array1 select _i > _array2 select _i}) exitWith
							{
								_tmp = _this select _dec;
								_this set [_dec,_this select _dec +1];
								_this set [_dec +1,_tmp]
							};
							if (_array1 select _i < _array2 select _i) exitWith {_itemSorted = true};
						};
						if (_itemSorted) exitWith {};
					};
				};
				aht_plrs = _this;
			};
			KRON_StrToArray = {
				private['_in','_i','_arr','_out'];
				_in=_this select 0;
				_arr = toArray(_in);
				_out=[];
				for '_i' from 0 to (count _arr)-1 do {
					_out=_out+[toString([_arr select _i])];
				};
				_out
			};
			KRON_StrRight = {
				private['_in','_len','_arr','_i','_out'];
				_in=_this select 0;
				_len=_this select 1;
				_arr=[_in] call KRON_StrToArray;
				_out='';
				if (_len>(count _arr)) then {_len=count _arr};
				for '_i' from ((count _arr)-_len) to ((count _arr)-1) do {
					_out=_out + (_arr select _i);
				};
				_out
			};
			admin_populateMenu = {
				for '_i' from 0 to ((count adminadd) - 1) do {
					if (isNull (findDisplay 3030)) exitWith {};
					_indx 	= (adminadd select _i);
					_indx0 	= (_indx select 0);
					_indx1 	= (_indx select 2);
					_indx2 	= (_indx select 3);
					_indx3 	= (_indx select 4);
					_indx4 	= (_indx select 6);
					
					_ctrl lbAdd _indx0;
					
					if (count _indx4 == 0) then {_ctrl lbSetColor [(lbsize _ctrl)-1,[1,1,1,1]]};
					if (_indx1 == '1') then {
						_inside = false;
						{if (str _x == '['+str _i+','+str _indx0+']') then {_inside = true}} forEach admin_toggled;
						_ctrl lbSetColor (if (_inside) then [{[(lbsize _ctrl)-1,[0,1,0,1]]},{[(lbsize _ctrl)-1,[1,0,0,1]]}]);
					};
					if (_indx2 == '1') then {_ctrl lbSetColor [(lbsize _ctrl)-1,[0.2,0.4,1,1]]};
					if (_indx3 == '1') then {_ctrl lbSetColor [(lbsize _ctrl)-1,[0,0.8,0.76,1]]};
					if (count _indx4 > 0) then {_ctrl lbSetColor [(lbsize _ctrl)-1,_indx4]};
					if (_isSpawnMenu) then {
						if ((_indx1 != '0')&&(_indx1 != '1')) then {
							_ctrl lbSetPicture [(lbsize _ctrl)-1,_indx1];
						};
					};
				};
			};
			admin_findPlayer = {
				private ['_return','_passed','_reason','_test','_arr','_allPlayers'];
				_return = [_this,objNull];
				_passed = _this;
				_reason = '';
				
				_test = toArray (_return select 0);
				_test resize 3;
				_test;
				_test = toString _test;
				
				if ((_passed == '')||(_test in ['[-l','[-P','[-I','-- ',' ','','   '])) then {
					_reason = (_passed+' does not exist!');
					_return = ['FAILED',objNull];
				};
				if (_test in ['D: ','P: ']) then {
					_arr = toArray _passed;
					_arr set [0,objNull];
					_arr set [1,objNull];
					_arr set [2,objNull];
					_return = [toString (_arr - [objNull]),objNull];
				};
				if ((_return select 0) != 'FAILED') then {
					_allPlayers = playableUnits;
					{if (name _x == (_return select 0)) exitWith {_return set [1,_x]}} forEach _allPlayers;
				};
				_return;
			};
			admin_dbclick = {
				_isran = false;
				_indx0 = ((adminadd select (lbCurSel 2)) select 0);
				_indx1 = ((adminadd select (lbCurSel 2)) select 1);
				_indx2 = ((adminadd select (lbCurSel 2)) select 2);
				_indx3 = ((adminadd select (lbCurSel 2)) select 3);
				_indx4 = ((adminadd select (lbCurSel 2)) select 4);
				_indx5 = ((adminadd select (lbCurSel 2)) select 5);
				
				if (_indx3 == '1') exitWith {};
				if (_indx4 == '1') then {
					if (_indx1 == 'Vehicles') exitWith {call admin_fillveh};
					if (_indx1 == 'VehiclesHIVE') exitWith {call admin_fillvehHIVE};
					if (_indx1 == 'Objects') exitWith {call admin_fillobj};
					if (_indx1 == 'Weaponz') exitWith {call admin_fillwpn};
					if (_indx1 == 'HackerLog') exitWith {call admin_fillhacklogs};
					if (_indx1 == 'PHitLog') exitWith {call admin_fillkilllogs};
					if (_indx1 == 'MiscLog') exitWith {call admin_fillmisclogs};
					if (_indx1 == 'LogLog') exitWith {call admin_fillLoglogs};
					if (_indx1 == 'WriteLog') exitWith {call admin_fillwritelogs};
					if (_indx1 == 'KeyLog') exitWith {call admin_fillkeylogs};
					if (_indx1 == 'MainMenu') exitWith {call admin_fillList};
					if (_indx1 == 'Skinz') exitWith {call admin_fillSkins};
					if (_indx1 == 'Weather') exitWith {call admin_weather};
					if (_indx1 == 'Time') exitWith {call admin_time};
				};
				if (_indx2 == '1') then {
					if (typeName _indx1 == 'STRING') then {_indx1 = compile _indx1};
					[] spawn _indx1;
					
					_tgl = (lbCurSel 2);
					_isInside = [false,-1];
					{if (str _x == '['+str _tgl+','+str _indx0+']') then {_isInside = [true,_forEachIndex]}} forEach admin_toggled;
					if !(_isInside select 0) then {
						lbSetColor [2,_tgl,[0,1,0,1]];
						admin_toggled set [count admin_toggled,[_tgl,_indx0]];
					} else {
						lbSetColor [2,_tgl,[1,0,0,1]];
						admin_toggled set [(_isInside select 1),objNull];
						admin_toggled = admin_toggled - [objNull];
					};
					
					_isran = true;
				} else {
					if (inSub) then {
						if (typeName _indx1 == 'CODE') then [{[] spawn _indx1},{call compile _indx1}];
						_isran = true;
					};
				};
				if ((_indx5 == '1')&& !_isran) then {
					_isran = true;
					if ((lbCurSel 1) >= 0) then {
						_text = ((lbtext [1,(lbCurSel 1)]) call admin_findPlayer);
						if ((_text select 0) == 'FAILED') exitWith {systemChat ('"+_AH_CHAT+": '+str (_text select 1)+'')};
						_text spawn _indx1;
					} else {
						_msg = 'Select a player from the left!';
						systemChat ('"+_AH_CHAT+": '+str _msg);
						cutText [_msg,'PLAIN'];
					};
				};
				if ((_indx5 == '0') && !_isran) then {if (typeName _indx1 == 'CODE') then [{[] spawn _indx1},{call compile _indx1}]};
			};
			admin_dbclick_2 = {
				_text = (lbtext [1,(lbCurSel 1)]) call admin_findPlayer;
				if ((_text select 0) == 'FAILED') exitWith {systemChat ('"+_AH_CHAT+": '+str (_text select 1)+'')};
				[_text select 0,_text select 1] spawn admin_spectateTarget;
			};
			admin_restartInit = {
				closeDialog 0;
				sleep 0.1;
				call admin_init;
			};
			admin_init = {
				if (isNull (findDisplay 3030)) then {
					createDialog 'AH_RSC_AHT';
					
					_time = call AH_fnc_serverTime;
					_ctrl = 1004 call getControl;
					_ctrl ctrlSetText (switch (true) do {
						default {'Admin Powers Revoked'};
						case (getPlayerUID player in levelone) : {format ['Welcome, %1! - Server Uptime: %2h %3m - Level 1',name player,_time select 0,_time select 1]};
						case (getPlayerUID player in leveltwo) : {format ['Welcome, %1! - Server Uptime: %2h %3m - Level 2',name player,_time select 0,_time select 1]};
						case (getPlayerUID player in levelthree) : {format ['Welcome, %1! - Server Uptime: %2h %3m - Level 3',name player,_time select 0,_time select 1]};
					});
					
					if !(getPlayerUID player in levelthree) then {
						{
							_ctrl = _x call getControl;
							_ctrl ctrlSetText 'DISABLED';
							_ctrl ctrlEnable false;
						} forEach [891,892,781];
					};
					
					call admin_fillList;
					call admin_fillPlayers;
					[] spawn {
						['',0,safezoneY,1,0,0,3077] spawn BIS_fnc_dynamicText;
						['',0,safezoneY,1,0,0,3078] spawn BIS_fnc_dynamicText;
						waitUntil {(isNull (findDisplay 3030))};
						['',0,safezoneY,1,0,0,3077] spawn BIS_fnc_dynamicText;
						['',0,safezoneY,1,0,0,3078] spawn BIS_fnc_dynamicText;
					};
				};
			};
			admin_advancedfiller = {
				adminadd set [count adminadd,[' ','','0','1','0','0',[]]];
				adminadd set [count adminadd,[' ','','0','1','0','0',[]]];
				adminadd set [count adminadd,[' ','','0','1','0','0',[]]];
				adminadd set [count adminadd,[' ','','0','1','0','0',[]]];
				adminadd set [count adminadd,[' ','','0','1','0','0',[]]];
			};
			[] spawn admin_allVehicles;
			[] spawn admin_allMagazines;
			[] spawn admin_allWeapons;
			[] spawn admin_allBuildings;
			[] spawn admin_allSkins;
			diag_log ('(GG-AntiHack): Loaded menu CFG vars! '+str time);
			if ("+_playerID+" player in levelthree) then {
				diag_log ('(GG-AntiHack): LEVEL 3 HOTKEYS LOADED.');
				_msg = 'Level 3 hotkeys added.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				AH_keyBinds = compile ('
					_key = (_this select 1);
					if (_key == 0x3B) then {call admin_init};
					if (_key == 0x0F) then {call admin_init};
					if (_key == 0xC7) then {DZE_togglesnap=true};
					if (_key == 0x3C) then {[] spawn admin_healPlayers};
					if (_key == 0x3D) then {[] spawn admin_spawnweapons};
					if (_key == 0x3E) then {[] spawn admin_deleteTarget};
					if (_key == 0x3F) then {[] spawn admin_unspectate};
					if (_key == 0x02) then {[] spawn admin_repairVehicle};
					if (_key == 0x03) then {[] spawn admin_flipVehicle};
					if (_key == 0x40) then {if (!isNull admin_AHactiveTarget) then {createGearDialog [(admin_AHactiveTarget),''RscDisplayGear'']}};
					if (AM_EPOCH) then {
						if (_key == 0x04) then {[] spawn admin_passget};
						if (_key == 0x05) then {[] spawn admin_generatekey};
						if (_key == 0x06) then {[] spawn manipulate_stealVehicle};
						if (_key == 0x07) then {[] spawn admin_OTFwriter};
						if (_key == 0x08) then {
							if !(isNil ''glue_deactivate'') then {
								[] spawn glue_deactivate;
							} else {
								[] spawn admin_QuickGlue;
							};
						};
					} else {
						if (_key == 0x04) then {[] spawn manipulate_stealVehicle};
						if (_key == 0x05) then {[] spawn admin_OTFwriter};
						if (_key == 0x06) then {
							if !(isNil ''glue_deactivate'') then {
								[] spawn glue_deactivate;
							} else {
								[] spawn admin_QuickGlue;
							};
						};
					};
				');
				AH_keyBinds2 = compile ('
					_key 	= _this select 1;
					if (_key == 0x1A) then {1 call admin_tpFWRD};
					if (_key == 0x2B) then {5 call admin_tpFWRD};
					if (_key == 0x27) then {if (isNull cursorTarget) then {(vehicle player) setPos (screenToWorld [0.5,0.5])} else {(vehicle player) setPos (cursorTarget modelToWorld [0,-1,0])}};
				');
			};
			if ("+_playerID+" player in leveltwo) then {
				diag_log ('(GG-AntiHack): LEVEL 2 HOTKEYS LOADED.');
				_msg = 'Level 2 hotkeys added.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				AH_keyBinds = compile ('
					_key = (_this select 1);
					if (_key == 0x3B) then {call admin_init};
					if (_key == 0x0F) then {call admin_init};
					if (_key == 0xC7) then {DZE_togglesnap=true};
					if (_key == 0x3E) then {[] spawn admin_deleteTarget};
					if (_key == 0x3F) then {[] spawn admin_unspectate};
					if (_key == 0x02) then {[] spawn admin_repairVehicle};
					if (_key == 0x03) then {[] spawn admin_flipVehicle};
					if (_key == 0x40) then {if (!isNull admin_AHactiveTarget) then {createGearDialog [(admin_AHactiveTarget),''RscDisplayGear'']}};
					if (AM_EPOCH) then {
						if (_key == 0x04) then {[] spawn admin_passget};
						if (_key == 0x05) then {[] spawn admin_generatekey};
					};
				');
			};
			if ("+_playerID+" player in levelone) then {
				diag_log ('(GG-AntiHack): LEVEL 1 HOTKEYS LOADED.');
				_msg = 'Level 1 hotkeys added.';
				systemChat ("""+_AH_CHAT+": "" + str _msg);
				_msg call AH_fnc_dynTextMsg;
				AH_keyBinds = compile ('
					_key = (_this select 1);
					if (_key == 0x3B) then {call admin_init};
					if (_key == 0x0F) then {call admin_init};
					if (_key == 0xC7) then {DZE_togglesnap=true};
					if (_key == 0x3F) then {[] spawn admin_unspectate};
					if (_key == 0x40) then {if (!isNull admin_AHactiveTarget) then {createGearDialog [(admin_AHactiveTarget),''RscDisplayGear'']}};
					if (AM_EPOCH) then {
						if (_key == 0x04) then {[] spawn admin_passget};
						if (_key == 0x05) then {[] spawn admin_generatekey};
					};
				');
			};
		};
	};
	diag_log ('(GG-AntiHack): (2/2) Admin tool loaded!');
");
call compile ("
	diag_log ('(GG-AntiHack): (1/2) Loading admin tool event handlers..!');

	"""+_AdminVAR+"_writeLog"" addPublicVariableEventHandler {
		_array = (_this select 1) select 0;
		
		_log1 = format ['ADMIN LOG: %1 [|DayZ instance: %2|]',_array,dayZ_instance];
		'AdminLog' callExtension (_log1);
		diag_log (_log1);
		
		_log2 = '     '+_array;
		"+_rnd+"_adminLog set [count "+_rnd+"_adminLog,[_log2,'','0','1','0','0',[0,0.5,1,1]]];
		if !("+str _LG_PVC+") then {publicVariable '"+_rnd+"_adminLog'};
	};
	AH_FNC_RE = {
		_unit = createAgent ['Sheep',[0,0,100000],[],0,'FORM'];
		_unit setVehicleInit _this;
		processInitCommands;
		clearVehicleInit _unit;
		deleteVehicle _unit;
	};
	"""+_AdminVAR+"_RE"" addPublicVariableEventHandler {
		if (isNil """+_rnd+"_adminLog"") then {"+_rnd+"_adminLog = []};
		_array 		= _this select 1;
		_commandopt = _array select 0;
		_savCaller 	= _array select 1;
		_isPlayer 	= (isPlayer _savCaller);
		_ahPCN 		= (name _savCaller);
		_ahCHK 		= ("+_playerID+" _savCaller);
		_ahARR 		= (levelone + leveltwo + levelthree);
		_isAdmin 	= (if (_ahCHK in _ahARR) then {true} else {false});
		admin_vehicleInit = {
			if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_this]};
			if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_this]};
			if (!isNil 'fnc_veh_ResetEH') then {_this call fnc_veh_ResetEH};
			if (!isNil 'PVDZE_veh_Init') then {PVDZE_veh_Init = _this;publicVariable 'PVDZE_veh_Init'};
			if (!isNil 'server_updateObject') then {[_this,'all'] spawn server_updateObject};
			
			clearWeaponCargoGlobal _this;
			clearMagazineCargoGlobal _this;
			
			_this engineOn true;
			_this setVariable ['ObjectID','1',true];
			_this setVariable ['ObjectUID','1',true];
			_this setvelocity [0,0,1];
			_allPlayers = playableUnits;
			{if (true) exitWith {_x action ['LightOn',_this]}} forEach _allPlayers;
		};
		if ((!_isAdmin)||(!_isPlayer)) exitWith {
			_array 		= nil;
			_commandopt = nil;
			if ((!_isAdmin)&&(_isPlayer)) then {'HackLog' callExtension format [""    Hack Log: %2 (%1) REASON: ADMIN RE HIJACK!!! (CONTACT DAMI) - |DayZ Instance: %1|"",dayZ_instance]};
		};
		if (_commandopt == 1337) exitWith {
			_dothis = (MarkerText ""rspawn_east"");
			_dothis call AH_FNC_RE;
			""rspawn_east"" setMarkerText ""Error"";
		};
		if (_commandopt == 1) exitWith {
			_player = (_array select 1);
			_class 	= (_array select 2);
			_pos 	= (_array select 3);
			_dir 	= (_array select 4);
			_action = (_array select 5);
			
			if (_action == 'FLY') then {
				_object = createVehicle [_class,_pos,[],0,_action];
				_object setDir _dir;
				_object call admin_vehicleInit;
				[_object,_pos] call AH_fnc_setPos;
				_player action ['GetInPilot',_object];
				_player moveInDriver _object;
			} else {
				_object = createVehicle [_class,_pos,[],0,""CAN_COLLIDE""];
				_object setDir _dir;
				_object call admin_vehicleInit;
				[_object,_pos] call AH_fnc_setPos;
			};
		};
		if (_commandopt == 2) exitWith {
			_savelog = format[""%1 (%2) hivespawned %3 at %4"",name (_array select 1),"+_playerID+" (_array select 1),(_array select 2),mapGridPosition getPosATL (_array select 1)];
			"+_AdminVAR+"_writeLog = [_savelog];
			publicVariableServer '"+_AdminVAR+"_writeLog';
			
			_class 		= (_array select 2);
			_worldspace = (_array select 3);
			_keySelected = (_array select 4);
			_characterID = str(getNumber(configFile >> ""CfgWeapons"" >> _keySelected >> ""keyid""));
			_location 	= _worldspace select 1;
			_uid 		= _worldspace call dayz_objectUID3;
			_object 	= createVehicle [_class,_location,[],0,""CAN_COLLIDE""];
			[_object,_location] call AH_fnc_setPos;
			_object setDir (_worldspace select 0);
			_object setvelocity [0,0,1];
			
			clearWeaponCargoGlobal  _object;
			clearMagazineCargoGlobal  _object;
			
			format[""CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:"",dayZ_instance,_class,0 ,_characterID,_worldspace,[],[],1,_uid] call server_hiveWrite;
			
			[_object,_uid,_characterID] spawn {
				_object 	= _this select 0;
				_retry 		= 0;
				while {_retry < 10} do {
					_result = format['CHILD:388:%1:',(_this select 1)] call server_hiveReadWrite;
					if ((_result select 0) == 'PASS') exitWith {_object setVariable ['ObjectID',(_result select 1),true]};
					sleep 0.3;
					_retry = _retry + 1;
				};
				
				_object setVehicleLock 'LOCKED';
				_object setVariable ['lastUpdate',time];
				_object setVariable ['CharacterID',(_this select 2),true];
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object]};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object]};
				if (!isNil 'fnc_veh_ResetEH') then {_object call fnc_veh_ResetEH};
				if (!isNil 'PVDZE_veh_Init') then {PVDZE_veh_Init = _object;publicVariable 'PVDZE_veh_Init'};
				if (!isNil 'server_updateObject') then {[_object,'all'] spawn server_updateObject};
			};
		};
		if (_commandopt == 3) exitWith {
			_savelog = format[""%1 (%2) hivespawned %3 at %4"",name (_array select 1),"+_playerID+" (_array select 1),(_array select 2),mapGridPosition getPosATL (_array select 1)];
			"+_AdminVAR+"_writeLog = [_savelog];
			publicVariableServer '"+_AdminVAR+"_writeLog';
			
			[(_array select 2),(_array select 3),(_array select 1)] spawn {
				_type = _this select 0;
				_pos = _this select 1;
				_player = _this select 2;
				_dirPlr = getDir _player;
				_object = createVehicle [_type,_pos,[],0,""CAN_COLLIDE""];	
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				_object addMPEventHandler [""MPKilled"",{_this call vehicle_handleServerKilled}];
				_uniqueid = str(round(random 999999));
				_object setVariable [""ObjectID"",_uniqueid,true];
				_object setVariable [""ObjectUID"",_uniqueid,true];
				_object setVariable [""lastUpdate"",time,true];
				_object setDir _dirPlr;
				if (!isNil ""dayz_serverObjectMonitor"") then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object]};
				if (!isNil ""PVDZE_serverObjectMonitor"") then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object]};
				waitUntil {(!isNull _object)};
				sleep 2;
				_typeObj = typeOf _object;
				_posObj = _object call AH_fnc_getPos;
				_dirObj = getDir _object;
				_key = format[""CHILD:999:select `id` from `vehicle` where `class_name` = '?' LIMIT 1:[""""%1""""]:"",_typeObj];
				_data = ""HiveEXT"" callExtension _key;
				_result = call compile format [""%1"",_data];
				_status = _result select 0;
				if (_status == ""CustomStreamStart"") then {
					""HiveEXT"" callExtension _key;
					_temp = _result select 1;
					if (_temp == 0) then {
						_data = ""HiveEXT"" callExtension format[""CHILD:999:Insert into vehicle (class_name,damage_min,damage_max,fuel_min,fuel_max,limit_min,limit_max,parts,inventory) values ('?',0,0,1.0,1.0,0,99,'',''):[""""%1""""]:"",_typeObj];
					};	
				};
				_data = ""HiveEXT"" callExtension format[""CHILD:999:Insert into world_vehicle (vehicle_id,world_id,worldspace,chance) values ((SELECT `id` FROM `vehicle` where `class_name` = '?' LIMIT 1),1,'%3',1):[""""%1"""",""""%2""""]:"",_typeObj,worldName,[_dirObj,_posObj]];
				_data = ""HiveEXT"" callExtension format[""CHILD:999:Insert into instance_vehicle (world_vehicle_id,instance_id,worldspace,inventory,parts,fuel,damage) values ((SELECT `id` FROM `world_vehicle` where `vehicle_id` = (SELECT `id` FROM `vehicle` where `class_name` = '%1' LIMIT 1) LIMIT 1),%3,'%2','[[[],[]],[[],[]],[[],[]]]','[]',1,0):[]:"",_typeObj,[_dirObj,_posObj],dayZ_instance];
				_key = format[""CHILD:999:SELECT `id` FROM `instance_vehicle` ORDER BY `id` DESC LIMIT 1:[]:""];
				_data = ""HiveEXT"" callExtension _key;
				_result = call compile format [""%1"",_data];
				_status = _result select 0;
				if (_status == ""CustomStreamStart"") then {
					_temp = _result select 1;
					if (_temp == 1) then {
						_data = ""HiveEXT"" callExtension _key;
						_result = call compile format [""%1"",_data];
						_status = _result select 0;
					};	
				};
				_object setVariable [""lastUpdate"",time];
				_object setVariable [""ObjectID"",str(_status),true];
				_object setVariable [""CharacterID"",""1337"",true];
				[_object,""all""] spawn server_updateObject;
			};
		};
		if (_commandopt == 4) exitWith {
			_player = _array select 1;
			_run 	= _array select 2;
			
			_allPlayers = playableUnits;
			{
				if (name _x == name _player) then {
					_x setVehicleInit ('this hideObject '+str (_run == 1));
					processInitCommands;
				}
			} forEach _allPlayers;
		};
		if (_commandopt == 5) exitWith {
			if (!isNil 'ManHuntThread') then {terminate ManHuntThread};
			ManHuntThread = [] spawn {
				_name 	= name PVOZ_target;
				if !(isNil 'MH_marker') then {deleteMarker MH_marker};
				if !(isNil 'MH_shade') then {deleteMarker MH_shade};
				MH_shade = createMarker ['Center Marker',getPosATL (vehicle PVOZ_target)];
				MH_shade setMarkerBrush 'DiagGrid';
				MH_shade setMarkerColor 'colorRed';
				MH_shade setMarkerShape 'ELLIPSE';
				MH_shade setMarkerAlpha 0.5;
				MH_shade setMarkerSize [150,150];
				
				MH_marker = createMarker ['Main Marker',getPosATL (vehicle PVOZ_target)];
				MH_marker setMarkerBrush 'SolidBorder';
				MH_marker setMarkerColor 'colorBlack';
				MH_marker setMarkerShape 'ELLIPSE';
				MH_marker setMarkerAlpha 0.5;
				MH_marker setMarkerSize [250,250];
				publicVariable 'MH_marker';
				publicVariable 'MH_shade';
				_SMSG = format ['<MAN HUNT> Man hunt has been issued on %1! Check your maps!',_name];
				[nil,nil,rspawn,[_SMSG],{systemChat (_this select 0)}] call RE;
				while {alive PVOZ_target} do {
					if (name PVOZ_target in ['Error: No Vehicle','Error: No Unit']) exitWith {};
					MH_marker setMarkerPos (getPosATL (vehicle PVOZ_target));
					MH_shade setMarkerPos (getPosATL (vehicle PVOZ_target));
					uiSleep (5 + (random 5));
				};
				deleteMarker MH_marker;
				deleteMarker MH_shade;
				if (isNull PVOZ_target) then {
					[nil,nil,rspawn,['<MAN HUNT> Manhunt over, player has left the game!'],{systemChat (_this select 0)}] call RE;
				} else {
					[nil,nil,rspawn,['<MAN HUNT> Manhunt over, player has died!'],{systemChat (_this select 0)}] call RE;
				};
			};
		};
		if (_commandopt == 6) exitWith {
			_loca 	= (_array select 2);
			_countW = (_array select 3);
			_countM = (_array select 4);
			_delTim = (_array select 5);
			_dir 	= _loca select 0;
			_pos 	= _loca select 1;
			
			_admincrate_BOX = createVehicle [""USBasicAmmunitionBox"",_pos,[],0,""CAN_COLLIDE""];
			[_admincrate_BOX,_pos] call AH_fnc_setPos;
			_admincrate_BOX setDir _dir;
			
			clearMagazineCargoGlobal _admincrate_BOX;
			clearWeaponCargoGlobal _admincrate_BOX;
			
			[_delTim,_pos] spawn {
				_delTime = _this select 0;
				_boxPos = _this select 1;
				if !(_delTime == 13337) then {
					uiSleep _delTime;
					_boxs = nearestObjects [_boxPos,[""USBasicAmmunitionBox""],15];
					{deleteVehicle _x} forEach _boxs;
					_msg = 'Admin box has been deleted!';
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				} else {
					_msg = format ['Admin box spawned @ %1(%2) with no timer!!',mapGridPosition _boxPos,_boxPos];
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				};
			};
			
			{_admincrate_BOX addWeaponCargoGlobal [_x,_countW]} forEach weapons_genbox;
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM]} forEach magazines_genbox;
		};
		if (_commandopt == 9) exitWith {
			_player = _array select 1;
			_selection = _array select 2;
			_intensity = _array select 3;
			switch (_selection) do {
				case 1: {
					dayzSetViewDistanceAH = _intensity;
					publicVariable ""dayzSetViewDistanceAH"";
					[""server"",nil,rSPAWN,_intensity,{""drn_DynamicWeatherEventArgs"" addPublicVariableEventHandler {setViewDistance _this};setViewDistance _this}] call RE;
					_savelog = format['%1 set serverViewDistance to %2',name _player,_intensity];
					"+_AdminVAR+"_writeLog = [_savelog];
					publicVariableServer '"+_AdminVAR+"_writeLog';
				};
				case 2: {
					dayzSetOvercastAH = _intensity;
					publicVariable ""dayzSetOvercastAH"";
					[""server"",nil,rSPAWN,_intensity,{""drn_DynamicWeatherEventArgs"" addPublicVariableEventHandler {0 setOvercast _this};0 setOvercast _this}] call RE;
					_savelog = format['%1 set serverOvercast to %2',name _player,_intensity];
					"+_AdminVAR+"_writeLog = [_savelog];
					publicVariableServer '"+_AdminVAR+"_writeLog';
				};
				case 3: {
					dayzSetRainAH = _intensity;
					publicVariable ""dayzSetRainAH"";
					[""server"",nil,rSPAWN,_intensity,{""drn_DynamicWeatherEventArgs"" addPublicVariableEventHandler {2 setRain _this};2 setRain _this}] call RE;
					_savelog = format['%1 set serverRain to %2',name _player,_intensity];
					"+_AdminVAR+"_writeLog = [_savelog];
					publicVariableServer '"+_AdminVAR+"_writeLog';
				};
				case 4: {
					dayzSetFogAH = _intensity;
					publicVariable ""dayzSetFogAH"";
					[""server"",nil,rSPAWN,_intensity,{""drn_DynamicWeatherEventArgs"" addPublicVariableEventHandler {2 setFog _this};2 setFog _this}] call RE;
					_savelog = format['%1 set serverFog to %2',name _player,_intensity];
					"+_AdminVAR+"_writeLog = [_savelog];
					publicVariableServer '"+_AdminVAR+"_writeLog';
				};
			};
		};
		if (_commandopt == 10) exitWith {
			_date = _array select 2;
			_offset = _array select 3;
			_date set [3,_offset];
			server_timeSync = {};
			dayzSetDateAH = _date;
			publicVariable 'dayzSetDateAH';
			['server',nil,rSPAWN,_date,{setDate _this}] call RE;
		};
		if (_commandopt == 11) exitWith {
			_loca 	= (_array select 2);
			_countW = (_array select 3);
			_countM = (_array select 4);
			_delTim = (_array select 5);
			_dir 	= _loca select 0;
			_pos 	= _loca select 1;
			
			_admincrate_BOX = createVehicle [""USBasicAmmunitionBox"",_pos,[],0,""CAN_COLLIDE""];
			[_admincrate_BOX,_pos] call AH_fnc_setPos;
			_admincrate_BOX setDir _dir;
			
			clearMagazineCargoGlobal _admincrate_BOX;
			clearWeaponCargoGlobal _admincrate_BOX;
			
			[_delTim,_pos] spawn {
				_delTime = _this select 0;
				_boxPos = _this select 1;
				if !(_delTime == 13337) then {
					uiSleep _delTime;
					_boxs = nearestObjects [_boxPos,[""USBasicAmmunitionBox""],15];
					{deleteVehicle _x} forEach _boxs;
					_msg = 'Admin box has been deleted!';
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				} else {
					_msg = format ['Admin box spawned @ %1(%2) with no timer!!',mapGridPosition _boxPos,_boxPos];
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				};
			};
			
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM]} forEach
			[
				""metal_floor_kit"",""CinderWallSmallDoorway_DZ"",
				""wooden_shed_kit"",""wood_shack_kit"",""workbench_kit"",""stick_fence_kit"",
				""sandbag_nest_kit"",""sun_shade_kit"",""rusty_gate_kit"",""outhouse_kit"",
				""storage_shed_kit"",""light_pole_kit"",""deer_stand_kit"",""metal_panel_kit"",
				""ItemPole"",""ItemBurlap"",""ItemCanvas"",""ItemCorrugated"",""PartWoodLumber"",
				""PartWoodPlywood"",""ItemSandbagLarge"",""ItemTentDomed2"",""ItemVault"",
				""ItemLockbox"",""ItemWoodFloor"",""ItemWoodFloorHalf"",""ItemWoodFloorQuarter"",
				""ItemWoodStairs"",""ItemWoodStairsSupport"",""ItemWoodLadder"",""ItemWoodWall"",
				""ItemWoodWallThird"",""ItemWoodWallDoor"",""ItemWoodWallWithDoor"",""ItemWoodWallWithDoorLocked"",
				""ItemWoodWallWindow"",""ItemWoodWallLg"",""ItemWoodWallGarageDoor"",""ItemWoodWallGarageDoorLocked"",
				""ItemWoodWallDoorLg"",""ItemWoodWallWithDoorLg"",""ItemWoodWallWithDoorLgLocked"",
				""ItemWoodWallWindowLg"",""PartEngine"",""PartWoodPile"",""PartPlankPack"",""CinderBlocks"",
				""MortarBucket"",""PartPlywoodPack"",""PartWoodLumber"",""PartVRotor"",
				""PartGlass"",""ItemSandbag"",""ItemSandbagExLarge"",""ItemTankTrap"",""cinder_wall_kit"",
				""TrapBear"",""ItemWire"",""ItemZombieParts"",""ItemComboLock"",""ItemOilBarrel"",""ItemFuelBarrel"",
				""cinder_garage_kit"",""30m_plot_kit"",""desert_large_net_kit"",""forest_large_net_kit"",
				""desert_net_kit"",""forest_net_kit"",""fuel_pump_kit"",""m240_nest_kit"",""park_bench_kit"",
				""ItemGenerator"",""ItemFuelPump"",""ItemLightBulb"",""ItemGoldBar"",""ItemGoldBar10oz"",
				""ItemSilverBar"",""ItemSilverBar10oz"",""ItemBronzeBar"",""ItemTentDomed"",""ItemTent"",
				""ItemAluminumBar"",""ItemAluminumBar10oz"",""ItemTinBar"",""ItemTinBar10oz"",""ItemBriefcase10oz"",
				""ItemBriefcase100oz"",""PartGeneric"",""Skin_Rocket_DZ"",""Skin_RU_Policeman_DZ"",""Skin_Pilot_EP1_DZ"",
				""Skin_GUE_Commander_DZ"",""Skin_Functionary1_EP1_DZ"",""Skin_Priest_DZ"",""Skin_Rocker1_DZ"",""Skin_Rocker2_DZ"",""Skin_Rocker3_DZ"",
				""Skin_Rocker4_DZ"",""Skin_Bandit1_DZ"",""Skin_Bandit2_DZ"",""Skin_GUE_Soldier_MG_DZ"",""Skin_GUE_Soldier_Sniper_DZ"",
				""Skin_GUE_Soldier_Crew_DZ"",""Skin_GUE_Soldier_CO_DZ"",""Skin_GUE_Soldier_2_DZ"",""Skin_BanditW1_DZ"",""Skin_BanditW2_DZ"",
				""Skin_SurvivorW3_DZ"",""Skin_SurvivorW2_DZ"",""Skin_SurvivorWpink_DZ"",""Skin_SurvivorWsequisha_DZ"",""Skin_SurvivorWsequishaD_DZ"",
				""Skin_SurvivorWcombat_DZ"",""Skin_SurvivorWdesert_DZ"",""Skin_SurvivorWurban_DZ"",""Skin_TK_INS_Warlord_EP1_DZ"",
				""Skin_TK_INS_Soldier_EP1_DZ"",""Skin_CZ_Special_Forces_GL_DES_EP1_DZ"",""Skin_Drake_Light_DZ"",""Skin_Soldier_Bodyguard_AA12_PMC_DZ"",
				""Skin_FR_OHara_DZ"",""Skin_FR_Rodriguez_DZ"",""Skin_CZ_Soldier_Sniper_EP1_DZ"",""Skin_Graves_Light_DZ"",""Skin_Soldier_Sniper_PMC_DZ"",
				""Skin_Soldier_TL_PMC_DZ"",""ItemTentOld"",""ItemTentDomed"",""ItemTentDomed2"",""Quiver"",""ItemSodaMtngreen"",
				""ItemSodaR4z0r"",""ItemSodaRbull"",""ItemSodaOrangeSherbet"",""ItemSodaClays"",""ItemSodaSmasht"",""ItemSodaDrwaste"",
				""ItemSodaDrwasteEmpty"",""ItemSodaLemonade"",""ItemSodaLvg"",""ItemSodaMzly"",""ItemSodaRabbit"",
				""ItemTrout"",""ItemSeaBass"",""ItemTuna"",""ItemTroutCooked"",""ItemSeaBassCooked"",""ItemTunaCooked"",
				""FoodBioMeat"",""FoodmeatRaw"",""FoodmuttonRaw"",""FoodchickenRaw"",""FoodrabbitRaw"",""FoodbaconRaw"",""FoodbeefRaw"",
				""FoodmeatCooked"",""FoodmuttonCooked"",""FoodchickenCooked"",""FoodbaconCooked"",""FoodrabbitCooked"",""FoodbeefCooked"",
				""AngelCookies"",""FoodMRE"",""FoodPistachio"",""FoodNutmix"",""FoodCanGriff"",""FoodCanBadguy"",""FoodCanBoneboy"",
				""FoodCanCorn"",""FoodCanCurgon"",""FoodCanDemon"",""FoodCanFraggleos"",""FoodCanHerpy"",""FoodCanOrlok"",""FoodCanPowell"",
				""FoodCanTylers"",""FoodCanUnlabeled"",""FoodPumpkin"",""FoodSunFlowerSeed"",""ItemWaterbottleBoiled"",""ItemKiloHemp"",
				""PartGlass"",""Skin_Sniper1_DZ"",""Skin_Haris_Press_EP1_DZ"",""Skin_Ins_Soldier_GL_DZ"",""cinder_door_kit""
			];
			{_admincrate_BOX addWeaponCargoGlobal [_x,_countW]} forEach [""ItemKeyKit"",""ItemToolbox"",""ItemEtool""];
			_admincrate_BOX addBackpackCargoGlobal [""DZ_LargeGunbag_EP1"",1];
		};
		if (_commandopt == 13) exitWith {
			_loca 	= (_array select 2);
			_countW = (_array select 3);
			_countM = (_array select 4);
			_delTim = (_array select 5);
			_dir 	= _loca select 0;
			_pos 	= _loca select 1;
			
			_admincrate_BOX = createVehicle [""USBasicAmmunitionBox"",_pos,[],0,""CAN_COLLIDE""];
			[_admincrate_BOX,_pos] call AH_fnc_setPos;
			_admincrate_BOX setDir _dir;
			
			clearMagazineCargoGlobal _admincrate_BOX;
			clearWeaponCargoGlobal _admincrate_BOX;
			
			[_delTim,_pos] spawn {
				_delTime = _this select 0;
				_boxPos = _this select 1;
				if !(_delTime == 13337) then {
					uiSleep _delTime;
					_boxs = nearestObjects [_boxPos,[""USBasicAmmunitionBox""],15];
					{deleteVehicle _x} forEach _boxs;
					_msg = 'Admin box has been deleted!';
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				} else {
					_msg = format ['Admin box spawned @ %1(%2) with no timer!!',mapGridPosition _boxPos,_boxPos];
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				};
			};
			
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM]} forEach
			[
				""Skin_Rocket_DZ"",""Skin_RU_Policeman_DZ"",
				""Skin_GUE_Commander_DZ"",""Skin_Functionary1_EP1_DZ"",""Skin_Priest_DZ"",""Skin_Rocker1_DZ"",""Skin_Rocker2_DZ"",""Skin_Rocker3_DZ"",
				""Skin_Rocker4_DZ"",""Skin_Bandit1_DZ"",""Skin_Bandit2_DZ"",""Skin_GUE_Soldier_MG_DZ"",""Skin_GUE_Soldier_Sniper_DZ"",
				""Skin_GUE_Soldier_Crew_DZ"",""Skin_GUE_Soldier_CO_DZ"",""Skin_GUE_Soldier_2_DZ"",""Skin_BanditW1_DZ"",""Skin_BanditW2_DZ"",
				""Skin_SurvivorW3_DZ"",""Skin_SurvivorW2_DZ"",""Skin_SurvivorWpink_DZ"",""Skin_SurvivorWsequisha_DZ"",""Skin_SurvivorWsequishaD_DZ"",
				""Skin_SurvivorWcombat_DZ"",""Skin_SurvivorWdesert_DZ"",""Skin_SurvivorWurban_DZ"",""Skin_TK_INS_Warlord_EP1_DZ"",
				""Skin_TK_INS_Soldier_EP1_DZ"",""Skin_CZ_Special_Forces_GL_DES_EP1_DZ"",""Skin_Drake_Light_DZ"",""Skin_Soldier_Bodyguard_AA12_PMC_DZ"",
				""Skin_FR_OHara_DZ"",""Skin_FR_Rodriguez_DZ"",""Skin_CZ_Soldier_Sniper_EP1_DZ"",""Skin_Graves_Light_DZ"",""Skin_Soldier_Sniper_PMC_DZ"",
				""Skin_Soldier_TL_PMC_DZ"",""Skin_Sniper1_DZ"",""Skin_Haris_Press_EP1_DZ"",""Skin_Pilot_EP1_DZ"",""Skin_Ins_Soldier_GL_DZ""
			];
			{_admincrate_BOX addWeaponCargoGlobal [_x,_countW]} forEach [""ItemToolbox"",""ItemEtool""];
			_admincrate_BOX addBackpackCargoGlobal [""DZ_LargeGunbag_EP1"",1];
		};
		if (_commandopt == 14) exitWith {
			_loca 	= (_array select 2);
			_countW = (_array select 3);
			_countM = (_array select 4);
			_delTim = (_array select 5);
			_dir 	= _loca select 0;
			_pos 	= _loca select 1;
			
			_admincrate_BOX = createVehicle [""USBasicAmmunitionBox"",_pos,[],0,""CAN_COLLIDE""];
			[_admincrate_BOX,_pos] call AH_fnc_setPos;
			_admincrate_BOX setDir _dir;
			
			clearMagazineCargoGlobal _admincrate_BOX;
			clearWeaponCargoGlobal _admincrate_BOX;
			
			[_delTim,_pos] spawn {
				_delTime = _this select 0;
				_boxPos = _this select 1;
				if !(_delTime == 13337) then {
					uiSleep _delTime;
					_boxs = nearestObjects [_boxPos,[""USBasicAmmunitionBox""],15];
					{deleteVehicle _x} forEach _boxs;
					_msg = 'Admin box has been deleted!';
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				} else {
					_msg = format ['Admin box spawned @ %1(%2) with no timer!!',mapGridPosition _boxPos,_boxPos];
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				};
			};
			
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM]} forEach
			[
				""ItemSodaMtngreen"",""ItemSodaR4z0r"",""ItemSodaRbull"",""ItemSodaOrangeSherbet"",""ItemSodaClays"",
				""ItemSodaSmasht"",""ItemSodaDrwaste"",""ItemSodaDrwasteEmpty"",""ItemSodaLemonade"",""ItemSodaLvg"",
				""ItemSodaMzly"",""ItemSodaRabbit"",""ItemTrout"",""ItemSeaBass"",""ItemTuna"",""ItemTroutCooked"",
				""ItemSeaBassCooked"",""ItemTunaCooked"",""FoodBioMeat"",""FoodmeatRaw"",""FoodmuttonRaw"",""FoodchickenRaw"",
				""FoodrabbitRaw"",""FoodbaconRaw"",""FoodbeefRaw"",""FoodmeatCooked"",""FoodmuttonCooked"",
				""FoodchickenCooked"",""FoodbaconCooked"",""FoodrabbitCooked"",""FoodbeefCooked"",
				""AngelCookies"",""FoodMRE"",""FoodPistachio"",""FoodNutmix"",""FoodCanGriff"",""FoodCanBadguy"",""FoodCanBoneboy"",
				""FoodCanCorn"",""FoodCanCurgon"",""FoodCanDemon"",""FoodCanFraggleos"",""FoodCanHerpy"",""FoodCanOrlok"",""FoodCanPowell"",
				""FoodCanTylers"",""FoodCanUnlabeled"",""FoodPumpkin"",""FoodSunFlowerSeed"",""ItemWaterbottleBoiled"",""ItemKiloHemp""
			];
			{_admincrate_BOX addWeaponCargoGlobal [_x,_countW]} forEach [""ItemToolbox"",""ItemEtool""];
			_admincrate_BOX addBackpackCargoGlobal [""DZ_LargeGunbag_EP1"",1];
		};
		if (_commandopt == 15) exitWith {
			_loca 	= (_array select 2);
			_countW = (_array select 3);
			_countM = (_array select 4);
			_delTim = (_array select 5);
			_dir 	= _loca select 0;
			_pos 	= _loca select 1;
			
			_admincrate_BOX = createVehicle [""USBasicAmmunitionBox"",_pos,[],0,""CAN_COLLIDE""];
			[_admincrate_BOX,_pos] call AH_fnc_setPos;
			_admincrate_BOX setDir _dir;
			
			clearMagazineCargoGlobal _admincrate_BOX;
			clearWeaponCargoGlobal _admincrate_BOX;
			
			[_delTim,_pos] spawn {
				_delTime = _this select 0;
				_boxPos = _this select 1;
				if !(_delTime == 13337) then {
					uiSleep _delTime;
					_boxs = nearestObjects [_boxPos,[""USBasicAmmunitionBox""],15];
					{deleteVehicle _x} forEach _boxs;
					_msg = 'Admin box has been deleted!';
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				} else {
					_msg = format ['Admin box spawned @ %1(%2) with no timer!!',mapGridPosition _boxPos,_boxPos];
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				};
			};
			
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM]} forEach [
				""metal_floor_kit"",
				""wooden_shed_kit"",""wood_shack_kit"",""workbench_kit"",""stick_fence_kit"",
				""sandbag_nest_kit"",""sun_shade_kit"",""rusty_gate_kit"",""outhouse_kit"",
				""storage_shed_kit"",""light_pole_kit"",""deer_stand_kit"",""metal_panel_kit"",
				""ItemPole"",""ItemBurlap"",""ItemCanvas"",""ItemCorrugated"",""PartWoodLumber"",
				""PartWoodPlywood"",""ItemSandbagLarge"",""ItemTentDomed2"",""ItemVault"",
				""ItemLockbox"",""ItemWoodFloor"",""ItemWoodFloorHalf"",""ItemWoodFloorQuarter"",
				""ItemWoodStairs"",""ItemWoodStairsSupport"",""ItemWoodLadder"",""ItemWoodWall"",
				""ItemWoodWallThird"",""ItemWoodWallDoor"",""ItemWoodWallWithDoor"",""ItemWoodWallWithDoorLocked"",
				""ItemWoodWallWindow"",""ItemWoodWallLg"",""ItemWoodWallGarageDoor"",""ItemWoodWallGarageDoorLocked"",
				""ItemWoodWallDoorLg"",""ItemWoodWallWithDoorLg"",""ItemWoodWallWithDoorLgLocked"",
				""ItemWoodWallWindowLg"",""PartEngine"",""PartWoodPile"",""PartPlankPack"",""CinderBlocks"",
				""MortarBucket"",""PartPlywoodPack"",""PartVRotor"",
				""PartGlass"",""ItemSandbag"",""ItemSandbagExLarge"",""ItemTankTrap"",""cinder_wall_kit"",
				""ItemWire"",""ItemOilBarrel"",""ItemFuelBarrel"",
				""cinder_garage_kit"",""30m_plot_kit"",""desert_large_net_kit"",""forest_large_net_kit"",
				""desert_net_kit"",""forest_net_kit"",""fuel_pump_kit"",""park_bench_kit"",
				""ItemGenerator"",""ItemFuelPump"",""ItemLightBulb"",""PartGeneric"",""cinder_door_kit"",
				""ItemTentDomed"",""ItemTent""
			];
			{_admincrate_BOX addWeaponCargoGlobal [_x,_countW]} forEach [""ItemToolbox"",""ItemEtool""];
			_admincrate_BOX addBackpackCargoGlobal [""DZ_LargeGunbag_EP1"",1];
		};
		if (_commandopt == 10010) exitWith {
			_loca 	= (_array select 2);
			_countM = (_array select 3);
			_delTim = (_array select 4);
			_dir 	= _loca select 0;
			_pos 	= _loca select 1;
			
			_admincrate_BOX = createVehicle [""USBasicAmmunitionBox"",_pos,[],0,""CAN_COLLIDE""];
			[_admincrate_BOX,_pos] call AH_fnc_setPos;
			_admincrate_BOX setDir _dir;
			
			clearMagazineCargoGlobal _admincrate_BOX;
			clearWeaponCargoGlobal _admincrate_BOX;
			
			[_delTim,_pos] spawn {
				_delTime = _this select 0;
				_boxPos = _this select 1;
				if !(_delTime == 13337) then {
					uiSleep _delTime;
					_boxs = nearestObjects [_boxPos,[""USBasicAmmunitionBox""],15];
					{deleteVehicle _x} forEach _boxs;
					_msg = 'Admin box has been deleted!';
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				} else {
					_msg = format ['Admin box spawned @ %1(%2) with no timer!!',mapGridPosition _boxPos,_boxPos];
					"+_rnd+"_AdminAlert = ['"+_AH_CHAT+": '+str _msg+'',true];
					publicVariableServer """+_rnd+"_AdminAlert"";
				};
			};
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM*3]} forEach ['workbench_kit','30m_plot_kit','itemVault'];
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM*5]} forEach
			[
				'ItemGenerator','light_pole_kit','ItemWoodStairs','ItemWoodStairsSupport','ItemWoodLadder','outhouse_kit','desert_large_net_kit',
				'desert_net_kit','forest_large_net_kit','forest_net_kit','fuel_pump_kit','park_bench_kit','wood_shack_kit','storage_shed_kit',
				'wood_ramp_kit','ItemComboLock'
			];
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM*10]} forEach
			[
				'ItemWoodWall','ItemWoodWallWithDoor','ItemWoodWallGarageDoor','ItemWoodWallWindow','ItemWoodWallLg','ItemWoodWallWithDoorLg','ItemWoodWallWindowLg',
				'ItemWoodFloor','ItemWoodFloorHalf','ItemWoodFloorQuarter','ItemWoodFloor','cinder_wall_kit','cinder_door_kit','cinder_garage_kit','metal_panel_kit',
				'metal_floor_kit','stick_fence_kit','MortarBucket','ItemPole'
			];
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM*15]} forEach ['ItemTankTrap'];
			{_admincrate_BOX addMagazineCargoGlobal [_x,_countM*40]} forEach ['CinderBlocks'];
			{_admincrate_BOX addWeaponCargoGlobal [_x,_countM*2]} forEach ['ItemCrowbar','ItemToolbox','ItemEtool'];
			_admincrate_BOX addBackpackCargoGlobal [""DZ_LargeGunbag_EP1"",1];
		};
	};
	[] spawn {
		if (isNil 'weapons_genbox') then {
			weapons_genbox = [];
			_cfgweapons = configFile >> 'cfgWeapons';
			for '_i' from 0 to (count _cfgweapons)-1 do {
				_weapon = _cfgweapons select _i;
				if (isClass _weapon) then {
					_wpn_type = configName(_weapon);
					_isKey = ['ItemKey',_wpn_type] call fnc_inString;
					if !(_isKey) then {
						_isBad = _wpn_type in AHT_badItems;
						if !(_isBad) then {
							if (((getNumber (_weapon >> 'scope') == 0)||(getNumber (_weapon >> 'scope') == 2))&&(getText (_weapon >> 'picture') != '')) then {
								weapons_genbox = weapons_genbox + [_wpn_type];
							};
						};
					};
				};
			};
		};
		if (isNil 'magazines_genbox') then {
			magazines_genbox = [];
			_cfgMagazines = configFile >> 'cfgmagazines';
			for '_i' from 0 to (count _cfgMagazines)-1 do {
				_magazine = _cfgMagazines select _i;
				if (isClass _magazine) then {
					_mag_type = configName(_magazine);
					_isBad = _mag_type in AHT_badItems;
					if !(_isBad) then {
						if (((getNumber (_magazine >> 'scope') == 0)||(getNumber (_magazine >> 'scope') == 2))&&(getText (_magazine >> 'picture') != '')) then {
							magazines_genbox = magazines_genbox + [_mag_type];
						};
					};
				};
			};
		};
	};
	diag_log ('(GG-AntiHack): (2/2) Loaded admin tool event handlers!');
");
diag_log ("(GG-AntiHack): Admin tool compiled!");