REM Here's an old script I used for vim and tesseract.
REM I just don't use these apps anymore.

REM Create profile.ps1 needed for aliases. This one is for VIM and Tesseract.
$AliasString = @"
Set-Alias vim `"C:\Program Files\Vim\vim82\vim.exe`"
Set-Alias tesseract `"C:\Users\$env:UserName\AppData\Local\Programs\Tesseract-OCR\tesseract.exe`"
"@

REM This is just for VIM.
REM $AliasString = @"
REM Set-Alias vim `"C:\Program Files\Vim\vim82\vim.exe`"
REM "@

New-Item C:\Users\$env:UserName\Documents\WindowsPowerShell\profile.ps1 -ItemType File -Value $AliasString
REM New-Item C:\Users\$env:UserName\Documents\PowerShell\profile.ps1 -ItemType File -Value $AliasString
