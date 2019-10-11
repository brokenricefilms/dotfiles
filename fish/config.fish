#!/usr/bin/fish

set -g -x fish_greeting Hi, Nicholas 
fish_vi_key_bindings

#able sudo!! for fish
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end

###Lazy code### 
alias ..='cd ..'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias c='clear'
alias h='history'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias e='exit'
alias v='nvim'
alias t='touch'
alias l='ls -latr'
alias p='python3'
alias rem='sudo apt-get update ;sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'

###git###
#commit so hard, so auto write commit cool 
alias clone='git clone'
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 

alias ghdotfiles='cp ~/.tmux.conf ~/git/dotfiles/tmux ; cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cd ~/git/dotfiles ; yo ; push'
alias ghfirstwebsite='cd ~/git/firstwebsite/ ; yo ; push'
alias ghpomodoro='cd ~/git/pomodoro/ ; yo ; push'
alias ghstudy='cd ~/git/study ; yo ; push'
alias gha='ghdotfiles ; ghstudy ; ghfirstwebsite ; ghpomodoro ; fortune | cowsay; cd'

alias gldotfiles='cd ~/git/dotfiles ; pull'
alias glstudy='cd ~/git/study ; pull'
alias glfirstwebsite='cd ~/git/firstwebsite ; pull'
alias glpomodoro='cd ~/git/pomodoro ; pull'
alias gla='gldotfiles ; glstudy ; glfirstwebsite ; glpomodoro ; cd ; cowthink -s "git pull all done"'

###firefox###
alias fi='firefox -new-firefox'
alias fi_youtube_subsriptions='firefox "https://www.youtube.com/feed/subscriptions"'
alias fi_pocket='firefox "https://app.getpocket.com/"'
alias fi_pomodoro='firefox "https://youtu.be/1znjHDiqBk8?t=1"'
alias fi_github='firefox https://github.com/nicholaspham2311' 
alias fi_fb='firefox https://facebook.com' 
alias fi_music_happy='firefox "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'
alias fi_music_anime='firefox "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"'
alias fi_music_chill='firefox https://youtu.be/hHW1oY26kxQ'
alias fi_music_rapvn='firefox "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias fi_anime='firefox "https://www9.gogoanime.io"' 
alias fi_kdrama='firefox "https://www.dramacool9.co"'
alias fi_fun='firefox_anime ; firefox_kdrama'

alias fi_toidicodedao='firefox "https://toidicodedao.com/"'
alias fi_thefullsnack='firefox "https://thefullsnack.com/"'
alias fi_codeaholicguy='firefox "https://codeaholicguy.com/"'
alias fi_thai='firefox "https://vnhacker.blogspot.com/"'
alias fi_ml='firefox "https://l4w.io/"'
alias fi_blogs='firefox_toidicodedao ; firefox_thefullsnack ; firefox_codeaholicguy ; firefox_thai ; firefox_ml'

###chrome###
alias ch='google-chrome'
alias ch_youtube_subsriptions='ch "https://www.youtube.com/feed/subscriptions"'
alias ch_pocket='ch "https://app.getpocket.com/"'
alias ch_pomodoro='ch "https://youtu.be/1znjHDiqBk8?t=1"'
alias ch_github='ch https://github.com/nicholaspham2311' 
alias ch_fb='ch https://facebook.com'

alias ch_music_happy='ch "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'
alias ch_music_anime='ch "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"'
alias ch_music_chill='ch https://youtu.be/hHW1oY26kxQ'
alias ch_music_chill_japan='ch "https://www.youtube.com/watch?v=9NaCaPuyyYY&list=PLvG4xTFF2NwlILSITQ5PcpZoKiMkcZdJ1"'
alias ch_music_rapvn='ch "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias ch_anime='ch "https://www9.gogoanime.io"' 
alias ch_kdrama='ch "https://www.dramacool9.co"'
alias ch_fun='ch_anime ; ch_kdrama'

alias ch_toidicodedao='ch "https://toidicodedao.com/"'
alias ch_thefullsnack='ch "https://thefullsnack.com/"'
alias ch_codeaholicguy='ch "https://codeaholicguy.com/"'
alias ch_thai='ch "https://vnhacker.blogspot.com/"'
alias ch_ml='ch "https://l4w.io/"'
alias ch_blogs='ch_toidicodedao ; ch_thefullsnack ; ch_codeaholicguy ; ch_thai ; ch_ml'

###mode###
alias work='fortune | cowsay ; ch_music_chill_japan ; gla ; gha'
alias hola='fortune | cowsay ; ch_fun ; ch_youtube_subsriptions ; ch_blogs ; ch_fb ; ch_music_rapvn ; rem ; gla ; gha'
