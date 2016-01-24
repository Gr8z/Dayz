@echo off
timeout 2
echo.
echo KILL server_test.exe
set serverkill="D:\A2Server"
cd /d %serverkill%
taskkill /f /im server_test.exe
timeout 1
taskkill /f /im ArmA2OA_BE.exe
echo.
timeout 1
echo.
echo Deleting Old Pbos
del "D:\A2Server\MPMissions\DayZ_GG_Test.Tavi.pbo"
del "D:\A2Server\@server_test\addons\*.pbo"
timeout 1
echo
:: UPDATING GITHUB REPOS
echo Updating Git Branch Dayz
"D:\A2Server\A2_Git_Sync.sh"
timeout 2
echo.
echo Starting Log Rotator
timeout 1
:: start Log Log Rotator
set logpath="D:\A2Server\server_test"
cd /d %logpath%
start rotate_logs.bat
echo.
echo.
timeout 1
echo.
echo Moving Files into the mission
move C:\Dayz\GG C:\Dayz\maps\tavi
echo.
timeout 1
echo.
echo Moving Files into the Configs
XCOPY C:\Dayz\configs\server_test D:\A2Server\server_test
echo.
timeout 1
echo.
echo Creating New Pbos
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\dayz_server" "D:\A2Server\@server_test\addons\dayz_server.pbo"
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "C:\Dayz\maps\Tavi" "D:\A2Server\MPMissions\DayZ_GG_Test.Tavi.pbo"
echo.
timeout 1
echo.
echo Moving Files back to root
move C:\Dayz\maps\tavi\GG C:\Dayz\
echo.
echo Starting Dayz Server
timeout 1
start /REALTIME "arma2" /min "D:\A2Server\server_test.exe" "-port=2362" "-config=server_test\config.cfg" "-mod=@Taviana;@DayzOverwatch;@DayZ_Epoch;@server_test;" "-cfg=server_test\basic.cfg" "-profiles=server_test" "-name=server_test" "-malloc=tbb3malloc_bi"  -world=Tavi -cpuCount=4 -exThreads=1 -maxmem=2047 -noCB -BEpath=D:\A2Server\server_test\BattlEye
echo.
cls
@exit