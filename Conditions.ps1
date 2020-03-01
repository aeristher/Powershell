[int]$age = Read-Host "Please enter your age"

$input = Read-Host "Would you like to know how old you are in (m)onths, (d)ays, (h)ours, or (s)econds?"

if ($input -eq 'm')
{
$months = [int]$Age * [int]12 
write-host "You are $months months old"
}
elseif ($input -eq 'd')
{
$days = [int]$Age * [int]365
write-host "You are $days days old"
}
elseif ($input -eq 'h')
{
$hours = [int]$Age * [bigint]8760
write-host "You are $hours hours old"
}
elseif ($input -eq 's')
{
$seconds = [int]$Age * [bigint]31536000
write-host "You are $seconds seconds old"
}
else {
write-host "Please type 'm', 'd', 'h', or 's'"
}

#Using switch
[int]$age1 = Read-Host "Please enter your age"

$input1 = Read-Host "Would you like to know how old you are in (m)onths, (d)ays, (h)ours, or (s)econds?"
switch ($input1)
{
"m" { $months1 = [int]$age1 * [int]12 
write-host "You are $months1 months old"; break;}
"d" { $days1 = [int]$age1 * [int]365
write-host "You are $days1 days old"; break;}
"h" {$hours1 = [int]$age1 * [bigint]8760
write-host "You are $hours1 hours old"; break;}
"s" {$seconds1 = [int]$age1 * [bigint]31536000
write-host "You are $seconds1 seconds old"; break;}
default {write-host "Please type 'm', 'd', 'h', or 's'"}
}
