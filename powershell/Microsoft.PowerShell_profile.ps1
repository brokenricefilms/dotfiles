$env:EDITOR = 'nvim'

Invoke-Expression (&starship init powershell)

# support light theme
Set-PSReadLineOption -Colors @{
  "Default"            = [ConsoleColor]::Black
  "Command"            = [ConsoleColor]::"DarkBlue"
  "Comment"            = [ConsoleColor]::"Yellow"
  "ContinuationPrompt" = [ConsoleColor]::"Green"
  "Emphasis"           = [ConsoleColor]::"DarkCyan"
  "Error"              = [ConsoleColor]::"DarkRed"
  "Keyword"            = [ConsoleColor]::"DarkMagenta"
  "Member"             = [ConsoleColor]::"White"
  "Number"             = [ConsoleColor]::"White"
  "Operator"           = [ConsoleColor]::"Green"
  "Parameter"          = [ConsoleColor]::"Blue"
  "String"             = [ConsoleColor]::"DarkGreen"
  "Type"               = [ConsoleColor]::"DarkMagenta"
  "Variable"           = [ConsoleColor]::"Red"
}

Import-Module -Name Terminal-Icons
# Terminal icons theme don't support light theme
# issue here: https://github.com/devblackops/Terminal-Icons/issues/69
Set-TerminalIconsTheme -DisableColorTheme

Import-Module -Name PSFzf

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

function c() {
  $folder = fd --type directory --exclude scoop --exclude go --exclude .vscode --exclude bundle --exclude .git --exclude gems --exclude node_modules | fzf --height 50% --min-height 20 --reverse
  Set-Location $folder
  la
}

function fzfEditFile() {
  if (!$args) {
    $file = fd --type file --follow --exclude scoop --exclude go --exclude node_modules | fzf --height 50% --min-height 20 --reverse --preview 'bat --theme=GitHub --style=numbers --color=always --line-range :500 {}'
    nvim $file
  }
  else {
    nvim "$args"
  }
}

Set-Alias v fzfEditFile
Set-Alias e fzfEditFile
Set-Alias vi fzfEditFile
Set-Alias vim fzfEditFile
Set-Alias f fzfEditFile

function openFile() {
  $file = fd --type file --follow --exclude scoop --exclude go --exclude node_modules | fzf --height 50% --min-height 20 --reverse
  Invoke-Item $file
}
Set-Alias o openFile

Import-Module PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource History
set-PSFzfOption -PSReadlineChordReverseHistory  'ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

Import-Module -Name Recycle
Set-Alias t Remove-ItemSafely

function clear() { Clear-Host }
function cler() { Clear-Host }
function clar() { Clear-Host }
function clr() { Clear-Host }

function q() { Exit }

Set-Alias lg lazygit

function push() { Start-Job { git push } }

function pull() { Start-Job { git pull } }

function st() { git status --short --branch }

function dv() { git difftool }

function gl() { git log --oneline | head -n 5 }

function githubIssueViewWeb() {
  $issue = gh issue list | fzf
  $issue = $issue -split "\t" | Select-Object -First 1
  gh issue view $issue --web
}
Set-Alias ghi githubIssueViewWeb

function gitHubIssueEdit() {
  $issue = gh issue list | fzf
  $issue = $issue -split "\t" | Select-Object -First 1
  gh issue edit $issue
}
Set-Alias ghie gitHubIssueEdit

function gitHubIssueClose() {
  $issue = gh issue list | fzf
  $issue = $issue -split "\t" | Select-Object -First 1
  gh issue close $issue
}
Set-Alias ghic gitHubIssueClose

function gitHubIssueComment() {
  $issue = gh issue list | fzf
  $issue = $issue -split "\t" | Select-Object -First 1
  gh issue comment $issue
}
Set-Alias ghim gitHubIssueComment

function gs() {
  $branch = git branch --all | fzf
  git switch $branch.replace(" ", "")
}

function autoCommit() {
  Start-Job {
    git add .
    git commit -m "[👌Auto commit] $(curl -s whatthecommit.com/index.txt)"
    git pull
    git push
  }
}
Set-Alias ok autoCommit

function yo {
  git status --short --branch
  git diff
  git add .
  $commit_message = Read-Host -Prompt "👉 Commit message"
  git commit --message "$commit_message"
  Start-Job { git push }
}

function ins() {
  $app = $args[0]
  winget install --accept-package-agreements --accept-source-agreements $app
}

function uins() {
  $app = $args[0]
  winget uninstall $app
}

function inss() {
  $app = $args[0]
  winget search $app
}

function ya() {
  Invoke-FuzzyScoop
}

function Get-ChildItem-Hidden() { Get-ChildItem -Force }
Set-Alias ls Get-ChildItem-Hidden
Set-Alias l Get-ChildItem-Hidden

function Get-ChildItem-Hidden-Wide() { Get-ChildItem -Force | Format-Wide }
Set-Alias la Get-ChildItem-Hidden-Wide

function .. { Set-location .. ; la }

function ... { Set-location .. ; Set-location .. ; la }

Remove-Alias cd
function cd() {
  $path = $args[0]
  Set-location -Path $path
  la
}

function mk() {
  $dir = $args[0]
  mkdir $dir
  Set-location -Path $dir
}

function tmp() {
  Set-location -Path $env:temp
  la
}

function dow() {
  Set-location -Path $env:USERPROFILE\Downloads
  la
}

function doc() {
  Set-location -Path $env:USERPROFILE\Documents\
  la
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function update() {
  winget upgrade --all
  scoop update *
}

function browserDaily() {
  Start-Process "https://mail.google.com/mail/u/0/#inbox"
  Start-Process "https://mail.google.com/mail/u/1/#inbox"
  Start-Process "https://www.youtube.com/feed/subscriptions"
  Start-Process "https://feeder.co/reader"
  Start-Process "https://animevietsub.tv/"
  Start-Process "https://subnhanh.net/"
  Start-Process "https://discord.com/channels/@me"
  Start-Process "https://facebook.com/"
}

function hi() {
  browserDaily
  update
}

function youtubeDownload( ) {
  yt-dlp -f bestvideo+bestaudio
}
Set-Alias yt youtubeDownload

function youtubeDownloadAudio() {
  yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"
}
Set-Alias yta youtubeDownloadAudio
