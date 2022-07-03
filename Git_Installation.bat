@ECHO OFF     

:: THIS IS WINDOWS SCRIPT COMMAND. HELP ME INSTALL GIT-VERSION CONTROLL
:: HOW TO RUN: Git_Installation.bat <path>
ECHO   _______________________________________________________________
ECHO  ^|  TuanTran                                                    ^| 
ECHO  ^|  https://github.com/quoctuan-iot                             ^|
ECHO  ^|                                                              ^|
ECHO  ^|______________________________________________________________^|

set pathInstall=%1
:: Check if pathInstall is empty. pathInstall is "C:\Program Files\Git"
if [%1]==[] 
set pathInstall="C:\Program Files\Git"

set pathInstall=%pathInstall:"=%

:: Write data to config file.
(
    echo [Setup]
    echo Lang=default
    echo Dir=%pathInstall%
    echo Group=Git
    echo NoIcons=0
    echo SetupType=default
    echo Components=icons,ext\reg\shellhere,assoc,assoc_sh
    echo Tasks=
    echo PathOption=Cmd
    echo SSHOption=OpenSSH
    echo CRLFOption=CRLFAlways
    echo BashTerminalOption=ConHost
    echo PerformanceTweaksFSCache=Enabled
    echo UseCredentialManager=Enabled
    echo EnableSymlinks=Disabled
    echo EnableBuiltinDifftool=Disabled
) > config.inf

:: Getting a git*.exe
for /r %%f in (git*.exe) do (
    call set file="%%f"
    @echo on
    @echo %%f
    @echo off
)

:: Check if execution file don't exist. Raise a error
if [%file%]==[] (
    @echo on
    @echo Error finding "git*.exe" install executable. File may not exist or is not named with the "git" prefix.
    exit /b 2
)

:: Execute a installation file
%file% /VERYSILENT /LOADINF="config.inf"
if errorlevel 1 (
    @echo on
    if %errorLevel% == 1 ( echo Error opening %file%. File may be corrupt. )
    if %errorLevel% == 2 ( echo Error reading %file%. May require elevated privileges. Run as administrator. )
    exit /b %errorlevel%
)

:: Delete a config file.
del config.inf

:: Set path git environment.
net session >nul 2>&1
if %errorLevel% == 0 (
    pathman /as "%PATH%;%installDir%/cmd"
    exit 0
) else (
    @echo on
    echo SYSTEM PATH Environment Variable may not be set, may require elevated privileges. Run as administrator if it doesn't already exist.
    exit /b 0
)
