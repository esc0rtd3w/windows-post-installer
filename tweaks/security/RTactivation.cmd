@echo off

if /i NOT "%PROCESSOR_ARCHITECTURE%"=="arm" goto PROCFAIL

bcdedit >nul

if not "%errorlevel%" == "0" (
echo.
echo Please run the script under an elevated window
echo.
goto EXIT
)

net stop sppsvc

attrib -h "%windir%\system32\spp\store\data.dat"
del "%windir%\system32\spp\store\data.dat"

REM cscript.exe "%windir%\system32\slmgr.vbs" /rilc >nul

cscript.exe "%windir%\system32\slmgr.vbs" /ipk DFTNP-7RDH4-XQ2MD-B4GJJ-XWXYP >nul

net stop sppsvc

cscript.exe "%windir%\system32\slmgr.vbs" /ato

REM install Office 15 pkey

pushd "%ProgramFiles%\Microsoft Office\Office15"
cscript ospp.vbs /inpkey:NWRBC-7R7BX-XBC32-V69M4-R3H4F
popd

pause
goto EXIT

:PROCFAIL
echo.
echo This script must be run on Windows RT device
echo.
:EXIT
