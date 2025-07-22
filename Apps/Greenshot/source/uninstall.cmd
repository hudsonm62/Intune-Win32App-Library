:: used for running in user context
cmd.exe /c "tasklist /FI "IMAGENAME eq Greenshot.exe" | find /I "Greenshot.exe" && taskkill /F /IM Greenshot.exe & "%LOCALAPPDATA%\Greenshot\unins000.exe" /SP- /VERYSILENT /NORESTART /FORCECLOSEAPPLICATIONS /SUPPRESSMSGBOXES"
