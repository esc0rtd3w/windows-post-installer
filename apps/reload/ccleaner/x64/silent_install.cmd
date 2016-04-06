@echo off

set installer=none
set appName=CCleaner
set silentSwitch=
cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

copy "%installer%" %windir%\system32