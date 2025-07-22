param(
    [switch]$Force = $false
)
$RepoRoot = Resolve-Path (Join-path $PSScriptRoot "../")
$OutFile = Join-Path $RepoRoot 'IntuneWinAppUtil.exe'
[uri]$Uri = 'https://raw.githubusercontent.com/microsoft/Microsoft-Win32-Content-Prep-Tool/refs/heads/master/IntuneWinAppUtil.exe'

if(-not (Test-Path $OutFile) -or $Force){
    Invoke-RestMethod -Uri $Uri -OutFile $OutFile -Method Get -UseBasicParsing
}
