#!/usr/bin/fish
set -g -x fish_greeting Hi, Nicholas 

fish_vi_key_bindings

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end

###########################Lazy coding 
alias s='sudo'
alias ..='cd ..'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias c='clear'
alias h='history'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias e='exit'
alias v='nvim'
alias l='ls -latr'
alias p='python3'
alias rem='sudo apt-get update ;sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean'
alias j7='ssh u0_a190@192.168.1.2 -p 8022'

###git###
#commit so hard, so auto write commit cool 
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#location file saved on pc, code push on github saved at other folder, that's it 
alias ghdotfiles='cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cd ~/git/dotfiles ; yo ; push'
alias ghfirstwebsite='cd ~/git/firstwebsite/ ; yo ; push'
alias ghpomodoro='cd ~/git/pomodoro/ ; yo ; push'

#learning from freecodecamp, when done task, archive file .json , download it
#alias ghstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; yo ; push'
alias ghstudy='cd ~/git/study ; yo ; push'
alias gha='ghdotfiles ; ghstudy ; ghfirstwebsite ; ghpomodoro ; fortune | cowsay; cd'

alias gldotfiles='cd ~/git/dotfiles ; pull'
alias glstudy='cd ~/git/study ; pull'
alias glfirstwebsite='cd ~/git/firstwebsite ; pull'
alias glpomodoro='cd ~/git/glpomodoro ; pull'
alias gla='gldotfiles ; glstudy ; glfirstwebsite ; glpomodoro ; cd ; cowsay git pull all done'
###git###

alias hi='cowsay Hi ; gla ; gha ; rem'
