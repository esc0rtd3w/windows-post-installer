@echo off


goto skip


:: Doing some activation stuff
cls


if %ostype%==winxp (

cls
echo I AM WINDOWS XP
pause

)


if %ostype%==vista (

cls
echo I AM WINDOWS VISTA
pause

)


if %ostype%==win7 (

cls
echo I AM WINDOWS 7
pause

cls
echo Waiting some time to trigger MSE for restoring WAT....
echo.
echo.
echo It should be detected as "HackTool Win32/WPAKill.B"
echo.
echo.
echo This may take up to a minute to trigger. Please be patient!
echo.
echo.

copy /y "~%dp0tweaks\security\trigger_mse_allow_restorewat_step2.cmd" %temp%
copy /y "~%dp0tweaks\security\trigger_mse_allow_restorewat_step3.cmd" %temp%
copy /y "~%dp0tweaks\security\trigger_mse_allow_restorewat_step3.reg" %temp%
copy /y "~%dp0tweaks\security\clear_runonce.reg" %temp%
copy /y "~%dp0tweaks\security\win7loader\Win7Loader.exe" %temp%
copy /y "~%dp0tweaks\security\win7loader\Keys.ini" %temp%
copy /y "~%dp0tweaks\security\win7loader\checksums.md5" %temp%
regedit /s "~%dp0tweaks\security\trigger_mse_allow_restorewat_runonce.reg"

call "~%dp0tweaks\security\trigger_mse_allow_restorewat_step1.cmd"

goto end

)


if %ostype%==win8 (

cls
echo I AM WINDOWS 8
pause

)


if %ostype%==win81 (

cls
echo I AM WINDOWS 8.1
pause

)


:skip

:: Triggering Windows Loader so MSE doesn't flag it and not copy the files
call "~%dp0tweaks\security\trigger_mse_allow_windows_loader.cmd"


cls
echo Waiting some time to trigger MSE for restoring WAT....
echo.
echo.
echo It should be detected as "HackTool Win32/WPAKill.B"
echo.
echo.
echo This may take up to a minute to trigger. Please be patient!
echo.
echo.

copy /y "~%dp0tweaks\security\trigger_mse_allow_restorewat_step2.cmd" %temp%
copy /y "~%dp0tweaks\security\trigger_mse_allow_restorewat_step3.cmd" %temp%
copy /y "~%dp0tweaks\security\trigger_mse_allow_restorewat_step3.reg" %temp%
copy /y "~%dp0tweaks\security\clear_runonce.reg" %temp%
copy /y "~%dp0tweaks\security\win7loader\Win7Loader.exe" %temp%
copy /y "~%dp0tweaks\security\win7loader\Keys.ini" %temp%
copy /y "~%dp0tweaks\security\win7loader\checksums.md5" %temp%
regedit /s "~%dp0tweaks\security\trigger_mse_allow_restorewat_runonce.reg"

call "~%dp0tweaks\security\trigger_mse_allow_restorewat_step1.cmd"




:end


