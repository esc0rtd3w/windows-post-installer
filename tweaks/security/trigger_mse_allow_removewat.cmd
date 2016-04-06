@echo off

cls
echo Triggering Microsoft Security Essentials
echo.
echo.
echo When warning displays, click SHOW DETAILS button.
echo.
echo Then select ALLOW from recommended action and APPLY ACTIONS....
echo.
echo.
echo If there are 2 detections, one is the active process, so allow both.
echo.
echo.
echo Once allowed in MSE, close RemoveWAT window!
echo.


::explorer "%windir%\setup\scripts"

if exist "%windir%\setup\scripts\faxcool.exe" "%windir%\setup\scripts\faxcool.exe"




