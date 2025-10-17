$apps = @(
    @{ Name = "Git.Git"; Override = '/VERYSILENT /NORESTART /COMPONENTS="icons,extcore,gitlfs,scalar,vscode"' },
    @{ Name = "Microsoft.VisualStudioCode"; Override = $null },
    @{ Name = "Microsoft.PowerToys"; Override = $null },
    @{ Name = "AutoHotkey.AutoHotkey"; Override = $null },
    @{ Name = "JanDeDobbeleer.OhMyPosh"; Override = $null }
)

foreach ($app in $apps) {
    Write-Host "Installing $($app.Name)..."

    if ($app.Override) {
        winget install $($app.Name) `
            --silent `
            --accept-package-agreements `
            --accept-source-agreements `
            --disable-interactivity `
            --no-upgrade `
            --override "$($app.Override)"
    } else {
        winget install $($app.Name) `
            --silent `
            --accept-package-agreements `
            --accept-source-agreements `
            --disable-interactivity `
            --no-upgrade
    }
}

# Install VS Code extensions in the VsCode directory
Set-Location -Path "$PSScriptRoot\VsCode"
& .\vscode-extensions.ps1
Set-Location -Path $PSScriptRoot

# Run install.ps1 in the AutoHotkey directory
Set-Location -Path "$PSScriptRoot\AutoHotkey"
& .\install.ps1
Set-Location -Path $PSScriptRoot

# Setup PwSh by running poshgit.sh in SettingUpPwSh directory
Set-Location -Path "$PSScriptRoot\SettingUpPwSh"
& .\poshgit.ps1
Set-Location -Path $PSScriptRoot



Write-Host "All applications and extensions have been installed."