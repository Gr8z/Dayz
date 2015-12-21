{
	_trader = createAgent [_x select 0,_x select 1,[],0,"CAN_COLLIDE"];
	{_trader removeMagazine _x} count magazines _trader;
	removeAllItems _trader;
	removeAllWeapons _trader;
	removeBackpack _trader;
	_trader switchMove "AmovPercMstpSlowWrflDnon";
	_trader setcaptive true;
	_trader setDir (_x select 2);
	_trader setVehicleInit "this disableAI 'ANIM'; this disableAI 'AUTOTARGET'; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0; this allowDamage false;";
	_trader setUnitAbility 0.6;
	_trader enableSimulation false;
} forEach [
	["FR_Sykes",[1100.26,2854.37,0],179.651],
	["GUE_Villager4",[8387.1,2369.31,0],171.998],
	["GUE_Soldier_CO",[13246.2,6071.39,0],5.43464],
	["UN_CDF_Soldier_Crew_EP1",[6391.78,7791.1,0],294.557],
	["UN_CDF_Soldier_Pilot_EP1",[6381.81,7767.48,0],121.089],
	["Soldier_MG_PMC",[6329.11,7790.77,0],111.327],
	["Soldier_MG_PKM_PMC",[6330.2,7792.34,0],127.651],
	["GUE_Worker2",[6308.4,7801.23,0],280.564],
	["Dr_Annie_Baker_EP1",[6307.59,7793.21,0],306.597],
	["TK_GUE_Soldier_5_EP1",[4078.29,11688.6,0],190.822],
	["GUE_Soldier_2",[4086.22,11679.8,0],205.641],
	["Drake",[11459.7,11385.8,0],44.9809],
	["BAF_Soldier_AAR_DDPM",[11458,11387,0],38.9443],
	["US_Delta_Force_AR_EP1",[11473.5,11383.1,0],154.968],
	["Soldier_Sniper_PMC",[5066.9,9729.36,0],319.709],
	["Tanny_PMC",[12947.7,12763.3,0],273.252],
	["GUE_Soldier_3",[6319.75,7780.39,0],111.174],
	["GUE_Soldier_Crew",[13106.1,8253.15,0],78.3213],
	["GUE_Commander",[4063.41,11665.4,0],4.06381],
	["TK_GUE_Warlord_EP1",[4065.97,11664.7,0],13.221],
	["CIV_EuroWoman02_EP1",[4059.16,11671.9,0],69.6608],
	["RU_Damsel4",[4059.36,11681.2,0],135.772],
	["GUE_Soldier_1",[1607.49,7780.24,0],206.985],
	["BAF_Soldier_EN_MTP",[11460.6,11395.9,0],151.445],
	["Herrera_Light",[11468,11394.9,0],197.338],
	["US_Delta_Force_Medic_EP1",[11474.3,11389.6,0],243.732],
	["GUE_Worker2",[3433.53,3802.97,0],311.875],
	["TK_GUE_Warlord_EP1",[3452.66,3798.23,0],54.987],
	["GUE_Commander",[3463.33,3802.84,0],272.618],
	["Dr_Annie_Baker_EP1",[3441.64,3796.55,0],170.272],
	["GUE_Soldier_2",[3444.93,3809.82,0],13.34],
	["UN_CDF_Soldier_Crew_EP1",[3416.59,3814.19,0.00138855],269.299],
	/*Units for: RefuelRepair_npcs.sqf*/
	["INS_Lopotev_DZ",[12982.3,10082.3,0],96.4293],
	["INS_Lopotev_DZ",[13372.8,6612.46,0],76.3111],
	["INS_Lopotev_DZ",[9498.33,1997.15,0],348.384],
	["INS_Lopotev_DZ",[6694.8,3006.7,0],144.622],
	["INS_Lopotev_DZ",[2018.93,2234.49,0],344.245],
	["INS_Lopotev_DZ",[5852.53,2203.9,0],149.576],
	["INS_Lopotev_DZ",[10440.4,8880.47,0],189.011],
	["INS_Lopotev_DZ",[5852.44,10105.3,0],298.668],
	["INS_Lopotev_DZ",[3659.66,8982.04,0],192.002],
	["INS_Lopotev_DZ",[3003.81,7464.59,0],271.629],
	["INS_Lopotev_DZ",[2695.55,5588.12,0],279.165],
	["INS_Lopotev_DZ",[4729.96,6385.77,0],219.639],
	["INS_Lopotev_DZ",[7264.06,7654.75,0],331.222],
	["INS_Lopotev_DZ",[10159.3,5309.94,0],272.806],
	["INS_Lopotev_DZ",[10731.7,10783.6,0],294.392]

];
processInitCommands;