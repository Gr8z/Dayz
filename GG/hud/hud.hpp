#define hud_status_idc 4900


class AsReMixhud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "AsReMixhud";
	onLoad = "uiNamespace setVariable ['AsReMixhud', _this select 0]";
	
	class controlsBackground {

		class AsReMixhud_Status:Hw_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = 0.57 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
            h = 0.1*safeZoneH;
            w = 0.1*safeZoneW;	
			colorText[] = {1,1,1,1};
			lineSpacing = 4;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "left";
			};
		};

	};
};