alias pwsh='pwsh.exe'
alias notepad='notepad.exe'
alias winget='winget.exe'
alias explorer='explorer.exe'

function windowsTaskKill() {
  task=$(tasklist.exe | fzf | awk '{print $1}')
  taskkill.exe /f /im $task
}
alias tk=windowsTaskKill
