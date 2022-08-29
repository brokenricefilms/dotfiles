alias ..='cd .. ; clear -x ; l'
alias ...='cd .. ; clear -x ; cd .. ; l'
alias dow='cd ~/Downloads ; clear -x ; l'
alias doc='cd ~/Documents ; clear -x ; l'
alias tmp='cd /tmp ; clear -x ;  la'
alias changeDirToUsbFolder='cd /run/media/master/ ; clear -x ; ls'

alias l='clear -x ; exa -al --color=never --group-directories-first'
alias ls='l'
alias sl='l'
alias ll='l'
alias la='clear -x ; exa -a --color=never --group-directories-first'
alias al='la'
alias l.='clear -x ; exa -a| egrep "^\."'
alias lt='clear -x ; exa -aT --color=never --group-directories-first'

function changeDirToGitRoot() {
  cd $(git rev-parse --show-toplevel)
}
alias cdr='changeDirToGitRoot'

function diskFree() {
  clear -x
  echo ""
  df -h | awk 'NR==1' | rg Avail
  df -h | awk 'NR==4'
}

function makeDir() {
  if [ ! -n "$1" ]; then
    echo -n "\n👉 Enter a directory name"
    read dirName
    mkdir -p $dirName && cd $dirName
  elif [ -d $1 ]; then
    echo "\n👉 \`$1' already exists"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}
alias mk="makeDir"

function changeDir() {
  local dir
  dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first -L 1')
  cd "$dir"
  clear -x
  ls
}
alias c='changeDir'

function changeDirInHome() {
  local dir
  dir=$(fd -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first -L 1')
  cd "$dir"
  clear -x
  ls
}
alias C='changeDirInHome'

function changeHiddenDir() {
  local dir
  dir=$(fd -t d --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first -L 1')
  cd "$dir"
  clear -x
  ls
}
alias ch='changeHiddenDir'

function changeHiddenDirInHome() {
  local dir
  dir=$(fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first -L 1')
  cd "$dir"
  clear -x
  ls
}
alias Ch='changeHiddenDirInHome'
