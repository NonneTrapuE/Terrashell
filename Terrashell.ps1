#Alternative à Terraform
#####################################################################################################
#                                                                                                   #
#   Terrashell est compatible avec Powershell 7.2 et ultérieur. Powershell 5.1 n'est pas supporté   #          
#                                                                                                   #
#   Le projet est porté par le module PSToml, permettant de lire les fichiers de configuration      #
#   .toml (fichiers de descriptions comme le json, xml, etc...) grâce à Powershell.                 #
#   Merci à jborean93.                                                                               #
#                                                                                                   #
#####################################################################################################


# Paramètres du script : Fichier .toml
Param(
    [Parameter(Mandatory=$True)]
    [string] $File)

# Vérifications du module PSToml
Clear-Host

$module_name = (Get-Module).Name

if ($module_name.Contains("PSToml")){
    Write-Host -ForegroundColor Green "Le module est installé"} 
else {
    Write-Warning "Le module n'est pas installé"
    Install-Module -Name PSToml -Force
}

# Récupération du fichier toml

$tomlFile = get-content $File | ConvertFrom-Toml

#Création du dossier Provider

if (!( Test-Path .\Provider )){

    New-Item -Path .\ -Name Provider -ItemType Directory -Force

}


# Téléchargement du provider
    # Pour le moment, les providers seront à télécharger depuis github au format .zip (code > local > Download ZIP)    
    # A modifier ultérieurement

Invoke-WebRequest -Uri $tomlFile.Provider.provider.url -OutFile .\Provider\provider.zip

# Décompression du provider

Expand-Archive -Path .\Provider\provider.zip -DestinationPath .\Provider\
Remove-Item -Path .\Provider\provider.zip -Confirm:$false -Force


# Exécution du provider
    # A faire : Rédiger le premier provider, ESX


