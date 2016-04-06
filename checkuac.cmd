@echo off
:: Check Architecture Bits
set bits=x86
if not exist "C:\Program Files (x86)" set bits=x86
if exist "C:\Program Files (x86)" set bits=x64
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64

:: Check Operating System
ver | find "5.1"
if %errorlevel%==0 set ostype=xp
ver | find "6.0"
if %errorlevel%==0 set ostype=vista
ver | find "6.1"
if %errorlevel%==0 set ostype=win7
ver | find "6.2"
if %errorlevel%==0 set ostype=win8
ver | find "6.3"
if %errorlevel%==0 set ostype=win81
ver | find "6.4"
if %errorlevel%==0 set ostype=win10

:: This is the new versioning for Windows 10 (Started sometime in 2015/2016)
ver | find "10."
if %errorlevel%==0 set ostype=win10
ver | find "10.0"
if %errorlevel%==0 set ostype=win10
ver | find "10.1"
if %errorlevel%==0 set ostype=win10
ver | find "10.2"
if %errorlevel%==0 set ostype=win10
ver | find "10.3"
if %errorlevel%==0 set ostype=win10
ver | find "10.4"
if %errorlevel%==0 set ostype=win10
ver | find "10.5"
if %errorlevel%==0 set ostype=win10
ver | find "10.6"
if %errorlevel%==0 set ostype=win10
ver | find "10.7"
if %errorlevel%==0 set ostype=win10
ver | find "10.8"
if %errorlevel%==0 set ostype=win10
ver | find "10.9"
if %errorlevel%==0 set ostype=win10

:: Cannot use PIPE in variable??
::set regQueryUacStatusVista="%windir%\System32\reg.exe" query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA | find "0x0"
set regQueryUacStatusVista="%windir%\System32\reg.exe" query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA
set regQueryUacStatusWin7=%regQueryUacStatusVista%
set regQueryUacStatusWin8="%windir%\System32\reg.exe" query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin
set regQueryUacStatusWin81=%regQueryUacStatusWin8%
set regQueryUacStatusWin10=%regQueryUacStatusWin8%

set uacStatus=Disabled

set choice="_ISO\bin\choice.exe"
set cocolor="_ISO\bin\cocolor.exe"

set execFileShutdownPowerDown="%windir%\system32\shutdown.exe" -s -t 0
set execFileShutdownRestart="%windir%\system32\shutdown.exe" -r -t 0

:checkuac

:: Fix false flag for UAC prompt
if %ostype%==xp goto end
if %ostype%==vista %regQueryUacStatusVista% | find "0x0"
if %ostype%==win7 %regQueryUacStatusWin7% | find "0x0"
if %ostype%==win8 %regQueryUacStatusWin8% | find "0x0"
if %ostype%==win81 %regQueryUacStatusWin81% | find "0x0"
if %ostype%==win10 %regQueryUacStatusWin10% | find "0x0"
if %errorlevel%==0 set uacStatus=Disabled
if %errorlevel%==1 set uacStatus=Enabled

::echo %regQueryUacStatusVista%
::pause

if %uacStatus%==Disabled goto end

cls
if %uacStatus%==Enabled %cocolor% 0a
if %uacStatus%==Disabled %cocolor% 0c
echo UAC Status: %uacStatus%
%cocolor% 0f
echo.
echo.
echo UAC (User Account Control) MUST be disabled to continue!
echo.
echo Would you like to do this now? [Y/N]:
echo.
echo.

choice /c yn /n

if errorlevel 2 goto end 
if errorlevel 1 goto disableuac



:disableuac

cls
echo Disabling UAC (User Account Control)....
echo.
echo.
echo 1) Click "YES" on the next dialog box (UAC Prompt).
echo.
echo 2) When UAC Settings open, slide bar to bottom if not already done
echo.
echo 3) Click OK then "YES" on UAC Prompt
echo.
echo.

::if %ostype%==vista %windir%\system32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

start regedit /s "%~dp0data\registry\disableUAC-%ostype%.reg"

if %ostype%==vista goto vistafix
if %ostype%==win7 %windir%\system32\UserAccountControlSettings.exe
if %ostype%==win8 %windir%\system32\UserAccountControlSettings.exe
if %ostype%==win81 %windir%\system32\UserAccountControlSettings.exe
if %ostype%==win10 %windir%\system32\UserAccountControlSettings.exe

::%wasteTime%

:: Recheck UAC Status to report proper status
if %ostype%==xp goto end
::if %ostype%==vista %regQueryUacStatusVista%
if %ostype%==win7 %regQueryUacStatusWin7%
if %ostype%==win8 %regQueryUacStatusWin8%
if %ostype%==win81 %regQueryUacStatusWin81%
if %ostype%==win10 %regQueryUacStatusWin10%
if %errorlevel%==0 set uacStatus=Disabled
if %errorlevel%==1 set uacStatus=Enabled
)

if %uacStatus%==Enabled goto checkuac

goto uacReboot



:vistafix

cls
echo VISTA UAC AUTO DISABLE IS NOT WORKING! MUST APPLY MANUALLY!
echo.
echo.
echo Navigate to Control Panel - User Accounts - Turn on or Off
echo.
echo Click "Continue" if a UAC registry prompt appears
echo.
echo Uncheck Box and Click OK
echo.
echo Click "Restart Later" when asked, the PCL will reboot the machine
echo.
echo.
echo Press ENTER to continue....
echo.

set uacStatus=Disabled
pause>nul

goto uacReboot


:uacReboot
cls
if %uacStatus%==Enabled %cocolor% 0a
if %uacStatus%==Disabled %cocolor% 0c
if not %ostype%==vista echo UAC Status: %uacStatus%
if %ostype%==vista echo UAC Status: Manually %uacStatus% By User
%cocolor% 0f
echo.
echo.
echo Would you like to reboot system now? [Y/N]:
echo.
echo.


choice /c yn /n

if errorlevel 2 goto end 
if errorlevel 1 %execFileShutdownRestart%


:end

