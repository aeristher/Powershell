function FinalDestination {
Param ([string[]]$processname)

$checker = Get-Process $processname -ErrorAction SilentlyContinue 
$procID = (Get-Process $processname -ErrorAction SilentlyContinue).Id
if ($checker -eq $null) {
write-host "None of your process(es) was found. Check that you typed your process correctly. Also, it might not be running after all."
}
else
{
foreach ($i in $checker) {
$checker.Kill() ; break
#stop-process -Name $processname -ErrorAction SilentlyContinue; break
}
$replacer = write-output "$procID $checker was destroyed!" 
$replacer.Replace("System.Diagnostics.Process","")
}
}

Set-Alias -Name FD -Value FinalDestination
