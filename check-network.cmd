@echo off


:: Checking network connectivity

setlocal ENABLEDELAYEDEXPANSION

set host=google.com

	ping -n 1 %host% | find "TTL"
	
    if not errorlevel 1 set lanStatus=online
    if errorlevel 1 set lanStatus=offline
	
    if !lanStatus!==online (
	set lanStatus=online
	)
	
    if !lanStatus!==offline (
	set lanStatus=offline
	)
	
)

endlocal


:end


