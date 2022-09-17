alias ..='cd .. ; l'
alias ...='cd .. ; cd .. ; l'
alias dow='cd ~/Downloads ; l'
alias doc='cd ~/Documents ; l'
alias tmp='cd /tmp'
alias changeDirToUsbFolder='cd /run/media/master/ ; ls'

alias l='exa -al --color=never --group-directories-first --icons'
alias ls='l'
alias sl='l'
alias ll='l'
alias la='exa -a --color=never --group-directories-first --icons'
alias al='la'
alias l.='exa -a| egrep "^\."'
alias lt='exa -aT --color=never --group-directories-first --icons'

function diskFree() {
  echo ""
  df -h | awk 'NR==1'
  df -h | rg /home
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
  dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias c='changeDir'

function changeDirInHome() {
  local dir
  dir=$(fd -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias C='changeDirInHome'

function changeHiddenDir() {
  local dir
  dir=$(fd -t d --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias ch='changeHiddenDir'

function changeHiddenDirInHome() {
  local dir
  dir=$(fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=never --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias Ch='changeHiddenDirInHome'
