# install.ps1 - one-shot setup for Leben's NVIDIA Pack (Windows)
# Installs the packwiz fork (trusted CurseForge key) and exports the .mrpack.
# Usage: powershell -ExecutionPolicy Bypass -File install.ps1
$ErrorActionPreference = "Stop"

$Tag    = "v0.0.1"
$Repo   = "Lebenoa/packwiz"
$Asset  = "packwiz-windows-amd64.exe"

function Test-PackwizFork {
    param([string]$Exe)
    try {
        $out = & $Exe 2>&1 | Out-String
    } catch { return $false }
    return $out -match "packwiz"
}

# 0. Ensure we are in the pack checkout (fetch it if run standalone).
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not (Test-Path (Join-Path $here "pack.toml"))) {
    Write-Host "No pack.toml next to the script - fetching pack metadata from GitHub..."
    $tmp = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $tmp | Out-Null
    $zip = Join-Path $tmp "pack.zip"
    Invoke-WebRequest -Uri "https://github.com/Lebenoa/leben-nvidia-pack/archive/refs/heads/master.zip" -OutFile $zip
    Expand-Archive -Path $zip -DestinationPath $tmp
    $extracted = Join-Path $tmp "leben-nvidia-pack-master"
    # Work inside the extracted checkout for the rest of the run.
    Set-Location $extracted
} else {
    Set-Location $here
}

# 1. Resolve packwiz: use existing if present, else download fork release.
$packwiz = $null
$existing = Get-Command packwiz -ErrorAction SilentlyContinue
if ($existing) {
    $packwiz = $existing.Source
    Write-Host "Found existing packwiz at $packwiz"
    Write-Host "WARNING: must be the Lebenoa/packwiz fork (trusted CurseForge key), not upstream." -ForegroundColor Yellow
    Write-Host "If export fails on InstaPack, that's why - delete it or set PACKWIZ_EXE to the fork binary."
} else {
    $dest = Join-Path $PWD "packwiz.exe"
    Write-Host "Downloading fork packwiz ($Asset)..."
    $url = "https://github.com/$Repo/releases/download/$Tag/$Asset"
    Invoke-WebRequest -Uri $url -OutFile $dest
    if (-not (Test-PackwizFork $dest)) { throw "Downloaded binary did not run correctly." }
    $packwiz = $dest
    Write-Host "Downloaded to $dest"
}

# 2. Export the pack from this repo's checkout.
Write-Host "Exporting .mrpack..."
& $packwiz modrinth export -o leben-nvidia-pack.mrpack
if ($LASTEXITCODE -ne 0) { throw "packwiz export failed." }

Write-Host "`nDone: $PWD\leben-nvidia-pack.mrpack" -ForegroundColor Green
Write-Host "Import it into a Modrinth-compatible launcher (Prism Launcher, ATLauncher, etc)."
