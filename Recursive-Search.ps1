#this shows the name of the text file under the folder 'Ellison'
invoke-command -ComputerName yoda -ScriptBlock{
ls -Path 'D:\' -Recurse -Include 'Ellison' | dir 
}

#this shows the output of the text file under 'Ellison'
invoke-command -ComputerName yoda -ScriptBlock{
ls -Path 'D:\' -Recurse -Include 'Ellison' | dir | cat
}
