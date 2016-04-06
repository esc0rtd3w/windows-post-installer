@echo off

bcdboot %WinDir% /l en-us

regedit /s "%~dp0set-language-en-us.reg"

:end

