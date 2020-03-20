#1 
new-aduser -Name "Oliver.Price" -GivenName "Oliver" -Surname "Price" -AccountPassword ("Panther$" | ConvertTo-SecureString -AsPlainText -Force) -Enabled $true 

#2
Set-ADAccountPassword -Identity "Oliver.Price" -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "PantherPanther$" -Force)
Get-AdUser "Oliver.Price" -Properties PasswordLastSet

#3
Get-ADDefaultDomainPasswordPolicy
#The Lockout Threshold was 0


get-addomain | select forest

Set-ADDefaultDomainPasswordPolicy -lockoutthreshold 3 -identity contoso.com
#The Lockout Threshold is now 3

Get-ADDefaultDomainPasswordPolicy

Get-ADUser -filter "name -like 'Oliver.Price'" -properties lockedout 

Search-ADAccount -LockedOut

Unlock-ADAccount Oliver.Price 

#4
get-aduser -Filter 'Surname -like "h*"' 

