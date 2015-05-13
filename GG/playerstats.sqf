private "_name";
//Let Zeds know
[player,4,true,(getPosATL player)] spawn player_alertZombies;

//display gui (temp hint)
_mags = [currentWeapon player] + (weapons player) + (magazines player);
_My_speed = speed (vehicle player);
_kills = player getVariable['zombieKills',0];
_killsH = player getVariable['humanKills',0];
_killsB = player getVariable['banditKills',0];
_headShots = player getVariable['headShots',0];
_humanity =	player getVariable['humanity',0];

_dmweapons = '';
_dmvehicle = '';
_dmweaponsname = '';
_dmvehiclename = '';
_dmweapons = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
_dmvehicle = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
_dmweaponsname = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'displayName'));
_dmvehiclename = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));

_zPos = getPos player select 2;

if ('ItemGPS' in _mags) then {
	hintSilent parseText format ["
	<t size='1.5'font='Bitstream'align='left'color='#0000FF'>%1</t>							<t size='0.90'font='Bitstream'align='right'color='#FFCC00'>FPS: %11</t><br/>
	<t size='0.95'font='Bitstream'align='left'>Players:%2</t>							<t size='0.95'font='Bitstream'align='right'>1000m: %3</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#FF0000'>Blood:</t>						<t size='0.95'font='Bitstream'align='right'color='#FF0000'>%18&#37;</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#66FFFF'>Humanity:</t>						<t size='0.95'font='Bitstream'align='right'color='#66FFFF'>%5</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#66FF66'>Vehicles:</t>						<t size='0.95' font='Bitstream'align='right'color='#66FF66'>%16 / %17</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Killed Zombies:</t>					<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%8</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Killed Bandits:</t>					<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%6</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Killed Survivors:</t>					<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%7</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Headshot:</t>						<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%9</t><br/>
	<t size='0.95'font='Bitstream'align='left'>GPS: %10 H: %20 S: %21</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#B4B4B4'>%12</t>						<t size='0.95'font='Bitstream'align='right'color='#B4B4B4'>%13</t><br/>
	<img size='2' image='%14' align='left'/>									<img size='2' image='%15' align='right'/><br/>
	<t size='0.95'font='Bitstream'align='left'color='#FFFF00'>GHOSTZGAMERZ.COM</t>
	",
	dayz_playerName,
	(count playableUnits),
	(({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 1000]))-1),
	round(r_player_blood),
	round _humanity,
	_killsB,
	_killsH,
	_kills,
	_headShots,
	(mapGridPosition getPos player),
	(round diag_fps),
	_dmweaponsname,
	_dmvehiclename,
	_dmweapons,
	_dmvehicle,
	(count([6800, 9200, 0] nearEntities [['StaticWeapon','Car','Motorcycle','Tank','Air','Ship'],50000])),
	count vehicles,
	(round((r_player_blood/12000)*100)),
	(299-(round(serverTime/60))),
	(round _zPos),
	round(_My_speed)
	];
} else {
	hintSilent parseText format ["
	<t size='1.5'font='Bitstream'align='left'color='#0000FF'>%1</t>							<t size='0.90'font='Bitstream'align='right'color='#FFCC00'>FPS: %11</t><br/>
	<t size='0.95'font='Bitstream'align='left'>Players:%2</t>							<t size='0.95'font='Bitstream'align='right'>1000m: X</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#FF0000'>Blood:</t>						<t size='0.95'font='Bitstream'align='right'color='#FF0000'>%18&#37;</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#66FFFF'>Humanity:</t>						<t size='0.95'font='Bitstream'align='right'color='#66FFFF'>%5</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#66FF66'>Vehicles:</t>						<t size='0.95' font='Bitstream'align='right'color='#66FF66'>%16 / %17</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Killed Zombies:</t>					<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%8</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Killed Bandits:</t>					<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%6</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Killed Survivors:</t>					<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%7</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#D793D1'>Headshot:</t>						<t size='0.95'font='Bitstream'align='right'color='#D793D1'>%9</t><br/>
	<t size='0.95'font='Bitstream'align='left'>GPS: XXXXXX H: X S: X</t><br/>
	<t size='0.95'font='Bitstream'align='left'color='#B4B4B4'>%12</t>						<t size='0.95'font='Bitstream'align='right'color='#B4B4B4'>%13</t><br/>
	<img size='2' image='%14' align='left'/>									<img size='2' image='%15' align='right'/><br/>
	<t size='0.95'font='Bitstream'align='center'color='#FFFF00'>GHOSTZGAMERZ.COM</t>
	",
	dayz_playerName,
	(count playableUnits),
	(({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 1000]))-1),
	round(r_player_blood),
	round _humanity,
	_killsB,
	_killsH,
	_kills,
	_headShots,
	(mapGridPosition getPos player),
	(round diag_fps),
	_dmweaponsname,
	_dmvehiclename,
	_dmweapons,
	_dmvehicle,
	(count([6800, 9200, 0] nearEntities [['StaticWeapon','Car','Motorcycle','Tank','Air','Ship'],50000])),
	count vehicles,
	(round((r_player_blood/12000)*100)),
	(299-(round(serverTime/60))),
	(round _zPos),
	round(_My_speed)
	];
};