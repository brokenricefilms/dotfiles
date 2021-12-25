Import-Module -Name Recycle

Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

Invoke-Expression (&starship init powershell)

Import-Module -Name PSFzf
set-PSFzfOption -PSReadlineChordReverseHistory  'ctrl+r'

function dow { Set-location -Path ~\Downloads }

function doc { Set-location -Path $env:USERPROFILE/Documents }

function e { exit }

Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias v nvim
Set-Alias t Remove-ItemSafely

function Get-ChildItem-Hidden { Get-ChildItem -Force }

Set-Alias la Get-ChildItem-Hidden

Set-Alias l Get-ChildItem

function .. { Set-location .. }

function ... { Set-location .. ; Set-location .. }

function cd {
	$path=$args[0]
	Set-location -Path $path
	ls
}

function ins {
	$app=$args[0]
	scoop install $app
}

function uins {
	$app=$args[0]
	scoop uninstall $app
}

function inss {
	$app=$args[0]
	scoop search $app
}

function mk {
	$dir=$args[0]
	mkdir $dir
	Set-location -Path $dir
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function push { git push }
function pull { git pull }
