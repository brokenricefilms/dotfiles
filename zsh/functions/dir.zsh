alias ..='cd .. ; clear -x ; l'
alias ...='cd .. ; clear -x ; cd .. ; l'
alias dow='cd ~/Downloads ; clear -x ; l'
alias doc='cd ~/Documents ; clear -x ; l'
alias tmp='cd /tmp ; clear -x ;  la'
alias changeDirToUsbFolder='cd /run/media/master/ ; clear -x ; ls'

alias l='exa -al --color=always --group-directories-first --icons'
alias ls='l'
alias sl='l'
alias la='exa -a --color=always --group-directories-first --icons'
alias al='exa -a --color=always --group-directories-first --icons'
alias ll='l'
alias l.='exa -a| egrep "^\."'
alias lt='exa -aT --color=always --group-directories-first --icons'

function diskFree() {
  clear -x
  echo ""
  df -h | awk 'NR==1' | rg Avail
  df -h | awk 'NR==4'
}

function makeDir() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}
alias mk="makeDir"

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
