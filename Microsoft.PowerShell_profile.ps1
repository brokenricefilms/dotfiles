Set-PSReadLineOption -EditMode vi

$env:EDITOR = 'nvim'

function change-dir-fzf() {
    $folder = fd --type directory --exclude scoop --exclude go --exclude .vscode --exclude bundle --exclude .git --exclude gems --exclude node_modules | fzf --height 50% --min-height 20 --reverse
    Set-Location $folder
}
Set-Alias c change-dir-fzf

function cc() {
    cd
    change-dir-fzf
}

function edit-file-fzf() {
    $file = fd --hidden --type file . | fzf --height 50% --min-height 20 --reverse
    nvim $file
}
Set-Alias e edit-file-fzf

function edit-powershell-config() { nvim $profile }

function edit-nvim-config() { nvim C:\Users\master\AppData\Local\nvim\init.lua }

function update-dotfiles() {
    cp $profile ~\repos\thuantanphamfilms\dotfiles\
    cp C:\Users\master\AppData\Local\nvim\init.lua ~\repos\thuantanphamfilms\dotfiles\nvim
    cd ~\repos\thuantanphamfilms\dotfiles\
    git add Microsoft.PowerShell_profile.ps1
    git add nvim\init.lua
    git commit -m "pwsh, nvim"
    git push
    cd -
}

Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

function q() { Exit }

function s() { git status --short --branch }

function git-commit {
    git status --short --branch
    git diff
    git add .
    git commit 
}
Set-Alias a git-commit

function auto-git-commit() {
    Start-Job {
        git add .
        git commit -m "👌Auto commit"
        git pull
        git push
    }
}
Set-Alias aa auto-git-commit


function p() { git push }

function Get-ChildItem-Hidden() { Get-ChildItem -Force }
Set-Alias ls Get-ChildItem-Hidden
Set-Alias l Get-ChildItem-Hidden

function Get-ChildItem-Hidden-Wide() { Get-ChildItem -Force | Format-Wide }
Set-Alias la Get-ChildItem-Hidden-Wide

function .. { Set-location .. }

function ... { Set-location .. ; Set-location .. }

function tmp() {
    Set-location -Path $env:temp
}

function dow() {
    Set-location -Path $env:USERPROFILE\Downloads\
}

function doc() {
    Set-location -Path $env:USERPROFILE\Documents\
}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function update() {
    winget upgrade --all
    scoop update *
}

function download-video( ) {
    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $args
}
Set-Alias dv download-video
Set-Alias y yt-dlp

function download-audio() {
    yt-dlp --extract-audio --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" $args
}
Set-Alias da download-audio

function ls-mb() {
    ls | Select-Object Name, @{Name="MegaBytes";Expression={$_.Length / 1MB}}
}

function ls-kb() {
    ls | Select-Object Name, @{Name="KiloBytes";Expression={$_.Length / 1KB}}
}

function resolve-template () {
    ii ~\davinci-resolve\licitfree.drb 
}
Set-Alias v resolve-template

new-alias grep select-string

new-alias unzip Expand-Archive

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
            $Local:ast = $commandAst.ToString().Replace('"', '""')
            winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
                [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
            }
}
