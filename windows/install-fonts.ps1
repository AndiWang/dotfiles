# Installs the repo's fonts for the current Windows user (no admin needed), so
# Windows Terminal / Cursor / VS Code on the Windows side match the Mac.
# Run from PowerShell:  powershell -ExecutionPolicy Bypass -File install-fonts.ps1
$ErrorActionPreference = 'Stop'
$src = Join-Path $PSScriptRoot '..\fonts'
$dst = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Fonts'
$reg = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts'
New-Item -ItemType Directory -Force -Path $dst | Out-Null

Get-ChildItem $src -Include *.ttf, *.otf -Recurse | ForEach-Object {
    $target = Join-Path $dst $_.Name
    Copy-Item $_.FullName $target -Force
    $kind = if ($_.Extension -eq '.otf') { 'OpenType' } else { 'TrueType' }
    New-ItemProperty -Path $reg -Name "$($_.BaseName) ($kind)" -Value $target -PropertyType String -Force | Out-Null
    Write-Host "installed $($_.Name)"
}
Write-Host 'Done. Restart Windows Terminal / editors to pick up the fonts.'
