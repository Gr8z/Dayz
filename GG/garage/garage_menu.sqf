GGgarageMenu =
[
    ["",true],
        ["Vehicle Storage:", [-1], "", -5, [["expression", ""]], "1", "0"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Store Vehicles", [2],  "", -5, [["expression", "[] execVM 'GG\garage\vehicle_store_list.sqf'"]], "1", "1"],
			["Withraw Vehicles", [3],  "", -5, [["expression", "[] execVM 'GG\garage\vehicle_dialog.sqf'"]], "1", "1"],
			["Info", [4],  "", -5, [["expression", "[] execVM 'GG\garage\help.sqf'"]], "1", "1"],
            ["", [-1], "", -5, [["expression", ""]], "1", "0"],
        ["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:GGgarageMenu";