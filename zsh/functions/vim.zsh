set -U EDITOR nvim
export EDITOR='nvim'
export VISUAL='nvim'

set -o vi

alias vi="nvim"
alias vim="nvim"

function find_file_edit_in_nvim() {
  if [ ! -n "$1" ]; then
    find_file
  else
    nvim "$1"
  fi
}
alias e='find_file_edit_in_nvim'
alias v='find_file_edit_in_nvim'
