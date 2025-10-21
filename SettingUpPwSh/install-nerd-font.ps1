$ErrorActionPreference = 'Stop'

function Log([string]$msg, [string]$level = 'INFO') {
    $ts = (Get-Date).ToString('HH:mm:ss')
    Write-Host "[$ts] [$level] $msg"
}

# Check if FiraCode Nerd Font is already installed
Add-Type -AssemblyName System.Drawing
$fontCollection = New-Object System.Drawing.Text.InstalledFontCollection
$fontFamilies = $fontCollection.Families
$installed = $fontFamilies | Where-Object { $_.Name -like "*FiraCode*" }
if ($installed) {
    Log "FiraCode Nerd Font is already installed. Skipping installation."
    exit
}

try {
    Log "Fetching latest Nerd Fonts release tag…"
    $data = Invoke-RestMethod -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest" `
        -Headers @{ "Accept"="application/json"; "User-Agent"="PowerShell" }

    $tag = $data.tag_name
    if (-not $tag) { throw "Could not resolve tag_name from response." }

    $zipUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/$tag/FiraCode.zip"
    Log "Latest tag: $tag"
    Log "ZIP URL: $zipUrl"

    # create temp inside try
    $tmp = Join-Path $env:TEMP ("nf_" + [guid]::NewGuid())
    $zip = Join-Path $tmp "FiraCode.zip"
    $unz = Join-Path $tmp "unz"
    New-Item -ItemType Directory -Path $tmp,$unz -Force | Out-Null
    Log "Temp folder: $tmp"

    try {
        Log "Downloading FiraCode.zip…"
        Invoke-WebRequest -Uri $zipUrl -Headers @{ "User-Agent"="PowerShell" } -OutFile $zip
        Log "Downloaded: $zip"

        Log "Extracting to: $unz"
        Expand-Archive -Path $zip -DestinationPath $unz -Force

        $fonts = Get-ChildItem -Path $unz -Recurse -Include *.ttf,*.otf
        if (-not $fonts) { throw "No fonts found in archive." }

        Log "Installing $($fonts.Count) fonts..."
        $shell = New-Object -ComObject Shell.Application
        $fontsFolder = $shell.Namespace(0x14)
        foreach ($f in $fonts) {
            $fontsFolder.CopyHere($f.FullName)
            Log "Installed: $($f.Name)"
        }
    }
    finally {
        if (Test-Path $tmp) {
            Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
            Log "Cleaned up temp folder."
        }
    }
}
catch {
    Log "ERROR: $($_.Exception.Message)" "ERROR"
}
finally {
        if (Test-Path $tmp) {
            Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
            Log "Cleaned up temp folder."
        }
    }