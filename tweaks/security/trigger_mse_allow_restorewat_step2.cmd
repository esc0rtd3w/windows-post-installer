@echo off


cls
echo Checking if RemoveWAT still exists
echo.
echo.
echo If MSE warning displays, click SHOW DETAILS button.
echo.
echo Then select REMOVE from recommended action and APPLY ACTIONS....
echo.



::explorer "%windir%\setup\scripts"

if exist "%windir%\setup\scripts\faxcool.exe" del /s /q "%windir%\setup\scripts\faxcool.exe"

regedit /s "%~dp0clear_runonce.reg"

:: Triggering final step to launch after reboot
regedit /s "%~dp0trigger_mse_allow_restorewat_step3.reg"


cls
echo Triggering Windows Loader
echo.
echo Select INSTALL and let it finish.
echo.
echo ***Even if the status says "Licensed" click Install anyways***
echo.
echo Once finished, close the Windows Loader and prepare for reboot....
echo.
echo ----------------------------------------------
echo DO NOT CLICK REBOOT WHEN LOADER FINISHES!!!
echo.
echo JUST CLOSE THE WINDOW!!
echo ----------------------------------------------
echo.
echo.
echo ***If Antivirus tries blocking it, then ALLOW it to be executed***
echo.


"%temp%\Win7Loader.exe"




"%windir%\system32\shutdown.exe" -r -t 0


