alias ..='cd .. ; l'
alias ...='cd .. ; cd .. ; l'
alias dow='cd ~/Downloads ; l'
alias doc='cd ~/Documents ; l'
alias tmp='cd /tmp ; l'
alias changeDirToUsbFolder='cd /run/media/master/ ; ls'

alias l='exa -al --color=always --group-directories-first --icons'
alias ls='l'
alias sl='l'
alias la='exa -a --color=always --group-directories-first --icons'
alias al='exa -a --color=always --group-directories-first --icons'
alias ll='l'
alias l.='exa -a| egrep "^\."'
alias lt='exa -aT --color=always --group-directories-first --icons'

function diskFree () {
  echo ""
  df -h | awk 'NR==1' | rg Avail
  df -h | awk 'NR==4'
}

function makeDir () {
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
