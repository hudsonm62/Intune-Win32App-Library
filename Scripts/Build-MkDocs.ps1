param(
    [switch]$Serve = $false,
    [Int32]$ServePort = 8000
)

if($null -eq (Get-Command mkdocs)){
    throw "Missing MkDocs command"
}

$WikiRoot = Get-Item (Join-Path $PSScriptRoot '../Wiki') -ErrorAction Stop
[string]$ConfigPath = Get-Item (Join-Path $WikiRoot 'mkdocs.yml') -ErrorAction Stop

if($Serve -ne $true){
    mkdocs build --config-file "$ConfigPath" -c
} else {
    mkdocs serve -a localhost:$ServePort --config-file "$ConfigPath"
}
