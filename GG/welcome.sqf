_onScreenTime = 6; 		

waitUntil {!isNil "dayz_animalCheck"}; 
sleep 5;
_role1 = "Welcome To:";
_role1names = ["[GG] Ghostz Gamerz","Dayz Overpoch"];
_role2 = "Group Management";
_role2names = ["Group with your friends", "Press Right Shift to Use"];
_role3 = "Deploy a Bike!";
_role3names = ["Right click on toolbox to open deployable menu"];
_role4 = "Free Builders Kit";			
_role4names = ["Get a Builders Kit", "By Signing up on the forums","Posting 30 posts","More info on TS"];
_role5 = "10k Free Coins!";
_role5names = ["Get 10,000 coins from admins", "To receive them, Join Our Teamspeak Server","ts.ghostzgamerz.com"];
_role6 = "Weed Farming";
_role6names = ["Use Hunting knife to harvest weed","Weed Farm is marked on the map"];
_role7 = "Base Maintenance";
_role7names = ["Maintain Every 10 days to prevent deletion of your base"];
_role8 = "Admin Support";
_role8names = ["Teamspeak Support Channels","Website Forums"];
_role9 = "Donation Perks";
_role9names = ["Donations gets you cool perks","Check out ghostzgamerz.com for more info"];
_role10 = "Claim Vehicle";
_role10names = ["Get 10oz Gold and Keymakers Kit","Scroll on a unlocked vehicle to claim"];
_role11 = "Action Menu";
_role11names = ["Press Right ALT to Open up a Menu","Activate it when you need it"];
_role12 = "Virtual Garage";
_role12names = ["Store your vehicle free of charge at a Vehicle Trader","You can deploy it with an etool"];
_role13 = "Earplugs";
_role13names = ["Activate Your Earplugs by pressing Y","It will soften the volume and disable environment noise."];
_role14 = "Twitter";
_role14names = ["Follow us @GhostzGamerz","Mention us and we will retweet"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.70' color='#013ADF' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.60' color='#848484' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names],
	[_role9, _role9names],
	[_role10, _role10names],			
	[_role11, _role11names],
	[_role12, _role12names],
	[_role13, _role13names],
	[_role14, _role14names]	//make SURE the last one here does NOT have a , at the end
];