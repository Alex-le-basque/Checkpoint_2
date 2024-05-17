#Pour récupérer le dossier Script depuis le serveur vers le bureau, je me suis connecté en bureau à distance sur le client via l'adresse IP puis j'ai copier coller le dossier en question
# j'ai modifier le script Main.ps1 en changeant le chemin d'acces du script 
# Start-Process -FilePath "powershell.exe" -ArgumentList "C:\Scripts\AddLocalUsers.ps1" -Verb RunAs -WindowStyle Maximized
#Q.2.3 A quoi sert l'option -Verb RunAs ? il indique à start-Process de lancer powershell en tant qu'administrateur
#Q.2.4 De même, à quoi sert l'option -WindowsStyle Maximized ? il permet de lancer la fenêtre powershell en taille maximisé
#Q.2.5 le prmeier user n'est pas pris en compte à cause de l'argument -Skip 2
#Q.2.6 car dans les param de $UserInfo on a pas préciser Description
#Q.2.16 la fonction permet de remplacer les lettres avec accent par sa version sans accent pour éviter divers conflit dans la création d'utilisateur








Write-Host "--- Début du script ---"

Function Random-Password ($length = 12)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description","mail","mobile","scriptPath","telephoneNumber" -Encoding UTF8  | Select-Object #-Skip 2

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Prenom.$Nom" -ErrorAction SilentlyContinue)) 
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        
        $UserInfo = @{
            Name                 = "$Prenom.$Nom"
            FullName             = "$Prenom.$Nom"
            Description          = "$Description"
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $false
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Prenom.$Nom"
        Set-LocalUser -Name $Name -PasswordNeverExpires 1
        Write-Host "L'utilisateur $Prenom.$Nom a été crée,  le mot de passe est $Pass" -ForegroundColor Green
    }
    else
    {
    write-host "L'utilisateur $Name éxiste déjà" -ForegroundColor Red
    }


}

Read-Host " Appuyer sur Entrée pour continuer!"
#pause
Write-Host "--- Fin du script ---"
#Start-Sleep -Seconds 10
