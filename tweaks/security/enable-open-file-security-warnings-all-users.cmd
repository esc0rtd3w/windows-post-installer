reg delete "HKCU\Environment" /v SEE_MASK_NOZONECHECKS /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v SEE_MASK_NOZONECHECKS /t REG_SZ /d 0 /f