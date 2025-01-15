# Automate Windows Setup

This is a collection of scripts used to automate the setup of Windows on a fresh box.

## Recommended Setup

1. admin/set-execution-policy-unrestricted.ps1
1. admin/automatic-startup-ssh-agent.ps1
1. install-wsl2.ps1
1. winget.bat
1. show-extensions.ps1
1. Install proxytunnel (need to add docs).
1. update-path.ps1.

## Improve PowerShell

1. admin/install-module.ps1
1. setup-oh-my-posh.ps1
1. Create or update your PowerShell profile (see section below).
1. Update your Windows Terminal settings.

### Update PowerShell Profile

You can use `echo $PROFILE` to see where your default profile is located. For me, it's
automatically backed up to OneDrive. I use something like this.

```powershell
# I like this theme.
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/jandedobbeleer.omp.json" | Invoke-Expression

# We used to have to retrieves themes online.
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json' | Invoke-Expression.

# This inits the default theme.
# oh-my-posh init pwsh | Invoke-Expression
```

### Update Windows Terminal Settings

The easiest way I'm aware of to find the Windows Terminal settings.json is to open the
program and use its menu to navigate to settings.json. Add the desired font to
`profiles.defaults.font.face`.

```json
{
    "profiles": {
        "defaults": {
            "font": {
                "face": "MesloLGM Nerd Font"
            }
        }
    }
}
```
