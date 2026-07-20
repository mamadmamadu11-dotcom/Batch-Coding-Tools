@echo off
:: Set encoding to support Unicode (UTF-8)
chcp 65001 >nul

:: Define the output text file name
set "OutputFile=FileList.txt"

:: Delete the output file if it already exists to start fresh
if exist "%OutputFile%" del "%OutputFile%"

echo Extracting file names...

:: Loop through all files in the current directory and subdirectories
for /R %%F in (*) do (
    :: Check if the file is not the batch script itself
    if /I not "%%~nxF"=="%~nx0" (
        :: Check if the file is not the output text file
        if /I not "%%~nxF"=="%OutputFile%" (
            echo %%~nxF>>"%OutputFile%"
        )
    )
)

echo Operation completed! File list saved in %OutputFile%.
pause