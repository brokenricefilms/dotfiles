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

function dl --description "download file like bitTorrent,..."
	cd ~/Downloads
	aria2c $argv
	cd -
end

function catc --description "test C program"
	gcc $argv
	./a.out
	trash a.out
end

#lazy code 
alias c='clear'
alias g='grep'
alias h='htop'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias e='exit'
alias v='nvim'
alias l='ls -lah'
alias p='python3'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias mkd='mkdir -pv'
alias ka='killall'
alias r='ranger'
alias fd='fdfind'
alias o='open'

#mpv
alias m='mpv ~/Music'

#tmux
alias ide='tmux split-window -h -p 30'

#cd
alias ..='cd ..'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias doc='cd ~/Documents'
alias vid='cd ~/Videos'

#youtube-dl
alias yt='youtube-dl --add-metadata -i'
alias yta='yt -x --audio-format mp3 (read $link)'

#trash-cli
alias t='trash'

#git
alias clone='git clone'
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias cm='git commit -m'
alias ok='yo ; push'

alias ghdotfiles='cp ~/.selected_editor ~/git/dotfiles ; cp ~/.gitconfig  ~/git/dotfiles/git/ ; cp ~/.tmux.conf ~/git/dotfiles/tmux ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cp ~/.config/fish/functions/fish_prompt.fish ~/git/dotfiles/fish/ ; cp ~/.ssh/config ~/git/dotfiles/ssh/ ; cp ~/.config/ranger/* ~/git/dotfiles/ranger ; cd ~/git/dotfiles ; yo ; push ; cd -'
alias ghdotfiles-termux='cd ~/git/dotfiles-termux ; yo ; push ; cd -'
alias ghlazyscript='cd ~/git/lazyscript ; yo ; push ; cd -'
alias ghstudy='cd ~/git/study ; yo ; push ; cd -'
alias ghmywebsite='cd ~/git/mywebsite ; yo ; push ; cd -'
alias ghpomodoro='cd ~/git/pomodoro ; yo ; push ; cd -'
alias ghtic_tac_toe='cd ~/git/tic_tac_toe ; yo ; push ; cd -'
alias gha='ghdotfiles-termux ; ghstudy ; ghmywebsite ; ghpomodoro ; ghlazyscript ; ghdotfiles ; ghtic_tac_toe'

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull ; cd -'
alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gldotfiles-termux='cd ~/git/dotfiles-termux ; pull ; cd -'
alias glstudy='cd ~/git/study ; pull ; cd -'
alias glmywebsite='cd ~/git/mywebsite ; pull ; cd -'
alias glpomodoro='cd ~/git/pomodoro ; pull ; cd -'
alias gltic_tac_toe='cd ~/git/tic_tac_toe ; pull ; cd -'
alias gla='gldotfiles-termux ; glstudy ; glmywebsite ; glpomodoro; glsherlock ; gldotfiles ; gllazyscript ; gltic_tac_toe'

#browser
alias ch='google-chrome'
alias fi='firefox -new-firefox'

alias ch_youtube_subsriptions='ch "https://www.youtube.com/feed/subscriptions"'
alias ch_fb='ch https://facebook.com'
alias ch_stu='ch "http://stu.edu.vn/"'
alias ch_stu2='ch http://www.stu.edu.vn/vi/265/khoa-cong-nghe-thong-tin.html'

alias ch_chill='ch "https://www.youtube.com/watch?v=vw3iCuCRm0Q&list=PLt7bG0K25iXjvB28Upp4YU_LvLS2MFbLr&index=1"'
alias ch_mail='ch "https://mail.google.com/mail/u/0/#inbox"'

#mode
alias hola='ch_mail ; ch_stu ; ch_stu2 ; ch_fb ; ch_youtube_subsriptions ; gla ; gha ; nvim -c "PlugUpdate | qa" ; tldr --update'

#hacking
alias sherlock='python3 ~/tools/hacking/sherlock/sherlock.py' 
function sherlockauto --description "open all link"
	cd ~/Documents/data/sherlock
	sherlock $argv
	cat *.txt > openlink.txt
	while read link
		google-chrome $link
	end < openlink.txt
	trash ~/Documents/data/sherlock/*
	cd -
end
