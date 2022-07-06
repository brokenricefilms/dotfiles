#! /usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

function emoji() {
  if hash emoji-fzf 2>/dev/null; then
    emoji-fzf preview --prepend | fzfDown | awk '{ print $1 }' | tr -d "\n" | copy
  else
    pip install emoji-fzf
    emoji-fzf preview --prepend | fzfDown | awk '{ print $1 }' | tr -d "\n" | copy
  fi
}
alias ej="emoji"

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

function manFzf() {
  if [ -z  $1 ]
  then
    man -k . | fzf -q " $1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ",  $2} {print  $1}' | xargs -r man
  else
    man  $1
  fi
}
alias M='manFzf'
alias help="manFzf"

function whichFzf() {
  CMD=$(
  (
  (alias)
  (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
  ) | fzf | cut -d '=' -f1
  );

  eval $CMD
}
alias W='whichFzf'

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
  local ENV_FZF
  ENV_FZF=$(env | fzfDown)
  echo $(echo $ENV_FZF | cut -d= -f2)
  copy $(echo $ENV_FZF | cut -d= -f2)
}
alias listEnvironment='getEnvironment'

function listAllCommands() {
    COMMANDS=`echo -n $PATH | xargs -d : -I {} find {} -maxdepth 1 \
        -executable -type f -printf '%P\n'  2>/dev/null`
    ALIASES=`alias | cut -d '=' -f 1`
    FUNCTIONS=`print -l ${(ok)functions}`
    RESULT=`echo "$COMMANDS"$'\n'"$ALIASES"$'\n'"$FUNCTIONS" | sort -u | fzfDown`
    SPACE=" "
    copy $RESULT$SPACE

    eval $RESULT
}
alias a='listAllCommands'

function changeDir() {
  local dir
  dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  clear -x
  ls
}
alias c='changeDir'

function changeDirInHome() {
  local dir
  dir=$(fd -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  clear -x
  ls
}
alias C='changeDirInHome'

function changeHiddenDir() {
  local dir
  dir=$(fd -t d --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  clear -x
  ls
}
alias ch='changeHiddenDir'

function changeHiddenDirInHome() {
  local dir
  dir=$(fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  clear -x
  ls
}
alias Ch='changeHiddenDirInHome'

source ~/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh
source ~/dotfiles/zsh/functions/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh
