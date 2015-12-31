diag_log ("(GG-AntiHack): Loading server-side AHCC_fnc...");
call compile ("
	'PVOZ_FL_handle' addPublicVariableEventHandler {
		_entry 	= _this select 1;
		_target = _entry select 0;
		_caller = _entry select 1;
		_action = _entry select 2;
		diag_log ('Friend list system: '+str(_this));
		if (_action == ""request"") then {
			diag_log ('(GG-AntiHack): '+name _caller+' send a friend request to '+name _target+'');
			PVOZ_FL_receive = [_target,_caller];
			(owner _target) publicVariableClient ""PVOZ_FL_receive"";
		};
		if (_action == ""acknowledge"") then {
			_answer = _entry select 3;
			if (_answer == ""accept"") then {
				diag_log ('(GG-AntiHack): '+name _target+' accepted '+name _caller+'''s friend request.');
				PVOZ_FL_receiveProc = [_target,_caller,_answer];
				(owner _caller) publicVariableClient 'PVOZ_FL_receiveProc';
				PVOZ_FL_receiveProc = [_target,_caller,'acceptt'];
				(owner _target) publicVariableClient 'PVOZ_FL_receiveProc';
			} else {
				diag_log ('(GG-AntiHack): '+name _target+' declined '+name _caller+'''s friend request.');
				PVOZ_FL_receiveProc = [_target,_caller,_answer];
				(owner _caller) publicVariableClient 'PVOZ_FL_receiveProc';
			};
		};
	};
	'"+_RND+"_PrivateMessage' addPublicVariableEventHandler {
		_arr 	= _this select 1;
		_player = _arr select 0;
		_target = _arr select 1;
		_msg 	= _arr select 2;
		_msg 	= toString _msg;
		if ((_msg == '')||(!isPlayer _player)||(isNull _player)||(name _player == 'Error: No unit')) exitWith {};
		
		'MiscLog' callExtension format ['%1 sent %2 a PM: %3',name _player,name _target,_msg];
		"+_RND+"_PrivateMessage = [name _player,name _target,_msg];
		(owner _target) publicVariableClient '"+_RND+"_PrivateMessage';
	};
	'"+_RND+"_eventPos' addPublicVariableEventHandler {
		_arr 	= _this select 1;
		if (count _arr > 0) then {
			_pos 	= _arr select 0;
			_type 	= _arr select 1;
			_lock 	= _arr select 2;
			_color 	= _arr select 3;
			
			if (!isNil 'event_spawnpoint') then {if (!isNull event_spawnpoint) then {deleteVehicle event_spawnpoint}};
			event_spawnpoint = createVehicle ['Sign_arrow_down_large_EP1',_pos,[],0,'CAN_COLLIDE'];
			[event_spawnpoint,_pos] call AH_fnc_setPos;
			
			event_1stplace = ['none',0];
			event_2ndplace = ['none',0];
			event_3rdplace = ['none',0];
		} else {
			[nil, nil, rspawn, [], {
				if !(isServer) then {
					if (intheevent) then {
						player allowDamage false;
						[] spawn "+_RND+"_eventHeal;
						_vehicle = (vehicle player);
						if ((_vehicle != player)&&((driver _vehicle == player)||(isNull driver _vehicle))) then {
							_vehicle setVelocity [0,0,0];
							deleteVehicle _vehicle;
						};
					};
				};
			}] call RE;
		};
	};
	'"+_RND+"_eventDeath' addPublicVariableEventHandler {
		_arr 	= _this select 1;
		_player = _arr select 0;
		_killer = _arr select 1;
		
		_parr = (toArray _killer);
		{_parr = _parr - [_x]} forEach [32,91,93,123,125,40,41,39,34,59,92,47,45,58,59,60,62,43,61,42,38,94,37,36,35,64,33,96,126,124,63,46,44];
		_pvar = toString _parr;
		call compile (""
			if (isNil '""+_pvar+""_score') then {""+_pvar+""_score=1} else {""+_pvar+""_score = ""+_pvar+""_score + 1};
			if (""+_pvar+""_score > event_1stplace select 1) then {
				if (event_2ndplace select 0 != ""+str _killer+"") then {event_2ndplace = event_1stplace};
				event_1stplace = [""+str _killer+"",""+_pvar+""_score];
			} else {
				if (""+_pvar+""_score > event_2ndplace select 1) then {
					if (event_3rdplace select 0 != _killer) then {event_3rdplace = event_2ndplace};
					event_2ndplace = [""+str _killer+"",""+_pvar+""_score];
				} else {
					if (""+_pvar+""_score > event_3rdplace select 1) then {
						event_3rdplace = [""+str _killer+"",""+_pvar+""_score];
					};
				};
			};
			_msg = format ['%1 was killed by %2 at the event! %2''s score: %3',_player,_killer,""+_pvar+""_score];
			[nil, nil, rspawn, [_msg], {systemChat ('"+_AH_CHAT+": '+(str (_this select 0))+'');}] call RE;
		"");
	};
	'"+_RND+"_StoreGear' addPublicVariableEventHandler {
		_arr 	= _this select 1;
		_player = _arr select 0;
		_pgear 	= _arr select 1;
		_ppos 	= _arr select 2;
		_action = _arr select 3;
		_cash 	= _arr select 4;
		_skin 	= _arr select 5;
		_humani = _arr select 6;
		_name 	= name _player;
		
		if ((!isPlayer _player)||(isNull _player)||(name _player == 'Error: No unit')) exitWith {};
		_pvar = getPlayerUID _player;
		if (_action == 'save') then {
			call compile (""
				if (isNil 'event_""+_pvar+""_gear') then {event_""+_pvar+""_gear = [[],false]};
				if !(event_""+_pvar+""_gear select 1) then {
					event_""+_pvar+""_gear = [[""+str _pgear+"",""+str _ppos+"",""+str _cash+"",""+str _skin+"",""+str _humani+""],true];
					diag_log ('(GG-AntiHack): ""+_name+""''s gear has been saved!');
					diag_log ('(GG-AntiHack): event_""+_pvar+""_gear: '+str event_""+_pvar+""_gear);
				} else {diag_log ('(GG-AntiHack): ""+_name+"" already has gear saved.')};
			"");
		} else {
			call compile (""
				if (isNil 'event_""+_pvar+""_gear') then {
					"+_RND+"_RedeemGear = [[],true];
					diag_log ('(GG-AntiHack): ""+_name+"" has no gear to redeem!');
				} else {
					"+_RND+"_RedeemGear = event_""+_pvar+""_gear;
					diag_log (if (event_""+_pvar+""_gear select 1) then [{('(GG-AntiHack): ""+_name+"" redeemed their gear.')},{('(GG-AntiHack): ""+_name+"" has already redeemed their gear!')}]);
				};
				(owner _player) publicVariableClient '"+_RND+"_RedeemGear';
				event_""+_pvar+""_gear set [1,false];
			"");
		};
	};
");
diag_log ("(GG-AntiHack): Loaded server-side AHCC_fnc!");
diag_log ("(GG-AntiHack): Loading client AHCC...");
_AH_CC = compile ("
	'PVOZ_FL_receive' addPublicVariableEventHandler {
		_entry 	= _this select 1;
		_target = _entry select 0;
		_caller = _entry select 1;
		[_target,_caller] spawn "+_RND+"_friend_reqHandler;
	};
	'PVOZ_FL_receiveProc' addPublicVariableEventHandler {
		_entry 	= _this select 1;
		_target = _entry select 0;
		_caller = _entry select 1;
		_answer = _entry select 2;
		[_target,_caller,_answer] spawn "+_RND+"_friend_procAnswer;
	};
	"+_RND+"_friend_procAnswer = {
		_target = _this select 0;
		_caller = _this select 1;
		_answer = _this select 2;
		if (_answer == ""acceptt"") exitWith {
			_friendList = profileNameSpace getVariable [""AH_friendlist"",[]];
			
			_friendList set [count _friendList,(("+_playerID+" _caller) call PIDP_check)];
			player setVariable ['AH_friendlist',_friendList,true];
			profileNamespace setVariable ['AH_friendlist',_friendList];
			saveProfileNamespace;
		};
		if (_answer == ""accept"") then {
			_msg = format ['%1 has accepted your friend request!',name _target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			_friendList = profileNameSpace getVariable [""AH_friendlist"",[]];
			
			_friendList set [count _friendList,(("+_playerID+" _target) call PIDP_check)];
			player setVariable ['AH_friendlist',_friendList,true];
			profileNamespace setVariable ['AH_friendlist',_friendList];
			saveProfileNamespace;
		} else {
			_msg = format ['%1 has denied your friend request.',name _target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
	};
	"+_RND+"_friend_reqHandler = {
		_target = _this select 0;
		_caller = _this select 1;
		if (player getVariable['combattimeout',0] >= time) exitWith {
			_msg = format ['Friend request from %1 blocked because you are in combat.',name _caller];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		AH_FL_accept = nil;
		_msg = 'Friend request received from '+str(name _caller);
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_msg call AH_fnc_dynTextMsg;
		AH_FL_menu = [
			['"+_AH_CHAT+"',true],
			['Accept request from '+name _caller+'?',[-1],'',-5,[['expression','']],'1','0'],
			['',	[-1],	'',-5,	[['expression',	'']],'1','0'],
			['Yes',[2],	'',-5,	[['expression',	'AH_FL_accept=true;']],'1','1'],
			['No',	[3],	'',-5,	[['expression',	'AH_FL_accept=false;']],'1','1'],
			['',	[-1],	'',-5,	[['expression','']],'1','0'],
			['Exit',[-1],	'',-3,	[['expression',	'AH_FL_accept=false;']],'1','1']
		];
		showCommandingMenu '#USER:AH_FL_menu';
		sleep 1;
		waitUntil {((!isNil 'AH_FL_accept')||(commandingMenu == ''))};
		if (isNil 'AH_FL_accept') then {AH_FL_accept=false};
		if !(AH_FL_accept) then {
			_msg = 'Friend request denied..';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			PVOZ_FL_handle = [_target,_caller,'acknowledge','deny'];
			publicVariableServer 'PVOZ_FL_handle';
		} else {
			_msg = 'Friend request accepted!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			PVOZ_FL_handle = [_target,_caller,'acknowledge','accept'];
			publicVariableServer 'PVOZ_FL_handle';
		};
	};
	"+_RND+"_onlinePlayers = {
		_allPlayers = playableUnits;
		_msg = '--- Players online ---';
		systemChat ('"+_AH_CHAT+": '+str _msg);
		_list = 0;
		_line = '';
		_max 	= ((count _allPlayers)-1);
		for '_i' from 0 to _max do {
			_entry = _allPlayers select _i;
			_name = name _entry;
			_list = _list + 1;
			if ((_list != 5)&&(_i != _max)) then {_line = _line + (_name+', ')};
			if ((_list == 5)||(_i == _max)) then {
				_line = _line + _name;
				_line call call_msg;
				_list = 0;
				_line = '';
			};
		};
		if (_line != '') then {_line call call_msg};
		_msg = 'There are are '+str (count _allPlayers)+' players in game.';
		systemChat ('"+_AH_CHAT+": '+str _msg);
		systemChat (' ');
	};
	"+_RND+"_onlineFriends = {
		_allPlayers = playableUnits;
		_msg = '--- Friend list ---';
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_onlinefrnd = [];
		_friends = (player getVariable ['AH_friendlist',[]]);
		{
			if ((("+_playerID+" _x) call PIDP_check) in _friends) then {
				_onlinefrnd = _onlinefrnd + [name _x];
			};
		} forEach _allPlayers;
		_list = 0;
		_line = '';
		_max 	= ((count _onlinefrnd)-1);
		for '_i' from 0 to _max do {
			_name = _onlinefrnd select _i;
			_list = _list + 1;
			if ((_list == 1)&&(_i != _max)) then {
				_line = _line + format['%1 ,',_name];
			};
			if ((_list == 2)||(_i == _max)) then {
				_line = _line + format['%1',_name];
				_line call call_msg;
				_list = 0;
				_line = '';
			};
		};
		if (_line != '') then {_line call call_msg};
		systemChat (' ');
	};
	gen_select = {
		enmen_nextPage = false;
		genmen_objRem = [];
		genmen_selObj = '';
		{genmen_objRem set [count genmen_objRem,_x]} forEach (_this select 1);
		
		genmen_generate = {
			_GG_GMGDFP = [['',true],['Select key:',[-1],'',-5,[['expression','']],'1','0']];
			for '_i' from (_this select 0) to (_this select 1) do {
				_arr = [format['%1',genmen_objRem select (_i)],[_i - (_this select 0) + 2],'',-5,[['expression',format['genmen_selObj = genmen_objRem select %1;',_i]]],'1','1'];
				_GG_GMGDFP set [_i+2,_arr];
			};
			if (count genmen_objRem >  (_this select 1)) then {
				_GG_GMGDFP set [(_this select 1)+2,['Next',[12],'',-5,[['expression','genmen_nextPage = true;']],'1','1']];
			} else {
				_GG_GMGDFP set [(_this select 1)+2,['',[-1],'',-5,[['expression','']],'1','0']];
			};
			_GG_GMGDFP set [(_this select 1)+3,['Exit',[13],'',-5,[['expression','genmen_selObj = ''genmen_exit'';']],'1','1']];
			showCommandingMenu '#USER:_GG_GMGDFP';
		};
		_j = 0;
		while {genmen_selObj == ''} do {
			[_j,(_j+10) min (count genmen_objRem)] call genmen_generate;
			_j = _j + 10;
			waitUntil {((genmen_selObj != '' )||(genmen_nextPage))};	
			genmen_nextPage = false;
		};
		if (genmen_selObj != 'genmen_exit') exitWith {_exit = true};
		call compile (_this select 0+' = '+str(genmen_selObj));
		_msg = ('Selected '+genmen_selObj);
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_msg call AH_fnc_dynTextMsg;
	};
	"+_RND+"_addFriend = {
		if (player getVariable['combattimeout',0] >= time) exitWith {
			_msg = format ['You can not send requests while in combat.'];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		add_target = '';
		['Add friend','Partial name:','Add','add_target'] call AH_fnc_displayCreate;
		if (add_target == '') exitWith {
			_msg = 'Cancelled addfriend!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_allPlayers = playableUnits;
		_isCF = false;
		_mtch = [];
		SEL_TARGET = objNull;
		{
			_isMatch = [toLower(add_target),toLower(name _x)] call fnc_inString;
			if (_isMatch) then {
				SEL_TARGET = _x;
				_mtch = _mtch + [name _x];
				_friendList = profileNameSpace getVariable [""AH_friendlist"",[]];
				if ((("+_playerID+" _x) call PIDP_check) in _friendList) exitWith {_isCF = true};
			};
		} forEach _allPlayers;
		if (isNull SEL_TARGET) exitWith {
			_msg = format ['Could not find %1.',add_target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		if (_isCF) exitWith {
			_msg = format ['%1 is already your friend.',name SEL_TARGET];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		if (count _mtch == 0) exitWith {
			_msg = format ['%1 did not match any online players.',add_target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_exit = false;
		if (count _mtch > 1) then {
			_msg = format ['%1 matched %2 players! Please select which player you want to add.',add_target,count _mtch];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			['add_target',_mtch] call gen_select;
		};
		if (_exit) exitWith {
			_msg = 'You did not select a player!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_msg = format ['Sending friend request to %1.',name SEL_TARGET];
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_msg call AH_fnc_dynTextMsg;
		PVOZ_FL_handle = [SEL_TARGET,player,'request'];
		publicVariableServer 'PVOZ_FL_handle';
	};
	"+_RND+"_delFriend = {
		del_target = '';
		['Delete friend','Partial Name:','Delete','del_target'] call AH_fnc_displayCreate;
		if (del_target == '') exitWith {
			_msg = 'Delete cancelled.';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_allPlayers = playableUnits;
		_foundFriend = false;
		SEL_TARGET = objNull;
		{
			_isMatch = [toLower(del_target),toLower(name _x)] call fnc_inString;
			if (_isMatch) then {
				SEL_TARGET = _x;
				_friendList = profileNameSpace getVariable [""AH_friendlist"",[]];
				if ((("+_playerID+" _x) call PIDP_check) in _friendList) exitWith {_foundFriend = true};
			};
		} forEach _allPlayers;
		if (isNull SEL_TARGET) exitWith {
			_msg = format ['Could not find %1.',del_target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		if (_foundFriend) then {
			_friendList = profileNameSpace getVariable [""AH_friendlist"",[]];
			
			_friendList = _friendList - [(("+_playerID+" sel_target) call PIDP_check)];
			player setVariable ['AH_friendlist',_friendList,true];
			profileNamespace setVariable ['AH_friendlist',_friendList];
			saveProfileNamespace;
			
			_targetList = SEL_TARGET getvariable [""AH_friendlist"",[]];
			
			_targetList = _targetList - [(("+_playerID+" player) call PIDP_check)];
			SEL_TARGET setVariable ['AH_friendlist',_targetList,true];
			
			_msg = format ['%1 has been removed from your friendlist.',name SEL_TARGET];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		} else {
			_msg = format ['Could not find %1!',del_target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
	};
	"+_RND+"_pmRE = {
		if (isNil 'last_pm_target') exitWith {
			_msg = 'Could not find last PM target.';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_allPlayers = playableUnits;
		_mtch = [];
		SEL_TARGET = objNull;
		{
			_isMatch = [toLower(last_pm_target),toLower(name _x)] call fnc_inString;
			if (_isMatch) then {
				SEL_TARGET = _x;
				_mtch = _mtch + [name _x];
			};
		} forEach _allPlayers;
		if (count _mtch == 0) exitWith {
			_msg = format ['%1 did not match any online players.',last_pm_target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_exit = false;
		if (count _mtch > 1) then {
			_msg = format ['%1 matched %2 players! Please select which player you want to PM.',last_pm_target,count _mtch];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			['last_pm_target',_mtch] call gen_select;
		};
		if (_exit) exitWith {
			_msg = 'You did not select a player!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		pm_msg = '';
		['Private message '+name SEL_TARGET,'Message:','Send','pm_msg'] call AH_fnc_displayCreate;
		if (pm_msg == '') exitWith {
			_msg = 'Cancelled reply!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_msg = format ['PM to %1: %2',name SEL_TARGET,pm_msg];
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_msg call AH_fnc_dynTextMsg;
		
		"+_RND+"_PrivateMessage = [player,SEL_TARGET,toArray pm_msg];
		publicVariableServer '"+_RND+"_PrivateMessage';
	};
	"+_RND+"_sendPM = {
		pm_target = '';
		['Select player','Partial name:','PM','pm_target'] call AH_fnc_displayCreate;
		if (pm_target == '') exitWith {
			_msg = 'PM cancelled.';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_allPlayers = playableUnits;
		last_pm_target = pm_target;
		_mtch = [];
		SEL_TARGET = objNull;
		{
			_isMatch = [toLower(last_pm_target),toLower(name _x)] call fnc_inString;
			if (_isMatch) then {
				SEL_TARGET = _x;
				_mtch = _mtch + [name _x];
			};
		} forEach _allPlayers;
		if (count _mtch == 0) exitWith {
			_msg = format ['%1 did not match any online players.',last_pm_target];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_exit = false;
		if (count _mtch > 1) exitWith {
			_msg = format ['%1 matched %2 players! Please select which player you want to PM.',pm_target,count _mtch];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			['pm_target',_mtch] call gen_select;
		};
		if (_exit) exitWith {
			_msg = 'You did not select a player!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		pm_msg = '';
		['Private message '+name SEL_TARGET,'Message:','Send','pm_msg'] call AH_fnc_displayCreate;
		if (pm_msg == '') exitWith {
			_msg = 'Cancelled PM!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		_msg = format ['PM to %1: %2',name SEL_TARGET,pm_msg];
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_msg call AH_fnc_dynTextMsg;
		
		_msg = 'Type !re to reply to '+name SEL_TARGET;
		_msg call AH_fnc_dynTextMsg;
		
		"+_RND+"_PrivateMessage = [player,SEL_TARGET,toArray pm_msg];
		publicVariableServer '"+_RND+"_PrivateMessage';
	};
	"+_RND+"_fespToggle = {
		_isFESP = profileNameSpace getVariable ['AH_FESP',true];
		if !(_isFESP) then {
			_msg = format ['Friend GPS tags have been enabled.'];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			profileNamespace setVariable ['AH_FESP',true];
			saveProfileNamespace;
		} else {
			_msg = format ['Friend GPS tags have been disabled.'];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			profileNamespace setVariable ['AH_FESP',false];
			saveProfileNamespace;
			
			_allPlayers = playableUnits;
			_AHT_SGIV = false;
			setGroupIconsVisible [_AHT_SGIV,_AHT_SGIV];
			{_friend = (group _x);clearGroupIcons _friend} forEach _allPlayers;
		};
	};
	'"+_RND+"_PrivateMessage' addPublicVariableEventHandler {
		_arr 	= _this select 1;
		_player = _arr select 0;
		_target = _arr select 1;
		_msg 	= _arr select 2;
		
		last_pm_target = _player;
		_msg = format ['PM from %1: %2',_player,_msg];
		systemChat ('"+_AH_CHAT+": ' + str _msg);
		_msg call AH_fnc_dynTextMsg;
		
		_msg = 'Type !re to send another message to '+last_pm_target;
		_msg call AH_fnc_dynTextMsg;
	};
	'"+_RND+"_RedeemGear' addPublicVariableEventHandler {
		_this spawn {
			_array	= (_this select 1) select 0;
			_redeem = (_this select 1) select 1;
			
			diag_log ('Redeeming '+str _array);
			
			if (!_redeem) exitWith {
				6767 cutText ['','BLACK IN'];
				_msg = format ['Gear already redeemed.'];
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
				3 fadeSound 1;
			};
			if (count _array == 0) then {
				6767 cutText ['','BLACK IN'];
				_msg = format ['Could not find stored gear or position.'];
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
				3 fadeSound 1;
			} else {
				_oldGear 	= _array select 0;
				_oldCashmo 	= abs(_array select 2);
				_oldSkin 	= _array select 3;
				_oldHumani 	= _array select 4;
				
				6767 cutText ['Returning you to your old position, please wait...','BLACK',0.25];
				player allowDamage false;
				if (typeOf player == _oldSkin) then {
					[dayz_playerUID,dayz_characterID,'Survivor1_DZ'] spawn player_humanityMorph;
					waitUntil {(typeOf player == 'Survivor1_DZ')};
					event_leavebox attachTo [player,[0,0,0]];
					player allowDamage false;
				};
				
				player setVariable ['AdminTempTele"+_RND+"',true];
				(vehicle player) setVelocity [0,0,1];
				(vehicle player) setVectorUp [0,0,1];
				[(vehicle player),(_array select 1)] call AH_fnc_setPos;
				[] spawn {
					uiSleep 1;
					player setVariable ['AdminTempTele"+_RND+"',false];
				};
				
				removeAllWeapons player;
				removeAllItems player;
				removeBackpack player;
				
				if ((isNil '_oldSkin')||(_oldSkin == 'Survivor1_DZ')||(_oldSkin == '')) then {_oldSkin = 'Survivor2_DZ'};
				[dayz_playerUID,dayz_characterID,_oldSkin] spawn player_humanityMorph;
				waitUntil {(typeOf player == _oldSkin)};
				event_leavebox attachTo [player,[0,0,0]];
				player allowDamage false;
				
				_inventory 	= _oldGear select 0;
				_backpackm 	= _oldGear select 2;
				_backpackmq = _oldGear select 3;
				_backpackw 	= _oldGear select 4;
				_backpackwq = _oldGear select 5;
				
				if (count (_inventory select 0) > 0) then {{player addMagazine _x} forEach (_inventory select 0)} else {player addMagazine 'ItemBloodbag'};
				if (count (_inventory select 1) > 0) then {{_dcwep = _x;player addWeapon _dcwep;} forEach (_inventory select 1)};
				
				player addBackpack (_oldGear select 1);
				waitUntil {(!isNull(unitBackPack player))};
				if (count _backpackm > 0) then {_num = 0;{(unitBackpack player) addMagazineCargoGlobal [_x,_backpackmq select _num];_num = _num + 1;} forEach _backpackm};
				if (count _backpackw > 0) then {_num = 0;{(unitBackpack player) addWeaponCargoGlobal [_x,_backpackwq select _num];_num = _num + 1;} forEach _backpackw};
				
				[] spawn "+_RND+"_eventHeal;
				{if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'type')) in [1,2,3]) then {player selectWeapon _x}} forEach (weapons player);
				reload player;
				deathHandled = false;
				player allowDamage true;
				6767 cutText ['','BLACK IN'];
				uiSleep 1;
				
				[] spawn "+_RND+"_eventHeal;
				[objNull,player,rSwitchMove,''] call RE;
				3 fadeSound 1;
				player setVariable ['Humanity',_oldHumani,true];
				player setVariable ['GGCoins',_oldCashmo,true];
				PVDZE_plr_Save = [player,(magazines player),true,true];
				publicVariableServer 'PVDZE_plr_Save';
				
				uiSleep 5;
				if (!isNil 'event_leavebox') then {if !(isNull event_leavebox) then {deleteVehicle event_leavebox}};
			};
		};
	};
	if (isNil 'dayz_playername') then {dayz_playername = name player};
	"+_RND+"_eventHeal = compile '''colorCorrections''ppEffectAdjust[1,1,0,[1,1,1,0.0],[1,1,1,1 min (4*r_player_blood/3/r_player_bloodTotal)],[1,1,1,0.0]];''colorCorrections''ppEffectCommit 0;''colorCorrections''ppEffectEnable true;''dynamicBlur''ppEffectAdjust[0];''dynamicBlur''ppEffectCommit 0;''dynamicBlur''ppEffectEnable false;((uiNamespace getVariable ''DAYZ_GUI_display'') displayCtrl  1303) ctrlShow false;((uiNamespace getVariable ''DAYZ_GUI_display'') displayCtrl 1203) ctrlShow false;1 cutRsc [''default'',''PLAIN'',0];4 cutRsc [''default'',''PLAIN'',0];dayz_hunger = 0;dayz_sourceBleeding = objNull;dayz_temperatur = 40;dayz_thirst = 0;disableSerialization;disableUserInput false;player setHit[''body'',0];player setHit[''hands'',0];player setHit[''head'',0];player setHit[''legs'',0];player setVariable [''combattimeout'', 0, true];player setVariable [''hit_arms'',0,true];player setVariable [''hit_hands'',0,true];player setVariable [''hit_legs'',0,true];player setVariable [''medForceUpdate'',true];player setVariable [''messing'',[dayz_hunger,dayz_thirst],true];player setVariable [''NORRN_unconscious'', false, true];player setVariable [''startcombattimer'', 0, true];player setVariable [''unconsciousTime'', 0, true];player setVariable [''USEC_BloodQty'',r_player_blood,true];player setVariable [''USEC_injured'',false,true];player setVariable [''USEC_inPain'',false,true];player setVariable [''USEC_isCardiac'',false,true];player setVariable [''USEC_lowBlood'',false,true];r_action = false;r_action_unload = false;r_doLoop = false;r_drag_sqf = false;r_fracture_arms = false;r_fracture_legs = false;r_handlercount = 0;r_interrupt = false;r_player_blood = 12000;r_player_cardiac = false;r_player_dead = false;r_player_handler = false;r_player_handler1 = false;r_player_infected = false;r_player_injured = false;r_player_inpain = false;r_player_loaded = false;r_player_lowblood = false;r_player_timeout = 0;r_player_unconscious = false;r_self = false;[0,0] call fnc_usec_pitchWhine;';
	if (isNil 'intheevent') then {intheevent = false};
	"+_RND+"_eventLeave = {
		if (vehicle player != player) exitWith {
			_msg = 'You can not teleport while in a vehicle!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		if (intheevent) then {
			deathHandled = true;
			if (!isNil 'event_protobox') then {if !(isNull event_protobox) then {deleteVehicle event_protobox}};
			event_leavebox = createVehicle ['DebugBoxPlayer_DZ',(player call AH_fnc_getPos), [], 0, 'CAN_COLLIDE'];
			event_leavebox attachTo [player,[0,0,0]];
			1 fadeSound 0;
			[] spawn "+_RND+"_eventHeal;
			flag_action_added = nil;
			diag_log ('AH_EVENT: Leaving the event...');
			
			6767 cutText ['Returning you to your old position, please wait...','BLACK OUT',0.25];
			player setPosATL [-18697,25815,0];
			diag_log ('AH_EVENT: Event init reverted!');
			
			if (preProcessFile 'GG\GG_PD.sqf' != '') then {
				player_death = compile preprocessFileLineNumbers 'GG\GG_PD.sqf';
			} else {
				player_death = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf';
			};
			dayz_slowCheck 				= [] spawn player_spawn_2;
			player_spawnCheck 			= event_oldSC;
			fnc_usec_damageunconscious 	= event_oldDU;
			fnc_usec_unconscious 		= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
			player_zombieCheck 			= compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
		};
		intheevent = false;
		colorchosen = nil;
		player setVariable ['intheevent',false,true];
		
		"+_RND+"_colorme = [player,'','leave'];
		publicVariableServer '"+_RND+"_colorme';
		"+_RND+"_StoreGear = [player,[],[0,0,0],'leave',0,'',0];
		publicVariableServer '"+_RND+"_StoreGear';
	};
	eventJoinInit = {
		player_death = {
			if (deathHandled) exitWith {};
			diag_log ('AH_EVENT: Died at event! Passed array: '+str _this);
			6767 cutText ['You are dead.','BLACK OUT',0.25];
			deathHandled = true;
			1 fadeSound 0;
			old_body = player;
			_lsht = player getVariable ['event_lastshot','none'];
			_killer = 'none';
			if (_lsht != 'none') then {_killer = _lsht} else {
				if (count _this != 0) then {
					_unit0 = (_this select 0);
					_killer = if ((_unit0 == player)||(isNull _unit0)) then [{'none'},{name _unit0}];
				};
			};
			diag_log ('AH_EVENT: Last shot: '+str _lsht+' Killer: '+str _killer);
			if (alive old_body) then {old_body setDamage 1};
			if (_killer != 'none') then {
				"+_RND+"_eventDeath = [dayz_playername,_killer];
				publicVariableServer '"+_RND+"_eventDeath';
			};
			
			_group = createGroup west;
			[old_body] join _group;
			
			waitUntil {((player != old_body)||(isNull old_body))};
			old_body spawn {
				uiSleep 30;
				deleteVehicle _this;
			};
			old_body = nil;
			[] spawn "+_RND+"_eventHeal;
			player setVariable ['intheevent',true,true];
			if ((str("+_RND+"_eventPos) == '[]')||("+_RND+"_eventPos select 2 in ['LASTMAN'])) then "+_RND+"_eventLeave else "+_RND+"_eventJoin;
		};
		player removeAllEventHandlers 'Respawn';
		player removeAllEventHandlers 'Hit';
		player addEventHandler [""Hit"", {if ((isPlayer (_this select 1))&&(alive (_this select 0))&&((_this select 0) != (_this select 1))) then {(_this select 0) setVariable ['event_lastshot',name (_this select 1)]};}];
		if (isNil 'event_oldSC') then {event_oldSC = player_spawnCheck};
		if (isNil 'event_oldDU') then {event_oldDU = fnc_usec_damageunconscious};
		fnc_usec_damageunconscious 	= {};
		fnc_usec_unconscious 		= {};
		player_zombieCheck 			= {};
		player_spawnCheck 			= {};
	};
	"+_RND+"_eventGo = {
		if (isNil '"+_RND+"_eventPos') then {"+_RND+"_eventPos = []};
		if (str("+_RND+"_eventPos) == '[]') then {
			_msg = format ['There is currently no admin event position set!'];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
		} else {
			if (inSafeZone) exitWith {
				_msg = 'You can not teleport while in a safezone!';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			if ((player getVariable['combattimeout',0] >= time)&&(isNil 'admin_movedevent')) exitWith {
				_msg = 'You can not teleport while in combat!';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			if (vehicle player != player) exitWith {
				_msg = 'You can not teleport while in a vehicle!';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			if ((player distance ("+_RND+"_eventPos select 0) < 100)&&(isNil 'admin_movedevent')) exitWith {
				_msg = 'You are already at the event!';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			if (("+_RND+"_eventPos select 2 in ['LOCKED','LASTMAN'])&&(!intheevent)) exitWith {
				_msg = 'You ran out of time to join the event!';
				systemChat ('"+_AH_CHAT+": ' + str _msg);
				_msg call AH_fnc_dynTextMsg;
			};
			PVDZE_plr_Save = [player,(magazines player),true,true];publicVariableServer 'PVDZE_plr_Save';
			{if !(isNil _x) then {call compile (""terminate ""+_x)}} forEach [""dayz_slowCheck""];
			
			diag_log ('AH_EVENT: Joining the event!');
			intheevent = true;
			player setVariable ['intheevent',true,true];
			
			_msg = format ['Gear saved! Type !leaveevent at any time to return to your old position with your gear!'];
			systemChat ('"+_AH_CHAT+": ' + str _msg);
			_msg call AH_fnc_dynTextMsg;
			
			_inventory 	= [(magazines player),(weapons player)];
			_backpack 	= (unitBackpack player);
			_backpackm 	= (getMagazineCargo _backpack) select 0;
			_backpackmq = (getMagazineCargo _backpack) select 1;
			_backpackw 	= (getWeaponCargo _backpack) select 0;
			_backpackwq = (getWeaponCargo _backpack) select 1;
			if (typeOf _backpack == '') then {_backpack = 'US_Assault_Pack_EP1'} else {_backpack = typeOf _backpack};

			_gear = [_inventory,_backpack,_backpackm,_backpackmq,_backpackw,_backpackwq];
			
			_humanity = player getVariable ['Humanity',0];
			_cashmoney = player getVariable ['GGCoins',0];
			_pos = (vehicle player) call AH_fnc_getPos;
			"+_RND+"_StoreGear = [player,_gear,_pos,'save',_cashmoney,typeOf player,_humanity];
			publicVariableServer '"+_RND+"_StoreGear';
			player setVariable ['GGCoins',0];
			
			_msg = 'Listen to your admins during this event, otherwise you will receive a ban!';
			systemChat ('"+_AH_CHAT+": ' + str _msg);systemChat ('"+_AH_CHAT+": ' + str _msg);
			systemChat ('"+_AH_CHAT+": ' + str _msg);systemChat ('"+_AH_CHAT+": ' + str _msg);
			
			call eventJoinInit;
			"+_RND+"_eventJoin = {
				call eventJoinInit;
				6767 cutText ['Teleporting you to the admin event position...','BLACK OUT',0.25];
				1 fadeSound 0;
				event_player = player;
				removeAllWeapons player;
				removeAllItems player;
				removeBackpack player;
				
				if ("+_RND+"_eventPos select 1 == 'HATCHET') then {
					diag_log ('AH_EVENT: Hatchet event!');
					_p4rt_0ut = 'MeleeHatchet_DZE';
					player addWeapon _p4rt_0ut;
					player selectWeapon _p4rt_0ut;
					player addMagazine 'Hatchet_Swing';
					reload player;
					{player addMagazine _x} forEach ['ItemBloodbag','ItemBloodbag','ItemMorphine','ItemMorphine','ItemBandage','ItemBandage'];
				};
				if ("+_RND+"_eventPos select 1 == 'PISTOL') then {
					diag_log ('AH_EVENT: Pistol event!');
					_pistols = ['Colt1911','glock17_EP1','Makarov','MakarovSD','M9','M9SD','Colt1911','glock17_EP1','Makarov','MakarovSD','M9','M9SD','Sa61_EP1','UZI_SD_EP1','UZI_EP1'];
					_p4rt_0ut = (_pistols call BIS_fnc_selectRandom);
					_mags = getArray(configfile >> 'cfgWeapons' >> _p4rt_0ut >> 'magazines');
					player addWeapon _p4rt_0ut;
					player selectWeapon _p4rt_0ut;
					for '_i' from 1 to 6 do {player addMagazine (_mags select 0)};
					
					{player addMagazine _x} forEach ['ItemBloodbag','ItemBloodbag','ItemMorphine','ItemMorphine','ItemBandage','ItemBandage'];
					reload player;
				};
				if ("+_RND+"_eventPos select 1 == 'RIFLE') then {
					diag_log ('AH_EVENT: Rifle event!');
					_rifles = ['AKS_74_kobra','AKS_74_U','AK_47_M','AK_74','bizon_silenced','M4A1','M4A1_Aim','M4A1_AIM_SD_camo','M4A3_CCO_EP1'];
					_p4rt_0ut = (_rifles call BIS_fnc_selectRandom);
					_mags = getArray(configfile >> 'cfgWeapons' >> _p4rt_0ut >> 'magazines');
					player addWeapon _p4rt_0ut;
					player selectWeapon _p4rt_0ut;
					for '_i' from 1 to 6 do {player addMagazine (_mags select 0)};
					
					_pistols = ['Colt1911','glock17_EP1','Makarov','MakarovSD','M9','M9SD','Sa61_EP1','UZI_SD_EP1','UZI_EP1'];
					_p4rt_0ut = (_pistols call BIS_fnc_selectRandom);
					_mags = getArray(configfile >> 'cfgWeapons' >> _p4rt_0ut >> 'magazines');
					player addWeapon _p4rt_0ut;
					for '_i' from 1 to 6 do {player addMagazine (_mags select 0)};
					
					{player addMagazine _x} forEach ['PartGeneric','ItemBloodbag','ItemBloodbag','ItemMorphine','ItemMorphine','ItemBandage','ItemBandage'];
					reload player;
				};
				
				_p4rt_0ut = 'ItemMap';
				player addWeapon _p4rt_0ut;
				_p4rt_0ut = 'NVGoggles';
				player addWeapon _p4rt_0ut;
				_p4rt_0ut = 'ItemToolbox';
				player addWeapon _p4rt_0ut;
				_p4rt_0ut = 'Binocular_Vector';
				player addWeapon _p4rt_0ut;
				
				if (!isNil 'event_protobox') then {if !(isNull event_protobox) then {deleteVehicle event_protobox}};
				event_protobox = createVehicle ['DebugBoxPlayer_DZ',(player call AH_fnc_getPos), [], 0, 'CAN_COLLIDE'];
				event_protobox attachTo [player,[0,0,0]];
				player setVariable ['AdminTempTele"+_RND+"',true];
				player setPosATL [-18697,25815,0];
				[] spawn "+_RND+"_eventHeal;
				[objNull,player,rSwitchMove,''] call RE;
				(vehicle player) setVelocity [0,0,1];
				(vehicle player) setVectorUp [0,0,1];
				
				_pos = "+_RND+"_eventPos select 0;
				_dir = (random 360);
				_pos = [(_pos select 0)+(1 + (random 4))*sin(_dir),(_pos select 1)+(1 + (random 4))*cos(_dir),(_pos select 2)+1];
				deathHandled = false;
				if (isNil 'event_procthrd') then {
					[] spawn {
						event_nofirepls = 0;
						if (isNil 'event_timer') then {event_timer = 30} else {event_timer = 10};
						event_procthrd = true;
						_msg = 'Event protection enabled!';
						systemChat ('"+_AH_CHAT+": ' + str _msg);
						_msg call AH_fnc_dynTextMsg;
						
						EVENTEH_FIRED = player addEventHandler ['Fired',{
							deleteVehicle (_this select 6);
							event_nofirepls = (event_nofirepls + 1);
							if (event_nofirepls < 5) then {
								_msg = 'Protection disabled in '+str(5 - event_nofirepls)+' more shots...';
								systemChat ('"+_AH_CHAT+": ' + str _msg);
								cutText [_msg,'PLAIN DOWN'];
							} else {event_timer = 0};
						}];
						
						_msg = 'Protection will last for '+str event_timer+' seconds! Get to cover!';
						systemChat ('"+_AH_CHAT+": ' + str _msg);
						
						while {event_timer > 0} do {
							player allowDamage false;
							call eventJoinInit;
							event_timer = event_timer - 1;
							if (event_timer < 10) then {
								_msg = 'Protection disabled in '+str event_timer;
								systemChat ('"+_AH_CHAT+": ' + str _msg);
							};
							uiSleep 1;
							if ((!intheevent)||(deathHandled)) exitWith {event_timer = 0};
						};
						player allowDamage true;
						if (!isNil 'event_protobox') then {if !(isNull event_protobox) then {deleteVehicle event_protobox}};
						player removeEventHandler ['Fired',EVENTEH_FIRED];
						
						_msg = 'Event protection disabled!';
						systemChat ('"+_AH_CHAT+": ' + str _msg);
						_msg call AH_fnc_dynTextMsg;
						event_procthrd = nil;
					};
				};
				if ("+_RND+"_eventPos select 3 == 'none') then {
					[(vehicle player),_pos] call AH_fnc_setPos;
					diag_log ('AH_EVENT: Position set!');
					sleep 1;
					player setVariable ['AdminTempTele"+_RND+"',false];
					6767 cutText ['','BLACK IN'];
					3 fadeSound 1;
				} else {
					if (typeOf player != 'Soldier1_DZ') then {
						diag_log ('AH_EVENT: Skin changed to Soldier1!');
						[dayz_playerUID,dayz_characterID,'Soldier1_DZ'] spawn player_humanityMorph;
						waitUntil {(typeOf player == 'Soldier1_DZ')};
						if (!isNil 'event_protobox') then {if !(isNull event_protobox) then {deleteVehicle event_protobox}};
						player setVariable ['intheevent',true,true];
					};
					"+_RND+"_colorme = [player,'RANDOM','join'];
					publicVariableServer '"+_RND+"_colorme';
					[(vehicle player),_pos] call AH_fnc_setPos;
					diag_log ('AH_EVENT: Position set!');
					sleep 1;
					player setVariable ['AdminTempTele"+_RND+"',false];
					6767 cutText ['','BLACK IN'];
					3 fadeSound 1;
				};
			};
			call "+_RND+"_eventJoin;
		};
	};
	"+_RND+"_instaToggle = {
		if (getPlayerUID player in GG_notimerarra) then {
			if (profileNameSpace getVariable ['AH_instacraft',false]) then {
				profileNamespace setVariable ['AH_instacraft',false];
				saveProfileNamespace;
				
				_msg = 'Crafting confirmation menu enabled.';
				_msg call AH_fnc_dynTextMsg;
				systemChat ('"+_AH_CHAT+": '+str _msg);
			} else {
				profileNamespace setVariable ['AH_instacraft',true];
				saveProfileNamespace;
				
				_msg = 'Crafting confirmation menu disabled.';
				_msg call AH_fnc_dynTextMsg;
				systemChat ('"+_AH_CHAT+": '+str _msg);
			};
		} else {
			_msg = 'Only donators can use this command!';
			_msg call AH_fnc_dynTextMsg;
			systemChat ('"+_AH_CHAT+": '+str _msg);
		};
	};
	"+_RND+"_CCsuicide = {
		_lastsuiA = profileNameSpace getVariable ['AH_lastsui',['0','']];
		_lastsuiT = abs(parseNumber (_lastsuiA select 0));
		_lastsuiV = (_lastsuiA select 1);
		_serverTE = (if (serverTime > 40000) then [{0},{serverTime}]);
		if ((_lastsuiV == str(donator_key))&&((_serverTE - _lastsuiT) < 300)&&(_lastsuiT != 0)&&(_serverTE < 40000)) exitWith {
			_msg = ('You can only suicide once every 5 minutes! Time left: '+str floor(300 - (serverTime - _lastsuiT)));
			systemChat ('(GG-AH): '+str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		if (inSafeZone) exitWith {
			_msg = 'You can not suicide in safezones..';
			systemChat ('(GG-AH): '+str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
		suicide_answer = nil;
		GGSpawn = [
			['Suicide Confirmation',true],
			['Are you sure?', [-1], '', -5, [['expression', '']], '1', '0'],
			['', [-1], '', -5, 		[['expression', '']], '1', '0'],
			['No', [2], '', -5, 	[['expression', 'suicide_answer=false;']], '1', '1'],
			['Yes', [3], '', -5, 	[['expression', 'suicide_answer=true;']], '1', '1'],
			['', [-1], '', -5, 		[['expression', '']], '1', '0'],
			['Exit', [-1], '', -3, 	[['expression', 'suicide_answer=false;']], '1', '1']
		];
		showCommandingMenu '#USER:GGSpawn';
		waitUntil {((!isNil 'suicide_answer')||(commandingMenu == ''))};
		if (isNil 'suicide_answer') then {suicide_answer=false};
		if (suicide_answer) then {
			player playmove (['ActsPercMstpSnonWpstDnon_suicide1B','ActsPercMstpSnonWpstDnon_suicide2B'] call BIS_fnc_selectRandom);
			uiSleep 8.4;
			player fire (currentWeapon player);
			[] spawn player_death;
			profileNameSpace setvariable ['AH_lastsui',[str(if (serverTime > 43200) then [{0},{serverTime}]),str(donator_key)]];
			saveprofileNameSpace;
		} else {systemChat ('Suicide canceled.')};
	};
	"+_RND+"_toggleHUD = {
		if (isNil 'hud_toggled') then {
			hud_toggled = true;
			3 cutRsc ['default','PLAIN',0];
			
			_msg = 'Hud disabled!';
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			_msg call AH_fnc_dynTextMsg;
		} else {
			hud_toggled = nil;
			3 cutRsc ['playerStatusGUI','PLAIN',0];
			call ui_changeDisplay;
			
			_msg = 'Hud enabled!';
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
	};
	"+_RND+"_toggleGrass = {
		if (profileNamespace getVariable ['AH_nograss',false]) then {
			profileNamespace setVariable ['AH_nograss',false];
			saveProfileNamespace;
			
			setTerrainGrid 5;
			_msg = 'Grass enabled!';
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			_msg call AH_fnc_dynTextMsg;
		} else {
			profileNamespace setVariable ['AH_nograss',true];
			saveProfileNamespace;
			
			setTerrainGrid 100;
			_msg = 'Grass disabled!';
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			_msg call AH_fnc_dynTextMsg;
		};
	};
	"+_RND+"_viewDistance = {
		view_distance_change = {
			if (_this == """") exitWith {};
			_setting 	= parseNumber _this;
			if ((_setting >= "+str _CC_MINVD+")&&(_setting <= "+str _CC_MAXVD+")) then {
				dayzSetViewDistanceAH = _setting;
				setViewDistance _setting;
				
				profileNamespace setVariable ['AH_viewdistance',_setting];
				saveProfileNamespace;
				
				_msg = ""Your view distance has been set to ""+str _setting+"", and shall be set to this on each login."";
				_msg call AH_fnc_dynTextMsg;
				systemChat ("""+_AH_CHAT+": ""+str _msg);
			} else {
				if (_setting > "+str _CC_MAXVD+") then {
					_msg = str(_setting)+"" is too high,you can only set your view distance to a maximum of "+str _CC_MAXVD+"."";
					_msg call AH_fnc_dynTextMsg;
					systemChat ("""+_AH_CHAT+": ""+str _msg);
				};
				if (_setting < "+str _CC_MINVD+") then {
					_msg = str(_setting)+"" is too low,you can only set your view distance to a minimum of "+str _CC_MINVD+"."";
					_msg call AH_fnc_dynTextMsg;
					systemChat ("""+_AH_CHAT+": ""+str _msg);
				};
			};
		};
		disableSerialization;
		['Set local viewdistance','Distance:','Set','view_distance_change'] call AH_fnc_displayCreate;
	};
	"+_RND+"_toggleInMusic = {
		_playIntro = profileNameSpace getVariable ['AH_introSong',true];
		if !(_playIntro) then {
			_msg = ""Login music has been enabled for your account."";
			_msg call AH_fnc_dynTextMsg;
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			
			profileNamespace setVariable ['AH_introSong',true];
			saveProfileNamespace;
		} else {
			_msg = ""Login music has been disabled for your account."";
			_msg call AH_fnc_dynTextMsg;
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			
			profileNamespace setVariable ['AH_introSong',false];
			saveProfileNamespace;
		};
	};
	"+_RND+"_buyMethod = {
		_buyMethod = profileNamespace getVariable ['AH_buymethod',true];
		if (_buyMethod) then {
			_msg = ""Delivery method disabled."";
			_msg call AH_fnc_dynTextMsg;
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			
			profileNamespace setVariable ['AH_buymethod',false];
			saveProfileNamespace;
		} else {
			_msg = ""Delivery method enabled."";
			_msg call AH_fnc_dynTextMsg;
			systemChat ("""+_AH_CHAT+": ""+str _msg);
			
			profileNamespace setVariable ['AH_buymethod',true];
			saveProfileNamespace;
		};
	};
	"+_RND+"_ePlugs = {
		if (soundVolume != 1) then {
			1 fadeSound 1;
			_msg = ""Ear plugs off."";
			_msg call AH_fnc_dynTextMsg;
			systemChat ("""+_AH_CHAT+": ""+str _msg);
		} else {
			1 fadeSound 0.2;
			_msg = ""Ear plugs on."";
			_msg call AH_fnc_dynTextMsg;
			systemChat ("""+_AH_CHAT+": ""+str _msg);
		};
	};
	call_msg = {systemChat ("""+_AH_CHAT+": ""+str _this+"""")};
	
	player setVariable [""AH_friendlist"",(profileNameSpace getVariable [""AH_friendlist"",[]]),true];
	
	if (isNil 'dayzSetViewDistanceAH') then {dayzSetViewDistanceAH=0};
	_viewDistance = profileNameSpace getVariable ['AH_viewdistance',dayzSetViewDistanceAH];
	if (_viewDistance > "+str _CC_MAXVD+") then {
		_msg = ""User defined view distance of ""+str _viewDistance+"" is higher than this server's max view distance of "+str _CC_MAXVD+"!"";
		systemChat ("""+_AH_CHAT+": ""+str _msg);
	} else {
		setViewDistance _viewDistance;
		_msg = ""User defined view distance of ""+str _viewDistance+"" has been set."";
		systemChat ("""+_AH_CHAT+": ""+str _msg);
	};
	if (profileNamespace getVariable ['AH_nograss',false]) then {
		setTerrainGrid 100;
		_msg = ""Grass has been disabled because of your user defined setting."";
		systemChat ("""+_AH_CHAT+": ""+str _msg);
	};
	
	_msg = ""Chat commands loaded! Type !help for more info."";
	systemChat ("""+_AH_CHAT+": ""+str _msg);
	disableSerialization;
	_badcht = "+str _CC_badChat+";
	_help 	= ['!help'];
	_nohud 	= ['!nohud'];
	_killme = ['!die','!killme','!kill','!suicide'];
	_ts3 	= ['!ts3'];
	_eplugs = ['!earplugs','!plugs','!earplug'];
	_rules 	= ['!rules'];
	_intro 	= ['!intro'];
	_viewd 	= ['!viewdistance'];
	_nogras = ['!nograss','!grass'];
	_inmusi = ['!music'];
	_online = ['!online'];
	_pmplr 	= ['!pm']; 
	_repm 	= ['!re'];
	_methd 	= ['!buymethod'];
	_event	= ['!event'];
	_leave 	= ['!leaveevent'];
	_debug	= ['!debug'];
	
	_dance1 = ['!dance1'];
	_dance2 = ['!dance2'];
	_dance3 = ['!dance3'];
	_boxing = ['!boxing'];
	_hanstn = ['!handstand'];
	_laydwn = ['!laydown'];
	_situps = ['!situps'];
	_pushup = ['!pushups'];
	_noanim = ['!stop'];
	_insta 	= ['!instacraft'];
	
	_FL_onfriends = ['!friends'];
	_FL_addfriend = ['!addfriend'];
	_FL_delfriend = ['!delfriend'];
	_FL_groupTags = ['!grouptags'];

	_airdrop = ['!airdrop'];
	_scan = ['!scan'];
	_adminCry = ['admin','!admin','/admin','admins','admin?','ADMIN','?admin','can an admin?','can a admin?','any admin','is an admin','i need help','yo admin','is there an admin'];
	
	if !("+str _CC_VDIS+") then {_viewd=[]};
	if !("+str _CC_MUSIC+") then {_inmusi=[]};
	_frndCommands = "+_CC_fcmds+";
	_animCommands = "+_CC_anims+";
	_chatCommands = (_debug + _badcht + _help + _nohud + _killme + _ts3 + _eplugs + _rules + _intro + _viewd + _nogras + _inmusi + _online + _pmplr + _repm + _methd + _event + _leave + _insta + _airdrop + _scan + _adminCry);
	_chatCommands = _chatCommands + _animCommands + _frndCommands;
	while {str(100) == str(100)} do {
		waitUntil {!(isNull (findDisplay 24))};
		waitUntil {(((toLower(ctrlText ((findDisplay 24) displayCtrl 101))) in _chatCommands)||(isNull (findDisplay 24)))};
		_msg = (toLower(ctrlText ((findDisplay 24) displayCtrl 101)));
		if (!isNull (findDisplay 24)) then {
			((findDisplay 24) displayCtrl 101) ctrlSetText '';
			(findDisplay 24) closeDisplay 0;
			_this = ['Hack menu','Chat hack'];
			if (_msg in _badcht) then "+str _AH_KICK+";
			if (_msg in _repm) then {[] spawn "+_RND+"_pmRE};
			if (_msg in _intro) then {[] spawn server_intro};
			if (_msg in _pmplr) then {[] spawn "+_RND+"_sendPM};
			if (_msg in _eplugs) then {[] spawn "+_RND+"_ePlugs};
			if (_msg in _event) then {[] spawn "+_RND+"_eventGo};
			if (_msg in _methd) then {[] spawn "+_RND+"_buyMethod};
			if (_msg in _nohud) then {[] spawn "+_RND+"_toggleHUD};
			if (_msg in _leave) then {[] spawn "+_RND+"_eventLeave};
			if (_msg in _killme) then {[] spawn "+_RND+"_CCsuicide};
			if (_msg in _insta) then {[] spawn "+_RND+"_instaToggle};
			if (_msg in _nogras) then {[] spawn "+_RND+"_toggleGrass};
			if (_msg in _online) then {[] spawn "+_RND+"_onlinePlayers};
			if (_msg in _FL_addfriend) then {[] spawn "+_RND+"_addFriend};
			if (_msg in _FL_delfriend) then {[] spawn "+_RND+"_delFriend};
			if (_msg in _FL_groupTags) then {[] spawn "+_RND+"_fespToggle};
			if (_msg in _FL_onfriends) then {[] spawn "+_RND+"_onlineFriends};
			if (("+str _CC_VDIS+")&&(_msg in _viewd)) then {[] spawn "+_RND+"_viewDistance};
			if (("+str _CC_MUSIC+")&&(_msg in _inmusi)) then {[] spawn "+_RND+"_toggleInMusic};
			if (_msg in _ts3) then {{_msg = _x;systemChat ("""+_AH_CHAT+": ""+str _msg);} forEach "+str _CC_TSTXT+";};
			if (_msg in _help) then {
				if (isNil 'help_on') then {
					help_on = true;
					_txt = '';
					{_txt = (_txt + _x)} forEach "+str _CC_HTXT+";
					[""<t size='0.5'align='left'>""+_txt+""</t>"",0.1 * safezoneW + safezoneX,0.1 * safezoneH + safezoneY,120,0,0,77398] spawn AH_fnc_dynamictext
				} else {
					help_on = nil;
					[' ',0,0,1,0,0,77398] spawn AH_fnc_dynamictext
				};
			};
			if (_msg in _rules) then {
				if (isNil 'rules_on') then {
					rules_on = true;
					_txt = '';
					{_txt = (_txt + _x)} forEach "+str _CC_RTXT+";
					[""<t size='0.5'align='left'>""+_txt+""</t>"",0.1 * safezoneW + safezoneX,0.1 * safezoneH + safezoneY,120,0,0,77398] spawn AH_fnc_dynamictext
				} else {
					rules_on = nil;
					[' ',0,0,1,0,0,77398] spawn AH_fnc_dynamictext
				};
			};
			if (_msg in _airdrop) then {
				player execVM 'GG\GG_AD.sqf';
			};
			if (_msg in _scan) then {
				player execVM 'GG\GG_SP.sqf';
			};
			if (_msg in _adminCry) then {
				[nil,player,rSAY,['babycry_1', 100]] call RE;
				uiSleep 2;
				systemChat 'SERVER: Asking For Help in SideChat Is forbidden';		
				uiSleep 1;
				systemChat 'SERVER: To get ahold of an admin, you must get in Teamspeak Support Channels';
				uiSleep 1;
				systemChat 'Teamspeak Server : TS.GHOSTZGAMERZ.COM';
			};
			if (_msg in _animCommands) then {
				if (count (nearestObjects [player, (DZE_maintainClasses), 10]) == 0) then {
					if ((vehicle player == player) && !((player getVariable ['NORRN_unconscious',false])||(player getVariable ['isTazed',false]))) then {
						if (_msg in _noanim) then {
							if (!DZE_ActionInProgress) then {
								player playActionNow 'stop';
								player playMoveNow '';
								[objNull,player,rSwitchMove,''] call RE;
							} else {
								_msg = 'Action in progress!';
								systemChat ("""+_AH_CHAT+": ""+str _msg);
								_msg call AH_fnc_dynTextMsg;
							};
						};
						if (_msg in _dance1) then {player playMoveNow 'ActsPercMstpSnonWnonDnon_DancingStefan';};
						if (_msg in _dance2) then {player playMoveNow 'ActsPercMstpSnonWnonDnon_DancingDuoStefan';};
						if (_msg in _dance3) then {player playMoveNow 'ActsPercMstpSnonWnonDnon_DancingDuoIvan';};
						if (_msg in _boxing) then {[objNull,player,rSwitchMove,'AmovPercMstpSnonWnonDnon_idle68boxing'] call RE;};
						if (_msg in _hanstn) then {[objNull,player,rSwitchMove,'AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou'] call RE;};
						if (_msg in _laydwn) then {[objNull,player,rSwitchMove,'AidlPpneMstpSnonWnonDnon_SleepC_layDown'] call RE;};
						if (_msg in _situps) then {[objNull,player,rSwitchMove,'AmovPercMstpSnonWnonDnon_idle72lehSedy'] call RE;};
						if (_msg in _pushup) then {[objNull,player,rSwitchMove,'AmovPercMstpSnonWnonDnon_idle71kliky'] call RE;};
					} else {
						_msg = 'You can not do this while unconscious/in a vehicle!';
						systemChat ("""+_AH_CHAT+": ""+str _msg);
						_msg call AH_fnc_dynTextMsg;
					};
				} else {
					_msg = 'You are not allowed to do animations near bases!';
					systemChat ("""+_AH_CHAT+": ""+str _msg);
					_msg call AH_fnc_dynTextMsg;
				};
			};
		};
	};
");
_AH_scrhndlr = _AH_scrhndlr + [_AH_CC];
diag_log ("(GG-AntiHack): Loaded client AHCC!");