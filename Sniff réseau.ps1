1..254 | foreach {Test-Connection 192.168.1.$_ -Count 1 -ErrorAction SilentlyContinue} 
