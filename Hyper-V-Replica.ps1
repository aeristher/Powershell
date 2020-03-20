#Hyper-V Replica

$HV01 = "Mythryl"
$HV02 = "Vader"
$VM1 = "aerAD_Master"

#Configure the server HV02 as a Hyper-V replica server
Invoke-Command -ComputerName $HV02 -ScriptBlock {
Enable-NetFirewallRule `
-DisplayName "Hyper-V Replica HTTP Listener (TCP-In)"
Set-VMReplicationServer -ReplicationEnabled $true `
-AllowedAuthenticationType Kerberos `
-KerberosAuthenticationPort 80 `
-DefaultStorageLocation "d:\vmreplica" `
-ReplicationAllowedFromAnyServer $true
}

Enable-VMReplication -VMName $VM1 `
-ReplicaServerName vader.univ.pitt.edu `
-ReplicaServerPort 80 -AuthenticationType Kerberos `
-CompressionEnabled $true -RecoveryHistory 5

#Begin Replication
$PrimaryVM1 = $VM1
Start-VMInitialReplication -VMName $PrimaryVM1

#Monitor replication status
Measure-VMReplication

#Performing a failover test
Invoke-Command -ComputerName $HV02 -ScriptBlock {
$TestReplicaVM1 = Start-VMFailover -AsTest -VMName "aerAD_MASTER" `
-Confirm:$false
Start-VM $TestReplicaVM1
}

#Stop failover test
Invoke-Command -ComputerName $HV02 -ScriptBlock {
Stop-VMFailover -VMName "aerAD_MASTER"
}

#Perform a planned failover

#On HV01:
Stop-VM $VM1
#wait for VM to shutdown

#Setup Replication on HV01
Enable-NetFirewallRule `
-DisplayName "Hyper-V Replica HTTP Listener (TCP-In)"
Set-VMReplicationServer `
-ReplicationEnabled $true `
-AllowedAuthenticationType Kerberos `
-KerberosAuthenticationPort 80 `
-DefaultStorageLocation "d:\vmreplica" `
-ReplicationAllowedFromAnyServer $true

Start-VMFailover -VMName "aerAD_Master" `
-Prepare -Confirm:$false

Invoke-Command -ComputerName $HV02 -ScriptBlock{
Start-VMFailover -VMName "aerAD_Master"
Set-VMReplication -Reverse -VMName "aerAD_Master"
Start-VM "aerAD_Master"
}

Measure-VMReplication
Measure-VMReplication -Computer $HV02

invoke-command -ComputerName $HV02 -ScriptBlock {
Resume-VMReplication -VMName "aerAD_Master"
}

Measure-VMReplication
Measure-VMReplication -ComputerName $HV02

#Bringing the VM instance back to machine
invoke-command -ComputerName $HV02 -ScriptBlock{
Stop-VM "aerAD_Master"
get-VM "aerAD_Master"
}

invoke-command -ComputerName $HV02 -ScriptBlock{
Start-VMFailover -VMName "aerAD_Master" -Prepare -Confirm:$false
}

Start-VMFailover -VMName "aerAD_Master" -Confirm:$false
Set-VMReplication -Reverse -VMName "aerAD_Master"
Start-VM "aerAD_Master"
