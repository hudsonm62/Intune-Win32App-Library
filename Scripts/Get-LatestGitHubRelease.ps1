<#
.PARAMETER Filter
Filter script for main asset to download - i.e. { $_.name.EndsWith('arm64.msi')

.EXAMPLE
$x = ./Scripts/Get-LatestGitHubRelease.ps1 -Repo 'powershell/powershell' -Filter { $_.name.EndsWith('arm64.msi') }
Invoke-RestMethod -Uri $x.DownloadURI -OutFile './powershell-arm64.msi' -Method Get -UseBasicParsing
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]$Repo,

    [Parameter(Mandatory)]
    [scriptblock]$Filter
)

$headers = @{
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
}

[uri]$URI = "https://api.github.com/repos/$Repo/releases/latest"
$LatestRelease = Invoke-RestMethod -Uri $URI -Headers $headers -Method Get -UseBasicParsing

return @{
    DownloadURI = ($LatestRelease.assets | Where-Object -FilterScript $Filter ).browser_download_url
    VersionTag = $LatestRelease.tag_name
    ReleaseNotes = $LatestRelease.html_url
}
