# Terrashell
Terrashell is an open source alternative PoC to Terraform written in Powershell.

## Why Powershell ?
Powershell is a great open source scripting language from Microsoft. It works in Linux, macOS and ... Windows. Of course.
Powershell has one great advantage: it benefits from a huge community of users and developpers.
And i think create provisionners from Powershell is simpliest because community works hard to create modules of everything (really everything...).
Provisionners can be develop from modules, and developpers can gain many hours.

## Use case
Terrashell is only for developpers now or testers.
First provisionner is not stable usable really, it's only a PoC.
To testing Terrashell, install Powershell 7.2 or early form [here](https://learn.microsoft.com/fr-fr/shows/it-ops-talk/how-to-install-powershell-7)

## Toml
Toml is a configuration language, like XML or JSON, but easier to understand by humans.
It's for that i choice this language.

## To test Terraform

Powershell 7.2 is required.
Create a .toml file in a directory or download the test.toml file in the ESX provider repository.
Syntax is easier to understand or write to JSON or XML.

To use, the script, you need to use first Init option like this :

``` .\Terrashell.ps1 -Init:$true -File "C:\path\to\toml\file" ```

And to deploy template

```.\Terrashell.ps1 -Apply:$true -File "C:\path\to\toml\file" ```

Destroy option is not implemented (in future release :D)

## Thanks to jborean93 for his PSToml module. Links [here](https://github.com/jborean93)
