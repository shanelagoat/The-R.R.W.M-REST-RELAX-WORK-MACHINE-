@echo off
setlocal enabledelayedexpansion
color 0A

:menu
cls
echo =================================================================================================================================================
echo         Batch Launcher
echo =================================================================================================================================================
echo 1. Bouncing Ball Animation                                    010100111001010101011100011011110110101010101010101010110110100110101010010011010010
echo 2. Weather for Los Angeles                                    010100111001010101011100011011110110101010101010101010110110100110101010010011010010
echo 3. Generate QR Code                                           010100111001010101011100011011110110101010101010101010110110100110101010010011010010
echo 4. [wifi passwords]                                           010100111001010101011100011011110110101010101010101010110110100110101010010011010010
echo 5. [dont click doesnt work]                                   010100111001010101011100011011110110101010101010101010110110100110101010010011010010
echo ==================================================================================================================================================
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto ball
if "%choice%"=="2" goto weather
if "%choice%"=="3" goto qr
if "%choice%"=="4" goto file4
if "%choice%"=="5" goto file5
goto menu

:ball
rem Bouncing Ball Animation
@echo off
setlocal enabledelayedexpansion
mode con: cols=80 lines=25
set "ball=O"
set "x=1"
set "y=1"
set "dx=1"
set "dy=1"
set "color=0A"
:loop
cls
echo.
for /l %%i in (1,1,%y%) do echo.
for /l %%j in (1,1,%x%) do set /p "= " <nul
echo !color!%ball%
set /a x+=dx
set /a y+=dy
if %x% geq 78 set /a dx=-1 & call :changeColor
if %x% leq 1 set /a dx=1 & call :changeColor
if %y% geq 23 set /a dy=-1 & call :changeColor
if %y% leq 1 set /a dy=1 & call :changeColor
ping localhost -n 1 >nul
goto loop
:changeColor
set /a "color=0x%random:~-1%"
exit /b

:weather
rem Weather for Los Angeles
curl wttr.in/LosAngeles
pause
goto menu

:qr
rem QR code maker
echo QR code has been generated
"C:\Users\tracy\OneDrive\Desktop\QR CM v 1.0.0.bat"
pause
goto menu

:file4
rem Your Batch File 4
echo wifi passwords
"C:\Users\tracy\recently connected to wifi key finder.bat"
pause
goto menu

:file5
rem Your Batch File 
echo ERR
rem Add your batch file 5 commands here
pause
goto menu
