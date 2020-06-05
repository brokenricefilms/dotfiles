#!/usr/bin/fish

# some fish function
function 256color
	bash ~/.config/fish/functions/print256colours.sh
end

function showTrueColor
	bash ~/.config/fish/functions/showTrueColor.sh
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
	ls -lah ~/Downloads
	cd -
end

function run --description "run test for c/cpp, Python"
	if ls $argv | grep ".cpp"
		g++ $argv
		./a.out
		trash a.out
	else if ls $argv | grep ".c"
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

function SERVER_IP --description "live server, go to folder project, have index.html"
	hostname -I
end

function se
	browser-sync start --server --files . --no-notify --host SERVER_IP --port 9000
end

########################################################################
########################################################################

set -g -x fish_greeting Yo!

set -g fish_term24bit 1
fzf_key_bindings
fish_vi_key_bindings
set -U EDITOR nvim

# lazy code
alias fishr='source ~/.config/fish/config.fish'
alias g='grep'
alias h='htop'
alias ins='sudo apt install -y'
alias uins='sudo apt remove -y'
alias e='exit'
alias :q='exit'
alias l='clear ; ls -lah'
alias p='ipython3'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias mkd='mkdir -pv'
alias ka='killall'
alias fi='vifm'
alias v='nvim'
alias o='open'
alias fd='fdfind'
alias 777='chmod -R 777'
alias cf='cd ~/.config/ ; nvim -o (fzf)'

function rem --description "update"
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean
	# sudo snap refresh
	sudo npm install npm -g
	nvim -c "PlugUpdate | qa"
	tldr --update
end

# tmux
# alias ide='tmux split-window -v -p 30 ; tmux split-window -h -p 66 ; tmux split-window -h -p 50'
alias ide='tmux split-window -v -p 20 ; tmux split-window -h -p 75'
alias qa='tmux kill-session -a ; tmux ls'

# cd
alias ..='cd .. ; clear ; l'
alias ...='cd .. ; cd .. ; cd .. ; clear ; l'
alias ....='cd .. ; cd .. ; cd .. ; cd .. ; clear ; l'
alias dow='c ~/Downloads'

function c
	cd $argv
	clear
	ls -ltrh
end

# youtube-dl
alias yt='youtube-dl --add-metadata -i (read $link)'
alias yta='yt -x --audio-format mp3 (read $link)'

# trash-cli
alias t='trash'
alias tdl='trash ~/Downloads/*'

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function fc -d "Fuzzy change directory"
	if set -q argv[1]
	set searchdir $argv[1]
	else
	set searchdir $HOME
end

# https://github.com/fish-shell/fish-shell/issues/1362
	set -l tmpfile (mktemp)
	find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf > $tmpfile
	set -l destdir (cat $tmpfile)
	rm -f $tmpfile

	if test -z "$destdir"
	return 1
	end

	cd $destdir
	clear
	ls -ltrh
end

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

# git
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias clone='git clone'
alias cm='git commit -m'
alias prettier='prettier --write .'
alias ok='prettier ; yo ; push '

function ghdotfiles
	cp ~/.selected_editor ~/git/dotfiles
	cp ~/.gitconfig  ~/git/dotfiles/git/
	cp ~/.tmux.conf ~/git/dotfiles/tmux/
	cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim
	cp ~/.config/fish/config.fish ~/git/dotfiles/fish/
	cp ~/.config/fish/functions/* ~/git/dotfiles/fish/
	cp ~/.config/vifm/vifmrc ~/git/dotfiles/vifm/
	cp ~/.config/vifm/colors/* ~/git/dotfiles/vifm/colors/
	cp ~/.ssh/config ~/git/dotfiles/ssh/
	cd ~/git/dotfiles/
	ok ; cd -
end

alias ghlazyscript='cd ~/git/lazyscript ; ok ; cd -'
alias ghlinux_setup='cd ~/git/linux_setup ; ok ; cd -'
alias ghvimium_dark_theme='cd ~/git/vimium_dark_theme ; ok ; cd -'
alias ghFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; ok ; cd -'
alias ghok='cd ~/git/ok ; ok ; cd -'
alias ghdataLab='cd ~/git/dataLab ; ok ; cd -'
alias ghEcommerceWebsite='cd ~/git/EcommerceWebsite ; ok ; cd -'

function gha --description "git push all project"
	cowsay "git push lazyscript"
	ghlazyscript

	cowsay "git push dotfiles"
	ghdotfiles

	cowsay "git push linux_setup" 
	ghlinux_setup

	cowsay "git push vimium-dark-theme" 
	ghvimium_dark_theme

	cowsay "git push FreeCodeCampProject" 
	ghFreeCodeCampProject

	cowsay "git push ok" 
	ghok

	cowsay "git push dataLab" 
	ghdataLab

	cowsay "git push EcommerceWebsite"
	ghEcommerceWebsite

	cowsay "D O N E"
end

alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gllinux_setup='cd ~/git/linux_setup ; pull ; cd -'
alias glvimium_dark_theme='cd ~/git/vimium_dark_theme ; pull ; cd -'
alias glFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; pull ; cd -'
alias glok='cd ~/git/ok ; pull ; cd -'
alias gldataLab='cd ~/git/dataLab ; pull ; cd -'
alias glEcommerceWebsite='cd ~/git/EcommerceWebsite ; pull ; cd -'

function gla --description "git pull all project"
	cowsay "git pull lazyscript" 
	gllazyscript 

	cowsay "git pull dotfiles" 
	gldotfiles 

	cowsay "git pull linux_setup" 
	gllinux_setup 

	cowsay "git pull vimium-dark-theme" 
	glvimium_dark_theme

	cowsay "git pull FreeCodeCampProject" 
	glFreeCodeCampProject 

	cowsay "git pull ok" 
	glok

	cowsay "git pull dataLab" 
	gldataLab

	cowsay "git pull EcommerceWebsite"
	glEcommerceWebsite
end

# browser
alias browser='brave-browser'
# alias browser='firefox'
alias github='browser "https://github.com/thuanpham2311"'

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
    browser_youtube_subsriptions
	browser_linkedin
	browser_mail0
	browser_mail1
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

function dataLab --description "setup for data research"
	cd ~/git/dataLab/
	tmux split-window -h -p 50
	jupyter-notebook
end
