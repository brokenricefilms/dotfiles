#!/usr/bin/fish

set -g -x fish_greeting Hi, Nicholas 
fish_vi_key_bindings

#enable sudo!! for fish
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end

###lazy code### 
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
alias rem='sudo snap refresh ; sudo apt-get update ; sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias dlmusic='youtube-dl -x --audio-format mp3 (read $link)'
###lazy code### 

###git###
#commit so hard, so auto write commit cool 
alias clone='git clone'
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias g='git'
alias cm='git commit -m'

alias ghdotfiles='cp ~/.gitconfig  ~/git/dotfiles/git/ ; cp ~/.tmux.conf ~/git/dotfiles/tmux ; cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cp ~/.config/vifm/vifmrc ~/git/dotfiles/vifm/ ; cp ~/.config/vifm/colors/Default.vifm ~/git/dotfiles/vifm/colors/ ; cp ~/.ssh/config ~/git/dotfiles/ssh/ ; cd ~/git/dotfiles ; yo ; push'
alias ghdotfiles-termux='cd ~/git/dotfiles-termux ; yo ; push'
alias ghmywebsite='cd ~/git/mywebsite/ ; yo ; push'
alias ghpomodoro='cd ~/git/pomodoro/ ; yo ; push'
alias ghstudy='cd ~/git/study ; yo ; push'
alias ghlazyscript='cd ~/git/lazyscript ; yo ; push'
alias gha='ghlazyscript ; ghdotfiles ; ghdotfiles-termux ; ghstudy ; ghmywebsite ; ghpomodoro ; fortune | cowsay; cd'

alias gldotfiles='cd ~/git/dotfiles ; pull'
alias gldotfiles-termux='cd ~/git/dotfiles-termux ; pull'
alias glstudy='cd ~/git/study ; pull'
alias glmywebsite='cd ~/git/mywebsite ; pull'
alias glpomodoro='cd ~/git/pomodoro ; pull'
alias gllazyscript='cd ~/git/lazyscript ; pull'
alias gla='gldotfiles ; gldotfiles-termux ; glstudy ; glmywebsite ; glpomodoro ; gllazyscript ; cd ; cowthink -s "git pull all done"'
###git###

###firefox###
alias fi='firefox -new-firefox'
alias fi-youtube-subsriptions='firefox "https://www.youtube.com/feed/subscriptions"'
alias fi-pocket='firefox "https://app.getpocket.com/"'
alias fi-pomodoro='firefox "https://youtu.be/1znjHDiqBk8?t=1"'
alias fi-github='firefox https://github.com/nicholaspham2311' 
alias fi-fb='firefox https://facebook.com' 
alias fi-cal='ch "https://calendar.google.com/calendar/r"'
alias fi-trello='ch "https://trello.com/b/nGRAb2ii/nicholas"'

alias fi-music_happy='firefox "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'
alias fi-music_anime='firefox "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"'
alias fi-music_chill='firefox https://youtu.be/hHW1oY26kxQ'
alias fi-music_rapvn='firefox "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias fi-anime='firefox "https://www9.gogoanime.io"' 
alias fi-kdrama='firefox "https://www.dramacool9.co"'
alias fi-fun='fi_anime ; fi_kdrama'

alias fi-layout1='ch_cal ; ch_keep'

alias fi-toidicodedao='firefox "https://toidicodedao.com/"'
alias fi-thefullsnack='firefox "https://thefullsnack.com/"'
alias fi-codeaholicguy='firefox "https://codeaholicguy.com/"'
alias fi-thai='firefox "https://vnhacker.blogspot.com/"'
alias fi-ml='firefox "https://l4w.io/"'
alias fi-blog='firefox_toidicodedao ; firefox_thefullsnack ; firefox_codeaholicguy ; firefox_thai ; firefox_ml'
###firefox###

###chrome###
alias ch='google-chrome'
alias ch-youtube-subsriptions='ch "https://www.youtube.com/feed/subscriptions"'
alias ch-pocket='ch "https://app.getpocket.com/"'
alias ch-pomodoro='ch "https://youtu.be/1znjHDiqBk8?t=1"'
alias ch-github='ch https://github.com/nicholaspham2311' 
alias ch-fb='ch https://facebook.com'
alias ch-cal='ch "https://calendar.google.com/calendar/r"'
alias ch-trello='ch "https://trello.com/b/nGRAb2ii/nicholas"'
alias ch-keep='ch "https://keep.google.com/"'

alias ch-music_happy='ch "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'
alias ch-music_anime='ch "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"'
alias ch-music_chill='ch https://youtu.be/hHW1oY26kxQ'
alias ch-music_chill_japan='ch "https://www.youtube.com/watch?v=9NaCaPuyyYY&list=PLvG4xTFF2NwlILSITQ5PcpZoKiMkcZdJ1"'
alias ch-music_rapvn='ch "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias ch-anime='ch "https://www9.gogoanime.io"' 
alias ch-kdrama='ch "https://www.dramacool9.co"'
alias ch-fun='ch_anime ; ch_kdrama'

alias ch-layout1='ch_cal ; ch_keep'

alias ch-toidicodedao='ch "https://toidicodedao.com/"'
alias ch-thefullsnack='ch "https://thefullsnack.com/"'
alias ch-codeaholicguy='ch "https://codeaholicguy.com/"'
alias ch-thai='ch "https://vnhacker.blogspot.com/"'
alias ch-ml='ch "https://l4w.io/"'
alias ch-blog='ch_toidicodedao ; ch_thefullsnack ; ch_codeaholicguy ; ch_thai ; ch_ml'
###chrome###

###mode###
alias work='fortune | cowsay ; ch_music_chill ; ch_pomodoro ; gla ; gha'
alias hola='fortune | cowsay ; ch_blogs ; ch_fun ; ch_youtube_subsriptions ; ch_fb ; rem ; gla ; gha'
###mode###

###hacking###
alias sherlock='python3 ~/tools/hacking/sherlock/sherlock.py' 
alias autosherlock='echo "who?" ; cd ~/Documents/data/sherlock ; sherlock (read $name) ; cat *.txt > openlink.txt ; xargs -a openlink.txt google-chrome ; trash ~/Documents/data/sherlock/*.txt ; cd -'
###hacking###
