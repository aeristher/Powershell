#This function makes a random password. This *should* pass the complexity of a password unless RNG is not on our side

function rng {
$i = 0
[int[]]$arraya = @(33..47)
$arraya += (97..122)
$arrayb = @(65..90)
$arrayc = @(48..57)
$array2 = @()
while ($i -lt 4){
  $array2 += [char]$arrayb[(Get-Random -Maximum ([array]$arrayb).count)]
  $array2 += [char]$arraya[(Get-Random -Maximum ([array]$arraya).count)]
  $array2 += [char]$arrayc[(Get-Random -Maximum ([array]$arrayc).count)]
  $i++
}
$rngpass = -join $array2
$rngpass
}

$aduserlist = import-csv -path C:\Users\Administrator\Desktop\ADuserlist.csv
$aduserlist

#regular way
$aduserlist | % {New-ADUser -name ($_.fname + "." + $_.lname) -SamAccountName ($_.fname + "." + $_.lname) `
-GivenName $_.fname -Surname $_.lname -EmailAddress $_.email -Department $_."Intranet Computer Implementation Branch" -Enabled $true `
-AccountPassword ('PantherPanther$' | ConvertTo-SecureString -AsPlainText -Force) -WhatIf}

#playing with rng because why not
$aduserlist | % {New-ADUser -name ($_.fname + "." + $_.lname) -SamAccountName ($_.fname + "." + $_.lname) `
-GivenName $_.fname -Surname $_.lname -EmailAddress ($_.lname + "@contoso.com") -Department $_."Intranet Computer Implementation Branch" -Enabled $true `
-AccountPassword (rng | ConvertTo-SecureString -AsPlainText -Force)}

# This is for removing all of the users from the CSV when ya just mess up ya know
$aduserlist | foreach {Remove-ADUser -Identity ($_.fname + "." + $_.lname) -Confirm:$false}

#These show users' properties
get-aduser -filter * | select name,givenname,surname,mail,department,enabled,accountpassword

get-aduser -filter * -Properties *

# This shows that mail and department in fact shows up properly as the get-aduser -filter * | select etc. doesn't show those properties and are blank for some reason.
#Doing one at a time shows them properly.
get-aduser Jesus.Montgomery -Properties name,givenname,surname,mail,department,enabled
