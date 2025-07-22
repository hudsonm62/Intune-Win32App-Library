<#
.DESCRIPTION
    Downloads specified source via 'download.ps1' and packages app after confirming the Content Prep Tool is available.
.PARAMETER URIOverride
    Optional URL Override instead of whats already specified in 'download.ps1'
.PARAMETER ShowDownloadProgress
    Displays Progress Bar for file download.
#>
param(
    [Parameter(Mandatory, ParameterSetName = 'Name', Position = 1)]
    [ValidateNotNullOrEmpty()]
    [string]$AppName,

    [Parameter(ParameterSetName = 'Name', Position = 2)]
    [uri]$URIOverride,

    [Parameter(ParameterSetName = 'All')]
    [switch]$All = $false
)

$template = '_template'
if($AppName -eq $template){
    throw "You can't package the template app - Try an App name from '\Apps' instead!"
}

$RepoRoot = Join-Path $PSScriptRoot '../'
$AppsDirectory = Join-Path $RepoRoot 'Apps'
$PackagerDownloader = Join-Path $PSScriptRoot 'Download-IntuneWinAppUtil.ps1'

if($All){
    $AppsToPackageRoot = Get-ChildItem -Path $AppsDirectory -Directory -Exclude $template -ErrorAction Stop
} else {
    $AppsToPackageRoot = Get-Item (Join-Path $AppsDirectory -ChildPath $AppName) -ErrorAction Stop
}

## Download Intune Packager Tool if not found
$Packager = (Join-Path $RepoRoot 'IntuneWinAppUtil.exe')
& $PackagerDownloader

$AppsToPackageRoot | ForEach-Object {
    Write-Output "-- Packaging '$($_.Name)' --"
    $AppSource = Get-Item (Join-Path $_ -ChildPath 'source') -ErrorAction Stop
    $OutFolder = Get-Item $_.FullName -ErrorAction Stop

    $SourceDownloader = Get-Item (Join-Path $_ 'download.ps1') -ErrorAction Stop

    $Override = @{}
    if (-not [string]::IsNullOrEmpty($URIOverride)) {
        $Override.Uri = $URIOverride
    }
    $SetupFile = & $SourceDownloader @Override

    & $Packager -c $AppSource.FullName -s $SetupFile -o $OutFolder.FullName -q
}
