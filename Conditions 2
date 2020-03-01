
$answer= Read-Host "Would you like to convert Fahrenheit to Celsius or Celsius to Fahrenheit? (F2C) or (C2F)"
if($answer -eq 'F2C')
{
$F2C = Read-Host "What is the degree to convert from Fahrenheit to Celsius"
$ConvertF2C = (([int]$F2C - 32) * 5)/9
Write-Host "$ConvertF2C degrees"
}
elseif($answer -eq 'C2F')
{
$C2F = Read-Host "What is the degree to convert from Celsius to Fahrenheit"
$ConvertC2F = ([int]$C2F * 9) /5 + 32
Write-Host "$ConvertC2F degrees"
}
else
{Write-Host "Please input F2C or C2F"
}

###Using Switch
$answer1= Read-Host "Would you like to convert Fahrenheit to Celsius or Celsius to Fahrenheit? (F2C) or (C2F)"
switch ($answer1)
{
"F2C" {$F2C1 = Read-Host "What is the degree to convert from Fahrenheit to Celsius"
$ConvertF2C1 = (([int]$F2C1 - 32) * 5)/9
Write-Host "$ConvertF2C1 degrees"
}
"C2F" {
$C2F1 = Read-Host "What is the degree to convert from Celsius to Fahrenheit"
$ConvertC2F1 = ([int]$C2F1 * 9) /5 + 32
Write-Host "$ConvertC2F1 degrees"
}
default {write-host "Please input F2C or C2F"}
}
