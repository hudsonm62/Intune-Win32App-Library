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
# Get the ARM version of PowerShell 7.5.2
$URI = 'https://github.com/PowerShell/PowerShell/releases/download/v7.5.2/PowerShell-7.5.2-win-arm64.msi'
./download.ps1 -URI $URI -OutFileName 'ps7-win-arm64.msi'
#>

[CmdletBinding()]
param(
    [Parameter()]
    [uri]$URI = 'https://cdn01.foxitsoftware.com/product/reader/desktop/win/2025.1.0/FoxitPDFReader20251_enu_Setup_Prom.exe',
    [Parameter()]
    [string]$OutFileName = 'FoxitPDFReader-Installer.exe'
)

$OutPath = Join-Path -Path (Join-Path $PSScriptRoot 'source') -ChildPath $OutFileName
Invoke-RestMethod -Method Get -Uri $URI -OutFile $OutPath -UseBasicParsing -ErrorAction Stop

return $OutFileName
