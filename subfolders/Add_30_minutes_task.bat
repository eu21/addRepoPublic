REM Add windows scheduler task that will run every 30 minutes
REM Programm:
REM "C:\Program Files\Git\git-bash.exe"
REM Args:
REM c:\1\github\exec_all\exec_all_run.repo



@echo off
:: Check if the script is running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    echo Requesting administrative privileges...
    goto :getAdmin
)

:getAdmin
:: Request administrative privileges
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /b



:runScript
:: Get the script directory
set "currentDir=%~dp0"

:: Create the scheduled task
schtasks /create /tn "GitTask" /tr "\"C:\Program Files\Git\git-bash.exe\" "%currentDir%exec_all_run.repo\" /sc minute /mo 30 /ru System

