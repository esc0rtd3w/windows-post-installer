@echo off

title Reload Common Applications

set choice="_ISO\bin\choice.exe"
set cocolor="_ISO\bin\cocolor.exe"

set root=%~dp0

set pf=%systemdrive%\Program Files
set cf=%systemdrive%\Program Files\Common Files
set pf64=%systemdrive%\Program Files (x86)
set cf64=%systemdrive%\Program Files (x86)\Common Files
set pd=%ProgramData%
set adl=%LocalAppData%
set adll=%SystemDrive%%HomePath%\AppData\LocalLow
set adr=%AppData%
set cu=%UserProfile%
set win=%windir%
set sys32=%windir%\system32
set sysprofile=%windir%\system32\config\systemprofile
set userdir=%userprofile%
set mydocs=%userprofile%\My Documents
set mydownloads=%userprofile%\Downloads
set temp1=%temp%
set temp2=%systemdrive%\Temp
set temp3=%windir%\Temp
set temp4=%windir%\system32\config\systemprofile\AppData\Local\Temp

:: Timers
set wait1=ping -n 1 127.0.0.1 | find "Reply" > nul
set wait3=ping -n 3 127.0.0.1 | find "Reply" > nul
set wait10=ping -n 10 127.0.0.1 | find "Reply" > nul
set wait30=ping -n 30 127.0.0.1 | find "Reply" > nul
set wait60=ping -n 60 127.0.0.1 | find "Reply" > nul
set wait120=-n 120 127.0.0.1 | find "Reply" > nul


:checkbits
set bits=x86
if not exist "%pf64%" set bits=x86
if exist "%pf64%" set bits=x64

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set bits=x64

goto checkos


:checkos

:: Check Operating System

:: Set Default OS
set ostype=windows

:: Check common OS versions
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


:: UAC Stuff
:: XP Fix
set uacStatus=none

::if %ostype%==vista goto checkuac
::if %ostype%==win7 goto checkuac
::if %ostype%==win8 goto checkuac
::if %ostype%==win81 goto checkuac

if %ostype%==vista call "checkuac.cmd"
if %ostype%==win7 call "checkuac.cmd"
if %ostype%==win8 call "checkuac.cmd"
if %ostype%==win81 call "checkuac.cmd"
if %ostype%==win10 call "checkuac.cmd"

:start


:: Do some pre registry stuff
regedit /s "tweaks\reload\reload-full.reg"
regedit /s "tweaks\reload\default-browser-chrome-win7.reg"
regedit /s "tweaks\reload\default-ie-settings.reg"
regedit /s "tweaks\ie\bypass-ie-welcome-screen.reg"
::regedit /s "tweaks\ie\set-google-as-default.reg"
regedit /s "tweaks\reload\default-wmc-settings.reg"
call "restart_explorer.cmd"



:: Start app install

:: Google Chrome
call "apps\reload\browsers\chrome\silent_install.cmd"


:: Mozilla Firefox
call "apps\reload\browsers\firefox\silent_install.cmd"


:: Adobe Flash
call "apps\reload\redist\flash\silent_install.cmd"


:: VLC Media Player
call "apps\reload\multimedia\vlc\%bits%\silent_install.cmd"


:: Adobe Reader
call "apps\reload\pdf-readers\adobe-reader\silent_install.cmd"


:: CCleaner Copy To system32 Folder
call "apps\reload\ccleaner\%bits%\silent_install.cmd"


:: DirectX
call "apps\reload\redist\directx\silent_install.cmd"


:: Microsoft.NET Framework
call "apps\reload\redist\dotnet\silent_install.cmd"


:: Visual C++ Redist
call "apps\reload\redist\vc\2005\silent_install.cmd"
call "apps\reload\redist\vc\2008\silent_install.cmd"
call "apps\reload\redist\vc\2010\silent_install.cmd"
call "apps\reload\redist\vc\2012\silent_install.cmd"
call "apps\reload\redist\vc\2013\silent_install.cmd"
call "apps\reload\redist\vc\2015\silent_install.cmd"


set avskip=0
cls
echo Press ENTER to install Security Essentials
echo.
echo.
echo Press "S" and ENTER to SKIP Antivirus install
echo.
echo.

set /p avskip=

if %avskip%==s goto skipav
if %avskip%==S goto skipav

:: Antivirus
if %ostype%==xp call "apps\reload\antivirus\avg\%bits%\silent_install.cmd"
if %ostype%==vista call "apps\reload\antivirus\security-essentials\%bits%\silent_install.cmd"
if %ostype%==win7 call "apps\reload\antivirus\security-essentials\%bits%\silent_install.cmd"

:: Triggering UPDATES ONLY for Windows 8/8.1
if %ostype%==win8 call "apps\reload\antivirus\security-essentials\%bits%\updates\silent_install.cmd"
if %ostype%==win81 call "apps\reload\antivirus\security-essentials\%bits%\updates\silent_install.cmd"


:skipav
:: Triggering Apps


cls
echo Launching Microsoft Security Essentials....
echo.
echo.
echo Click "Settings", "Scheduled Scan", and change CPU Limit to 10%
echo.
echo.
::echo Press any key to proceed....
::pause>nul

if exist "%pf%\Microsoft Security Client\msseces.exe" "%pf%\Microsoft Security Client\msseces.exe"


cls
echo Launching Windows Media Center....
echo.
echo.
echo 1) If a 64MB video error pops up, click OK and IGNORE
echo.
echo 2) Open to full screen
echo.
echo 3) Close when finished
echo.
echo.
::echo Press any key to proceed....
::pause>nul


%windir%\ehome\ehshell.exe



:: Fix This Sometime In The Future - 20140621
cls
echo Launching Default Network Location Settings....
echo.
echo.
echo 1) Check the box "Treat all future networks I connect to as public..."
echo.
echo 2) Click "Public Network" button
echo.
echo 3) Click "Close" when finished
echo.
echo.
::echo Press any key to proceed....
::::pause>nul


::"%windir%\system32\rundll32.exe" pnidui.dll,NwCategoryWiz {AC18748B-825C-405A-9D97-221922C0CADA} 0




cls
echo Launching Internet Explorer....
echo.
echo.
echo 1) Open Browser to Full Screen
echo.
echo 2) Close Browser Window When Finished
echo.
echo.
::echo Press any key to proceed....
::echo.
::echo.
::pause>nul

"%pf%\Internet Explorer\iexplore.exe"




cls
echo Launching Chrome....
echo.
echo.
echo 1) Go to settings and change default home page to google.com
echo.
echo 2) Check the "Always Show Home Button" box
echo.
echo 3) Close browser when finished
echo.
echo.
::echo Press any key to proceed....
::pause>nul


if exist "%pf%\Google\Chrome\Application\chrome.exe" "%pf%\Google\Chrome\Application\chrome.exe"
if exist "%pf64%\Google\Chrome\Application\chrome.exe" "%pf64%\Google\Chrome\Application\chrome.exe"



cls
echo Launching Firefox....
echo.
echo.
echo 1) Import settings from Internet Explorer
echo.
echo 2) Import home page from Internet Explorer
echo.
echo 3) Pin Firefox icon to taskbar
echo.
echo 4) Uncheck "Always perform this check" for default browser
echo.
echo 5) If you want Firefox as your default browser, click YES
echo.
echo 6) Close browser when finished
echo.
echo.
::echo Press any key to proceed....
::pause>nul

if exist "%pf%\Mozilla Firefox\firefox.exe" "%pf%\Mozilla Firefox\firefox.exe"
if exist "%pf64%\Mozilla Firefox\firefox.exe" "%pf64%\Mozilla Firefox\firefox.exe"




cls
echo Terminating Firefox....
echo.
echo.
echo Firefox must be terminated to continue
echo.
echo.
::::echo Press any key to proceed....
::::pause>nul

taskkill /t /f /im "firefox.exe"



cls
echo Terminating All Browsers
echo.
echo.
echo Check each one and close when finished
echo.
echo.
::echo Press any key to proceed....
::echo.
::echo.
::::pause>nul

taskkill /t /f /im "chrome.exe"
taskkill /t /f /im "firefox.exe"
taskkill /t /f /im "iexplore.exe"


cls
echo Relaunching All Browsers....
echo.
echo.
echo Verify all settings are correct and close all browsers
echo.
echo.
::echo Press any key to proceed....
::echo.
::echo.
::pause>nul

if exist "%pf%\Google\Chrome\Application\chrome.exe" "%pf%\Google\Chrome\Application\chrome.exe"
if exist "%pf64%\Google\Chrome\Application\chrome.exe" "%pf64%\Google\Chrome\Application\chrome.exe"

if exist "%pf%\Mozilla Firefox\firefox.exe" "%pf%\Mozilla Firefox\firefox.exe"
if exist "%pf64%\Mozilla Firefox\firefox.exe" "%pf64%\Mozilla Firefox\firefox.exe"

"%pf%\Internet Explorer\iexplore.exe"


:: VLC Player
cls
echo Launching VLC Media Player....
echo.
echo.
echo 1) When launched click "Continue" and close VLC
echo.
echo.
::echo Press any key to proceed....
::pause>nul

if exist "%pf%\VideoLAN\VLC\vlc.exe" "%pf%\VideoLAN\VLC\vlc.exe"
if exist "%pf64%\VideoLAN\VLC\vlc.exe" "%pf64%\VideoLAN\VLC\vlc.exe"


:: Adobe Reader

::set versionAdobeReader=11.0

cls
echo Launching Adobe Reader....
echo.
echo.
echo 1) Open to full screen and close when finished
echo.
echo.
::echo Press any key to proceed....
::pause>nul

::if %bits%==x86 "%pf%\Adobe\Reader %versionAdobeReader%\Reader\AcroRd32.exe"
::if %bits%==x64 "%pf64%\Adobe\Reader %versionAdobeReader%\Reader\AcroRd32.exe"

if %bits%==x86 "%pf%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"
if %bits%==x64 "%pf64%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"



:: Doing some system32 stuff

if %uacStatus%==Enabled goto checkuac


:: Invoking CCleaner

cls
echo Cleaning Temp Files....

"%windir%\system32\CCleaner.exe" /auto


:: Copying other files to system32

cls
echo Adding Command Line Tools....

copy /y "_ISO\bin\7z.exe" "%windir%\system32"
copy /y "_ISO\bin\7z.dll" "%windir%\system32"
copy /y "_ISO\bin\rar.exe" "%windir%\system32"
copy /y "_ISO\bin\sleep.exe" "%windir%\system32"
copy /y "_ISO\bin\unzip.exe" "%windir%\system32"


:: Adding Tweaks

cls
echo Applying Registry Tweaks....
regedit /s "tweaks\reload\reload-full.reg"
call "restart_explorer.cmd"


cls
set sneaky=0
echo Be Sneaky [Y/N]?:
echo.
echo.
set /p sneaky=

if %sneaky%==y call "sneaky.cmd"
if %sneaky%==Y call "sneaky.cmd"



goto end


:end

::cls
::if %uacStatus%==Enabled %cocolor% 0a
::if %uacStatus%==Disabled %cocolor% 0c
::echo UAC Status: %uacStatus%
::%cocolor% 0f
::echo.
::echo.
::echo Would you like to reboot system now? [Y/N]:
::echo.
::echo.


::choice /c yn /n

::if errorlevel 2 exit
::if errorlevel 1 "%windir%\system32\shutdown.exe" -r -t 0


:: Force reboot if user does not trigger one.
"%windir%\system32\shutdown.exe" -r -t 0


