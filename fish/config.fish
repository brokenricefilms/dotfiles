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
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias c='clear'
alias h='history'
alias ins='s apt-get install -y'
alias uins='s apt-get remove -y'
alias e='exit'
alias v='nvim'
alias rem='s apt-get update ;s apt-get upgrade -y ;s apt-get autoremove -y;s apt-get autoclean'
alias download='cd ~/Downloads'
alias p='python3'

#commit so hard, so auto write commit cool 
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull"

#location file saved on pc, code push on github saved at other folder, that's it 
alias ghdotfiles='cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish ; cd ~/git/dotfiles ; yo ; push'

#auto lazy coding 
alias ghfirstwebsite='cd ~/git/firstwebsite/ ; yo ; push'

#learning from freecodecamp, when done task, archive file .json , download it
#alias ghstudy='mv ~/Downloads/*.json ~/git/study/html/freecodecamp/website/Basic-HTML-and-HTML5/ ; cd ~/git/study ; yo ; push'
alias ghstudy='cd ~/git/study ; yo ; push'

#cowsay make fun
alias gha='ghdotfiles ; ghstudy ; ghfirstwebsite ; fortune | cowsay; cd'
alias gla='cd ~/git/dotfiles ; pull ; cd ~/git/study ; pull ; cd ~/git/firstwebsite ; pull ; cd ; cowsay git pull all done'
