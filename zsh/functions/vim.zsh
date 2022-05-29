set -U EDITOR nvim
export EDITOR='nvim'
export VISUAL='nvim'

function findFileEditInNvim() {
  if [ ! -n "$1" ]; then
    findFile
  else
    nvim "$1"
  fi
}
alias e='findFileEditInNvim'
alias v='findFileEditInNvim'
