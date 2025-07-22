#region Setup
$AppName = "Python 3.13"
$Locations = @(
    # User Locations
    [string](Join-path $env:LOCALAPPDATA "Python313\python.exe")

    # System Locations
    [string](Join-path $env:ProgramFiles "Python313\python.exe")
    [string](Join-path ${env:ProgramFiles(x86)} "Python313\python.exe")
)
#endregion

############

#region Define Functions
function Test-FilePresence {
    param ($f)
    if(Test-Path $f){
        Write-Output "Located at '$f'"
        exit 0
    }
}
function Find-UninstallKey {
    param ($n)
    $x = @(
            # User Locations
            "Registry::HKEY_CURRENT_USER\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
            "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall"

            # System Locations
            "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
            "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
        ) | ForEach-Object {
            if(Test-Path $_){
                Get-ChildItem $_ | ForEach-Object {
                    Get-ItemProperty $_.PSPath
                } | Where-Object {
                    $_.DisplayName -like "*$n*"
                }
            }
        }
    if($null -ne $x){
        Write-Output "Found Uninstall Keys"
        exit 0
    }
}
#endregion
#region Check Presence
# confirm files don't exist on common paths
$Locations | ForEach-Object {
    Test-FilePresence -f $_
}

# confirm no matching products installed, in case installed in a different directory
Find-UninstallKey -n $AppName

exit 1
#endregion
