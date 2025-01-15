@ECHO OFF
GOTO CHECK_PERMISSIONS

:CHECK_PERMISSIONS
    ECHO Administrative permissions required. Detecting permissions...
    NET SESSION >NUL 2>&1
    if %errorLevel% == 0 (
        ECHO Success: Administrative permissions confirmed. Press any key to continue.
    ) else (
        ECHO Failure: Current permissions inadequate. Press any key to continue.
    )
    PAUSE >NUL

REM Comment/uncomment lines to select software.

REM IDE
winget install --exact --id Microsoft.VisualStudioCode
REM winget install --exact --id Microsoft.VisualStudioCodeInsiders
REM winget install --exact --id Microsoft.VisualStudio.Professional
REM winget install --exact --id Microsoft.VisualStudio.2019.Community-Preview

REM Social apps
winget install --exact --id Discord.Discord
winget install --exact --id SlackTechnologies.Slack
REM winget install --exact --id Microsoft.Teams

REM Tools
winget install --exact --id 7zip.7zip
winget install --exact --id CPUID.HWMonitor
REM winget install --exact --id Google.BackupAndSync
winget install --exact --id Google.GoogleDrive
REM winget install --exact --id Inkscape.Inkscape
winget install --exact --id KeePassXCTeam.KeePassXC
REM winget install --exact --id LibreOffice.LibreOffice
REM winget install --exact --id Malwarebytes.Malwarebytes
REM winget install --exact --id Microsoft.MouseWithoutBorder
REM winget install --exact --id Nvidia.GeForceExperience
REM winget install --exact --id Nvidia.CUDA
winget install --exact --id OBSProject.OBSStudio
winget install --exact --id OpenVPNTechnologies.OpenVPNConnect
winget install --exact --id VB-Audio.Voicemeeter.Potato
winget install --exact --id VideoLAN.VLC
REM winget install --exact --id WinDirStat.WinDirStat
winget install --exact --id Zotero.Zotero

REM Music
REM winget install --exact --id Audacity.Audacity
winget install --exact --id VentisMediaInc.MediaMonkey
winget install --exact --id Spotify.Spotify

REM Programming
winget install --exact --id Docker.DockerDesktop
REM winget install --exact --id GNU.Emacs
winget install --exact --id Git.Git
winget install --exact --id JanDeDobbeleer.OhMyPosh
winget install --exact --id Microsoft.AzureCLI
REM winget install --exact --id Microsoft.AzureStorageExplorer
winget install --exact --id Microsoft.GitCredentialManagerCore
REM winget install --exact --id Microsoft.PowerShell-Preview
REM winget install --exact --id Microsoft.WindowsTerminalPreview
winget install --exact --id MSYS2.MSYS2
winget install --exact --id Postman.Postman
REM winget install --exact --id UB-Mannheim.TesseractOCR
winget install --exact --id vim.vim

REM Browsers
winget install --exact --id Google.Chrome
winget install --exact --id Mozilla.Firefox
winget install --exact --id Microsoft.Edge

REM Gaming
winget install --exact --id Blizzard.BattleNet
winget install --exact --id ElectronicArts.Origin
winget install --exact --id EpicGames.EpicGamesLauncher
winget install --exact --id GOG.Galaxy
winget install --exact --id Valve.Steam
