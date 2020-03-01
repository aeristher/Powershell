
New-VmSwitch -Name CIST1342VMSWITCH -SwitchType Internal

#import-vm '\\zonnon\d$\VM\AD_MASTER\AD_MASTER\Virtual Machines\CC50473F-0EEC-43D2-BE8A-111B79D01690.vmcx' -Copy -VhdDestinationPath 'D:\aer\PowershellVM\Vhds\AD_MASTER' -VirtualMachinePath 'D:\aer\PowershellVM\VMs\AD_MASTER' -GenerateNewId
import-vm -Path 'D:\aer\PowershellVM\AD_MASTER\Virtual Machines\CC50473F-0EEC-43D2-BE8A-111B79D01690.vmcx' -Copy -VhdDestinationPath 'D:\aer\PowershellVM\Vhds\' -VirtualMachinePath 'D:\aer\PowershellVM\VMs\' -GenerateNewId
$report = Compare-VM -Path 'D:\aer\PowershellVM\AD_MASTER\Virtual Machines\CC50473F-0EEC-43D2-BE8A-111B79D01690.vmcx'
$report.Incompatibilities | Format-Table -AutoSize
$report.Incompatibilities[0].Source | Disconnect-VMNetworkAdapter
Compare-VM -CompatibilityReport $report
import-vm -CompatibilityReport $report

Set-VmProcessor AD_MASTER -Count 4
Connect-VMNetworkAdapter -VMName AD_MASTER -SwitchName CIST1342VMSWITCH
New-NetIPAddress -InterfaceAlias 'vEthernet (CIST1342VMSWITCH)' -IPAddress '192.168.219.1' -PrefixLength 24
start-Vm -Name AD_MASTER
get-vm -Name AD_MASTER

$vmoutput = get-vm -Name AD_MASTER | fl *
$vmoutput >> vmoutput.txt
