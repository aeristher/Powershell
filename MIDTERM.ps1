#1.) Demonstrate each of the following in a script using data from a commandlet of your choice.  Items can be combined if it makes sense as long as each point below is accomplished

#a function that accepts a computer name parameter and doing a simple ping
function ezping {
param([string[]]$computername)
ping $computername
}
#creating an alias for the function ezping so that all ya gotta do is type ez
set-alias -name ez -value ezping
#creating a foreach loop that searches for all the users in the C:\ directory and concatenating it with 'is a user'
$catdirectory = ls C:\Users
foreach ($i in $catdirectory){
echo "$i is a user"
}
#creating a while loop that outputs 1-20 
while ($meep -ne 20){
$meep++
write-host $meep
}
#creating a for loop that outputs from 1-20
for ($i=0;$i -le 20; $i++) {
echo $i
}
#creating an if-elseif-else statement that asks the user what is 1 + 1
$math = read-host ("what is 1 + 1")
if ($math -eq '2') {
echo "you did it, proud of ya"
}
elseif($math -eq '') 
{
echo "uhh, type something" 
}
else {"try againnnnnn"}
#creating a switch statement that asks the user what is 2 + 2
$mathswitch = read-host ("what is 2 + 2")
switch($mathswitch)
{
'4' {"ya right";break}
'' {"type something ya kno";break}
default {"try againnnn"}
}
#pipeline that gets a running notepad's processname and id and outputs it to a gridview
get-process notepad | select-object -Property ProcessName, Id | ogv
#pipeline that gets all the process, piping it by only selecting the processname, then sorting it from descending order then outputting it to a text file.
get-process | select-object -property ProcessName| % {echo ($_.processname)} | sort-object -Descending | out-file $env:USERPROFILE\midtermz.txt

#2. Write a script that remotely retrieves VM's and properties from Zonnon

#this script collects information from zonnon's VMs and then piping it to select specific properties, outputting it to a
#html file. Used hash tables to divide Memory by 1GB to convert it as GB.


#PLAN A - legit attempt at getting the right path but somehow missing 'Ubuntu' and having @{Path at the start
invoke-command -ComputerName zonnon.univ.pitt.edu -scriptblock {
get-vm | select -Property VMname, State, @{name='Memory(GB)';expression={$_.MemoryStartup/1GB}}, ProcessorCount, `
 @{name='Path';expression={get-vm $_.vmname | select vmid | get-vhd | select path}} | convertto-html -as Table `
-Head '<h1><marquee>hi bob</marquee></h1>' -PostContent '<h1><marquee>hi bob</marquee></h1>' `
> e:\users\jgm45\Desktop\midtermnumbuhtwo.htm
}

invoke-command -ComputerName zonnon.univ.pitt.edu -scriptblock {
get-vm | select -Property VMname, State, @{name='Memory(GB)';expression={$_.MemoryStartup/1GB}}, ProcessorCount, `
 @{expression={get-vm $_.vmname | select vmid | get-vhd | select path}} | convertto-html -as Table `
-Head '<h1><marquee>hi bob</marquee></h1>' -PostContent '<h1><marquee>hi bob</marquee></h1>' `
> e:\users\jgm45\Desktop\midtermnumbuhtwo.htm
}



#PLAN B - <insert_your_vm_name_here>.vhdx
invoke-command -ComputerName zonnon.univ.pitt.edu -scriptblock {
get-vm | select -Property VMname, State, @{name='Memory(GB)';expression={$_.MemoryStartup/1GB}}, ProcessorCount, `
 @{name='Path';expression={$_.path + '\Virtual Hard Disks\<insert_your_vm_name_here>.vhdx'}} | convertto-html -as Table `
-Head '<h1><marquee>hi bob</marquee></h1>' -PostContent '<h1><marquee>hi bob</marquee></h1>' `
> e:\users\jgm45\Desktop\midtermnumbuhtwo.htm
}

#ATTEMPT AT EXTRA CREDIT
<#5. Using the ConvertTo-HTML commandlet produce a formatted report for all activedirectory groups on your server that includes
the following. Submit both the script and your report #>

#this script gets all of the users from contoso, selecting specific properties then outputting it to an html file
import-module activedirectory

get-aduser -Filter * -SearchBase 'cn=users,dc=contoso,dc=com' -Properties `
givenname, surname,samaccountname,whenCreated,lastLogon,passwordlastset, enabled `
 | ConvertTo-Html -Property givenname, surname, samaccountname, whencreated, lastlogon, passwordlastset, enabled `
 -Title "Contoso Domain Group Membership Report" `
-PostContent "Created by your favorite Contoso IT Department ;)" -as Table > C:\users\Administrator\Desktop\midtermEC.htm
