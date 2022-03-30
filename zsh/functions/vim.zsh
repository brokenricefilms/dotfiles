set -U EDITOR nvim
export EDITOR='nvim'
export VISUAL='nvim'

bindkey -v

function zle_keymap_select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle_keymap_select

function zle_line_init() {
  zle -K viins
  echo -ne "\e[5 q"
}

zle -N zle_line_init

echo -ne '\e[5 q'

preexec() { echo -ne '\e[5 q'; }

function findFileEditInNvim() {
  if [ ! -n "$1" ]; then
    findFile
  else
    nvim "$1"
  fi
}
alias e='findFileEditInNvim'
alias v='findFileEditInNvim'
alias vi='findFileEditInNvim'
alias vim='findFileEditInNvim'
