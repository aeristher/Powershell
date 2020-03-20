get-vm -Name MarketingUno

start-vm -Name MarketingUno
save-vm -Name MarketingUno
stop-vm -Name MarketingUno -Force


function takeoff {
Param ([string]$vmname)
$checkstate = get-vm -Name $vmname | select -ExpandProperty State
if ($checkstate -eq "Running"){
Write-Host "Yo, your VM $vmname is already up and running."}
else {
start-vm -Name $vmname 
Write-Host "Yo, your VM $vmname is taking off :)"
}
}

function mayday {
Param ([string]$vmname)
$checkstate = get-vm -Name $vmname | select -ExpandProperty State
if ($checkstate -eq "Off"){
Write-Host "Yo, your VM is already gone."}
else {
stop-vm -Name $vmname -Force
Write-Host "Uh-oh, your VM $vmname is going down :'("
}
}
