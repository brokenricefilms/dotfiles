#!/usr/bin/fish
set -g -x fish_greeting Hi, Master

#alias
alias s='sudo'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias c='clear'
alias h='history'
alias ins='s apt-get install -y'
alias uins='s apt-get ove -y'
alias e='exit'
alias v='vim'

#vi mode
fish_vi_key_bindings

#git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#git push dotfiles
alias ghdotfiles='cd ~/git/dotfiles/fish ; cp ~/.config/fish/config.fish . ; echo "fish done" ; cd ~/git/dotfiles/vim ; cp ~/.vimrc . ; echo "vim done" ; cd ~/git/dotfiles ; yo ; push ; figlet dotfiles done'

###bug"green": mv error -> fix:ideas "if" ###bug"yellow":maybe *.json not freecodecamp
alias ghstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; yo ; push ; figlet study done'

#git push all
alias gha='ghdotfiles ; ghstudy ; figlet all-done ; cd'

#git pull all 
alias gla='cd ~/git/dotfiles ; pull ; cd ~/git/study ; pull ; cd ~/git/firstwebsite ; pull ; cd'

