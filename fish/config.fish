#!/usr/bin/fish
set -g -x fish_greeting Hi, Nicholas 
fish_vi_key_bindings

##############################
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
alias dl='cd ~/Downloads'
alias rem='sudo apt-get update ;sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean'
alias j7='ssh u0_a190@192.168.1.2 -p 8022'

#commit so hard, so auto write commit cool 
alias autocommit='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#location file saved on pc, code push on github saved at other folder, that's it 
alias gitpushdotfiles='cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cd ~/git/dotfiles ; autocommit ; push'
alias gitpushfirstwebsite='cd ~/git/firstwebsite/ ; autocommit ; push'

#learning from freecodecamp, when done task, archive file .json , download it
#alias gitpushstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; autocommit ; push'
alias gitpushstudy='cd ~/git/study ; autocommit ; push'

#cowsay make fun
alias gitpushall='gitpushdotfiles ; gitpushstudy ; gitpushfirstwebsite ; fortune | cowsay; cd'
alias gitpullall='cd ~/git/dotfiles ; pull ; cd ~/git/study ; pull ; cd ~/git/firstwebsite ; pull ; cd ; cowsay git pull all done'

alias hi='cowsay Hi ; gitpullall ; gitpushall ; rem'
