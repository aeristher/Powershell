#Pre-task 
import-module activedirectory
get-psdrive
cd AD:\"cn=users,dc=contoso,dc=com"
new-psdrive -Name Users -PsProvider ActiveDirectory -Root "AD:\cn=users,dc=contoso,dc=com"
dir | ? Name -match 'Oliver'

#1.) Creating organizational units from the CSV
$oudep = import-csv C:\Users\Administrator\Desktop\departments-1.csv

$oudep | % {New-ADOrganizationalUnit -name $_.department}

#1.) Creating groups under OUs
new-adgroup -Name Marketing -GroupScope global -path "OU=Marketing,OU=Departments,dc=contoso,dc=com"
new-adgroup -Name IT -GroupScope global -path "OU=IT,OU=Departments,dc=contoso,dc=com"
new-adgroup -Name HumanResources -GroupScope global -path "OU=HumanResources,OU=Departments,dc=contoso,dc=com"
new-adgroup -Name Sales -GroupScope global -path "OU=Sales,OU=Departments,dc=contoso,dc=com"
new-adgroup -Name Manufacturing -GroupScope global -path "OU=Manufacturing,OU=Departments,dc=contoso,dc=com"

#2.) Adding a shortcut for Users
new-psdrive -Name Users -PsProvider ActiveDirectory -Root "AD:\cn=users,dc=contoso,dc=com"
cd users:

#3.) Creating an array with 5 users
$userarray = @("Alice.Stevens", "Edgar.Lynch", "Seth.Jones", "Peter.Floyd", "Jake.Newman")
#3.) Adding the users in the Marketing Group
$userarray | % {Add-ADGroupMember "Marketing" $_}

#4.) Moving the users into the Marketing Container
$TargetOU = "OU=Marketing,OU=Departments,dc=contoso,dc=com"
$userarray | ForEach-Object {$userDN = (Get-ADUser -Identity $_).distinguishedName
Move-ADObject -Identity $userDN -TargetPath $TargetOU}

#5.) Setting the department properties for the user accounts to Marketing
$userarray | % {Set-Aduser $_ -Department "Marketing"}

#6.) Listing all the users and groups under the marketing container
cd AD:\"ou=marketing,ou=departments,dc=contoso,dc=com"
ls
