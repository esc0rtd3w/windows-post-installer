reg add "HKCU\Environment" /v SEE_MASK_NOZONECHECKS /t REG_SZ /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v SEE_MASK_NOZONECHECKS /t REG_SZ /d 1 /f