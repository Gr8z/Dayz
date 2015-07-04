closeDialog 0;
the_color_menu =
[
	["",true],
		["Normal", [11],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\normal.sqf'"]], "1", "1"],
		["Contrast", [2],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\clear.sqf'"]], "1", "1"],
		["Wasteland", [3],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\wasteland.sqf'"]], "1", "1"],
		["Color Buff", [4],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\colorbuff.sqf'"]], "1", "1"],
		["Summer", [5],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\summer.sqf'"]], "1", "1"],
		["Africa", [6],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\africa.sqf'"]], "1", "1"],
		["Tropical", [7],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\tropical.sqf'"]], "1", "1"],
		["Flashpoint", [8],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\flashpoint.sqf'"]], "1", "1"],
		["Dark Drain", [9],  "", -5, [["expression", 	"[] execVM 'Scripts\colors\darkdrain.sqf'"]], "1", "1"]
];
showCommandingMenu "#USER:the_color_menu";


