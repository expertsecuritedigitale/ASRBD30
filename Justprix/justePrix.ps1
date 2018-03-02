<#
creer base de donnée de 5 objets
associer des prix aléatoire par rapport à l'objet
demander le prix de l'objet à l'util
comparer le prix de l'objet avec le prix donné par l'util 
#>

#-----------------------------------SETUP---------------------------------------#

#Charger les classes
. C:\Users\caca\Desktop\Powershell\Justprix\Class\ObjectJP.ps1
. C:\Users\caca\Desktop\Powershell\Justprix\Class\UserJP.ps1

#Charger les fonctions
. .\Function\FuncjustePrix.ps1
. C:\Users\caca\Desktop\Powershell\Justprix\Function\ObjectValue.ps1

#Choose un objet en random
$ChooseObject = Get-Random("un RER B","une Guitare","une Chaise","une Horloge","une Batterie")
    #je renseigne le nom de l'objet
    $ObjetJP.Name = $ChooseObject

#lui donner un prix et un ASCII

ObjectValue $ObjetJP.Name

#----------------------------------DEMARAGE DU JEU-------------------------------------------------#

#Demander le nom de l'utilisateur
clear
$UserName = Read-Host "
            #------------------------------------------------------------------#
            #                       Quel est ton nom ?                         #
            #------------------------------------------------------------------#
                                            "
$UserJP.name = $UserName

#Affichage de l'enigme et lancement de la function
Write-host "
            #------------------------------------------------------------------#
            #        L'objet d'aujourd'hui est $($ObjetJP.name)                #"
write-host $ObjetJP.ASCIIArt
FuncJustePrix

