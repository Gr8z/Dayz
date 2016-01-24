@ECHO OFF
timeout 2
echo.
echo KILL server_1.exe
set serverkill="D:\A2Server"
cd /d %serverkill%
taskkill /f /im server_1.exe
echo.
echo Kill Bec1.exe
set beckill="D:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_1.exe
echo.
echo Kill EPM_1.exe
set EPMkill="D:\A2Server\EPM"
cd /d %EPMkill%
taskkill /f /im EPM_1.exe
echo Starting Log Rotator
timeout 2
:: start Log Log Rotator
set logpath="D:\A2Server\server_1"
cd /d %logpath%
start rotate_logs.bat
echo
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"D:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Deleting Old Pbos
del "D:\A2Server\MPMissions\DayZ_GG.Tavi.pbo"
del "D:\A2Server\@Server_1\addons\*.pbo"
echo.
timeout 2
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\tavi
copy C:\Dayz\steam_appid.txt D:\A2Server\steam_appid.txt
echo.
timeout 2
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_1 D:\A2Server\server_1
echo.
timeout 2
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "D:\A2Server\@Server_1\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\tavi" "D:\A2Server\MPMissions\DayZ_GG.Tavi.pbo"
echo.
timeout 2
echo.
echo Moving Files back to root
move C:\Dayz\maps\tavi\GG C:\Dayz\
echo.
timeout 2
:: start Maintainance
set Maintainancepath="C:\Dayz\SQL_SCRIPTS"
cd /d %Maintainancepath%
start server_1.bat
echo.
echo Starting Dayz Server
timeout 2
:: start the server..
start "arma2" /realtime /min "D:\A2Server\server_1.exe" -ip=74.91.127.244 -port=3302 "-config=server_1\config.cfg" "-cfg=server_1\basic.cfg" "-profiles=server_1" "-name=server_1" "-mod=@Taviana;@DayzOverwatch;@DayZ_Epoch;@Server_1;@extDB;@marma_1" "-BEpath=D:\A2Server\BattlEye"
echo.
echo Starting Bec
timeout 5
:: start bec
set becpath="D:\A2Server\BEC"
cd /d %becpath%
start "Battleye Extended Controls" /min "Bec_1.exe" -f server_1.cfg
echo Starting MBCon
timeout 5
:: start MBCon
set MBconpath="D:\A2Server\MBcon\server_1"
cd /d %MBconpath%
start "MBCon" /min MBcon_1.exe
echo Starting EPM
timeout 5
:: start EPM
set EPMpath="D:\A2Server\EPM"
cd /d %EPMpath%
start "EPM" /min EPM_1.exe -ip=74.91.127.244 -password=GG1029 -port=3302
echo.