#!/usr/bin/fish
set -g -x fish_greeting Hi, Master

#alias
alias s='sudo'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias rem='s apt-get update ; s apt-get upgrade -y ; s apt-get autoremove -y ; s apt autoclean'
alias bye='s apt-get update ; s apt-get upgrade -y ; s apt-get autoremove -y ; s apt autoclean ; s shutdown now'
alias sylater='s apt-get update ; s apt-get upgrade -y ; s apt-get autoremove -y ; s apt autoclean ; s reboot now'
alias c='clear'
alias h='history'
alias ins='s apt-get install -y'
alias uins='s apt-get remove -y'
alias e='exit'
alias v='vim'

#vi mode
fish_vi_key_bindings

#git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#git push all repositories

alias gitpushdotfile='cd ~/git/dotfiles/fish ; cp ~/.config/fish/config.fish . ; echo "fish done" ; cd ~/git/dotfiles/vim ; cp ~/.vimrc . ; echo "vim done" ; cd ~/git/dotfiles ; yo ; push ; figlet dotfiles done'

###bug"green": mv error -> fix:ideas "if" bug"yellow":maybe *.json not freecodecamp
alias gitpushstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; yo ; push ; figlet study done'

alias gitpushall='gitpushdotfile ; gitpushstudy ; figlet all-done ; cd'


#git pull all repositories
alias gitpullall='cd ~/git/dotfiles ; pull ; .. ; cd study ; pull ; .. ; cd firstwebsite ; pull ; cd'

#start a day
alias hi='rem ; gitpullall ; gitpushall ; c ; cd ; figlet Be grateful for every moment ; figlet ooo ; figlet I love Mater so much!'

