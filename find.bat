@echo off
:: Set encoding for console output
chcp 65001 >nul

echo Starting the icon extraction process...

:: Define the name of the new folder to store the copied icons
set "OutputFolder=SelectedIcons"

:: Create the output folder if it does not already exist
if not exist "%OutputFolder%" (
    mkdir "%OutputFolder%"
    echo Created new directory: %OutputFolder%
)

:: Define the exact names of the SVG files we want to extract
:: This includes both motion-based icons and media player icons
set "FilesToCopy=arrows-rotate.svg repeat.svg person-walking.svg person-running.svg bicycle.svg bolt.svg car.svg play.svg forward-step.svg forward.svg forward-fast.svg"

echo.
echo Searching and copying requested files...

:: Loop through the defined list of files
for %%i in (%FilesToCopy%) do (
    :: Search recursively in all subdirectories for each file
    for /R %%f in (%%i) do (
        if exist "%%f" (
            :: Copy the file to the output folder without prompting for overwrite
            copy /Y "%%f" "%OutputFolder%\" >nul
            echo [Copied] - %%i
        )
    )
)

echo.
echo Operation completed successfully!
echo All specified icons have been moved to the "%OutputFolder%" folder.
pause