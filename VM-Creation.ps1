<#
    Name: Marketing
    Startup Memory 512 MB
    Enable Dynamic Memory
    Maximum Memory 3GB
    127 GB Hard Drive
    2 Processors
    Attaches an ISO to the dvd drive for OS installation.
#>

$VMname = "MarketingUno"
$VMLocation = "D:\aer\PowershellVM\VMs"
$VHDlocation = "D:\aer\PowershellVM\Vhds"
$VhdPath = "$VHDLocation\MarketingUno.Vhdx"
$ISOPath = "D:\aer\PowershellVM\ISO\CentOS-8-x86_64-1905-dvd1.iso"

New-Vm -Name $VMname -Path $VMLocation -MemoryStartupBytes 512MB
New-VHD -Path $VhdPath -SizeBytes 127GB -Dynamic
Add-VMHardDiskDrive -VMName $VMname -Path $VhdPath
Set-VMDvdDrive -VMName $VMName -ControllerNumber 1 -Path $ISOPath
Set-VMProcessor -VmName $VMName -Count 2
Set-VmMemory -VMName $VMname -DynamicMemoryEnabled $true -MinimumBytes 512MB -StartupBytes 512MB -MaximumBytes 3GB
Get-VMMemory -VMname $VMname
Start-VM -VMName $VMname
Get-VM -Name $VMname | fl *

get-vm -name $vmname
