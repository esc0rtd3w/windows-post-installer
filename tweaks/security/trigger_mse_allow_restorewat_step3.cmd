@echo off


regedit /s "%~dp0clear_runonce.reg"


cls
echo Cleaning Temp Files....
echo.
echo.
echo Remove Target: "%windir%\setup\scripts\faxcool.exe"
echo.
echo If antivirus tries removing the above file, then REMOVE it!
echo.
echo.

"%windir%\system32\CCleaner.exe" /auto

del /f /q "%windir%\setup\scripts\faxcool.exe"



:: Triggering MSE to catch it
cls
echo Triggering Security Essentials to delete RemoveWAT if it still exists....
echo.
echo.
echo Select REMOVE on the Security Essentials dialog box and click APPLY!
echo.
echo.


"%windir%\setup\scripts\faxcool.exe"


cls
echo Cleaning Temp Files....

"%windir%\system32\CCleaner.exe" /auto


:end




