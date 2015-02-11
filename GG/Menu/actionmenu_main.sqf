pathtoscripts = "GG\menu\tools\";
pathtocolors = "GG\menu\sky\";
pathtofog = "GG\menu\fog\";
pathtodonations = "GG\menu\donations\";
pathtobuilding = "GG\menu\building\";
pathtoPack = "GG\deployables\";
pathtoclothing = "GG\menu\wardrobe\";
pathtoGroup = "GG\group\";

EXECscript1 = 'player execVM "'+pathtoscripts+'%1"';
EXECscript2 = 'player execVM "'+pathtocolors+'%1"';
EXECscript4 = 'setviewdistance %1;';
EXECscript5 = 'player execVM "'+pathtodonations+'%1"';
EXECscript6 = 'player execVM "'+pathtobuilding+'%1"';
EXECscript7 = '["%1"] execVM "GG\deployables\deploy.sqf"';
EXECscript8 = 'player execVM  "'+pathtoPack+'%1"';
EXECscript9 = '["%1"] execVM "GG\menu\tools\movements.sqf"';
EXECscript10 = '[] spawn %1;';
EXECscript11 = 'player execVM "'+pathtoclothing+'%1"';
EXECscript12 = 'player execVM "'+pathtoGroup+'%1"';

ActionMenu =
[
	["",true],
		["Action Menu >>", [], "#USER:ActionMenua", -5, [["expression", ""]], "1", "1"],
		["Deploy Menu >>", [], "#USER:DeployMenu", -5, [["expression", ""]], "1", "1"],
		["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"],
		["Color Filters Menu>>", [], "#USER:SkyMenu", -5, [["expression", ""]], "1", "1"],
		["Wardrobe Menu >>", [], "#USER:wardrobe", -5, [["expression", ""]], "1", "1"],
		["View Distance (Fog) Menu >>", [], "#USER:FogMenu", -5, [["expression", ""]], "1", "1"],
		["Group  Menu >>", [], "", -5, [["expression", format[EXECscript12,"loadGroupManagement.sqf"]]], "1", "1"],
            ["", [], "", -5, [["expression", ""]], "1", "0"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

ActionMenua =
[
	["",true],
		["Flip Vehicle", [2],  "", -5, [["expression", format[EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
		["Self Bloodbag", [3],  "", -5, [["expression", format[EXECscript1,"bloodbag.sqf"]]], "1", "1"],
		["Commit Suicide", [3],  "", -5, [["expression", format[EXECscript1,"suicide.sqf"]]], "1", "1"],
		["Scream", [4],  "", -5, [["expression", "_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;[nil,player,rSAY,[_sound,250]] call RE;"]], "1", "1"],
		["Hints & Tips - Read Me!", [5],  "", -5, [["expression", format[EXECscript1,"help.sqf"]]], "1", "1"],			
		["Environmental sounds", [6], "#USER:environment", -5, [["expression", ""]], "1", "1"],
		["Toggle Debug Moniter", [7], "", -5, [["expression", format[EXECscript10,"fnc_debugX0"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

DeployMenu =
[
	["",true],
		["Deploy Bike", [2],  "", -5, [["expression", format[EXECscript7,"MMT_Civ"]]], "1", "1"],
		["Deploy Motorcycle", [3],  "", -5, [["expression", format[EXECscript7,"TT650_Civ"]]], "1", "1"],
		["Deploy Gyrocopter", [4],  "", -5, [["expression", format[EXECscript7,"CSJ_GyroC"]]], "1", "1"],
		["Pack Created Vehicle", [5],  "", -5, [["expression", format[EXECscript8,"pack.sqf"]]], "1", "1"],		
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

MovementMenu =
[
	["",true],
	["Dance1",[],"", -5,[["expression",format[EXECscript9,"ActsPercMstpSnonWnonDnon_DancingDuoIvan"]]],"1","1"],
	["Dance2",[],"", -5,[["expression",format[EXECscript9,"ActsPercMstpSnonWnonDnon_DancingDuoStefan"]]],"1","1"],
	["Dance3",[],"", -5,[["expression",format[EXECscript9,"ActsPercMstpSnonWnonDnon_DancingStefan"]]],"1","1"],
	["Boxing",[],"", -5,[["expression",format[EXECscript9,"AmovPercMstpSnonWnonDnon_idle68boxing"]]],"1","1"],
	["Karate",[],"", -5,[["expression",format[EXECscript9,"AmovPercMstpSnonWnonDnon_exerciseKata"]]],"1","1"],
	["Pushups",[],"", -5,[["expression",format[EXECscript9,"AmovPercMstpSnonWnonDnon_exercisePushup"]]],"1","1"],
	["Squat",[],"", -5,[["expression",format[EXECscript9,"AmovPercMstpSnonWnonDnon_exercisekneeBendA"]]],"1","1"],
	["HandStand",[],"", -5,[["expression",format[EXECscript9,"AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];

SkyMenu =
[
["",true],
        ["Color Bluff", [2],  "", -5, [["expression", format[EXECscript2 ,"16.sqf"]]], "1", "1"],
        ["Dark Draining", [4],  "", -5, [["expression", format[EXECscript2 ,"3.sqf"]]], "1", "1"],
        ["Sandy", [5],  "", -5, [["expression", format[EXECscript2 ,"4.sqf"]]], "1", "1"],
        ["Summer Chernarus", [6],  "", -5, [["expression", format[EXECscript2 ,"5.sqf"]]], "1", "1"],
        ["Dog Vision", [7],  "", -5, [["expression", format[EXECscript2 ,"6.sqf"]]], "1", "1"],
        ["Tropical", [8],  "", -5, [["expression", format[EXECscript2 ,"7.sqf"]]], "1", "1"],
        ["Photo", [9],  "", -5, [["expression", format[EXECscript2 ,"8.sqf"]]], "1", "1"],
        ["WarZone", [10],  "", -5, [["expression", format[EXECscript2 ,"9.sqf"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["Next page", [12], "#USER:SkyMenu2", -5, [["expression", ""]], "1", "1"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
SkyMenu2 =
[
["",true],

        ["Operation Flashpoint", [2],  "", -5, [["expression", format[EXECscript2 ,"10.sqf"]]], "1", "1"],
        ["Africa", [3],  "", -5, [["expression", format[EXECscript2 ,"11.sqf"]]], "1", "1"],
        ["Blue", [4],  "", -5, [["expression", format[EXECscript2 ,"12.sqf"]]], "1", "1"],
        ["Arma Mission Colours", [5],  "", -5, [["expression", format[EXECscript2 ,"13.sqf"]]], "1", "1"],
        ["Heavy Colour Correction", [6],  "", -5, [["expression", format[EXECscript2 ,"14.sqf"]]], "1", "1"],
        ["Zombie View", [7],  "", -5, [["expression", format[EXECscript2 ,"15.sqf"]]], "1", "1"],
        ["Wasteland", [8],  "", -5, [["expression", format[EXECscript2 ,"2.sqf"]]], "1", "1"],
        ["Clear Contrast", [9],  "", -5, [["expression", format[EXECscript2 ,"1.sqf"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
FogMenu =
[
["",true],
        ["250M", [2],  "", -5, [["expression", format[EXECscript4 ,"250"]]], "1", "1"],
        ["500M", [3],  "", -5, [["expression", format[EXECscript4 ,"500"]]], "1", "1"],
        ["750M", [4],  "", -5, [["expression", format[EXECscript4 ,"750"]]], "1", "1"],
        ["1000M", [5],  "", -5, [["expression", format[EXECscript4 ,"1000"]]], "1", "1"],
        ["1250M", [6],  "", -5, [["expression", format[EXECscript4 ,"1250"]]], "1", "1"],
        ["1500M", [7],  "", -5, [["expression", format[EXECscript4 ,"1500"]]], "1", "1"],
        ["1750M", [8],  "", -5, [["expression", format[EXECscript4 ,"1750"]]], "1", "1"],
        ["2000M", [9],  "", -5, [["expression", format[EXECscript4 ,"2000"]]], "1", "1"],
        ["2500M", [10],  "", -5, [["expression", format[EXECscript4 ,"2500"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["Next page", [12], "#USER:FogMenu2", -5, [["expression", ""]], "1", "1"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
FogMenu2 =
[
["",true],
        ["3000M", [2],  "", -5, [["expression", format[EXECscript4 ,"3000"]]], "1", "1"],
        ["4000M", [3],  "", -5, [["expression", format[EXECscript4 ,"4000"]]], "1", "1"],
        ["5000M", [4],  "", -5, [["expression", format[EXECscript4 ,"5000"]]], "1", "1"],
        ["10000M", [5],  "", -5, [["expression", format[EXECscript4 ,"10000"]]], "1", "1"],
        ["20000M (Super Computer)", [6],  "", -5, [["expression", format[EXECscript4 ,"20000.sqf"]]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
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
		["Men Clothing", [2], "", -5, [["expression", format[EXECscript11,"open_dialog.sqf"]]], "1", "1"],
		["Women Clothing", [3], "", -5, [["expression", format[EXECscript11,"open_dialog2.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:ActionMenu";