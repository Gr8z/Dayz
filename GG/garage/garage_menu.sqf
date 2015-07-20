_info = "This is a Hived Vehicle Garage system. You can your vehicles here with or without gear. It will be saved virtually and will be accessible from all garages and vehicle traders accross the maps. You can also access these vehicles across all our servers.";

GGgarageMenu =
[
    ["",true],
        ["Garage:", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["My Garage", [2],  "", -5, [["expression", "[] execVM 'GG\garage\vehicle_dialog.sqf'"]], "1", "1"],
			["Store Vehicle", [3],  "", -5, [["expression", "[] execVM 'GG\garage\vehicle_store_list.sqf'"]], "1", "1"],
			["Info", [4],  "", -5, [["expression", "hint _info"]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
        ["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:GGgarageMenu";