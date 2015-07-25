_pathtoscripts = "GG\menu\tools\";
_pathtocolors = "GG\menu\sky\";
_pathtofog = "GG\menu\fog\";
_pathtodonations = "GG\menu\donations\";
_pathtobuilding = "GG\menu\building\";
_pathtoPack = "GG\deployables\";
_pathtoclothing = "GG\menu\wardrobe\";
_pathtoGroup = "GG\group\";
_pathtoAirDrop = "GG\";

_EXECscript1 = 'player execVM "'+_pathtoscripts+'%1"';
_EXECscript2 = 'player execVM "'+_pathtocolors+'%1"';
_EXECscript4 = 'setviewdistance %1;';
_EXECscript5 = 'player execVM "'+_pathtodonations+'%1"';
_EXECscript6 = 'player execVM` "'+_pathtobuilding+'%1"';
_EXECscript7 = '["%1"] execVM "GG\deployables\deploy.sqf"';
_EXECscript8 = 'player execVM  "'+_pathtoPack+'%1"';
_EXECscript9 = '["%1"] execVM "GG\menu\tools\movements.sqf"';
_EXECscript10 = '[] spawn %1;';
_EXECscript11 = 'player execVM "'+_pathtoclothing+'%1"';
_EXECscript12 = 'player execVM "'+_pathtoGroup+'%1"';
_EXECscript13 = 'player execVM "'+_pathtoAirDrop+'%1"';

ActionMenu =
[
	["",true],
		["Action Menu >>", [], "#USER:ActionMenua", -5, [["expression", ""]], "1", "1"],
		["Color Filters Menu >>", [], "#USER:SkyMenu", -5, [["expression", ""]], "1", "1"],
		["Toggle Earplugs >>", [], "#USER:EarMenu", -5, [["expression", ""]], "1", "1"],
		["Toggle Environmental sounds >>", [], "#USER:environment", -5, [["expression", ""]], "1", "1"],
		["Toggle Grass >>", [], "#USER:grass", -5, [["expression", ""]], "1", "1"],
		["Wardrobe Menu >>", [], "#USER:wardrobe", -5, [["expression", ""]], "1", "1"],
		["View Distance (Fog) Menu >>", [], "#USER:FogMenu", -5, [["expression", ""]], "1", "1"],
		["Group  Menu >>", [], "", -5, [["expression", format[_EXECscript12,"loadGroupManagement.sqf"]]], "1", "1"],
            ["", [], "", -5, [["expression", ""]], "1", "0"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ActionMenua =
[
	["",true],
		["Flip Vehicle", [2],  "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
		["Call Air Drop", [3],  "", -5, [["expression", format[_EXECscript13,"carepackage.sqf"]]], "1", "1"],
		["Scan Players (1000m)", [4],  "", -5, [["expression", format[_EXECscript13,"player_nearMe.sqf"]]], "1", "1"],
		["Self Bloodbag", [5],  "", -5, [["expression", format[_EXECscript1,"bloodbag.sqf"]]], "1", "1"],
		["Commit Suicide", [6],  "", -5, [["expression", format[_EXECscript1,"suicide.sqf"]]], "1", "1"],
		["Scream", [7],  "", -5, [["expression", "_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;[nil,player,rSAY,[_sound,250]] call RE;"]], "1", "1"],
		["Hints & Tips - Read Me!", [8],  "", -5, [["expression", format[_EXECscript1,"help.sqf"]]], "1", "1"],			
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

SkyMenu =
[
["",true],
        ["Normal", [11],  "", -5, [["expression", format[_EXECscript2 ,"normal.sqf"]]], "1", "1"],
        ["Contrast", [2],  "", -5, [["expression", format[_EXECscript2 ,"clear.sqf"]]], "1", "1"],
        ["Wasteland", [3],  "", -5, [["expression", format[_EXECscript2 ,"wasteland.sqf"]]], "1", "1"],
        ["Color Buff", [4],  "", -5, [["expression", format[_EXECscript2 ,"colorbuff.sqf"]]], "1", "1"],
        ["Summer", [5],  "", -5, [["expression", format[_EXECscript2 ,"summer.sqf"]]], "1", "1"],
        ["Africa", [6],  "", -5, [["expression", format[_EXECscript2 ,"africa.sqf"]]], "1", "1"],
        ["Tropical", [7],  "", -5, [["expression", format[_EXECscript2 ,"tropical.sqf"]]], "1", "1"],
        ["Flashpoint", [8],  "", -5, [["expression", format[_EXECscript2 ,"flashpoint.sqf"]]], "1", "1"],
        ["Dark Drain", [9],  "", -5, [["expression", format[_EXECscript2 ,"darkdrain.sqf"]]], "1", "1"],
        ["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
FogMenu =
[
["",true],
        ["250M", [2],  "", -5, [["expression", format[_EXECscript4 ,"250"]]], "1", "1"],
        ["500M", [3],  "", -5, [["expression", format[_EXECscript4 ,"500"]]], "1", "1"],
        ["750M", [4],  "", -5, [["expression", format[_EXECscript4 ,"750"]]], "1", "1"],
        ["1000M", [5],  "", -5, [["expression", format[_EXECscript4 ,"1000"]]], "1", "1"],
        ["1250M", [6],  "", -5, [["expression", format[_EXECscript4 ,"1250"]]], "1", "1"],
        ["1500M", [7],  "", -5, [["expression", format[_EXECscript4 ,"1500"]]], "1", "1"],
        ["1750M", [8],  "", -5, [["expression", format[_EXECscript4 ,"1750"]]], "1", "1"],
        ["2000M", [9],  "", -5, [["expression", format[_EXECscript4 ,"2000"]]], "1", "1"],
        ["2500M", [10],  "", -5, [["expression", format[_EXECscript4 ,"2500"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["Next page", [12], "#USER:FogMenu2", -5, [["expression", ""]], "1", "1"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
FogMenu2 =
[
["",true],
        ["3000M", [2],  "", -5, [["expression", format[_EXECscript4 ,"3000"]]], "1", "1"],
        ["4000M", [3],  "", -5, [["expression", format[_EXECscript4 ,"4000"]]], "1", "1"],
        ["5000M", [4],  "", -5, [["expression", format[_EXECscript4 ,"5000"]]], "1", "1"],
        ["6000M", [4],  "", -5, [["expression", format[_EXECscript4 ,"6000"]]], "1", "1"],
        ["7000M", [4],  "", -5, [["expression", format[_EXECscript4 ,"7000"]]], "1", "1"],
        ["8000M", [4],  "", -5, [["expression", format[_EXECscript4 ,"8000"]]], "1", "1"],
        ["9000M", [4],  "", -5, [["expression", format[_EXECscript4 ,"9000"]]], "1", "1"],
        ["10000M", [5],  "", -5, [["expression", format[_EXECscript4 ,"10000"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

grass =
[
	["",true],
	["ON", [2],  "", -5, [["expression","setTerrainGrid 25; systemChat('Grass turned ON');"]], "1", "1"],
	["OFF", [3],  "", -5, [["expression","setTerrainGrid 50; systemChat('Grass turned OFF');"]], "1", "1"]
];

EarMenu =
[
	["",true],
	["ON", [2],  "", -5, [["expression","1 fadeSound 0.2;enableEnvironment false;((uiNamespace getVariable 'EarPlugs') displayCtrl 1) ctrlSetStructuredText parseText ""<t size='4' align='left' valign='middle'><img image='GG\images\earplugs.paa' /></t>"";GGEARPLUGS = false;"]], "1", "1"],
	["OFF", [3],  "", -5, [["expression","1 fadeSound 1;enableEnvironment true;((uiNamespace getVariable 'EarPlugs') displayCtrl 1) ctrlSetStructuredText parseText '';GGEARPLUGS = true;"]], "1", "1"]
];

environment =
[
	["",true],
	["ON", [2],  "", -5, [["expression","enableEnvironment true;"]], "1", "1"],
	["OFF", [3],  "", -5, [["expression","enableEnvironment false;"]], "1", "1"]
];

wardrobe =
[
	["",true],
		["Men Clothing", [2], "", -5, [["expression", format[_EXECscript11,"open_dialog.sqf"]]], "1", "1"],
		["Women Clothing", [3], "", -5, [["expression", format[_EXECscript11,"open_dialog2.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:ActionMenu";