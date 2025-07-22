<#
.DESCRIPTION
Script downloads installer for the software.
Since (in most cases) we aren't allowed to redistribute the installers, a script to download them on demand is provided instead.

To use, fill out the parameters in the script, so all you need to do is run ./download.ps1

For GitHub Releases that change, a script is provided in /scripts/Get-LatestGitHubRelease.ps1 to get the latest link which you can pass in via -URI.

WARNING:
    - Perform hash checks by yourself - These can change depending on the app and install URI
    - If you want to use the ARM64 version of an installer, you'll need to update the link yourself.
    - I will always default to the x64 version of an installer.
    - For apps that don't update themselves, the admin is responsible for keeping app installers up to date.


(this download script could probably be improved later down the line across the board)

.EXAMPLE
# Get the latest ARM version of PowerShell

$URI = (& './Scripts/Get-LatestGitHubRelease' -Repo 'PowerShell/PowerShell' -Filter {$_.name -like '*win-arm64.msi'}).DownloadURI,
./download.ps1 -URI $URI -OutFileName 'ps7-win-arm64.msi'
#>

[CmdletBinding()]
param(
    [Parameter()]
    [uri]$URI = 'https://download.smokeball.com/?id=313876bd-3adb-4d68-baf4-21312e56c074', # AU
    # UK: https://download.smokeball.com/?id=9361af86-968b-4f10-b18e-c6d3dcc6c630
    # USA: https://download.smokeball.com/?id=0b3e9fc9-c342-4ce6-8cca-3569d0aa3d56
    [Parameter()]
    [string]$OutFileName = 'Smokeball-Installer.exe'
)

$OutPath = Join-Path -Path (Join-Path $PSScriptRoot 'source') -ChildPath $OutFileName
Invoke-RestMethod -Method Get -Uri $URI -OutFile $OutPath -UseBasicParsing -ErrorAction Stop

return $OutFileName
