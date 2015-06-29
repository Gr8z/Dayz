// IF INFISTAR IS BROKEN THIS WORKS
// Script Kiddies are now Bypassing Infistar by blocking it in the threads
// Made By Gr8
// www.GHOSTZGAMERZ.com
// Note : Hey there pbo theif, if you wanna steal it go ahead, 
// just make sure you have a working version of infistar running.
// And Ban players that get kicked by Create Vehicle Restriction #2
if (!isDedicated) then {
	waitUntil {uiSleep 0.25;(!isNil "PVDZE_plr_LoginRecord")};

	nopeGoodbye = {
		// Strip Gear
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		uiSleep 1;
		// Lets Spawn a box so BE Filter Kicks the player
		createVehicle ['RUBasicWeaponsBox',getPosATL player,[],10,'CAN_COLLIDE'];
		// Freeze Player
		disableUserInput true;
		disableUserInput true;
		disableUserInput true;
	};

	nopeScan = {
		_nopeListf = [
			(format['%1\init.sqf',name player]),(format['%1\exec.sqf',name player])
		];
		_nopeListfi = [
			'pboHider.dll','Jun.exe','Jun.vmp.dll','WhippyV4\execv4.sqf','WhippyV4\Keybindiezz.sqf','V3\B1ND.sqf',
			'JHAction.sqf','V4Run.sqf','Whippymenu\activate.sqf','Whippymenu\keybindfz.sqf','WhippyV4\WHRSupplies.sqf',
			'oefexec.dll','stdafx.h','whippy\execute.sqf','MSSM\main.sqf','ScriptName.sqf','RommelV1\Rexecv1.sqf',
			'whippymenu\execute.sqf','ArmA2OAHackUCReleasebyCriibyy_[www.unknowncheats.me]_.dll','ArmA2OAHackUCReleasebyCriibyy.dll',
			'Mystic.sqf','debug_console','Xenos.exe','Xenos64.exe','hoen\sttart.sqf','hoen\compile\re.sqf',
			'freddiesexternalmenu\freddies_active.sqf','freddiesexternalmenuv8\freddies_active.sqf','Menu_Scripts\menu\menu_generate.sqf',
			'infiSTAR_[www.unknowncheats.me]_.dll','Missions\infiSTAR_[www.unknowncheats.me]_.dll','Deluxe_97\Deluxe.sqf',
			'Expansion\infiSTAR_[www.unknowncheats.me]_.dll','dll\infiSTAR_[www.unknowncheats.me]_.dll',
			'infiSTAR.dll','Missions\infiSTAR.dll','Expansion\infiSTAR.dll','dll\infiSTAR.dll',
			'VGLoader.exe','Missions\VGLoader.exe','Expansion\VGLoader.exe','dll\VGLoader.exe',
			'vgupdater.exe','Missions\vgupdater.exe','Expansion\vgupdater.exe','dll\vgupdater.exe',
			'0100100110\start.sqf','Missions\0100100110\start.sqf','Expansion\0100100110\start.sqf','dll\0100100110\start.sqf',
			'0100100110\Starts.sqf','Missions\0100100110\Starts.sqf','Expansion\0100100110\Starts.sqf','dll\0100100110\Starts.sqf',
			'epoch\epochMain.sqf','Missions\epoch\epochMain.sqf','Expansion\epoch\epochMain.sqf','dll\epoch\epochMain.sqf',
			'Hack-Dayz.exe','Missions\Hack-Dayz.exe','Expansion\Hack-Dayz.exe','dll\Hack-Dayz.exe','TM\keymenu.sqf',
			'DayZZ.exe','Missions\DayZZ.exe','Expansion\DayZZ.exe','dll\DayZZ.exe','OTHER\scripts\fly.sqf','TM\clearvar.sqf',
			'scrFuckOffInfistar1\start.sqf','epoch\targetall\fuckserver.sqf','boooooooobies.sqf','infiSTAR_GOLD\Startup.sqf',
			'settings26\init.sqf','settings26\start.sqf','settings26\load.sqf','settings26\go.sqf','Arma 2 OA Battleye Bypass.exe',
			'scroll\startmain.sqf','Exta_files\scrollMain.sqf','players\egeg.sqf','DCv3\dc.sqf','Supplys\giveloadout.sqf',
			'runme.dll','Missions\runme.dll','Expansion\runme.dll','dll\runme.dll','Scripts\runme.dll',
			'NR.exe','Missions\NR.exe','Expansion\NR.exe','dll\NR.exe','Scripts\NR.exe','wuat\start3.sqf',
			'activator_NR.exe','Missions\activator_NR.exe','Expansion\activator_NR.exe','dll\activator_NR.exe','Scripts\activator_NR.exe',
			'MedMen.exe','Missions\MedMen.exe','Expansion\MedMen.exe','dll\MedMen.exe','Scripts\MedMen.exe',
			'SpawnTool.exe','Missions\SpawnTool.exe','Expansion\SpawnTool.exe','dll\SpawnTool.exe','Scripts\SpawnTool.exe',
			'HVMRuntm.dll','Missions\HVMRuntm.dll','Expansion\HVMRuntm.dll','dll\HVMRuntm.dll','Scripts\HVMRuntm.dll',
			'D-DayZ.dll','Missions\D-DayZ.dll','Expansion\D-DayZ.dll','dll\D-DayZ.dll','Scripts\D-DayZ.dll',
			'ss3.dll','Missions\ss3.dll','Expansion\ss3.dll','dll\ss3.dll','Scripts\ss3.dll','epoch.sqf','epoch2.sqf','fixed.exe',
			'Scripts\darky.sqf','Scripts\explo.sqf','Scripts\explode_all.sqf','Scripts\explode.sqf','@Dayz_Namalsk\menu.sqf','@Dayz_Namalsk\HP.sqf',
			'Dayz_Namalsk\menu.sqf','Dayz_Namalsk\HP.sqf','youtube.dll','vg\Run.sqf','rus\mission_settings\create.sqf',
			'vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf','vg\exec.sqf','scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf',
			'uhx_menu_first_ed\menu\logoblue.paa','Expansion\beta\dll\RayHook.dll','RayHook.dll','scr\Startup.sqf','scr\ahbypass.sqf',
			'cset.sqf','crawdaunt\crawdaunt.sqf','hangender\start.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf',
			'Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf','RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf',
			'wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf',
			'infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf','bowenisthebest.sqf',
			'Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
			'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf',
			'Missions\Menus\battleHIGH_Menu\startup.sqf','infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf',
			'TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf',
			'battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf',
			'Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf',
			'YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf','Scripts\startmenu.sqf','run.sqf','tm\starthack.sqf',
			'ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','sigdumper.dll','sigdumper.exe',
			'yolo\YoloMenu Updated v6.sqf','dll\Project1_[www.unknowncheats.me]_.exe','Scripts\Project1_[www.unknowncheats.me]_.exe',
			'gc_menu\uitvoeren.sqf','scr_wasteland\menu\initmenu.sqf','exec.sqf','infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf',
			'infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf','Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf',
			'scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf','Pickled Menu 3.0\Scripts\ajmenu.sqf','invisible.sqf',
			'@mHlopchik\Menu_Scripts\menu\keybind\funmenu','RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf',
			'Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf',
			'TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe','dayz-injector.sqf',
			'DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll','DayZ-Injector v0.4.exe','CFF-Hook.sqf',
			'CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf',
			'Obama Drone 0.5.2.1.exe','NewDayZ.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf',
			'hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf','script loader Warrock.exe','infiSTAR.sqf',
			'VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf','kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe',
			'scripts\new.sqf','new.sqf','Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','cheater.sqf',
			'@Hak_script\1.GLAVNOYE\000.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf',
			'ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe','DayZ Private AIM,MAP,WH v1.2.exe',
			'AimJunkies.exe','FABISDayZLauncher.exe','gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','ChernoNuke.sqf',
			'Scripts\Menu_Scripts\ChernoNuke.sqf','Menu_Scripts\ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf',
			'NWAFNuke.sqf','Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf',
			'ElektroNuke.sqf','Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf',
			'ESP\esp_TEST.sqf','esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf',
			'God mode 1.sqf','MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf',
			'TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe','Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf',
			'Ubu5Ukg3.sqf','customizethis.sqf','Z__i_n_f_i_S_T_A_R__Z\Run.sqf','Missions\infiSTAR_SEVEN\startup.sqf',
			'Missions\infiSTAR_SSH\startup.sqf','renamethis.sqf','round2\runthis.sqf','safe scripts\gm.sqf','scr\exec.sqf',
			'Scripts\exec.sqf','scrollz\tp.sqf','ShadowyFaze\exec.sqf','infiSTAR_BLACK\Startup.sqf','lol.sqf','teststartup.sqf',
			'infiSTAR_NEW\Startup.sqf','DayZ_Settings.txt','Optix_DayZ_Auto.txt','ldr.cnf','Custom_folder\scrollmenu\Click to Tp.sqf',
			'Aspire Menu v.0.5\ALL TEH SCRIPTS!\esp.sqf','Aspire Menu v.0.5\ALL TEH SCRIPTS!\heal.sqf','SpawnTool.exe','LoganNZL\LoganNZL@execute.sqf',
			'LoganNZL\LoganNZL@start.sqf','LoganNZL@start.sqf','nightsuck.sqf','Project1_[www.unknowncheats.me]_.exe','wuat\RUN.sqf','menuu.zip',
			'Missions\Project1_[www.unknowncheats.me]_.exe','Expansion\Project1_[www.unknowncheats.me]_.exe','wuat\Scripts.txt','wuat\start1.sqf',
			'GiveItTheDLL.exe','Missions\GiveItTheDLL.exe','Expansion\GiveItTheDLL.exe','dll\GiveItTheDLL.exe','Scripts\GiveItTheDLL.exe',
			'spawner.dll','Missions\spawner.dll','Expansion\spawner.dll','dll\spawner.dll','Scripts\spawner.dll','wuat\scripts\runMagicaly.sqf',
			'inject.bat','Missions\inject.bat','Expansion\inject.bat','dll\inject.bat','Scripts\inject.bat','wuat\screen2.sqf','wuat\standalonemenu.sqf',
			'spawner\GiveItTheDLL.exe','spawner\Missions\GiveItTheDLL.exe','spawner\Expansion\GiveItTheDLL.exe','spawner\dll\GiveItTheDLL.exe','spawner\Scripts\GiveItTheDLL.exe',
			'spawner\spawner.dll','spawner\Missions\spawner.dll','spawner\Expansion\spawner.dll','spawner\dll\spawner.dll','spawner\Scripts\spawner.dll',
			'spawner\inject.bat','spawner\Missions\inject.bat','spawner\Expansion\inject.bat','spawner\dll\inject.bat','spawner\Scripts\inject.bat',
			'infiSTAR_SSH\setup\startup.sqf','Supplys\BBstart.sqf','TM\666.sqf','vscripts\Startup.sqf','Ronnie\Startup.sqf','MyScripts\cargo.sqf',
			'BE\update.sqf','ScriptBasic.sqf','ScriptTelePlayer.sqf','Deluxe.sqf','Moving_Gun_Menu\start.sqf',
			'WRMoney.sqf','allover_[www.unknowncheats.me]_.dll','allover.dll','WhippyMenu\keybindfz.sqf','WhippyMenu\SqfFiles\esp.sqf',
			'WhippyMenu\SqfFiles\destroyb.sqf','WhippyMenu\SqfFiles\setviewdistance500m.sqf','WhippyMenu\SqfFiles\night.sqf','WhippyMenu\SqfFiles\unlock.sqf',
			'initFunctions.sqf','tbb4malloc_bi.dll','PRaZ\start.sqf','jh\Action.sqf','ArmA2OA_Extars\BB_menu_BB.sqf',
			'ArmA2OA_Extras\ben_ex.sqf'
		]+_nopeListf;
		_nopeListv = [
			'manatee_craft_menu','manatee_craft_menu_wea','manatee_craft_menu_sur','manatee_craft_menu_ind','BTC_liftHudId','jun',
			'MonsterCheats_Admin_Options','B1g_B3nProEsp','MonsterCheats_ESP','freddiesmm','vehiclemarkershuehuehue','Freddies_1stepbuild','MonsterCheats_Menu','hippoWiveHiveServer','whippyv7',
			'ANTIHACKKICK','lel','fnx3','vars','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','name','carepkg','scrollAim','BlurExec','sbpc','CALLRE',
			'quake','menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','D_AMEZ_COA','TBMKnlist',
			'envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL','b','infiSTAR_fillRE','Esp_Id_setter',
			'qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','fnc_allunits','sbp',
			'PV_IAdminMenuCode','PVAH_WriteLogRequest','skype_img','Lhacks','Lpic','LtToTheRacker','Lexstr','take1','Called','epochExec','sdgff4535hfgvcxghn',
			'adadawer24_1337','fsdddInfectLOL','W_O_O_K_I_E_ANTI_ANTI_HAX','W_O_O_K_I_E_Car_RE','kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress',
			'toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode','AdminLoadOK',
			'AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red',
			'JME_MENU_Sub','JME_menu_title','JME_Sub','JME_OPTIONS','god','heal','grass','fatguybeingchasedbyalion','night','day','infammo','nvg','thermal',
			'Keybinds','fredtargetkill','loopfredtpyoutome','epochTp','AdminLst','BB_Pr0_Esp','BBProEsp','epochMapMP','CALLRESVR','lazy_ILHA_is_lazy',
			'trap','boomgoats','morphme','morph','blfor','blfor2','blfor3','rdfor','rdfor2','rdfor3','napa','civ','runonce','keybindz','BB_Menu_Fnc',
			'mod_select','scrollmenu','ly5t1c','JJMMEE_Swagger','Bobsp','Speed_Hack_cus','pList_star_peter_cus','RGB','onKeyPress','neo_throwing','n912',
			'Menu_I_Run_Color_LP','Blue_I_Color_LP','Orange_I_Color_LP','Menu_I_On_Color_LP','Menu_I_Off_Color_LP','Speed_Hack_cus','cus_SPEED_DOWN',
			'pnc','SpyglassFakeTrigger','infammook','Tit_Choppertimer','Mystic_ESP','biggies_menu_open','MM_150','FND_fnc_select','hoenUSABLE','changestats',
			'FND_fnc_subs','FND_fnc_spawn_veh','bombs','GLASS911_Run','key_combos_ftw','MainScripts','AimAssistUC','arr1','init_main','ESP_Count','eroticTxt',
			'nec2','GetinPassenger','iaimon','func_execOnServer','jayRE','Fanatic_InfiPass','keybindings_xxx','zeus_star','B1g_B3n_target','viname','BB_nofatigue',
			'First_PAGE','Get_in_D','i_t_s__m_e_o','smissles','whippyhtmlz','htmlz','htmlzV4','whippyhtmlzV4','VehicleMarkers','WhippyV4MAPESP_MA',
			'alsonotakeybind','Jay_g0d_M0de','MCheats_Clip_F','I_love_rustler_and_jet','inf3MMO','JayT3L3Eclick','JayT3L3Click','espOn3','togESP4',
			'hhahaaaaar','CharlieSheenkeybinds','KickOFF','yolo','runonce','notakeybind','GEFClear','GEFClose','GEFWhite','GEFRed','GEFGreen','GEFCyan','FirstHint','LoganIsTired',
			'MonsterCheats_Admin_Options','MonsterCheats_Toggle_Mods','MonsterCheats_Toggle','Jkeyszz','n2','monkyinterrupt','T0ol_it3ms','A11','fnx14','startmenu','menu0','Nute_Dat_Bomber',
			'NienUntoten','WhippyV4_PPAdd','shazbot','jun','whipbut','MainMenu','UserFuncs'
		];
		while {true} do {
			_nopeC = false;
			_cfg = configFile;
			for '_i' from 0 to count (_cfg)-1 do {
				_selected = _cfg select _i;
				if (isClass _selected) then {
					_c = configName _selected;
					if (_c in ['PoopLoop','RscRazzler','RscListBoxVG','RscHippoz','Rschippoz2','vgdialog']) then {_nopeC = true;};
				};
			};
			if (lbSize 109 > 2) then {_nopeC = true;};
			{if (!isNull (findDisplay _x)) exitWith {_nopeC = true;};} count [17,64,155,156,162,1001,2929,3030,125,69,19,71,45,132,32,165,157,2727,30,9899,0110,110,70000];
			_c = 0;
			{
				_c = _c + 1;
				if (_c >= 10) then {_c = 0;uiSleep 0.5;};
				_f = preprocessFileLineNumbers _x;
				if (_f != '') exitWith {_nopeC = true;};
				true
			} count _nopeListfi;
			{
				if (!isNil _x) exitWith {_nopeC = true;};
				true
			} count _nopeListv;
			if (_nopeC) exitWith {[] spawn nopeGoodbye;};
			
			// Scans Every 5 Seconds
			uiSleep 5;
		};
	};

	if (!((getPlayerUID player) in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List))) then { // Admin UIDs taken from infistar, If you dont run infistar, then manually add admin UIDs
		preProcessFileLineNumbers 'Scan completed, bad content was not found';
		[] spawn nopeScan;
	};
};

// Made By Gr8 //
// BYE BYE SCRIPT KIDDIES THT BYPASS INFISTAR //