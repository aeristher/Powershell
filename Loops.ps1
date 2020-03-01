[int]$times = Read-Host "How many scores would you like to enter"
$Scores_Array = @()
for($i=0; $i -lt $times; $i++) {
[int]$Scores = Read-Host "Enter score"
$Total = $Scores_Array += $Scores
}

$Summing = ($Total | Measure-Object -Sum).Sum
Write-Host "Your total is" $Summing

$Average = $Summing / $times

Write-Host "Your average is" $Average


<#Create a script that asks the user to enter grade scores. Start by asking the user 
how many scores they would like to enter. Then use a loop to request each score and
 add it to a total. Finally, calculate and display the average for the entered scores. #>

[int]$times1 = Read-Host "How many scores would you like to enter"
$Scores_Array1 = @()
$z = 0
while ($z -lt $times1){
$Scores_Array1 += Read-Host "Enter score"; $z++
}
$Summing1 = ($Scores_Array1 | Measure-Object -Sum).Sum 
Write-Host "Your total is $Summing1"
$Average1 = $Summing1 / $times1
Write-Host "Your average is $Average1"
