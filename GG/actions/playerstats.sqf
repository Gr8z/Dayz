hintSilent parseText format ["


	<img size='5' image='GG\images\logo.paa'/><br/><br/>
	
	<t size='1.5' font='Bitstream' align='center' color='#2E64FE'>%7</t><br/><br/>
	
	<t size='1.20' font='Bitstream' color='#BDBDBD'>Survived %6 Days</t><br/><br/>
	
	<t size='1.15' font='Bitstream' align='left' color='#2E64FE'>Zombies Killed: </t>
	<t size='1.15' font='Bitstream' align='right' color='#BDBDBD'>%1</t><br/>
	
	<t size='1.15' font='Bitstream' align='left' color='#2E64FE'>Headshots: </t>
	<t size='1.15' font='Bitstream' align='right' color='#BDBDBD'>%2</t><br/>
	
	<t size='1.15' font='Bitstream' align='left' color='#2E64FE'>Murders: </t>
	<t size='1.15' font='Bitstream' align='right' color='#BDBDBD'>%3</t><br/>
	
	<t size='1.15' font='Bitstream' align='left' color='#2E64FE'>Bandits Killed: </t>
	<t size='1.15' font='Bitstream' align='right' color='#BDBDBD'>%4</t><br/><br/>
	
	<t size='1.15' font='Bitstream' align='left' color='#2E64FE'>Humanity: </t>
	<t size='1.15' font='Bitstream' align='right' color='#2E64FE'>%5</t><br/>
	
	<t size='1.15' font='Bitstream' align='left' color='#C70000'>Blood: </t>
	<t size='1.15' font='Bitstream' align='right' color='#C70000'>%8&#37;</t><br/><br/>
	
	<t size='1.20' font='Bitstream' align='center' color='#2E64FE'>Website:</t><br/>
	<t size='1.20' font='Bitstream' align='center' color='#BDBDBD'>www.GhostzGamerz.com</t><br/>
	
	<t size='1.20' font='Bitstream' align='center' color='#2E64FE'>Teamspeak:</t><br/>
	<t size='1.20' font='Bitstream' align='center' color='#BDBDBD'>TS.GHOSTZGAMERZ.COM</t><br/>",
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	(dayz_Survived),
	dayz_playerName,
	round((r_player_blood/12000)*100)
];