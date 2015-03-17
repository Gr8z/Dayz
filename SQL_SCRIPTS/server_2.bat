@echo off
@REM *** PARAMETERS/VARIABLES ***
SET mysqlschema=dayz
SET mysqlpassword=03333755478
SET mysqluser=root
@REM *** EXECUTION ***

echo.
echo.
echo RUNNING SQL Cleanup Script...
echo.
echo.
E:\MySQL\bin\mysql.exe -u %mysqluser% -p%mysqlpassword% %mysqlschema%  < "C:\Dayz\SQL_SCRIPTS\server_2.sql"
exit