@echo off

set installer=none
set appName=Microsoft Security Essentials Definition Update
set silentSwitch=

cls
echo Installing %appName%....

for %%a in (%~dp0*.exe) do set installer=%%a

"%installer%" %silentSwitch%