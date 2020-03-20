$Presidents = cat 'e:\Users\me\Desktop\us_presidentsCopy.csv'  `
| % {$_ -replace '(Name)',"Last Name,First Name,Middle Name"} `
| % {$_ -replace '^(\d{1,2}),(\w+\s)((\w\.\s)*?)(\w+(\s\w+)?),(\d{4})',"`$1,`$5,`$2,`$3,`$7"} `
| out-file 'e:\Users\jgm45\Desktop\new_presidents.csv'
