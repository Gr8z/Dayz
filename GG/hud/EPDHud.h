#define CT_STATIC 0
#define ST_LEFT           0x00
#define ST_PICTURE        48

class playerStatusGUI {
	idd = 6900;
	movingEnable = 0;
	duration = 100000;
	name = "statusBorder";
	onLoad = "uiNamespace setVariable ['DAYZ_GUI_display', _this select 0];";
	class ControlsBackground {
		//BROKEN LEG
        class RscPicture_1203: RscPictureGUI
        {
            idc = 1203;
            text = "\z\addons\dayz_code\gui\status\status_effect_brokenleg.paa";
            x = 0.32 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.055*safeZoneH;
                w = 0.033*safeZoneW;
            colorText[] = {1,1,1,1};
        };
		//TEMP BACKGROUND
        class RscPicture_1908: RscPictureGUI
        {
            idc = 1908;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.350 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//TEMP BORDER
        class RscPicture_1208: RscPictureGUI
        {
            idc = 1208;
            text = "\z\addons\dayz_code\gui\status\status_temp_outside_ca.paa";
            x = 0.350 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//BLOOD BACKGROUND
        class RscPicture_1900: RscPictureGUI
        {
            idc = 1900;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.380 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//BLOOD BORDER
        class RscPicture_1200: RscPictureGUI
        {
            idc = 1200;
            text = "\z\addons\dayz_code\gui\status\status_blood_border_ca.paa";
            x = 0.380 * safezoneW + safezoneX;
            y = 0.93* safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		
		//FOOD BACKGROUND
        class RscPicture_1901: RscPictureGUI
        {
            idc = 1901;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.41 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//FOOD BORDER
        class RscPicture_1201: RscPictureGUI
        {
            idc = 1201;
            text = "\z\addons\dayz_code\gui\status\status_food_border_ca.paa";
            x = 0.41 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//THIRST BACKGROUND
        class RscPicture_1902: RscPictureGUI
        {
            idc = 1902;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.44 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//THIRST BORDER
        class RscPicture_1202: RscPictureGUI
        {
            idc = 1202;
            text = "\z\addons\dayz_code\gui\status\status_thirst_border_ca.paa";
            x = 0.44 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//COMBAT BACKGROUND
		class RscPicture_1907: RscPictureGUI
		{
            idc = 1907;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.475 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//COMBAT BORDER
		class RscPicture_1207: RscPictureGUI
		{
            idc = 1207;
            text = "\z\addons\dayz_code\gui\status\status_combat_border_CA.paa";
            x = 0.475 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//NOISE BACKGROUND
        class RscPicture_1205: RscPictureGUI
        {
            idc = 1205;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.51 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
        };
		//VISIBLE BACKGROUND
        class RscPicture_1206: RscPictureGUI
        {
            idc = 1206;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.54 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;			
        };

		//SURVIVOR ICON
		class RscPicture_1308: RscPictureGUI
		{
			idc = 1308;
			text = "GG\images\st_humanity_survivor.paa";
			x = 0.66 * safezoneW + safezoneX;
			y = 0.90 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		//BANDIT ICON
		class RscPicture_1309: RscPictureGUI
		{
			idc = 1309;
			text = "GG\images\st_humanity_bandit.paa";
			x = 0.66 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		//ZOMBIE ICON
		class RscPicture_1310: RscPictureGUI
		{
			idc = 1310;
			text = "GG\images\zombie.paa";
			x = 0.66 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.027 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		//FPS BACKGROUND
        class RscText_1322: RscPictureGUI
        {
            idc = 1322;
            text = "\z\addons\dayz_code\gui\status\status_bg.paa";
            x = 0.95 * safezoneW + safezoneX;
            y = 0.91 * safezoneH + safezoneY;
            w = 0.037 * safezoneW;
            h = 0.047 * safezoneH;
        };
    };
        class Controls {
			//TEMP ICON
            class RscPicture_1306: RscPictureGUI
            {
                idc = 1306;
				x = 0.35 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };		
			//BLOOD ICON
            class RscPicture_1300: RscPictureGUI
            {
                idc = 1300;
                x = 0.38 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };		
			//FOOD ICON
            class RscPicture_1301: RscPictureGUI
            {
                idc = 1301;

                x = 0.41 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };
			//THIRST ICON
            class RscPicture_1302: RscPictureGUI
            {
                idc = 1302;

                x = 0.44 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;				
            };
			//BLOOD ICON - BLEEDING
            class RscPicture_1303: RscPictureGUI
            {
                idc = 1303;
                text = "\z\addons\dayz_code\gui\status\status_bleeding_ca.paa";
                x = 0.382 * safezoneW + safezoneX;
                y = 0.932 * safezoneH + safezoneY;
                h = 0.049*safeZoneH;
                w = 0.032*safeZoneW;				
                colorText[] = {1,1,1,0.5};
            };
			//NOISE ICON
            class RscPicture_1304: RscPictureGUI
            {
                idc = 1304;
                text = "\z\addons\dayz_code\gui\status\status_noise.paa";
                x = 0.51 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;				
            };
			//VISIBLE ICON
            class RscPicture_1305: RscPictureGUI
            {
                idc = 1305;
                text = "\z\addons\dayz_code\gui\status\status_visible.paa";
                x = 0.54 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;				
            };
			//COMBAT ICON
			class RscPicture_1307: RscPictureGUI
            {
                idc = 1307;
                text = "\z\addons\dayz_code\gui\status\status_combat_inside_ca.paa";
                x = 0.475 * safezoneW + safezoneX;
                y = 0.93 * safezoneH + safezoneY;
                h = 0.057*safeZoneH;
                w = 0.034*safeZoneW;
            };
			//FPS
            class RscText_1321: RscTextGUIK
            {
                idc = 1321;
                text = "fps";
                x = 0.95 * safezoneW + safezoneX;
                y = 0.91 * safezoneH + safezoneY;
                w = 0.037 * safezoneW;
                h = 0.047 * safezoneH;
                size = 0.065;
                sizeEx = 0.065;
                colorText[] = {1,1,1,0.0};
            };
		//SURVIVOR KILLS
		class RscText_1400: RscTextGUIK
		{
			idc = 1400;
			text = "1000";
			x = 0.673 * safezoneW + safezoneX;
			y = 0.90 * safezoneH + safezoneY;
			w = 0.037 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//BANDIT KILLS
		class RscText_1402: RscTextGUIK
		{
			idc = 1402;
			text = "1000";
			x = 0.673 * safezoneW + safezoneX;
			y = 0.93 * safezoneH + safezoneY;
			w = 0.037 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//ZOMBIE KILLS
		class RscText_1403: RscTextGUIK
		{
			idc = 1403;
			text = "1000";
			x = 0.673 * safezoneW + safezoneX;
			y = 0.96 * safezoneH + safezoneY;
			w = 0.037 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//BLOOD AMOUNT
		class RscText_1420: RscTextGUIK
		{
			idc = 1420;
			text = "1000";
			x = 0.40 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.040 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {0.8,0.07,0.06,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//HUMANITY AMOUNT
		class RscText_1421: RscTextGUIK
		{
			idc = 1421;
			text = "1000";
			x = 0.49 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.040 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//SERVER RESTART AMOUNT
		class RscText_1422: RscTextGUIK
		{
			idc = 1422;
			text = "X";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.040 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,0.8,0,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//BLOOD LABEL
		class RscText_1423: RscTextGUIK
		{
			idc = 1423;
			text = "Blood (%):";
			x = 0.33 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		//HUMANITY LABEL
		class RscText_1424: RscTextGUIK
		{
			idc = 1424;
			text = "Humanity:";
			x = 0.43 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		// Players near
		class RscText_1425: RscTextGUIK
		{
			idc = 1425;
			text = "Online Players:";
			x = 0.53 * safezoneW + safezoneX;
			y = 0.895 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
		class RscText_1428: RscTextGUIK
		{
			idc = 1428;
			text = "Ghostz Gamerz";
			x = 0.882 * safezoneW + safezoneX;
			y = 0.86 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {0,0.6,1,1};
			size = 0.045;
			sizeEx = 0.045;
		};
		class RscText_1429: RscTextGUIK
		{
			idc = 1426;
			text = "FPS";
			x = 0.89 * safezoneW + safezoneX;
			y = 0.88 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.047 * safezoneH;
			colorText[] = {1,1,1,1.0};
			size = 0.03;
			sizeEx = 0.03;
		};
	};
};