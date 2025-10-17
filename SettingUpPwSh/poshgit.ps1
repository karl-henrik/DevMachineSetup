winget install JanDeDobbeleer.OhMyPosh

# Check if Oh My Posh is already configured in the profile
if (Test-Path -Path $PROFILE) {
    $profileContent = Get-Content -Path $PROFILE -Raw
    if ($profileContent -match "oh-my-posh") {
        Write-Output "Oh My Posh is already configured in the profile."
        exit
    }
}

$env:POSH_THEMES_PATH = [System.Environment]::GetEnvironmentVariable("POSH_THEMES_PATH","User")

# Determine the config path: use POSH_THEMES_PATH if set, otherwise use full path to CommonSettings
if ($env:POSH_THEMES_PATH) {
    $configPath = "$env:POSH_THEMES_PATH\kh.omp.json"
} else {
    $configPath = "$PSScriptRoot\..\CommonSettings\kh.omp.json"
}

$lineToAdd = 'oh-my-posh init pwsh --config "' + $configPath + '" | Invoke-Expression'

# Check if the profile file exists, create it if it doesn't
if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Add the line to the end of the profile file
Add-Content -Path $PROFILE -Value $lineToAdd

# Copy the config file only if POSH_THEMES_PATH is set
if ($env:POSH_THEMES_PATH) {
    Copy-Item -Path "$PSScriptRoot\..\CommonSettings\kh.omp.json" -Destination $env:POSH_THEMES_PATH -Force
}

Write-Output "Line added to $PROFILE"

# Reload the profile to apply the changes
. $PROFILE

Write-Output "Profile reloaded and environment variables refreshed"