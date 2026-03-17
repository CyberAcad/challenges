@echo off
REM =============================================
REM  TOTALLY NORMAL STARTUP SCRIPT
REM  Nothing to see here Mr. Henderson
REM =============================================

REM Step 1: Set a fun new wallpaper
REG ADD "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\Users\jamal\Pictures\wizard_cat.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePeritWindowStation

REM Step 2: Change browser homepage to something special
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "http://localhost:8888/you-have-been-pranked" /f

REM Step 3: Display a friendly message (totally not creepy)
REM The hex below decodes to something... but what?
echo.
echo ============================================
echo   G H O S T   P R O T O C O L   v1.0
echo ============================================
echo.
echo Decoding haunted transmission...
echo.

REM --- TRANSMISSION START ---
echo 62
echo 6f
echo 6f
echo 21
REM --- TRANSMISSION END ---

echo.
echo Transmission complete. Have a nice day :)
echo ============================================

REM Step 4: Open 5 calculator windows because why not
start calc.exe
start calc.exe
start calc.exe
start calc.exe
start calc.exe

REM Step 5: Say something spooky
msg * "I'm in your computer... just kidding it's Danielle lol"

REM Cleanup evidence (not really)
REM del /f /q C:\Users\jamal\Desktop\totally_not_a_virus.txt
REM ^ commented out because I felt bad — Danielle
