$username = "ansible"
$password = "Password01$"

$group = "Administrators"

$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$existing = $adsi.Children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $username }

if ($existing -eq $null) {

    Write-Host "Creating new local user $username."
    & NET USER $username $password /add /y /expires:never

    Write-Host "Adding local user $username to $group."
    & NET LOCALGROUP $group $username /add

}
else {
    Write-Host "Setting password for existing local user $username."
    $existing.SetPassword($password)
}

Write-Host "Ensuring password for $username never expires."
& WMIC USERACCOUNT WHERE "Name='$username'" SET PasswordExpires=FALSE

Invoke-Expression ((New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))
