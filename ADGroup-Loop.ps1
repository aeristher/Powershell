$groups = Get-ADGroup -Filter *

foreach ($group in $groups) {
echo ("Group: " + $group.name)
$users=Get-ADGroupMember $group.name | Get-ADUSER -properties emailaddress,department -ErrorAction SilentlyContinue
foreach ($user in $users) {
echo ("`t " + $user.name + ", " + $user.GivenName + " " + $user.surname + ", " + $user.emailaddress + ", " + $user.department)
}
}
