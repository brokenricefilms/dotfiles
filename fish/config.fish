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

###C language
alias catc='./a.out ; t a.out'
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
alias ok='yo ; push'

alias ghdotfiles='cp ~/.gitconfig  ~/git/dotfiles/git/ ; cp ~/.tmux.conf ~/git/dotfiles/tmux ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cp ~/.config/vifm/vifmrc ~/git/dotfiles/vifm/ ; cp ~/.config/vifm/colors/Default.vifm ~/git/dotfiles/vifm/colors/ ; cp ~/.ssh/config ~/git/dotfiles/ssh/ ; cd ~/git/dotfiles ; yo ; push ; cd -'
alias ghdotfiles-termux='cd ~/git/dotfiles-termux ; yo ; push ; cd -'
alias ghlazyscript='cd ~/git/lazyscript ; yo ; push ; cd -'
alias ghstudy='cd ~/git/study ; yo ; push ; cd -'
alias ghmywebsite='cd ~/git/mywebsite ; yo ; push ; cd -'
alias ghpomodoro='cd ~/git/pomodoro ; yo ; push ; cd -'
alias gha='ghdotfiles-termux ; ghstudy ; ghmywebsite ; ghpomodoro ; ghlazyscript ; ghdotfiles'

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull ; cd -'
alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gldotfiles-termux='cd ~/git/dotfiles-termux ; pull ; cd -'
alias glstudy='cd ~/git/study ; pull ; cd -'
alias glmywebsite='cd ~/git/mywebsite ; pull ; cd -'
alias glpomodoro='cd ~/git/pomodoro ; pull ; cd -'
alias gla='gldotfiles-termux ; glstudy ; glmywebsite ; glpomodoro; glsherlock ; gldotfiles ; gllazyscript'
###

###browser
alias ch='google-chrome'
alias fi='firefox -new-firefox'

alias ch_youtube_subsriptions='ch "https://www.youtube.com/feed/subscriptions"'
alias ch_github='ch https://github.com/nicholaspham2311' 
alias ch_fb='ch https://facebook.com'
alias ch_stu='ch "http://stu.edu.vn/"'
alias ch_mail='ch "https://mail.google.com/mail/u/0/#inbox" ; ch "https://mail.google.com/mail/u/5/#inbox" ; ch "https://mail.google.com/mail/u/8/#inbox"'

alias ch_chill='ch "https://www.youtube.com/watch?v=vw3iCuCRm0Q&list=PLt7bG0K25iXjvB28Upp4YU_LvLS2MFbLr&index=1"'

alias ch_anime='ch "https://www9.gogoanime.io"' 
alias ch_kdrama='ch "https://www.dramacool9.co"'
alias ch_movie='ch "https://fmovies.to/home"'
alias ch_fun='ch_anime ; ch_kdrama ; ch_movie'

alias ch_toidicodedao='ch "https://toidicodedao.com/"'
alias ch_thefullsnack='ch "https://thefullsnack.com/"'
alias ch_codeaholicguy='ch "https://codeaholicguy.com/"'
alias ch_thai='ch "https://vnhacker.blogspot.com/"'
alias ch_ml='ch "https://l4w.io/"'
alias ch_ali='ch "https://aliabdaal.com/"'
alias ch_blog='ch_ali ; ch_toidicodedao ; ch_thefullsnack ; ch_codeaholicguy ; ch_thai ; ch_ml'
###

###mode
alias hola='ch_mail ; ch_stu ; ch_fb ; ch_youtube_subsriptions ; ch_blog ; rem ; gla ; gha'
###

###hacking###
alias sherlock='python3 ~/tools/hacking/sherlock/sherlock.py' 
alias autosherlock='echo "who?" ; cd ~/Documents/data/sherlock ; sherlock (read $name) ; cat *.txt > openlink.txt ; xargs -a openlink.txt google-chrome ; trash ~/Documents/data/sherlock/openlink.txt ; cd -'
###
