$Secure= Read-Host -AsSecureString

$Secure

$Encrypted = ConvertFrom-SecureString -SecureString $Secure
$Encrypted

$Secure2 = ConvertTo-SecureString -String $Encrypted
$Secure2


new-aduser -Name jjohnny -GivenName "Johnny" -Surname "Test" -SamAccountName "jjohnny" `
 -AccountPassword (Read-host -AsSecureString "Type password for Johnny Test") -EmailAddress "johnny@contoso.com" `
 -Department "Warner Bros" -Enabled $True

 new-aduser -Name jbravo -GivenName "Johnny" -Surname "Bravo" -SamAccountName "jbravo" `
 -AccountPassword (Read-host -AsSecureString "Type password for Johnny Bravo") -EmailAddress "bravo@contoso.com" `
 -Department "Cartoon Network" -Enabled $True

 new-aduser -Name jquest -GivenName "Johnny" -Surname "Quest" -SamAccountName "jquest" `
 -AccountPassword (Read-host -AsSecureString "Type password for Johnny Quest") -EmailAddress "jquest@contoso.com" `
 -Department "Hanna-Barbera" -Enabled $True

 get-aduser jjohnny
 get-aduser jbravo
 get-aduser jquest

 set-aduser jjohnny -AccountExpirationDate 1/1/2015

 set-aduser jbravo -Enabled $True
 
 Set-ADAccountPassword -Identity jbravo -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "PantherPanther$" -Force)
 
remove-aduser jbravo -Confirm:$False

