@echo off
E:
CD Github\Skype-Ad-Blocker
IF /I "%ip%" EQU "" SET ip=127.0.0.1
FOR /F "tokens=* delims=" %%x IN (domains.txt) DO >nul FIND "%ip% %%x" "C:\Windows\System32\drivers\etc\hosts" && (ECHO '%ip% %%x' already in hosts file, skipping . . .) || (ECHO %ip% %%x >> "C:\Windows\System32\drivers\etc\hosts")

echo.
pause >nul
exit