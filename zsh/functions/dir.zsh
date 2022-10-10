alias ..='cd .. ; l'
alias ...='cd .. ; cd .. ; l'
alias dow='cd ~/Downloads ; l'
alias doc='cd ~/Documents ; l'
alias tmp='cd /tmp'
alias changeDirToUsbFolder='cd /run/media/master/ ; ls'

alias l='exa -al --color=auto --group-directories-first --icons'
alias ls='l'
alias sl='l'
alias ll='l'
alias la='exa -a --color=auto --group-directories-first --icons'
alias al='la'
alias l.='exa -a| egrep "^\."'
alias lt='exa -aT --color=auto --group-directories-first --icons'

function disk_free() {
  echo ""
  df -h | awk 'NR==1'
  df -h | rg /home
}

function make_dir() {
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
alias mk="make_dir"
