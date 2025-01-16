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

## Recommended Setup on WSL2

1. Import GPG keys (see section below).
1. Install AWS CLI: `sudo snap install aws-cli --classic`.

### Import GPG Keys

You can just copy and paste the folder. Run `gpg --list-keys` to ensure your keys are
there. You can also run `echo "test" | gpg --sign` to see if everything works. If you
run into an issue, you might want to try `export GPG_TTY=$(tty)`. I prefer to add this
as one of my startup profiles.

Next you'll need to add your keys to Git. Run
`gpg --list-secret-keys --keyid-format=long` and extract the ID of your key. It should
be 16 characters. Then run the following commands.

```sh
git config --global user.signingkey gpg ...
git config --global commit.gpgsign true
git config --global tag.gpgSign true
```

### Automate AWS

Throw this into your .bashrc.

```bash
getpip() {
  local profile="${1:-default}"
  local domain="${2:-default}"
  local domain_owner="${3:-default}"
  local repository="${4:-default}"

  # Get the authorization token.
  local token
  token=$(aws codeartifact get-authorization-token --profile "$profile" --domain "$domain" --domain-owner "$domain_owner" --query authorizationToken --output text)

  # Get the repository endpoint.
  local url
  url=$(aws --profile "$profile" codeartifact get-repository-endpoint --domain "$domain" --repository "$repository" --format pypi --domain-owner "$domain_owner" --no-cli-pager)
  url=$(echo "$url" | jq -r '.repositoryEndpoint')

  # Construct the final URL.
  url="https://aws:$token@${url#https://}simple"

  # Output the URL.
  echo "$url"
}
```

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
