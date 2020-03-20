#simple 'fail' check
$backuplog = cat 'e:\Users\jgm45\Desktop\log.txt'

foreach ($log in $backuplog) {
if ($log -match 'fail') {echo ("better start panicking")
}
}


#some regex shenanigans
$regex = '\w+\s\w+\s\"\w+\w\W+\w+\"\sfail'


if ($backuplog -match $regex) {
echo 'it failed :( at' $timestamper 
}
else {echo 'it succeeded somehow!'}


$timestamper = select-string -Pattern '(AM|PM)' -Path 'e:\Users\jgm45\Desktop\log.txt'

