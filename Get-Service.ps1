function waiter {
Param([string[]]$customer)
$staff = get-service $customer -ErrorAction SilentlyContinue
if ($staff -eq $null){
Write-Host "Welp, nothing to see here" 
}
else {
foreach ($i in $staff){
write-host $staff ; break
}
}
#This sends the service file into a certain directory
$staff | out-file -FilePath $env:USERPROFILE\waiter.txt
#This selects DisplayName and StartType exclusively
$staff | Select-Object -Property DisplayName, StartType
#This shows the services from Running to Stopped
$staff | Sort-Object -Property Status, DisplayName 
}
#This shows all of the services from Running to Stopped
get-service | Sort-Object -Property Status, DisplayName -Descending
#This sets an alias for waiter
set-alias -Name wait -Value waiter
