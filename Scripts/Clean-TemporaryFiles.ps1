param(
    [switch]$WhatIf = $false
)
$FileTypes = @(
    ".intunewin"
    ".exe"
    ".msi"
    ".log"
)

$RepoRoot = Join-Path $PSScriptRoot '../'
$x = Get-ChildItem $RepoRoot -Recurse -File | Where-Object { $FileTypes -contains $_.Extension }
$amount = $x.Length

$x | Remove-Item -Force -WhatIf:$WhatIf
if(-not $WhatIf){ Write-Output "Removed $amount item(s)" }

$MkDocsOutput = Join-Path $PSScriptRoot '../Wiki/site'
$MkDocsAssetCache = Join-Path $PSScriptRoot '../.cache'
if(Test-Path $MkDocsOutput){
    Remove-Item $MkDocsOutput -Recurse -Force -WhatIf:$WhatIf
    if(-not $WhatIf){ Write-Output "Cleared built MkDocs site 'Wiki/site'" }
}
if(Test-Path $MkDocsAssetCache){
    Remove-Item $MkDocsAssetCache -Recurse -Force -WhatIf:$WhatIf
    if(-not $WhatIf){ Write-Output "Cleared MkDocs Asset Cache" }
}
