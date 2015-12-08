diag_log ("(GG-AntiHack): Loading client AHDS...");
_AH_DC = compile ("
	if !("+_playerID+" player in "+(str _AdminArray)+") then {
		disableSerialization;
		if (isNil ""disconnect_timer"") then {disconnect_timer = 0};
		while {str(100) == str(100)} do {
			if (isNull (findDisplay 63)) then {waitUntil {(!isNull findDisplay 63)}};
			"+_randv+"_really_loud_sounds = {
				[60,15] call fnc_usec_pitchWhine;
				[nil,player,rSAY,['z_scream_w_1',100]] call RE;
				for ""_i"" from 1 to 50 do {player say ['z_scream_w_1',100];playSound _this};
			};
			"+_randv+"_double_cut = {
				_msg = _this;
				systemChat ("""+_AH_CHAT+": ""+str _msg);
				1 cutText [_msg,""PLAIN DOWN""];
				2 cutText [_msg,""PLAIN""];
			};
			if ((!isNull(findDisplay 55)) && (ctrlText (findDisplay 63 displayCtrl 101) in [localize 'str_channel_side',localize 'str_channel_global'])) then {
				if ((disconnect_timer == 0)||(isNil ""reset_timer"")) then {
					[] spawn {
						if (disconnect_timer == 0) then {disconnect_timer = 1;sleep 1;disconnect_timer = 0};
						if (isNil ""reset_timer"") then {
							reset_timer = true;
							uiSleep 300;
							disconnect_me = nil;
							reset_timer = nil;
						};
					};
				};
				if (isNil ""disconnect_me"") then [{disconnect_me = 0},{if (disconnect_timer == 1) exitWith {};disconnect_me = disconnect_me + 1}];
				if (disconnect_me == 0) then {
					""beat04"" call "+_randv+"_really_loud_sounds;
					""NO VOICE ON SIDE! (1/3 chances left)"" call "+_randv+"_double_cut;
				};
				if (disconnect_me == 1) then {
					_msg = 'NO VOICE ON SIDE! (1/3 chances left)';
					_msg call AH_fnc_dynTextMsg;
					systemChat ("""+_AH_CHAT+": ""+str _msg);
					""beat04"" call "+_randv+"_really_loud_sounds;
					""NO VOICE ON SIDE! (2/3 chances left)"" call "+_randv+"_double_cut;
				};
				if ((disconnect_me >= 2)&&(isNil '"+_randv+"_disconnectED')) then {
					_msg = 'Disconnecting you...';
					_msg call AH_fnc_dynTextMsg;
					systemChat ("""+_AH_CHAT+": ""+str _msg);
					""beat04"" call "+_randv+"_really_loud_sounds;
					""(3/3 chances left)"" call "+_randv+"_double_cut;
					['Side Chat','(3/3 chances used)','misc'] spawn "+_randv+"_disconnect;
				};
			};
			sleep 0.5;
		};
	};
");
_AH_scrhndlr = _AH_scrhndlr + [_AH_DC];
diag_log ("(GG-AntiHack): Loaded client AHDS!");