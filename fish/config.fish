set -g -x fish_greeting 'Hi, Master'
alias rem='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt autoclean'
alias bye='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt autoclean && sudo shutdown now'
alias sylater='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt autoclean && sudo reboot now'
alias c='clear'
alias h='history'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias e='exit'
alias v='vim'
alias ...='cd .. && cd .. && cd ..'
alias ....='cd .. && cd .. && cd .. && cd ..'

#vi mode
fish_vi_key_bindings

#git
alias yo='git add -A && git commit -m "TODO: Fix later"'
alias push="git push"
