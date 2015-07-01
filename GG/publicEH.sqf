//Medical Event Handlers
"norrnRaLW"					addPublicVariableEventHandler {(_this select 1) execVM "\z\addons\dayz_code\medical\publicEH\load_wounded.sqf"};
"norrnRLact"				addPublicVariableEventHandler {(_this select 1) execVM "\z\addons\dayz_code\medical\load\load_wounded.sqf"};
"norrnRDead"				addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\dayz_code\medical\publicEH\deadState.sqf"};
"usecBleed"					addPublicVariableEventHandler {_id = (_this select 1) spawn fnc_usec_damageBleed};
"usecBandage"				addPublicVariableEventHandler {(_this select 1) call player_medBandage};
"usecInject"				addPublicVariableEventHandler {(_this select 1) call player_medInject};
"usecEpi"					addPublicVariableEventHandler {(_this select 1) call player_medEpi};
"usecTransfuse"				addPublicVariableEventHandler {(_this select 1) call player_medTransfuse};
"usecMorphine"				addPublicVariableEventHandler {(_this select 1) call player_medMorphine};
"usecPainK"					addPublicVariableEventHandler {(_this select 1) call player_medPainkiller};
"PVDZE_plr_Hit" 			addPublicVariableEventHandler {(_this select 1) call fnc_usec_damageHandler};
"PVDZE_plr_HitV" 			addPublicVariableEventHandler {(_this select 1) call fnc_usec_damageVehicle};
"usecBreakLegs"				addPublicVariableEventHandler {(_this select 1) call player_breaklegs};

//Both
"PVDZE_veh_SFuel"			addPublicVariableEventHandler {(_this select 1) spawn local_setFuel};
"PVDZE_veh_SFix"			addPublicVariableEventHandler {(_this select 1) call object_setFixServer};
"PVDZE_plr_HideBody"		addPublicVariableEventHandler {hideBody (_this select 1)};
"PVDZE_obj_Hide"			addPublicVariableEventHandler {hideObject  (_this select 1)};
"PVDZE_veh_Lock"			addPublicVariableEventHandler {(_this select 1) spawn local_lockUnlock};
"PVDZE_plr_GutBody"			addPublicVariableEventHandler {(_this select 1) spawn local_gutObject};
"PVDZE_plr_GutBodyZ"		addPublicVariableEventHandler {(_this select 1) spawn local_gutObjectZ};
"PVDZE_plr_DelLocal"		addPublicVariableEventHandler {(_this select 1) call object_delLocal};
"PVDZE_veh_Init"			addPublicVariableEventHandler {(_this select 1) call fnc_veh_ResetEH};
"PVDZE_plr_HumanityChange"	addPublicVariableEventHandler {(_this select 1) spawn player_humanityChange};
"PVDZE_serverObjectMonitor" addPublicVariableEventHandler {PVDZE_serverObjectMonitor = dayz_safety};
/* PVS/PVC - Skaronator */
"PVCDZE_vehSH" 			addPublicVariableEventHandler {(_this select 1) call vehicle_handleDamage}; // set damage to vehicle part

"PVDZE_Server_Simulation" addPublicVariableEventHandler {
	_agent = ((_this select 1) select 0);
	_control = ((_this select 1) select 1);

	_agent enableSimulation _control;
};

//Server only
if (isServer) then {
	/* PVS/PVC - Skaronator */
	"PVDZE_send" addPublicVariableEventHandler {(_this select 1) call server_sendToClient};
	"PVDZE_maintainArea" addPublicVariableEventHandler {(_this select 1) spawn server_maintainArea};

	"PVDZE_atp" addPublicVariableEventHandler {
		_x = _this select 1;
		if (typeName _x == "STRING") then {
			diag_log _x;
		};
	};
	"PVDZE_plr_Died"		addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};
	"PVDZE_plr_Save"		addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerSync;};
	"PVDZE_obj_Publish"		addPublicVariableEventHandler {(_this select 1) call server_publishObj};
	"PVDZE_fullobj_Publish"		addPublicVariableEventHandler {(_this select 1) call server_publishFullObject};	
	"PVDZE_veh_Update"		addPublicVariableEventHandler {_id = (_this select 1) spawn server_updateObject};
	"PVDZE_plr_Login"		addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerLogin};
	"PVDZE_plr_Login2"		addPublicVariableEventHandler {(_this select 1) call server_playerSetup};
	"PVDZE_plr_Morph"		addPublicVariableEventHandler {(_this select 1) call server_playerMorph};
	"PVDZE_plr_LoginRecord"	addPublicVariableEventHandler {_id = (_this select 1) spawn dayz_recordLogin};
	//Checking
	"PVDZE_obj_Delete"		addPublicVariableEventHandler {(_this select 1) spawn server_deleteObj};
	// upgrade && maintain
	"PVDZE_obj_Swap"		addPublicVariableEventHandler {(_this select 1) spawn server_swapObject};
	// disable zombies server side
	"PVDZE_zed_Spawn"		addPublicVariableEventHandler {(_this select 1) spawn server_handleZedSpawn};

	// Dayz epoch custom
	"PVDZE_veh_Publish"		addPublicVariableEventHandler {(_this select 1) spawn server_publishVeh};
	"PVDZE_veh_Publish2"	addPublicVariableEventHandler {(_this select 1) spawn server_publishVeh2};
	"PVDZE_veh_Upgrade"	addPublicVariableEventHandler {(_this select 1) spawn server_publishVeh3};
	"PVDZE_obj_Trade"		addPublicVariableEventHandler {(_this select 1) spawn server_tradeObj};
	"PVDZE_plr_TradeMenu"	addPublicVariableEventHandler {(_this select 1) spawn server_traders};
	"PVDZE_plr_DeathB"		addPublicVariableEventHandler {(_this select 1) spawn server_deaths};

	"PVDZE_log_lockUnlock" addPublicVariableEventHandler {(_this select 1) spawn server_logUnlockLockEvent};
};

//Client only
if (!isDedicated) then {
	"PVDZE_plr_SetDate"		addPublicVariableEventHandler {setDate (_this select 1)};
	"PVDZE_plr_SetSaveTime"	addPublicVariableEventHandler {DZE_SaveTime = (_this select 1)};
	"PVDZE_obj_RoadFlare"	addPublicVariableEventHandler {(_this select 1) spawn object_roadFlare};
	"PVDZE_plr_Morph2"		addPublicVariableEventHandler {(_this select 1) call player_serverModelChange};
	"PVDZE_plr_Morph"		addPublicVariableEventHandler {(_this select 1) call server_switchPlayer};
	"PVDZE_obj_Fire"		addPublicVariableEventHandler {nulexp=(_this select 1) spawn BIS_Effects_Burn};
	"PVDZE_plr_FriendRQ"	addPublicVariableEventHandler {(_this select 1) call player_tagFriendlyMsg};

	"PVDZ_Death_msg"		addPublicVariableEventHandler {
		_id = (_this select 1);
		_killerName = _id select 0;
		_pic		= _id select 1;
		_victimName = _id select 2;
		_distance 	= _id select 3;
		_weapon 	= _id select 4;
		if (line4 == 1) then {
			line0 = 1; lvl = 6000; safeOffset = 0;
			line1 = 0; line2 = 0; line3 = 0; line4 = 0;
			[] spawn { sleep 10; line0 = 0; };
		} else { if (line4 == 1) then {
			line5 = 1; lvl = 6005; safeOffset =0.82;
			[] spawn { sleep 10; line5 = 0; };
		} else { if (line3 == 1) then {
			line4 = 1; lvl = 6004; safeOffset =0.68;
			[] spawn { sleep 10; line4 = 0; };
		} else { if (line2 == 1) then {
			line3 = 1; lvl = 6003; safeOffset = 0.50;
			[] spawn { sleep 10; line3 = 0; };
		} else { if (line1 == 1) then {
			line2 = 1; lvl = 6002; safeOffset = 0.36;
			[] spawn { sleep 10; line2 = 0; };
		} else { if (line0 == 1) then {
			line1 = 1; lvl = 6001; safeOffset = 0.18;
			[] spawn { sleep 10; line1 = 0; };
		} else { line0 = 1; lvl = 6000; safeOffset = 0; [] spawn { sleep 10; line0 = 0; };};};};};};};
		//Halv's Kill Messages
		_dyntxt = format["
		<t size='0.75'align='left'color='#5882FA'>%1</t>
		<t size='0.5'align='left'>  Killed  </t>
		<t size='0.75'align='left'color='#c70000'>%2</t><br/>
		<t size='0.45'align='left'> With: </t>
		<t size='0.5'align='left'color='#FFCC00'>%3</t>
		<t size='0.45'align='left'> - Distance: </t>
		<t size='0.5'align='left'color='#FFCC00'>%4 m</t><br/>
		<img size='1.5'align='left' image='%5'/>
		",
		_killerName,
		_victimName,
		_weapon,
		_distance,
		_pic
		];
		[_dyntxt,safezoneX,(safezoneY + safeOffset),9,0,0,lvl] spawn yoloText;
		systemChat format ["%1 killed %2 with a %3 from %4 meters",_killerName,_victimName,_weapon,_distance];
	};

	"norrnRaDrag"			addPublicVariableEventHandler {(_this select 1) execVM "\z\addons\dayz_code\medical\publicEH\animDrag.sqf"};
	"norrnRnoAnim"			addPublicVariableEventHandler {(_this select 1) execVM "\z\addons\dayz_code\medical\publicEH\noAnim.sqf"};
};
