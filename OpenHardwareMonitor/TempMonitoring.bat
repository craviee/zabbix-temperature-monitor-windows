@echo off

setlocal enabledelayedexpansion

:repeat

set sum=0
set div=0

call start /B /wait C:\OpenHardwareMonitor\OpenHardwareMonitorReport.exe > C:\OpenHardwareMonitor\OpenHardwareMonitorReport.txt
find "CPU Core" C:\OpenHardwareMonitor\OpenHardwareMonitorReport.txt | find "   " | find "temperature" >C:\OpenHardwareMonitor\Result.txt
for /f "tokens=7 delims= " %%i in (C:\OpenHardwareMonitor\Result.txt) do (set /a sum=!sum!+%%i
	set /a div=!div!+1
)
set /a sum=!sum!/%div%
echo %sum% >C:\OpenHardwareMonitor\temperature.txt

timeout /t 60

goto repeat
