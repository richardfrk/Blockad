@ECHO off
CLS

:checkPrivileges
:: Checking if the user has administrator rights.
ECHO Checking privileges . . .
ECHO.
NET FILE 1>NUL 2>NUL
IF '%errorlevel%' == '0' (GOTO confirm) ELSE (GOTO getPrivileges)

:getPrivileges
:: If the user doesn't have administrator rights, then prompt for it.
IF '%1'=='ELEV' (SHIFT & GOTO confirm)
SETLOCAL DisableDelayedExpansion
SET "batchPath=%~0"
SETLOCAL EnableDelayedExpansion
ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
EXIT /B

:confirm
:: Asking the user if he really wanted to do this.
ECHO Access granted.
ECHO.
ECHO.
ECHO Confirming . . .
ECHO.
ECHO This script modifies your hosts file. It does not mess with Skype itself.
ECHO Therefore we don't breach Skype's terms and conditions or user agreement
ECHO.
SET /P c=Are you sure you want to continue [Y/N]?
IF /I "%c%" EQU "Y" GOTO :writeHost
IF /I "%c%" EQU "N" EXIT
GOTO :confirm

PAUSE

:writeHost
:: Writing the changes to the host file so add domains are blocked.
ECHO.
ECHO.
ECHO Writing add domains to host file . . .
ECHO.
>nul FIND "# Skype Ads Blocker" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '# Skype Ads Blocker' already in hosts file, skipping . . .) || (ECHO # Skype Ads Blocker >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 live.rads.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 live.rads.msn.com' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 live.rads.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 ads1.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 ads1.msn.com' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 ads1.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 rad.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 rad.msn.com' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 rad.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 static.2mdn.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 static.2mdn.net' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 static.2mdn.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 g.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 g.msn.com' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 g.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 a.ads2.msads.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 a.ads2.msads.net' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 a.ads2.msads.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 b.ads2.msads.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 b.ads2.msads.net' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 b.ads2.msads.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "127.0.0.1 ac3.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '127.0.0.1 ac3.msn.com' already in hosts file, skipping . . .) || (ECHO 127.0.0.1 ac3.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "# End Skype Ads Blocker" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '# End Skype Ads Blocker' already in hosts file, skipping . . .) || (ECHO # End Skype Ads Blocker >> "C:\Windows\System32\drivers\etc\hosts")
GOTO rebootSkype

:rebootSkype
:: Restarting skype for the changes to take effect.
ECHO.
ECHO.
ECHO Shutting down Skype . . .
"C:\Program Files (x86)\Skype\Phone\Skype.exe" /shutdown
ECHO.
ECHO.
ECHO Starting Skype . . .
START "" "C:\Program Files (x86)\Skype\Phone\Skype.exe"
ECHO.
ECHO.
PAUSE
