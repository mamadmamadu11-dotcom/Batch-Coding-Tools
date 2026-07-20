@echo off
REM تنظیم انکودینگ روی UTF-8 برای پشتیبانی صحیح از متون و کامنت‌های فارسی
chcp 65001 >nul
setlocal enabledelayedexpansion

REM نام فایل نهایی که تمام کدها در آن جمع می‌شوند
set "OutputFile=Project_Source_Code.txt"
REM نام خود این اسکریپت برای جلوگیری از خوانده شدن خودش
set "ScriptFile=%~nx0"

echo ==================================================
echo Starting to extract and merge all project files...
echo Output will be saved to: %OutputFile%
echo ==================================================
echo.

REM پاک کردن فایل خروجی قبلی اگر از قبل در پوشه وجود داشت
if exist "%OutputFile%" del "%OutputFile%"

REM حلقه برای گشتن در تمام فولدرها و ساب‌فولدرها
for /R %%F in (*.*) do (
    set "Skip="
    
    REM 1. نادیده گرفتن خود همین اسکریپت
    if "%%~nxF"=="%ScriptFile%" set "Skip=1"
    
    REM 2. نادیده گرفتن فایل خروجی نهایی
    if "%%~nxF"=="%OutputFile%" set "Skip=1"
    
    REM 3. نادیده گرفتن فایل‌های باینری، فونت و مدیا (برای جلوگیری از خراب شدن و ناخوانا شدن فایل متنی)
    if /I "%%~xF"==".png" set "Skip=1"
    if /I "%%~xF"==".jpg" set "Skip=1"
    if /I "%%~xF"==".jpeg" set "Skip=1"
    if /I "%%~xF"==".gif" set "Skip=1"
    if /I "%%~xF"==".svg" set "Skip=1"
    if /I "%%~xF"==".mp4" set "Skip=1"
    if /I "%%~xF"==".apk" set "Skip=1"
    if /I "%%~xF"==".ttf" set "Skip=1"
    if /I "%%~xF"==".exe" set "Skip=1"
    if /I "%%~xF"==".dll" set "Skip=1"
    if /I "%%~xF"==".zip" set "Skip=1"
    if /I "%%~xF"==".pdb" set "Skip=1"
    
    REM اگر فایل جزو استثنائات بالا نبود، آن را بخوان و در فایل نهایی بنویس
    if not defined Skip (
        echo Processing: %%~nxF
        
        REM نوشتن یک جداکننده مشخص، نام فایل و مسیر دقیق آن در سیستم
        echo ================================================================================ >> "%OutputFile%"
        echo File Name: %%~nxF >> "%OutputFile%"
        echo Full Path: %%F >> "%OutputFile%"
        echo ================================================================================ >> "%OutputFile%"
        
        REM خواندن محتوای فایل و ریختن آن در فایل خروجی
        type "%%F" >> "%OutputFile%" 2>nul
        
        REM ایجاد چند خط فاصله برای مرتب شدن و جدا شدن از کدهای فایل بعدی
        echo. >> "%OutputFile%"
        echo. >> "%OutputFile%"
    )
)

echo.
echo ==================================================
echo Extraction Complete! 
echo All code is now safely merged into "%OutputFile%".
echo ==================================================
pause