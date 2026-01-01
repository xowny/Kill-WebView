@echo off
title Kill WebView - WebView2 Suppressor

:: Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%cd%"
    CD /D "%~dp0"

:menu
cls
echo ==========================================
echo    Kill WebView
echo ==========================================
echo [1] BLOCK WebView2 (Kill and Prevent Restart)
echo [2] UNBLOCK WebView2 (Restore Normal Function)
echo [3] Exit
echo.
set /p choice="Selection: "

if "%choice%"=="1" goto block
if "%choice%"=="2" goto unblock
if "%choice%"=="3" exit
goto menu

:block
echo.
echo Blocking WebView2...
:: Override the executable with a dummy entry
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedgewebview2.exe" /v Debugger /t REG_SZ /d "systray.exe" /f
:: Force kill existing ones
taskkill /F /IM msedgewebview2.exe /T >nul 2>&1
echo.
echo [DONE] WebView2 is blocked. It cannot restart itself.
echo Press any key to return to menu...
pause >nul
goto menu

:unblock
echo.
echo Restoring WebView2...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msedgewebview2.exe" /v Debugger /f >nul 2>&1
echo.
echo [DONE] WebView2 is restored to normal.
echo Press any key to return to menu...
pause >nul
goto menu