@echo off

set installer=none
set appName=VLC Media Player
set silentSwitch=/L=1033 /S

cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%