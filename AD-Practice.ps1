import-module activedirectory
cd AD:\"ou=departments,dc=contoso,dc=com"

New-ADOrganizationalUnit -Name "Week7"

$week7users = import-csv -Path "C:\Users\Administrator\Desktop\week7quizusers.csv" 

$week7users | New-AdUser -Name {$_.firstname + "." + $_.lastname} -SamAccountName {$_.firstname + "." + $_.lastname} -Department {$_.company} -AccountPassword (Read-Host -AsSecureString "Panther$") -Enabled $true

new-adgroup -Name "ACME" -GroupScope Global

get-adgroupmember "ACME"

Add-ADGroupMember ACME "Bo.Diddly", "Jo.Diddly","Wile.Coyote","Bugs.Bunny","Elmer.Fudd"

Reset-ADServiceAccountPassword "Elmer.Fudd" 

Set-ADAccountPassword -Identity "Elmer.Fudd" -NewPassword (ConvertTo-SecureString -AsPlainText "Panther$1" -Reset)

Remove-AdUser -Identity "Bugs.Bunny"  
