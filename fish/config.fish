#!/usr/bin/fish
set -g -x fish_greeting Hi, Nicholas 
#vi mode
fish_vi_key_bindings






##############################
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end




##############################
#alias
alias s='sudo'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias c='clear'
alias h='history'
alias ins='s apt-get install -y'
alias uins='s apt-get remove -y'
alias e='exit'
alias v='nvim'
alias rem='s apt-get update ;s apt-get upgrade -y ;s apt-get autoremove -y;s apt-get autoclean'
alias chrome='google-chrome'

#git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#git push dotfiles
alias ghdotfiles='cp ~/.config/fish/config.fish ~/git/dotfiles/fish ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cd ~/git/dotfiles ; yo ; push'

#git push firstwebsite
alias ghfirstwebsite='cd ~/git/firstwebsite/ ; yo ; push'

###bug"green": mv error -> fix:ideas "if" ###bug"yellow":maybe *.json not freecodecamp
alias ghstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; yo ; push'

#git push all
alias gha='ghdotfiles ; ghstudy ; ghfirstwebsite ; cowsay git push all done ; cd'

#git pull all 
alias gla='cd ~/git/dotfiles ; pull ; cd ~/git/study ; pull ; cd ~/git/firstwebsite ; pull ; cd ; cowsay git pull all done'

