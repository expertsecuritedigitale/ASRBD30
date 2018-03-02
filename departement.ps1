#
#Le beau scripts de CINDY!!!!!!!!
#
#


#rentrez le chemin du fichier

$item = Import-Csv "C:\Users\Cindy\Desktop\departementexcel.csv" -Delimiter ";"

#renseignez les noms des colones

$Numeros = $item.Numeros
$Nom = $item.Nom

#L'utilisateur saisi le département

$reponse = Read-host "Numéros de département"

#modulation de la réponse

$uj = $item | Where-Object { $_.Numeros -eq $reponse}

Write-Host = $uj.Nom