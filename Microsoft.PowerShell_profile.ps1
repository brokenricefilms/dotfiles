Set-PSReadLineOption -EditMode vi

$env:EDITOR = 'nvim'

function change_dir_fzf() {
    $folder = fd --type directory --exclude scoop --exclude go --exclude .vscode --exclude bundle --exclude .git --exclude gems --exclude node_modules | fzf --height 50% --min-height 20 --reverse
    Set-Location $folder
}
Set-Alias c change_dir_fzf

function cc() {
    cd
    change_dir_fzf
}

function edit_file_fzf() {
    $file = fd --hidden --type file . | fzf --height 50% --min-height 20 --reverse
    nvim $file
}
Set-Alias e edit_file_fzf

function edit_powershell_config() { nvim $profile }

Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History

function q() { Exit }

function s() { git status --short --branch }

function auto_git_commit() {
    Start-Job {
        git add .
        git commit -m "👌Auto commit"
        git pull
        git push
    }
}
Set-Alias ok auto_git_commit

function a {
    git status --short --branch
    git diff
    git add .
    git commit
}

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

function download_video( ) {
    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $args
}
Set-Alias dv download_video

function download_audio() {
    yt-dlp --extract-audio --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title="%(artist)s - %(title)s" $args
}
Set-Alias da download_audio

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
            $Local:ast = $commandAst.ToString().Replace('"', '""')
            winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
                [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
            }
}
