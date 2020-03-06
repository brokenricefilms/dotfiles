#!/usr/bin/fish
set -g -x fish_greeting Yo!
fish_vi_key_bindings
set -U EDITOR nvim

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

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

function run
	if ls $argv | grep ".c"
		gcc $argv
		./a.out
		trash a.out
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

# live server, go to folder project, have index.html
function SERVER_IP
	hostname -I
end

function serve
	browser-sync start --server --files . --no-notify --host SERVER_IP --port 9000
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
alias p='ipython'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias mkd='mkdir -pv'
alias ka='killall'
alias r='ranger'
alias fd='fdfind'
alias o='open'
alias rem='sudo apt-get update ; sudo apt-get upgrade -y ; sudo apt-get autoremove -y ; sudo apt-get autoclean ; sudo apt-get clean'

#tmux
alias ide='tmux split-window -h -p 20'

#cd
alias ..='cd ..'
alias ...='cd .. ; cd .. ; cd ..'
alias ....='cd .. ; cd .. ; cd .. ; cd ..'
alias doc='cd ~/Documents'
alias dow='cd ~/Downloads'

#youtube-dl
alias yt='youtube-dl --add-metadata -i (read $link)'
alias yta='yt -x --audio-format mp3 (read $link)'

# mpv
alias rain='mpv ~/Music/rain.mp3 --volume=80'

#trash-cli
alias t='trash'
alias tdl='trash ~/Downloads/*'
alias tvid='trash ~/Videos/*'

#git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias cm='git commit -m'
alias ok='yo ; push'

# alias ghdotfiles='cp ~/.selected_editor ~/git/dotfiles ; cp ~/.gitconfig  ~/git/dotfiles/git/ ; cp ~/.tmux.conf ~/git/dotfiles/tmux ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cp ~/.config/fish/functions/fish_prompt.fish ~/git/dotfiles/fish/ ; cp ~/.ssh/config ~/git/dotfiles/ssh/ ; cp ~/.config/ranger/* ~/git/dotfiles/ranger ; cd ~/git/dotfiles ; ok ; cd -'
function ghdotfiles
	cp ~/.selected_editor ~/git/dotfiles 
	cp ~/.gitconfig  ~/git/dotfiles/git/ 
	cp ~/.tmux.conf ~/git/dotfiles/tmux 
	cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim 
	cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ 
	cp ~/.config/fish/functions/fish_prompt.fish ~/git/dotfiles/fish/ 
	cp ~/.ssh/config ~/git/dotfiles/ssh/ 
	cp ~/.config/ranger/* ~/git/dotfiles/ranger 
	cd ~/git/dotfiles 
	ok ; cd -
end

alias ghlazyscript='cd ~/git/lazyscript ; ok ; cd -'
alias ghlinux_setup='cd ~/git/linux_setup ; ok ; cd -'
alias ghvimium_theme='cd ~/git/vimium_theme ; ok ; cd -'
alias gha='ghlazyscript ; ghdotfiles ; ghlinux_setup ; ghvimium_theme'

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull ; cd -'
alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gllinux_setup='cd ~/git/linux_setup ; pull ; cd -'
alias glvimium_theme='cd ~/git/vimium_theme ; pull ; cd -'
alias gla='glsherlock ; gldotfiles ; gllazyscript ; gllinux_setup ; glvimium_theme'

#browser
alias ch='google-chrome'
#alias ch='firefox'

alias ch_youtube_subsriptions='ch "https://www.youtube.com/feed/subscriptions"'
alias ch_fb='ch https://facebook.com'
alias ch_stu='ch "http://stu.edu.vn/"'
alias ch_stu2='ch "http://www.stu.edu.vn/vi/265/khoa-cong-nghe-thong-tin.html"'
alias ch_mail0='ch "https://mail.google.com/mail/u/0/#all"'
alias ch_mail1='ch "https://mail.google.com/mail/u/1/#all"'
alias ch_mail2='ch "https://mail.google.com/mail/u/2/#all"'
alias ch_mail='ch_mail0 ; ch_mail1 ; ch_mail2'
alias ch_linkedin='ch "https://www.linkedin.com/feed/"'

#mode
alias hi='ch_linkedin ; ch_mail ; ch_stu ; ch_youtube_subsriptions ; ch_fb ; gla ; gha ; rem ; nvim -c "PlugUpdate | qa" ; tldr --update'

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
