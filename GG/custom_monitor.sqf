fnc_debug = {
	  private ["_kills","_killsH","_killsB","_humanity","_headShots","_vehname","_crew","_crew2","_crew3","_crew4","_crew5","_crew6","_crew7","_crew8","_crew9"];
    debugMonitor = true;
    while {debugMonitor} do
    {
        _kills =        player getVariable["zombieKills",0];
        _killsH =       player getVariable["humanKills",0];
        _killsB =       player getVariable["banditKills",0];
        _humanity =     player getVariable["humanity",0];
        _headShots =    player getVariable["headShots",0];
	
	      hintSilent parseText format ["
				<t size='1' font='Bitstream' align='center' color='#FFCC00'>Survived %1 Days</t><br/><br/>
        <t size='1' font='Bitstream' align='left' color='#EEC900'>Blood Left:</t><t size='1' font='Bitstream' align='right' color='#EE0000'>%2</t><br/>
        <t size='1' font='Bitstream' align='left' color='#EEC900'>Humanity:</t><t size='1'font='Bitstream' align='right' color='#EEC900'>%3</t><br/>
        <t size='1' font='Bitstream' align='left' color='#EEC900'>Murders:</t><t size='1'font='Bitstream' align='right' color='#EEC900'>%4</t><br/>
        <t size='1' font='Bitstream' align='left' color='#EEC900'>Bandits Killed:</t><t size='1'font='Bitstream' align='right' color='#EEC900'>%5</t><br/>
        <t size='1' font='Bitstream' align='left' color='#EEC900'>Zombies Killed:</t><t size='1'font='Bitstream' align='right' color='#EEC900'>%6</t><br/>
        <t size='1' font='Bitstream' align='left' color='#EEC900'>Headshots:</t><t size='1'font='Bitstream' align='right' color='#EEC900'>%7</t><br/>
				<t size='1' font='Bitstream' align='left' color='#EEC900'>Fps:</t><t size='1'font='Bitstream' align='right' color='#FFFFFF'>%8</t><br/>
        <t size='1' font='Bitstream' align='center' color='#0080C0'>www.grof.gr</t><br/>",
        dayz_skilllevel,
        r_player_blood,
        round _humanity,
        _killsH,
        _killsB,
        _kills,
        _headShots,
        round diag_FPS
        ];
    sleep 1;
    };
};