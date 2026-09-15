@echo off
setlocal EnableExtensions
title AlyArchetype Updater - Installation

set "APPDIR=%APPDATA%\AlyArchetypeUpdater"
set "DESKTOP=%USERPROFILE%\Desktop"
set "UPDATER=%APPDIR%\AlyArchetype-Updater.bat"
set "ICON=%APPDIR%\AlyArchetype.ico"
set "SHORTCUT=%DESKTOP%\AlyArchetype Updater.lnk"

echo.
echo ========================================================
echo        ALYARCHETYPE UPDATER - INSTALLATION
echo ========================================================
echo.

if not exist "%~dp0AlyArchetype-Updater.bat" (
  echo [ERREUR] AlyArchetype-Updater.bat introuvable.
  echo Placez Install-Updater.bat, AlyArchetype-Updater.bat
  echo et AlyArchetype.ico dans le meme dossier.
  echo.
  pause
  exit /b 1
)

if not exist "%~dp0AlyArchetype.ico" (
  echo [ERREUR] AlyArchetype.ico introuvable.
  echo.
  pause
  exit /b 1
)

if not exist "%APPDIR%" mkdir "%APPDIR%" >nul 2>&1

copy /y "%~dp0AlyArchetype-Updater.bat" "%UPDATER%" >nul
if errorlevel 1 goto :fail
copy /y "%~dp0AlyArchetype.ico" "%ICON%" >nul
if errorlevel 1 goto :fail

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$ws=New-Object -ComObject WScript.Shell;" ^
 "$s=$ws.CreateShortcut('%SHORTCUT%');" ^
 "$s.TargetPath='%UPDATER%';" ^
 "$s.WorkingDirectory='%APPDIR%';" ^
 "$s.IconLocation='%ICON%,0';" ^
 "$s.Description='AlyArchetype Updater';" ^
 "$s.Save()"
if errorlevel 1 goto :fail

echo [OK] Updater installe.
echo [OK] Logo ALYA installe.
echo [OK] Raccourci cree sur le Bureau.
echo.
echo Vous pouvez maintenant lancer "AlyArchetype Updater"
echo depuis le Bureau.
echo.
pause
exit /b 0

:fail
echo.
echo [ERREUR] Installation impossible.
echo.
pause
exit /b 1
