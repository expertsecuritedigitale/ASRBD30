

$Message = Read-Host "
Quel message tu veux DANS ta boite de dialogue ?
                    "
$Titre = Read-Host "
Quel titre tu veux à ta boite de dialogue ?
                    "

do { 
    $Btn = Read-Host "
    Qu'est ce que tu veux comme bouton ?
        [0] OK 
        [1] OK    | Cancel
        [2] Abort | Retry | Ignore
        [3] Yes   | No    | Cancel
        [4] Yes   | No
        [5] Retry | Cancel
    "
}while ($Btn -notmatch '^\d+$')

do {
    $Icon = Read-Host "
    Qu'est ce que tu veux comme icone ?
        [0] Aucune
        [1] Croix rouge (error)
        [2] Avertissement (! jaune)
        [3] Information (! bleu)
    "
}while ($Btn -notmatch '^\d+$')

switch ($Icon){
    "0"{$Icon = 0}
    "1"{$Icon = 16}
    "2"{$Icon = 48}
    "3"{$Icon = 64}
    }

$read = [System.Windows.Forms.MessageBox]::Show($Message, $Titre , $Btn, $Icon)

if ($read = $true){
    . C:\Users\caca\Desktop\Powershell\mesgBox.ps1}
    
