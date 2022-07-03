@ECHO OFF     

:: THIS IS WINDOWS SCRIPT COMMAND. IT WILL HELP ME ACT FASTER
ECHO   _______________________________________________________________
ECHO  ^|  TuanTran                                                    ^| 
ECHO  ^|  https://github.com/quoctuan-iot                             ^|
ECHO  ^|                                                              ^|
ECHO  ^|______________________________________________________________^|

:LOOP
ECHO  ^|
ECHO 1) RESTART.
ECHO 2) CLOSE ALL WINDOWS.
ECHO 3) SHUTDOW WINDOWS.
ECHO 4) OPEN GOOGLE CHROME.
ECHO 5) OPEN FILE EXPLORER.
ECHO 6) LOGIN B2B.
ECHO 7) LOCK SCREEN.
ECHO 8) LOCK SCREEN USING TIMER 120s.
ECHO 9) OPEN NEW COMMAND PORT
ECHO 10) OPEN MICROSOFT EAGE
ECHO 11) EXIT_SCRIPT
ECHO  ^|

SET /P OP=TYPE OPTION:
IF "%OP%"=="11" GOTO End
IF "%OP%"=="10" GOTO OPEN_MS_EDGE
IF "%OP%"=="9" GOTO OPEN_NEW_CMD
IF "%OP%"=="8" GOTO LOCK_SCREEN_TIMER
IF "%OP%"=="7" GOTO LOCK_SCREEN
IF "%OP%"=="6" GOTO LOGIN_B2B
IF "%OP%"=="5" GOTO OPEN_FILE_EXPLORER
IF "%OP%"=="4" GOTO OPEN_GOOGLE_CHROME
IF "%OP%"=="3" GOTO SHUTDOWN_WINDOWS
IF "%OP%"=="2" GOTO CLOSE_ALL_WINDOWS
IF "%OP%"=="1" GOTO RESTART

:LOGIN_B2B
ECHO LOGIN B2B
login.bat
GOTO LOOP

:OPEN_GOOGLE_CHROME
start chrome
GOTO LOOP

:OPEN_MS_EDGE
start msedge
GOTO LOOP

:OPEN_NEW_CMD
ECHO OPEN NEW COMMAND PORT
start
GOTO LOOP

:OPEN_FILE_EXPLORER
ECHO OPEN EXPLORER D:\
start d:\
GOTO LOOP

:RESTART
ECHO Restart
shutdown -r
GOTO LOOP

:SHUTDOWN_WINDOWS
ECHO Shutdown
shutdown -s 
:: Shutdown with timer: shutdown -s -t <seconds>
GOTO LOOP

:CLOSE_ALL_WINDOWS
ECHO Close All Windows
powershell -command "(New-Object -comObject Shell.Application).Windows() | foreach-object {$_.quit()}; Get-Process | Where-Object {$_.MainWindowTitle -ne \"\"} | stop-process"
GOTO End

:LOGOFF
ECHO Logoff
shutdown -l  
GOTO LOOP

:LOCK_SCREEN
ECHO Lock screen
Rundll32.exe user32.dll,LockWorkStation
GOTO LOOP

:LOCK_SCREEN_TIMER
ECHO Lock screen timer
powercfg.exe /SETACVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 120
GOTO LOOP

:End
ECHO EXIT SCRIPT

@REM PAUSE