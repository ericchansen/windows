# Define the SSH key files
$Files = @("$env:UserProfile\.ssh\id_rsa", "$env:UserProfile\.ssh\id_rsa.pub")
foreach ($File in $Files) {
    # Take ownership.
    TakeOwn /F $File
    # Disable inheritance of permissions from parent objects.
    icacls $File /inheritance:d
    # Grant full control (F) permission to the current user.
    icacls $File /grant ${env:UserName}:R
    # Remove specific groups from the access control list.
    icacls $File /remove:g Administrator "Authenticated Users" "BUILTIN\Administrators" "BUILTIN\Everyone" System Users
    # Display updated permissions.
    icacls $File
}
