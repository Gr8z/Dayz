@echo off
timeout 2
echo.
echo KILL server_3.exe
set serverkill="E:\A2Server"
cd /d %serverkill%
taskkill /f /im server_3.exe
echo.
echo Kill Bec1.exe
set beckill="E:\A2Server\BEC"
cd /d %beckill%
taskkill /f /im Bec_3.exe
echo.
echo Kill EPM_3.exe
set EPMkill="E:\A2Server\EPM"
cd /d %EPMkill%
taskkill /f /im EPM_3.exe
timeout 2
echo.
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"E:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Deleting Old Pbos
del "E:\A2Server\MPMissions\DayZ_GG.Napf.pbo"
del "E:\A2Server\@Server_3\addons\*.pbo"
echo.
echo Starting Log Rotator
timeout 2
:: start Log Log Rotator
set logpath="E:\A2Server\server_3"
cd /d %logpath%
start /min rotate_logs.bat
echo.
timeout 2
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\napf
copy C:\Dayz\steam_appid.txt E:\A2Server\steam_appid.txt
echo.
timeout 2
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_3 E:\A2Server\server_3
echo.
timeout 2
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "E:\A2Server\@Server_3\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\napf" "E:\A2Server\MPMissions\DayZ_GG.Napf.pbo"
echo.
timeout 2
echo.
echo Moving Files back to root
move C:\Dayz\maps\napf\GG C:\Dayz\
echo.
timeout 2
:: start Maintainance
set Maintainancepath="C:\Dayz\SQL_SCRIPTS"
cd /d %Maintainancepath%
start server_3.bat
echo.
echo Starting Dayz Server
timeout 2
:: start the server..
start /REALTIME "arma2" /min "E:\A2Server\server_3.exe" -port=2342 "-config=server_3\config.cfg" "-cfg=server_3\basic.cfg" "-profiles=server_3" -name=server_3 "-mod=@DayzOverwatch;@DayZ_Epoch;@server_3;@extDB;@marma_3" "-BEpath=E:\A2Server\BattlEye"
echo.
echo Starting Bec
timeout 5
:: start bec
set becpath="E:\A2Server\BEC"
cd /d %becpath%
start "Battleye Extended Controls" /min "Bec_3.exe" -f server_3.cfg
echo.
echo Starting MBCon
timeout 5
:: start MBCon
set MBconpath="E:\A2Server\MBcon\server_3"
cd /d %MBconpath%
start "MBCon" /min MBcon_3.exe
echo Starting EPM
timeout 5
:: start EPM
set EPMpath="E:\A2Server\EPM"
cd /d %EPMpath%
start "EPM" /min EPM_3.exe -ip=127.0.0.1 -password=GGNIGGER12 -port=2342
echo.