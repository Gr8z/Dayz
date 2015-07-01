@ECHO OFF
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure ([Y]/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
echo.
echo Kill Bec3.exe
set beckill="E:\A2Server\BEC"
cd /d %beckill%
taskkill /im Bec_3.exe
timeout 2
echo
echo Starting 5 Minute Bec
timeout 2
:: start bec
set becpath="E:\A2Server\BEC"
cd /d %becpath%
start "" "Bec_3.exe" -f server_3_5min.cfg
echo.
:END
endlocal