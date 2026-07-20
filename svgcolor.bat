@echo off
:: Set console to UTF-8
chcp 65001 >nul

echo Starting SVG optimization...
echo Cleaning comments and applying white color (#FFFFFF)...

:: Define a temporary PowerShell script file
set "ps1=%temp%\UpdateSVGs.ps1"

:: Delete it if it already exists from a previous run
if exist "%ps1%" del "%ps1%"

:: Build the PowerShell script dynamically to avoid CMD character escaping issues
echo $files = Get-ChildItem -Path '.' -Filter '*.svg' -Recurse > "%ps1%"
echo foreach ($file in $files) { >> "%ps1%"
echo     $content = Get-Content -Path $file.FullName -Raw >> "%ps1%"
echo     $content = $content -replace '(?s)^<!--.*?--^>', '' >> "%ps1%"
echo     $content = $content -replace '\s?fill="[^"]*"', '' >> "%ps1%"
echo     $content = $content -replace '^<svg\s', '^<svg fill="#FFFFFF" ' >> "%ps1%"
echo     $content = $content -replace '^<path\s', '^<path fill="#FFFFFF" ' >> "%ps1%"
echo     [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8) >> "%ps1%"
echo     Write-Host "Processed and colored white: $($file.Name)" >> "%ps1%"
echo } >> "%ps1%"

:: Run the safely generated PowerShell script
powershell -NoProfile -ExecutionPolicy Bypass -File "%ps1%"

:: Clean up the temporary file
del "%ps1%"

echo.
echo Operation completed successfully! All SVG files are now optimized and white.
pause