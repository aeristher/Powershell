function featstaller {
Param ([string[]]$windowsfeature)
$checkfeaturestate = get-windowsfeature $windowsfeature | select -ExpandProperty "Installed"
if ($checkfeaturestate -eq $null){
write-host "Welp, your feature $windowsfeature is not found"
}
elseif ($checkfeaturestate -eq "True"){
write-host "Welp, your feature $windowsfeature is already installed"}
else {
write-host "Installing $windowsfeature"
Install-WindowsFeature $windowsfeature -LogPath $env:USERPROFILE/feature.log
}
}

