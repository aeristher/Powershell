invoke-command -ComputerName zonnon -ScriptBlock{
Get-VMProcessor -VMName MyServer
}

invoke-command -ComputerName zonnon -ScriptBlock{
Get-VMMemory -Vmname MyServer
}

invoke-command -ComputerName zonnon -ScriptBlock{
Get-VM -Name Myserver | Select-Object VMID | Get-vhd
}

invoke-command -ComputerName zonnon -ScriptBlock{
Get-VM -Name Myserver | select-object *
}

invoke-command -ComputerName zonnon -ScriptBlock{
Get-VMNetworkAdapter -VMName MyServer
}
