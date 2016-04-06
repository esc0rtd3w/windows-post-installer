@echo off

if %windir%==X:\windows %SystemRoot%\system32\wpeutil.exe reboot

::if %target_root%==C:\windows %SystemRoot%\system32\wpeutil.exe reboot

"%windir%\system32\shutdown.exe" -r -t 0