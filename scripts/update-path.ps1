# Define new paths to add.
$newPaths = "C:\msys64\usr\bin;C:\Users\$env:USERNAME\bin"

# Backup the current user PATH.
$currentPath = [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::User)
$currentPath | Out-File -FilePath "$env:USERPROFILE\Documents\UserPathBackup.txt"

# Split the new paths into an array.
$newPathsArray = $newPaths -split ';'

# Filter out paths that already exist in the current user PATH.
$pathsToAddArray = $newPathsArray | Where-Object { $currentPath -notlike "*$_*" }

# Join the remaining paths into a single string.
$pathsToAdd = $pathsToAddArray -join ';'

# Update the user PATH if there are new paths to add.
if ($pathsToAdd) {
    $updatedUserPath = "$currentPath;$pathsToAdd"
    [Environment]::SetEnvironmentVariable("PATH", $updatedUserPath, [EnvironmentVariableTarget]::User)
    Write-Output "User PATH updated successfully."
} else {
    Write-Output "The specified paths are already present in the User PATH."
}

# Print the updated user PATH.
Write-Output "`nUser PATH vars:"
$updatedUserPath = [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::User)
$updatedUserPath -split ';' | ForEach-Object { Write-Output $_ }
