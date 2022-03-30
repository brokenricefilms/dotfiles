#! /usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \ $1 }' | wl-copy"
# alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \ $1 }' | xclip -sel clip"

fzfDown() { fzf --height 50% --min-height 20 --bind ctrl-/:toggle-preview "$@" --reverse }

function findFile() {
  local file
  file=$(fd . -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias f='findFile'

function findFileInHome() {
  local file
  file=$(fd . $HOME -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias F='findFileInHome'

function findHiddenFile() {
  local file
  file=$(fd . -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias fh='findHiddenFile'

function findHiddenFileInHome() {
  local file
  file=$(fd . $HOME -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias Fh='findHiddenFileInHome'

function openFile() {
  local object
  object=$(fd . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias o='openFile'

function openFileInHome() {
  local object
  object=$(fd . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z '$object' ]
  then
    xdg-open '$object'
  fi
}
alias O='openFileInHome'

function openHiddenFile() {
  local object
  object=$(fd . --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias oh='openHiddenFile'

function openHiddenFileInHome() {
  local object
  object=$(fd . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias Oh='openHiddenFileInHome'

function fzfMan() {
  if [ -z  $1 ]
  then
    man -k . | fzf -q " $1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ",  $2} {print  $1}' | xargs -r man
  else
    man  $1
  fi
}
alias M='fzfMan'
alias help="fzfMan"

function getAlias() {
  CMD=$(
  (
  (alias)
  (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
  ) | fzf | cut -d '=' -f1
  );

  eval $CMD
}

function getEnvironment() {
  local out
  out=$(env | fzf)
  echo $(echo $out | cut -d= -f2)
}

source ~/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh
source ~/dotfiles/zsh/functions/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh
