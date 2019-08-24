#!/usr/bin/fish
set -g -x fish_greeting Hi, Master





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
alias v='vim'
alias rem='s apt-get update ; s apt-get upgrade -y ; s apt-get autoremove -y; s apt-get autoclean'

#vi mode
fish_vi_key_bindings

#git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#git push dotfiles
alias ghdotfiles='cd ~/git/dotfiles/fish ; cp ~/.config/fish/config.fish . ; cd ~/git/dotfiles/vim ; cp ~/.vimrc . ; cd ~/git/dotfiles ; yo'

###bug"green": mv error -> fix:ideas "if" ###bug"yellow":maybe *.json not freecodecamp
alias ghstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; yo ; push'

#git push all
alias gha='ghdotfiles ; ghstudy ; cowsay git push all done ; cd'

#git pull all 
alias gla='cd ~/git/dotfiles ; pull ; cd ~/git/study ; pull ; cd ~/git/firstwebsite ; pull ; cd ; cowsay git pull all done'

