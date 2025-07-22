param(
    [switch]$CI = $false
)
$RepoRoot = Join-Path $PSScriptRoot '../'
$AnalyzerSettings = Join-Path $RepoRoot 'PSScriptAnalyzerSettings.psd1'

$f = Get-ChildItem $RepoRoot -Include '*.ps1','*.psd1' -Exclude '*.Tests.ps1' -Recurse
$f | Invoke-ScriptAnalyzer -Settings $AnalyzerSettings -Recurse -ReportSummary -EnableExit:$CI

#Requires -Modules PSScriptAnalyzer
