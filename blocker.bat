::
:: Skype Ad Blocker 0.1.0.0
::
:: 
:: © 2015 Dalthow Game Studios
::

@ECHO off

:checkPrivileges
:: Checking if the user has administrator rights.

CLS

ECHO Checking privileges...
ECHO.
NET FILE 1>NUL 2>NUL
IF '%errorlevel%' == '0' (GOTO confirm) ELSE (GOTO getPrivileges)

:getPrivileges
:: If the user doesn't have administrator rights, then prompt for it.
IF '%1'=='ELEV' (SHIFT & GOTO confirm & ECHO Access granted.)
SETLOCAL DisableDelayedExpansion
SET "batchPath=%~0"
SETLOCAL EnableDelayedExpansion
ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
EXIT /B

:confirm
:: Asking the user if he really wanted to do this.

CLS

ECHO Usage.
ECHO.
ECHO This script modifies your hosts file. It does not mess with Skype itself.
ECHO Therefore we don't breach Skype's terms and conditions or user agreement.
ECHO.
SET /P confirm=Are you sure you want to continue [Y/N]?
IF /I "%confirm%" EQU "Y" GOTO :menu
IF /I "%confirm%" EQU "N" EXIT
GOTO :confirm

:menu
:: A place where the user can specify what he wants to do.

CLS

ECHO Menu.
ECHO.
ECHO 1. Block Skype ad's.
ECHO 2. Configuration.
ECHO 3. Reboot Skype.
ECHO 4. Exit.
ECHO.
SET /P option=Option: 
IF /I "%option%" EQU "1" GOTO :writeHost
IF /I "%option%" EQU "2" GOTO :redirectingAds
IF /I "%option%" EQU "3" GOTO :rebootSkype
IF /I "%option%" EQU "4" EXIT
GOTO :menu

:redirectingAds
:: Asking the user what domain the ad's should be redirected to.

CLS

ECHO Redirecting ad's.
ECHO.
ECHO Do you want to redirect ad's to a specific adress on your local machine?
ECHO If you don't know what this means, press enter for localhost.
ECHO.
SET /P ip=Domain: 
GOTO :installationDirectory

:installationDirectory
:: If the user installed Skype in a different directory he can change it here.

CLS

ECHO Installation directory.
ECHO.
ECHO Where is your Skype installed? For the default directory press enter.
ECHO.
SET /P installDir=Path: 
GOTO :menu

:writeHost
:: Writing the changes to the host file so ad domains are blocked.

IF /I "%ip%" EQU "" SET ip=127.0.0.1

CLS

ECHO Writing ad domains to host file...
ECHO.
>nul FIND "# Skype Ads Blocker" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '# Skype Ads Blocker' already in hosts file, skipping . . .) || (ECHO # Skype Ads Blocker >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% secure.flashtalking.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% secure.flashtalking.com' already in hosts file, skipping . . .) || (ECHO %ip% secure.flashtalking.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% cdn.atdmt.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% cdn.atdmt.com' already in hosts file, skipping . . .) || (ECHO %ip% cdn.atdmt.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% ad-emea.doubleclick.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% ad-emea.doubleclick.net' already in hosts file, skipping . . .) || (ECHO %ip% ad-emea.doubleclick.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% ad.doubleclick.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% ad.doubleclick.net' already in hosts file, skipping . . .) || (ECHO %ip% ad.doubleclick.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% ec.atdmt.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% ec.atdmt.com' already in hosts file, skipping . . .) || (ECHO %ip% ec.atdmt.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% msntest.serving-sys.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% msntest.serving-sys.com' already in hosts file, skipping . . .) || (ECHO %ip% msntest.serving-sys.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% sO.2mdn.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% sO.2mdn.net' already in hosts file, skipping . . .) || (ECHO %ip% sO.2mdn.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% aka-cdn-ns.adtech.de" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% aka-cdn-ns.adtech.de' already in hosts file, skipping . . .) || (ECHO %ip% aka-cdn-ns.adtech.de >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% rads.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% rads.msn.com' already in hosts file, skipping . . .) || (ECHO %ip% rads.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% live.rads.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% live.rads.msn.com' already in hosts file, skipping . . .) || (ECHO %ip% live.rads.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% ads1.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% ads1.msn.com' already in hosts file, skipping . . .) || (ECHO %ip% ads1.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% rad.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% rad.msn.com' already in hosts file, skipping . . .) || (ECHO %ip% rad.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% static.2mdn.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% static.2mdn.net' already in hosts file, skipping . . .) || (ECHO %ip% static.2mdn.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% g.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% g.msn.com' already in hosts file, skipping . . .) || (ECHO %ip% g.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% ads2.msads.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% ads2.msads.net' already in hosts file, skipping . . .) || (ECHO %ip% ads2.msads.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% a.ads2.msads.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% a.ads2.msads.net' already in hosts file, skipping . . .) || (ECHO %ip% a.ads2.msads.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% b.ads2.msads.net" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% b.ads2.msads.net' already in hosts file, skipping . . .) || (ECHO %ip% b.ads2.msads.net >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "%ip% ac3.msn.com" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% ac3.msn.com' already in hosts file, skipping . . .) || (ECHO %ip% ac3.msn.com >> "C:\Windows\System32\drivers\etc\hosts")
>nul FIND "# End Skype Ads Blocker" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '# End Skype Ads Blocker' already in hosts file, skipping . . .) || (ECHO # End Skype Ads Blocker >> "C:\Windows\System32\drivers\etc\hosts")

GOTO rebootSkype

:rebootSkype
:: Restarting Skype for the changes to take effect.

IF /I "%installDir%" EQU "" SET installDir=C:\Program Files (x86)\Skype\

CLS

ECHO.
ECHO Shutting down Skype...
TASKKILL /F /IM Skype.exe >nul 2>&1
ECHO.
ECHO Starting Skype...
START "" "%installDir%\Phone\Skype.exe"

GOTO finish

:finish
:: Tells the user the ad block was successful.

CLS

ECHO Successfully blocked domains, your Skype should be ad free now !
ECHO.
SET /P =Press any key to return to the menu...
GOTO :menu