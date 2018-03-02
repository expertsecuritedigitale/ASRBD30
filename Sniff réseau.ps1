1..254 | foreach {Test-Connection 192.168.1.$_ -Count 1 -ErrorAction SilentlyContinue} 

fsutil -creatnew file "C:\Users\caca\Desktop\Pl1DeFichier\test.txt" 254000MB