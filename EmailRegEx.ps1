<#
In Powershell
1) load p:\emails.txt
2) parse each line and check for yahoo.com email address
3) output the yahoo addresses to screen and write to a text file

#>



#First 
$rawmail = cat 'P:\emails.txt'

$rawmail | select-string -Pattern '\w+\@yahoo.com' -AllMatches | out-file 'e:\Users\jgm45\Desktop\ymail.txt'

#Second
copy-item 'P:\emails.txt' -Destination 'e:\Users\jgm45\Desktop\emails.txt'

$rawmail | % {$_ -replace '(\w+)@yahoo.com',"`$1@yahoogle.com"} | out-file 'e:\Users\jgm45\Desktop\emails.txt'
get-content 'e:\Users\jgm45\Desktop\emails.txt'
