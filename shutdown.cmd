@echo off

if %windir%==X:\windows %SystemRoot%\system32\wpeutil.exe shutdown

::if %target_root%==C:\windows %SystemRoot%\system32\wpeutil.exe shutdown

"%windir%\system32\shutdown.exe" -s -t 0