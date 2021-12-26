Import-Module -Name PSFzf
Import-Module -Name Recycle
Import-Module PSReadLine

Invoke-Expression (&starship init powershell)

Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History
set-PSFzfOption -PSReadlineChordReverseHistory  'ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias v nvim
Set-Alias t Remove-ItemSafely
Set-Alias la Get-ChildItem-Hidden
Set-Alias l Get-ChildItem

function push { git push }

function pull { git pull }

function st { git status -sb }

function dv { git difftool }

function gl { git log --oneline | head -n 5 }

function Get-ChildItem-Hidden { Get-ChildItem -Force }

function .. { Set-location .. }

function ... { Set-location .. ; Set-location .. }

function e { exit }

Remove-Alias cd
function cd {
	$path=$args[0]
	Set-location -Path $path
	Get-ChildItem
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

function dow {
    Set-location -Path $env:USERPROFILE\Downloads
    Get-ChildItem
}

function doc {
    Set-location -Path $env:USERPROFILE\Documents\
    Get-ChildItem
}

function c {
    $dir=fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude scoop --exclude AppData --exclude .cache | fzf
    Set-location $dir
    Get-ChildItem
}


function f() {
    $file=fd . $HOME -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude scoop --exclude AppData --exclude .cache | fzf
    if ($file -eq '') {
        Write-Out 'fak'
    } else {
        nvim "$file"
    }
}

