winget install JanDeDobbeleer.OhMyPosh

$lineToAdd = 'oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kh.omp.json" | Invoke-Expression'
$env:POSH_THEMES_PATH = [System.Environment]::GetEnvironmentVariable("POSH_THEMES_PATH","User")

# Check if the profile file exists, create it if it doesn't
if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Add the line to the end of the profile file
Add-Content -Path $PROFILE -Value $lineToAdd
Copy-Item -Path "$PWD\..\CommonSettings\kh.omp.json" -Destination $env:POSH_THEMES_PATH -Force
Write-Output "Line added to $PROFILE"

# Reload the profile to apply the changes
. $PROFILE

Write-Output "Profile reloaded and environment variables refreshed"