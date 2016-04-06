@echo off

set start=start "" /wait
set installer=none
set appName=Direct-X 9.0c Redistributable
set silentSwitch=/silent
cls
echo Installing %appName%....

for %%a in (%~dp0setup\*.exe) do set installer=%%a

"%installer%" %silentSwitch%