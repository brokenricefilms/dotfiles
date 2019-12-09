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

###lazy code 
alias c='clear'
alias h='history'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias e='exit'
alias v='nvim'
alias l='ls -lah'
alias p='python3'
alias rem='sudo apt-get update ; sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean ; nvim -c "PlugUpdate | qa"'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias mkd='mkdir -pv'
alias ka='killall'
###

###cd
alias ..='cd ..'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias dl='cd ~/Downloads'
###

###youtube-dl
alias yt='youtube-dl --add-metadata -i'
alias yta='yt -x --audio-format mp3 (read $link)'
###

###trash-cli
alias t='trash'
alias tdl='cd ~/Downloads ; trash * ; cd -'
###

###git
#commit so hard, so auto write commit cool 
alias clone='git clone'
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias g='git'
alias cm='git commit -m'
alias gh='yo ; push'

alias ghdotfiles='cp ~/.gitconfig  ~/git/dotfiles/git/ ; cp ~/.tmux.conf ~/git/dotfiles/tmux ; cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cp ~/.config/vifm/vifmrc ~/git/dotfiles/vifm/ ; cp ~/.config/vifm/colors/Default.vifm ~/git/dotfiles/vifm/colors/ ; cp ~/.ssh/config ~/git/dotfiles/ssh/ ; cd ~/git/dotfiles ; yo ; push'
alias ghdotfiles-termux='cd ~/git/dotfiles-termux ; yo ; push'
alias ghmywebsite='cd ~/git/mywebsite/ ; yo ; push'
alias ghpomodoro='cd ~/git/pomodoro/ ; yo ; push'
alias ghstudy='cd ~/git/study ; yo ; push'
alias ghlazyscript='cd ~/git/lazyscript ; yo ; push'
alias gha='ghlazyscript ; ghdotfiles ; ghdotfiles-termux ; ghstudy ; ghmywebsite ; ghpomodoro ; fortune | cowsay; cd'

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull'
alias gldotfiles='cd ~/git/dotfiles ; pull'
alias gldotfiles-termux='cd ~/git/dotfiles-termux ; pull'
alias glstudy='cd ~/git/study ; pull'
alias glmywebsite='cd ~/git/mywebsite ; pull'
alias glpomodoro='cd ~/git/pomodoro ; pull'
alias gllazyscript='cd ~/git/lazyscript ; pull'
alias gla='glsherlock ; gldotfiles ; gldotfiles-termux ; glstudy ; glmywebsite ; glpomodoro ; gllazyscript ; cd ; cowthink -s "git pull all done"'
###

###browser
alias ch='google-chrome'
alias fi='firefox -new-firefox'

alias ch_youtube_subsriptions='ch "https://www.youtube.com/feed/subscriptions"'
alias ch_pocket='ch "https://app.getpocket.com/"'
alias ch_pomodoro='ch "https://youtu.be/1znjHDiqBk8?t=1"'
alias ch_github='ch https://github.com/nicholaspham2311' 
alias ch_fb='ch https://facebook.com'
alias ch_cal='ch "https://calendar.google.com/calendar/r"'
alias ch_trello='ch "https://trello.com/b/nGRAb2ii/nicholas"'
alias ch_keep='ch "https://keep.google.com/"'

alias ch_music_happy='ch "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'
alias ch_music_anime='ch "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"'
alias ch_music_chill='ch "https://www.youtube.com/watch?v=vw3iCuCRm0Q&list=PLt7bG0K25iXjvB28Upp4YU_LvLS2MFbLr&index=1"'
alias ch_music_rapvn='ch "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias ch_anime='ch "https://www9.gogoanime.io"' 
alias ch_kdrama='ch "https://www.dramacool9.co"'
alias ch_movie='ch "https://fmovies.to/home"'
alias ch_fun='ch_anime ; ch_kdrama ; ch_movie'

alias ch_layout1='ch_cal ; ch_keep'

alias ch_toidicodedao='ch "https://toidicodedao.com/"'
alias ch_thefullsnack='ch "https://thefullsnack.com/"'
alias ch_codeaholicguy='ch "https://codeaholicguy.com/"'
alias ch_thai='ch "https://vnhacker.blogspot.com/"'
alias ch_ml='ch "https://l4w.io/"'
alias ch_ali='ch "https://aliabdaal.com/"'
alias ch_blog='ch_ali ; ch_toidicodedao ; ch_thefullsnack ; ch_codeaholicguy ; ch_thai ; ch_ml'
###

###mode
alias work='fortune | cowsay ; ch_music_chill ; ch_pomodoro ; gla ; gha'
alias hola='fortune | cowsay ; ch_youtube_subsriptions ; ch_fb ; rem ; gla ; gha'
###

###hacking###
alias sherlock='python3 ~/tools/hacking/sherlock/sherlock.py' 
alias autosherlock='echo "who?" ; cd ~/Documents/data/sherlock ; sherlock (read $name) ; cat *.txt > openlink.txt ; xargs -a openlink.txt google-chrome ; trash ~/Documents/data/sherlock/*.txt ; cd -'
###
