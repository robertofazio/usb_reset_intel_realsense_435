echo off
title Remove USB devices with DevCon
echo Scanning USB device...
timeout 5
:: rescan devices
C:\Users\SIM01\devcon.exe rescan
:: Try to find Intel RealSense
C:\Users\SIM01\devcon.exe find @*USB\VID_8086* | find /i "No matching devices found."
if not errorlevel 1 (
   echo --- NO INTEL REAL SENSE FOUND -  Ready to reboot system.

   timeout 5
   C:\Users\SIM01\devcon.exe rescan
   ::timeout /t -1
    shutdown -r -t 1
)

:: assig to environment err
set err=C:\Users\SIM01\devcon.exe find @*USB\VID_8086*
:: save to local file

%err%>>C:\Users\SIM01\Desktop\RESET_USB.log 
echo FOUND THIS : 
C:\Users\SIM01\devcon.exe find @*USB\VID_8086*
timeout 10
echo Start Unity APP
timeout 5
:: start your app.exe
start C:\Users\SIM01\Desktop\BUILD_SIM\BUILD_SIM\BUILD_SIM.exe
   



