#!/usr/bin/fish

# some fish function

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
	ls -lah ~/Downloads
	cd -
end

function run --description "run test for C, Python"
	if ls $argv | grep ".cpp"
		g++ $argv
		./a.out
		trash a.out
	else if ls $argv | grep ".c"
		gcc $argv
		./a.out
	else if ls $argv | grep ".py"
		python3 $argv
	end
end

function repeat
	while true
		$argv
		sleep 1
	end
end

function SERVER_IP --description "live server, go to folder project, have index.html"
	hostname -I
end

function se
	browser-sync start --server --files . --no-notify --host SERVER_IP --port 9000
end

########################################################################
########################################################################

set -g -x fish_greeting Yo!
fish_vi_key_bindings
set -U EDITOR nvim

# lazy code
alias fishr='source ~/.config/fish/config.fish'
alias g='grep'
alias h='htop'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias cl='clear'
alias e='exit'
alias v='nvim'
alias l='clear ; ls -lah'
alias p='ipython'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias mkd='mkdir -pv'
alias ka='killall'
alias fd='fdfind'
alias f='vifm'
alias o='open'
alias 777='chmod -R 777'
# update all
function rem
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean
	sudo snap refresh
	sudo npm install npm -g
	nvim -c "PlugUpdate | qa"
	tldr --update
end

function cleanning
	sudo apt-get autoremove -y
	sudo apt-get autoclean
	sudo apt-get clean
	t ~/.cache/thumbnails/*
	cowsay "trash empty"
	trash-empty
end

# tmux
# alias ide='tmux split-window -v -p 30 ; tmux split-window -h -p 66 ; tmux split-window -h -p 50'
alias ide='tmux split-window -v -p 20 ; tmux split-window -h -p 75'
alias qa='tmux kill-session -a ; tmux ls'

# cd
alias ..='cd .. ; clear ; l'
alias ...='cd .. ; cd .. ; cd .. ; clear ; l'
alias ....='cd .. ; cd .. ; cd .. ; cd .. ; clear ; l'
alias doc='c ~/Documents'
alias dow='c ~/Downloads'
alias vi='c ~/Videos'
alias pi='c ~/Pictures'
alias fgit='vifm ~/git'
alias fdoc='vifm ~/Documents'
alias fdow='vifm ~/Downloads'
alias fvi='vifm ~/Videos'
alias fpi='vifm ~/Pictures'

function c
	cd $argv
	clear
	ls -ltrh
end

# youtube-dl
alias yt='youtube-dl --add-metadata -i (read $link)'
alias yta='yt -x --audio-format mp3 (read $link)'

# mpv
alias rain='mpv ~/Music/rain.mp3 --volume=80'
alias fire='mpv ~/Music/fire.mp3'

# trash-cli
alias t='trash'
alias tdl='trash ~/Downloads/*'

# git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias clone='git clone'
alias cm='git commit -m'
alias ok='yo ; push'

function ghdotfiles
	cp ~/.selected_editor ~/git/dotfiles 
	cp ~/.gitconfig  ~/git/dotfiles/git/ 
	cp ~/.tmux.conf ~/git/dotfiles/tmux 
	cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim 
	cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ 
	cp ~/.config/fish/functions/fish_prompt.fish ~/git/dotfiles/fish/ 
	cp ~/.config/vifm/vifmrc ~/git/dotfiles/vifm
	cp ~/.config/vifm/colors/* ~/git/dotfiles/vifm/colors
	cp ~/.ssh/config ~/git/dotfiles/ssh/ 
	cd ~/git/dotfiles 
	ok ; cd -
end

alias ghlazyscript='cd ~/git/lazyscript ; ok ; cd -'
alias ghlinux_setup='cd ~/git/linux_setup ; ok ; cd -'
alias ghvimium_theme='cd ~/git/vimium_theme ; ok ; cd -'
alias ghFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; ok ; cd -'
alias ghok='cd ~/git/ok ; ok ; cd -'
alias ghcppPrimer='cd ~/git/cppPrimer ; ok ; cd -'

function gha --description "git push all project"
	cowsay "git push lazyscript"
	ghlazyscript

	cowsay "git push dotfiles"
	ghdotfiles

	cowsay "git push linux_setup" 
	ghlinux_setup

	cowsay "git push vimium_theme" 
	ghvimium_theme

	cowsay "git push FreeCodeCampProject" 
	ghFreeCodeCampProject

	cowsay "git push ok" 
	ghok

	cowsay "git push cppPrimer"
	ghcppPrimer

	cowsay "D O N E"
end

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull ; cd -'
alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gllinux_setup='cd ~/git/linux_setup ; pull ; cd -'
alias glvimium_theme='cd ~/git/vimium_theme ; pull ; cd -'
alias glFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; pull ; cd -'
alias glok='cd ~/git/ok ; pull ; cd -'
alias glcppPrimer='cd ~/git/cppPrimer ; pull ; cd -'


function gla --description "git pull all project"
	cowsay "git pull sherlock"
	glsherlock

	cowsay "git pull lazyscript" 
	gllazyscript 

	cowsay "git pull dotfiles" 
	gldotfiles 

	cowsay "git pull linux_setup" 
	gllinux_setup 

	cowsay "git pull vimium_theme" 
	glvimium_theme 

	cowsay "git pull FreeCodeCampProject" 
	glFreeCodeCampProject 

	cowsay "git pull cppPrimer"
	glcppPrimer

	cowsay "git pull ok" 
	glok
end

# browser
alias browser='brave-browser'
alias github='browser "https://github.com/nicholaspham2311"'

alias browser_youtube_subsriptions='browser "https://www.youtube.com/feed/subscriptions"'
alias browser_fb='browser https://facebook.com'
alias browser_stu='browser "http://stu.edu.vn/"'
alias browser_stu2='browser "http://www.stu.edu.vn/vi/265/khoa-cong-nghe-thong-tin.html"'
alias browser_mail0='browser "https://mail.google.com/mail/u/0/#all"'
alias browser_mail1='browser "https://mail.google.com/mail/u/1/#all"'
alias browser_mail2='browser "https://mail.google.com/mail/u/2/#all"'
alias browser_mail='browser_mail0 ; browser_mail1 ; browser_mail2'
alias browser_linkedin='browser "https://www.linkedin.com/feed/"'

function browser_daily
	browser_linkedin
	browser_mail0
	browser_mail1
	browser_youtube_subsriptions
	browser_stu
	browser_fb
end

## search
function !t
	brave-browser --new-window "https://translate.google.com/?source=osdd#auto|auto|$argv"
end

function !y
	brave-browser --new-window "https://www.youtube.com/results?search_query=$argv"
end

function !gm
	brave-browser --new-window "https://www.google.com/maps?q=$argv"
end

function !g
	brave-browser --new-window "https://www.google.com/search?q=$argv"
end

function !gi
	brave-browser --new-window "https://www.google.com/search?tbm=isch&q=$argv"
end

function !w
	brave-browser --new-window "https://en.wikipedia.org/wiki/Special:Search?search=$argv"
end

function !gh
	brave-browser --new-window "https://github.com/search?q=$argv"
end

function !fa
	brave-browser --new-window "https://www.facebook.com/search?q=$argv"
end

function !m
	brave-browser --new-window "https://medium.com/search?q=$argv"
end


# mode
alias hi='browser_daily ; gla ; gha ; rem'

# hacking
alias sherlock='python3 ~/tools/hacking/sherlock/sherlock.py' 
function sherlockauto --description "open all link"
	mkdir -p ~/Documents/data/sherlock
	cd ~/Documents/data/sherlock
	sherlock $argv
	cat *.txt > openlink.txt
	while read link
		brave-browser $link
	end < openlink.txt
	trash ~/Documents/data/sherlock/*
	cd -
end
