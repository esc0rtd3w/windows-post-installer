@echo off

set installer=none
set appName=Mozilla Firefox
set silentSwitch=-ms

cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%

:: Pin to TaskBar
set taskbarDir=%userprofile%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar
set desktopDir=%public%\Desktop

::copy /y "%desktopDir%\Mozilla Firefox.lnk" "%taskbarDir%\"


::echo Windows Registry Editor Version 5.00>pin.reg
::echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts]>>pin.reg
::echo "C:\\Users\\%username%\\AppData\\Roaming\\Microsoft\\Internet Explorer\\Quick Launch\\User Pinned\\TaskBar\\Mozilla Firefox.lnk"=dword:00000001>>pin.reg

::regedit /s pin.reg
::del /s /q pin.reg

::taskkill /f /im explorer.exe
::start %windir%\explorer.exe
