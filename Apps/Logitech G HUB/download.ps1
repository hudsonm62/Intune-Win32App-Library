<#
.DESCRIPTION
Script downloads installer for the software.
Since (in most cases) we aren't allowed to redistribute the installers, a script to download them on demand is provided instead.

To use, fill out the parameters in the script, so all you need to do is run ./download.ps1

For GitHub Releases that change, a script is provided in /scripts/Get-LatestGitHubRelease.ps1 to get the latest link which you can pass in via -URI.

(this download script could probably be improved later down the line across the board)

.EXAMPLE
# Get the latest ARM version of PowerShell
$URI = (& '../../Scripts/Get-LatestGitHubRelease.ps1' -Repo 'PowerShell/PowerShell' -Filter {$_.name -like '*win-arm64.msi'}).DownloadURI,
./download.ps1 -URI $URI -OutFileName 'ps7-win-arm64.msi'
#>
[CmdletBinding()]
param(
    [Parameter()]
    [uri]$URI = "https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe",
    [Parameter()]
    [string]$OutFileName = "lghub_installer.exe"
)

$OutPath = Join-Path -Path (Join-Path $PSScriptRoot 'source') -ChildPath $OutFileName
Invoke-RestMethod -Method Get -Uri $URI -OutFile $OutPath -UseBasicParsing -ErrorAction Stop

return $OutFileName
