$warmfix = get-hotfix | Where-Object installedon -gt 12/1/2015
foreach ($i in $warmfix){
    echo ($i.HotFixID + " was installed on " + $i.InstalledOn)
    }
