[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Require-Path([string]$relativePath) {
    $fullPath = Join-Path $projectRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath)) {
        $errors.Add("Missing required path: $relativePath")
    }
}

@(
    "Game.exe", "Game.ini", "Game.rxproj", "Data/Scripts.rxdata",
    "Data/MapInfos.rxdata", "PBS/pokemon.txt", "PBS/moves.txt",
    "PBS/items.txt", "PBS/map_metadata.txt", "PBS/encounters.txt",
    "Graphics", "Audio", "Fonts"
) | ForEach-Object { Require-Path $_ }

$mapFiles = @(Get-ChildItem (Join-Path $projectRoot "Data") -File -Filter "Map*.rxdata" |
    Where-Object { $_.Name -ne "MapInfos.rxdata" })
if ($mapFiles.Count -eq 0) {
    $errors.Add("No map files were found in Data/.")
}

$nestedGraphics = Join-Path $projectRoot "Graphics/Graphics"
if (Test-Path -LiteralPath $nestedGraphics) {
    $warnings.Add("Graphics/Graphics exists; nested files are normally outside runtime lookup paths.")
}

$pluginFiles = @()
$pluginsPath = Join-Path $projectRoot "Plugins"
if (Test-Path -LiteralPath $pluginsPath) {
    $pluginFiles = @(Get-ChildItem $pluginsPath -Recurse -File)
}

$gameTitle = ""
$titleLine = Select-String -Path (Join-Path $projectRoot "Game.ini") -Pattern '^Title=(.*)$' |
    Select-Object -First 1
if ($titleLine) { $gameTitle = $titleLine.Matches[0].Groups[1].Value }
if ($gameTitle -match 'Essentials') {
    $warnings.Add("Game.ini still uses the Pokemon Essentials default title.")
}

$scriptSourceFiles = @(Get-ChildItem (Join-Path $projectRoot "Data") -Recurse -File -Filter "*.rb" -ErrorAction SilentlyContinue)
if ($scriptSourceFiles.Count -eq 0) {
    $warnings.Add("No editable Ruby script sources were found; only the compiled script bundle is available.")
}

Write-Output "Project baseline validation"
Write-Output "Root: $projectRoot"
Write-Output "Maps: $($mapFiles.Count)"
Write-Output "Plugins: $($pluginFiles.Count) files"
Write-Output "Game title: $gameTitle"

foreach ($warning in $warnings) { Write-Warning $warning }
foreach ($validationError in $errors) { Write-Error $validationError }

if ($errors.Count -gt 0) { exit 1 }
Write-Output "PASS: required baseline files are present."
