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

###Lazy code### 
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
###lazy code###

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
alias glpomodoro='cd ~/git/pomodoro ; pull'
alias gla='gldotfiles ; glstudy ; glfirstwebsite ; glpomodoro ; cd ; cowthink -s "git pull all done"'
###git###

###firefox tab###
alias ft='firefox -new-tab'
alias tab_youtube_subsriptions='ft "https://www.youtube.com/feed/subscriptions"'
alias tab_pocket='ft "https://app.getpocket.com/"'

alias tab_anime='ft "https://www9.gogoanime.io/"'
alias tab_kdrama='ft "https://www.dramacool9.co/category/drama/?country=korean"'
alias tab_kmovie='ft "https://ww1.fmovies.to/country/korea"'
alias tab_fun='tab_anime ; tab_kdrama ; tab_kmovie'

alias tab_music_happy='ft "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'

alias tab_toidicodedao='ft "https://toidicodedao.com/"'
alias tab_thefullsnack='ft "https://thefullsnack.com/"'
alias tab_codeaholicguy='ft "https://codeaholicguy.com/"'
alias tab_blogs='tab_toidicodedao ; tab_thefullsnack ; tab_codeaholicguy'
###fire tab###

###mode###
alias work='cowthink -s "." ; ft https://youtu.be/hHW1oY26kxQ "https://youtu.be/1znjHDiqBk8?t=1" ; gla ; gha'

alias hola='cowsay -f dragon "hola hola" ; tab_music_happy ; tab_fun ; tab_youtube_subsriptions ; tab_blogs ; tab_pocket'
###mode###
