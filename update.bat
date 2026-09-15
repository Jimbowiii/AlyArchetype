@echo off
setlocal EnableExtensions
title AlyArchetype Updater
cd /d "%~dp0"

echo ==========================================
echo          AlyArchetype Updater
echo ==========================================
echo.

set "PS1=%TEMP%\AlyArchetypeUpdater_%RANDOM%_%RANDOM%.ps1"

> "%PS1%" echo $ErrorActionPreference = 'Stop'
>>"%PS1%" echo try {
>>"%PS1%" echo   $repo = 'Jimbowiii/AlyArchetype'
>>"%PS1%" echo   $root = (Get-Location).Path
>>"%PS1%" echo   $vf = Join-Path $root 'version.txt'
>>"%PS1%" echo   if (Test-Path $vf) { $local = (Get-Content $vf -Raw).Trim() } else { $local = '0.0.0' }
>>"%PS1%" echo   Write-Host ('Version installee : ' + $local)
>>"%PS1%" echo   Write-Host 'Recherche de la derniere release GitHub...'
>>"%PS1%" echo   $headers = @{ 'User-Agent'='AlyArchetype-Updater'; 'Accept'='application/vnd.github+json' }
>>"%PS1%" echo   $release = Invoke-RestMethod -Uri ('https://api.github.com/repos/' + $repo + '/releases/latest') -Headers $headers
>>"%PS1%" echo   $remote = ([string]$release.tag_name).TrimStart('v')
>>"%PS1%" echo   Write-Host ('Derniere version  : ' + $remote)
>>"%PS1%" echo   $lv = [version]$local
>>"%PS1%" echo   $rv = [version]$remote
>>"%PS1%" echo   if ($rv -le $lv) { Write-Host ''; Write-Host 'Le theme est deja a jour.' -ForegroundColor Green; exit 0 }
>>"%PS1%" echo   $tmp = Join-Path $env:TEMP ('AlyArchetype_' + [guid]::NewGuid().ToString('N'))
>>"%PS1%" echo   $zip = Join-Path $tmp 'release.zip'
>>"%PS1%" echo   $ext = Join-Path $tmp 'extract'
>>"%PS1%" echo   New-Item -ItemType Directory -Path $tmp -Force ^| Out-Null
>>"%PS1%" echo   New-Item -ItemType Directory -Path $ext -Force ^| Out-Null
>>"%PS1%" echo   Write-Host ''; Write-Host ('Mise a jour vers ' + $remote + '...') -ForegroundColor Yellow
>>"%PS1%" echo   Invoke-WebRequest -Uri $release.zipball_url -Headers $headers -OutFile $zip
>>"%PS1%" echo   Expand-Archive -LiteralPath $zip -DestinationPath $ext -Force
>>"%PS1%" echo   $src = (Get-ChildItem -LiteralPath $ext -Directory ^| Select-Object -First 1).FullName
>>"%PS1%" echo   if (-not $src) { throw 'Archive GitHub invalide.' }
>>"%PS1%" echo   Get-ChildItem -LiteralPath $src -Force ^| Where-Object { $_.Name -notin @('.git','.github') } ^| ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $root -Recurse -Force }
>>"%PS1%" echo   Set-Content -LiteralPath $vf -Value $remote -Encoding ASCII
>>"%PS1%" echo   Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
>>"%PS1%" echo   Write-Host ''; Write-Host ('Mise a jour terminee : ' + $remote) -ForegroundColor Green
>>"%PS1%" echo } catch {
>>"%PS1%" echo   Write-Host ''
>>"%PS1%" echo   Write-Host ('ERREUR : ' + $_.Exception.Message) -ForegroundColor Red
>>"%PS1%" echo   exit 1
>>"%PS1%" echo }

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
set "RC=%ERRORLEVEL%"
del /q "%PS1%" >nul 2>&1

echo.
if not "%RC%"=="0" echo Echec de la mise a jour. Code erreur : %RC%
echo.
echo Appuyez sur une touche pour fermer cette fenetre.
pause >nul
exit /b %RC%
