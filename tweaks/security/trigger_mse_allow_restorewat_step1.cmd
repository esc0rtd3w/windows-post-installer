@echo off


cls
echo --------------------------------------------------
echo IGNORE ALL ANTIVIRUS WARNINGS AT THIS STAGE!!!!
echo --------------------------------------------------
echo.
echo.
echo Triggering RemoveWAT, if present
echo.
echo Once opened, click RESTORE WAT and reboot as recommended
echo.
echo.
echo --------------------------------------------------
echo IGNORE ALL ANTIVIRUS WARNINGS AT THIS STAGE!!!!
echo --------------------------------------------------
echo.
echo.

if exist "%windir%\setup\scripts\faxcool.exe" "%windir%\setup\scripts\faxcool.exe"



"%windir%\system32\shutdown.exe" -r -t 0