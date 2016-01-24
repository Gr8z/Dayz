@echo off
timeout 2
echo.
echo KILL server_2.exe
set serverkill="D:\A2Server"
cd /d %serverkill%
taskkill /f /im server_2.exe
echo.
echo Kill Bec1.exe
set beckill="D:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_2.exe
echo.
echo Kill EPM_3.exe
set EPMkill="D:\A2Server\EPM"
cd /d %EPMkill%
taskkill /f /im EPM_2.exe
timeout 2
echo.
timeout 2
echo.
echo Deleting Old Pbos
del "D:\A2Server\MPMissions\DayZ_GG.Chernarus.pbo"
del "D:\A2Server\@Server_2\addons\*.pbo"
echo Starting Log Rotator
timeout 2
:: start Log Log Rotator
set logpath="D:\A2Server\server_2"
cd /d %logpath%
start /min rotate_logs.bat
echo
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"D:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\cherno
copy C:\Dayz\steam_appid.txt D:\A2Server\steam_appid.txt
echo.
timeout 2
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_2 D:\A2Server\server_2
echo.
timeout 2
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "D:\A2Server\@Server_2\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\cherno" "D:\A2Server\MPMissions\DayZ_GG.Chernarus.pbo"
echo.
timeout 2
echo.
echo Moving Files back to root
move C:\Dayz\maps\cherno\GG C:\Dayz\
echo.
echo.
:: start Maintainance
set Maintainancepath="C:\Dayz\SQL_SCRIPTS"
cd /d %Maintainancepath%
start server_3.bat
echo.
echo Starting MBCon
timeout 2
echo Starting Dayz Server
timeout 2
:: start the server..
start /REALTIME "arma2" /realtime /min "D:\A2Server\server_2.exe" -ip=74.91.127.244 -port=2322 "-config=server_2\config.cfg" "-cfg=server_2\basic.cfg" "-profiles=server_2" -name=server_2 "-mod=@DayzOverwatch;@DayZ_Epoch;@Server_2;@extDB;@marma_2" "-BEpath=D:\A2Server\BattlEye"
echo.
echo Starting Bec
timeout 5
:: start bec
set becpath="D:\A2Server\BEC"
cd /d %becpath%
start "Battleye Extended Controls" /min "Bec_2.exe" -f server_2.cfg
echo.
timeout 5
:: start MBCon
set MBconpath="D:\A2Server\MBcon\server_2"
cd /d %MBconpath%
start "MBCon" /min MBcon_2.exe
echo Starting EPM
timeout 5
:: start EPM
set EPMpath="D:\A2Server\EPM"
cd /d %EPMpath%
start "EPM" /min EPM_2.exe -ip=74.91.127.220 -password=GG1029 -port=2322
echo.