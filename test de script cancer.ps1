#Ce script lance des phrases aléatoires via le bot de Windows
#Ce script a été fait par Cindy ASRBD 30 


while($true)
{

   #Si chrome est lancé, lance la voix

$ProcessActive = Get-process explorer


if($ProcessActive -eq "Running")
{
 $voice.speak($Phrase)
}
else
{
 Start-Sleep -s 1

    #Phrases aléatoires, rentrer les phrases voulues

    $Phrase        = @("I'm a robot.", 
        "Help, I'm stuck in the machine!", 
        "What are you doing", "You suck!", "You are so sexy!", "you are very bad boy!", "I am a very bad", "What your name?" , "I am here", "your subscription to you porn has expired", "What did you expect", "what is this", "bullshit" ) | Get-Random

    #Faire appel au synthétiseur de voix

    Add-Type -AssemblyName System.speech
    $voice = New-Object System.Speech.Synthesis.SpeechSynthesizer

    #on défini le débit de parole de -10 à 10

    $voice.Rate = -2 

    #le volume et le type de voix

    $voice.Volume = 100
    $voice.state
    $voice.voice | %{$_.AdditionalInfo}

    $voice.speak($Phrase)

}
}
