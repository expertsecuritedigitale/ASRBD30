<#

Je signe ce script par ce qu'on m'as dit de le faire
            Signé ~ PA

#>

#Recupérer nom du pc
$PC = Get-WmiObject -Class WIn32_computersystem
Write-Host "
------LE PC-------
Nom du pc : $($PC.name)
Fabriquant : $($PC.Manufacturer)
Modele du PC : $($PC.Model)
Domain ou Workgroup : $($PC.Domain)
Utilisateur authentifié : $($PC.PrimaryOwnerName)"

#Recup license
$OS = Get-WmiObject -Class WIn32_operatingsystem
Write-Host "
--------OS---------
OS : $($OS.caption)
Service pack : $($OS.CSDversion)
Racine Systeme : $($OS.SystemDrive)
Version : $($OS.Version)
Numéro de build : $($OS.BuildNumber)
Numéro de Série : $($OS.Serialnumber)
Date du dernier boot : $($OS.ConvertToDateTime($OS.Lastbootuptime))"

#récuperer nombre de proc et de choeur
$Proc = Get-WmiObject -Class win32_processor
$Proc2 = Get-WmiObject -Class Win32_ComputerSystem
Write-Host "
-------Procesor---------
Nom du processor : $($Proc.name)
Nombre de processor : $($Proc2.NumberOfProcessors)
Famille de processeur : $($Proc.Caption)
Mémoire processeur utilisé : $($Proc.LoadPercentage) `%"

#récupérer ram

$MaxRAM=[string](Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory/1GB
$FreeRAM=[String](Get-Ciminstance Win32_OperatingSystem | select *memory*).FreePhysicalMemory/1MB
$UsedRAM=[string]($MaxRAM - $FreeRAM) + " GB utilisée"
        
   
Write-Host "
--------RAM---------
Taille de la ram : $MaxRAM
RAM Disponible : $FreeRAM
RAM utilisé : $UsedRAM
" 

#Recupérer Hotfix
$Hotfix =  Get-WmiObject Win32_QuickFixEngineering
Write-Host "
-------Hotfix------"
$Hotfix  | ft "HotfixID", "description"

#récupérer info disque
$Fs=@{Label='Free Space (GB)'; expression={($_.freespace)/1gb};formatstring='n2'}
$Sz=@{Label='Size (GB)'; expression={($_.Size)/1gb};formatstring='n2'}
$DFz=@{Label='Disk free Space (GB)'; expression={($_.Size)/1gb - ($_.freespace)/1gb};formatstring='n2'}
Write-Host "
-------Disk Configuration------"
Get-WMIObject win32_LogicalDisk| Format-Table Name, $fs, $Sz, $DFz  -a

#Recupérer info réseau
$NIC = Get-WmiObject Win32_NetworkAdapter -Filter "netconnectionstatus = 2"
$NICconf = Get-WmiObject win32_networkadapterconfiguration -filter "ipenabled = 'True'"
Write-Host "
-------network Configuration------
Nom de la carte : $($NIC.Name) 
Adresse physique : $($NIC.MACAddress)
Adresse IP et Masque : $($NICconf.IPADDress)
Passerelle par Defaut : $($NICconf.DefaultIPGateway)
DNS : 
"

#recupérer les services
Write-Host "
--------Services------------"
Get-Service | ft "name", "status"

#Récupére la date
$Date=(Get-date).DateTime
$TimeZone = (Get-TimeZone).DaylightName
Write-Host "
---------DATE ET TIME ZONE--------
Date du pc : $Date
Time zone = $TimeZone
"


Read-Host "Appuie sur Entrée pour fermer
"

<#
~Hardcore jusqu'à la mort, mais doux comme de la soie~
#>