# Run as admin.

# https://github.com/PowerShell/PSReadLine
# This might already be installed.
Install-Module PSReadLine

# https://github.com/dahlbyk/posh-git
Install-Module posh-git
# In case you've already installed a previous version of posh-git from the PowerShell
# Gallery.
# PowerShellGet\Update-Module posh-git

# I did this on my latest fresh install of Windows, but now I'm wondering if maybe it
# wasn't necessary. Oh well.
Install-Module -Name Terminal-Icons -Repository PSGallery
