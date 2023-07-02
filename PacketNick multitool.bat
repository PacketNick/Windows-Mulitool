@echo off 
Title Nicks Client.
color A
REM Checking for Adminstrator Perms - Requesting them 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' ( goto UACPrompt ) else ( goto Start )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:Start 
cls
                             
echo       %version%
echo.
echo                          [Enter] To use Nicks auto tweaker.(Make a restore point prior to using)
set /p=
cls
@echo off
:c
echo Press 1 to Remove Windows Bloatware Note (Warning Removes MS apps)
echo Press 2 to Disable Hibernation
echo Press 3 to run Registry Tweaks
echo Press 4 to Delete Temp files
echo Press 5 to run Network Tweaks 
echo Press 6 to switch power plan 
echo Press 7 to Finish

set /p ans=""

if %ans%==1 (
goto Remove Windows Bloatware
)
if %ans%==2 (
goto Disable Hibernation
)
if %ans%==3 (
goto Registry Tweaks
)
if %ans%==4 (
goto Delete Temp Files
)
if %ans%==5 (
goto Network Tweaks
)
if %ans%==6 (
goto Power Plan
)
if %ans%==7 (
goto Finished
)

:Remove Windows Bloatware
echo Removing Windows Bloatware Applications.  
Powershell -Command "Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Cortona* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *camera* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *communications* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *maps* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage people | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppXPackage *Microsoft.WindowsMaps* | Remove-AppXPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage" >nul 2>&1
PowerShell -Command "Get-AppxPackage *yourphone* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.Office* | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Microsoft.OneNote for Windows 10 * | Remove-AppxPackage" >nul 2>&1
Powershell -Command "Get-AppxPackage *Tips* | Remove-AppxPackage" >nul 2>&1
pause
cls
goto c

:Disable Hibernation 
echo Disabling Hibernation 
powercfg -h off >nul 2>&1
pause
cls
goto c


:Registry Tweaks
echo Applying Registry tweaks...
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE" /v DisableExternalDMAUnderLock /t REG_DWORD /d 0 /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t Reg_DWORD /d 1 /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t Reg_DWORD /d 28 /f >nul 2>&1
pause
cls
goto c

:Delete Temp Files
echo Deleting Temp files
del /f /q "%localappdata%\temp\*.*" >nul 2>&1
del /f /q "C:\Windows\temp\*.*" >nul 2>&1
del /f /q "C:\Windows\Prefetch\*.*" >nul 2>&1
pause
cls
goto c

:Network Tweaks
echo applying Network Tweaks 
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "00000000" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "00000000" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "00000010" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "00000000" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "00000006" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "00000005" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "00000004" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "00000007" /f  >nul 2>&1
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "00000016" /f  >nul 2>&1
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "00000016" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "00000000" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "4294967295" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d "00000001" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "00000001" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "00065534" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "00000030" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "00000000" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "00000001" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPCongestionControl" /t REG_DWORD /d "00000001" /f  >nul 2>&1
pause
cls
goto c

:Power Plan
echo switching power plans
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
pause
cls
goto c

:Finished
cls
echo                                                           %version%
echo.
echo       Automated Tweaks have finished, Thank you for using Nicks services and make sure to leave a vouch.
echo                                 Press Enter to Restart your Computer
set /p=
shutdown -t 0 -r -f

