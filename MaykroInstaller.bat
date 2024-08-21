@echo off

:: Değişkenler
set REPO_URL=https://github.com/tasinsahin/maykropublic
set TARGET_DIR=C:\Maykro
set EXE_NAME=Maykro.exe
set SHORTCUT_NAME=Maykro.lnk
set DESKTOP_PATH=%USERPROFILE%\Desktop

:: Eski kısayolu sil
if exist "%DESKTOP_PATH%\%SHORTCUT_NAME%" (
    echo Masaüstündeki mevcut kısayol siliniyor...
    del "%DESKTOP_PATH%\%SHORTCUT_NAME%"
)

:: Eski dosyaları sil
if exist "%TARGET_DIR%" (
    echo "%TARGET_DIR%" dizini zaten var, mevcut dosyalar siliniyor...
    rmdir /S /Q "%TARGET_DIR%"
)

:: GitHub reposunu indir
git clone %REPO_URL% "%TARGET_DIR%"

:: Masaüstüne kısayol oluştur
set EXE_PATH=%TARGET_DIR%\%EXE_NAME%
set SHORTCUT_PATH=%DESKTOP_PATH%\%SHORTCUT_NAME%

:: PowerShell kullanarak kısayol oluşturma
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = '%EXE_PATH%'; $s.WorkingDirectory = '%TARGET_DIR%'; $s.Save()"

echo Kısayol oluşturuldu: %SHORTCUT_PATH%

pause
