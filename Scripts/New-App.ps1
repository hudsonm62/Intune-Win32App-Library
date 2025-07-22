param(
    [Parameter(Mandatory)]
    [string]$AppName
)

$RepoRoot = Join-Path $PSScriptRoot '../'
$AppsDirectory = Join-Path $RepoRoot "Apps"

$TemplateApp = Join-Path $AppsDirectory "_template"
$Destination = Join-Path $AppsDirectory $AppName

if(Test-Path $Destination){
    throw "App '$AppName' already exists under '$Destination'!"
}

Copy-Item $TemplateApp $Destination -Force -Recurse -ErrorAction Stop
Write-Output "Created new app under 'Apps\$AppName'"
