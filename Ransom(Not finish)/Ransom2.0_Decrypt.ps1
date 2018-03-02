
# read User Key
$Desk = [Environment]::GetFolderPath("Desktop")
$key = Get-Content "$Desk/LaKey.key" -Encoding byte

# create ps AES objects
<# sources
 https://gist.github.com/ctigeek/2a56648b923d198a6e60
#>


$FileEnc = Get-ChildItem "$Desk\Pl1DeFichier\*.ELFAMOSO" 

ForEach ($f in $FileEnc) {
$AES = New-Object System.Security.Cryptography.AesManaged
Write-Host "
#---------------------------------------------------------------------------------------------------------------------#
#                                             Clé AES :                                                               #
# $Key #
#---------------------------------------------------------------------------------------------------------------------#"

$AES.Key = $key
$AES.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7

# lister tout les fichier .ELFAMOSO et les déchiffrer

    $bytes = Get-Content "$($f.Name)" -Encoding byte
    $oriname = "$($f.Name)" -replace '\.ELFAMOSO',''

    # Retrouver la VI avec les 16 premiers octets
    $iv = $bytes[0..15]
    $AES.iv = $iv
    
Write-Host "
#---------------------------------------------------------------------------------------------------------------------#
#                                            valeur D'initiation:                                                     #
#                              $VI                                 #
#---------------------------------------------------------------------------------------------------------------------#
"
    $decryptor = $AES.CreateDecryptor()
    $unencryptedData = $decryptor.TransformFinalBlock($bytes, 16, $bytes.Length - 16)
    Set-Content -Value $unencryptedData -LiteralPath $oriname -Encoding byte
    #Write-Host (Get-Content $oriname)
   
}
Remove-Item C:\Users\caca\Desktop\Pl1DeFichier\*.ELFAMOSO