
#3. Creating a variable called port with the value 'HTTP'
$port = "HTTP"

#4. Creating an array called servers with the values 'www.google.com', 'www.pitt.edu', and 'www.cnn.com"

$servers= "www.google.com", "www.pitt.edu", "www.cnn.com"

#5. Adding another element called 'Unixs.cist.pitt.edu' in the servers array
$servers+="Unixs.cis.pitt.edu"

#6. Showing the third element of the server array. Note that it's written as '2' because arrays start from [0]
$servers[2]

#7. Show the number of elements in the server array.
$servers.count

#8. Running man command to check 'foreach-object' and 'test-netconnection'
man ForEach-Object ; man Test-NetConnection

#9. This shows whether the servers from the array have HTTP working

$servers | ForEach-Object {Test-NetConnection $_ $port}
