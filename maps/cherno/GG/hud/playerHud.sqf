disableSerialization;

AsReMixhud_Control = true; // player getVariable["AsReMixhud",true];


while {true} do
{
    1000 cutRsc ["AsReMixhud","PLAIN"];
    _wpui = uiNameSpace getVariable "AsReMixhud";
    _vitals = _wpui displayCtrl 4900;
	
	_thePlayer = player;
	AsReMixhud_headshots 		= _thePlayer getVariable["cashMoney",0];
    Zupa_bank 					= _thePlayer getVariable["bankMoney",0];
	
    
	_vitals ctrlSetStructuredText parseText format ["
		<t size='0.9'> %1 </t><img size='0.8' align='right' image='GG\images\Money.paa'/>   <br/>
		<t size='0.9'> %2 </t><img size='0.8' align='right' image='GG\images\Bank.paa'/>   <br/>",
	[AsReMixhud_headshots] call BIS_fnc_numberText,//1
	[Zupa_bank] call BIS_fnc_numberText//2
	];
	_vitals ctrlCommit 0;
        
    sleep 2;
};
