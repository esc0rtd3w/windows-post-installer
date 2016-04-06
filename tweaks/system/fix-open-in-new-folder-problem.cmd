@echo off

:: 32 bit and 64 bit
IF EXIST "%SystemRoot%\System32\actxprxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%SystemRoot%\System32\actxprxy.dll"
IF EXIST "%ProgramFiles%\Internet Explorer\ieproxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%ProgramFiles%\Internet Explorer\ieproxy.dll"

:: 64 bit only (32bit on 64 bit)
IF EXIST "%WinDir%\SysWOW64\actxprxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%WinDir%\SysWOW64\actxprxy.dll"
IF EXIST "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll"