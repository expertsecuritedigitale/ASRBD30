Function FuncJustePrix{

    Do{   
        #Poser la question à l'utilisateur
        do{
            $AnswerUser = Read-Host "
            #------------------------------------------------------------------#
            #      Alors $($UserJP.Name) ! Quel est le prix de cet objet ?     
            #------------------------------------------------------------------#
                                                "
            #DEBBUGUNG LINE#
            Write-Host $ObjetJP.Price
            #Check si il à rentré un chiffre

              if ($AnswerUser -notmatch '^\d+$'){
                  Write-Host "
            #------------------------------------------------------------------#
            #           Tu n'as pas rentré un chiffre, recomence               #
            #------------------------------------------------------------------#" -ForegroundColor Red
                 }
              else{
                 $AnswerUser = [long]$AnswerUser
                 }
        }while ($AnswerUser -notmatch '^\d+$')

        if ($AnswerUser -lt $ObjetJP.Price){   
            $UserJP.Life--
            Write-Host "
            #------------------------------------------------------------------#
            #             C'est plus grand, tu perd une vie                    #
            #                    Il te reste  $($UserJP.Life) vie                            #
            #------------------------------------------------------------------#" -ForegroundColor yellow
            -
        }
        elseif ($AnswerUser -gt $ObjetJP.Price){
            $UserJP.Life--
            Write-Host "
            #------------------------------------------------------------------#
            #             C'est plus petit, tu perd une vie                    #
            #                    Il te reste  $($UserJP.Life) vie                            #
            #------------------------------------------------------------------#" -ForegroundColor yellow
            
        }
        elseif ($AnswerUser -eq $ObjetJP.Price){
            Read-Host "
            #------------------------------------------------------------------#
            #                      C'est ça ! Gagné !                          #
            #           Appuie sur Entrée pour ferme le programme              #
            #------------------------------------------------------------------#"
            Exit 0
        }
        else {
            Write-Host "
            #------------------------------------------------------------------#
            #          Tu n'as pas rentré de chiffre, recomence                #
            #------------------------------------------------------------------#" -ForegroundColor Red
        }
    }While ($UserJP.Life -gt 0)

    Read-Host "
            #------------------------------------------------------------------#
            #                           Tu as perdu !                          #
            #              Appuie sur Entrée pour fermer le jeu                #
            #------------------------------------------------------------------#"
    Exit 0

}