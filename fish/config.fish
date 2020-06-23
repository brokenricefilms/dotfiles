#!/usr/bin/fish


# funtions stuff
function 256color
	bash ~/.config/fish/functions/print256colours.sh
end

function switchTv
	sh ~/.config/fish/functions/switchTv.sh
end

function 24bitColor
	bash ~/.config/fish/functions/24-bit-color.sh
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
		rm a.out
	else if ls $argv | grep ".c"
		gcc $argv
		./a.out
        rm a.out
	else if ls $argv | grep ".py"
		python3 $argv
	end
end

function runcpp
    g++ *.cpp
    ./a.out
    rm a.out
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

set -g -x fish_greeting Yo!

set -g fish_term24bit 1
fzf_key_bindings
fish_vi_key_bindings
set -U EDITOR nvim

# lazy code
alias n='obsidian &'
alias fishr='source ~/.config/fish/config.fish'
alias fd='fdfind'
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
alias v='nvim'
alias o='open'
alias 777='chmod -R 777'
alias x='chmod +x'
alias cf='cd ~/.config/ ; nvim -o (fzf)'

# tmux
# alias ide='tmux split-window -v -p 30 ; tmux split-window -h -p 66 ; tmux split-window -h -p 50'
alias ide='tmux split-window -v -p 20 ; tmux split-window -h -p 75'
alias qa='tmux kill-session -a ; tmux ls'

# cd
alias ..='cd .. ; clear ; l'
alias ...='cd .. ; cd .. ; cd .. ; clear ; l'
alias ....='cd .. ; cd .. ; cd .. ; cd .. ; clear ; l'
alias dow='c ~/Downloads'
alias doc='c ~/Documents'

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
alias sta='git status'
alias push="git push"
alias pull="git pull" 
alias clone='git clone'
alias commit='git commit -m'
alias prettier='prettier --write .'
alias ok='prettier ; yo ; push '

function ghdotfiles
    cp -r ~/.fonts ~/git/dotfiles
    cp -r ~/.config/vifm/* ~/git/dotfiles/vifm
	cp ~/.selected_editor ~/git/dotfiles
	cp ~/.gitconfig  ~/git/dotfiles/git/
	cp ~/.tmux.conf ~/git/dotfiles/tmux/
	cp ~/.config/nvim/coc-settings.json ~/git/dotfiles/nvim/
	cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim/
	cp -r ~/.config/nvim/stuff ~/git/dotfiles/nvim/
	cp -r ~/.config/nvim/coc-settings.json ~/git/dotfiles/nvim/
	cp -r ~/.config/fish/* ~/git/dotfiles/fish/
	cp ~/.ssh/config ~/git/ok/ssh/
	cd ~/git/dotfiles/
	ok ; cd -
end

alias ghlazyscript='cd ~/git/lazyscript ; ok ; cd -'
alias ghlinux_setup='cd ~/git/linux_setup ; ok ; cd -'
alias ghvimium_dark_theme='cd ~/git/vimium_dark_theme ; ok ; cd -'
alias ghFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; ok ; cd -'
alias ghok='cd ~/git/ok ; ok ; cd -'
alias ghdataLab='cd ~/git/dataLab ; ok ; cd -'
alias ghwindowsSetup='cd ~/git/windowsSetup ;  ok ; cd -'
alias ghtermuxSetup='cd ~/git/termuxSetup ;  ok ; cd -'
function ghnote
    cd ~/git/note/Attachments/

    mv *.png ~/git/note/Attachments/Image/
    mv *.jpg ~/git/note/Attachments/Image/
    mv *.jpeg ~/git/note/Attachments/Image/

    mv *.jpeg ~/git/note/Attachments/Audio/
    mv *.webm ~/git/note/Attachments/Audio/
    mv *.wav ~/git/note/Attachments/Audio/
    mv *.m4a ~/git/note/Attachments/Audio/
    mv *.ogg ~/git/note/Attachments/Audio/
    mv *.3gp ~/git/note/Attachments/Audio/
    mv *.flac ~/git/note/Attachments/Audio/

    mv *.pdf ~/git/note/Attachments/pdf/
    
    cd -

    cd ~/git/note/
    ok
    cd -
end

function gha --description "git push all project"
	cowsay "git push note"
	ghnote

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

	cowsay "git push windowsSetup" 
    ghwindowsSetup

	cowsay "git push termuxSetup" 
    ghtermuxSetup
	cowsay "D O N E"
end

alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gllinux_setup='cd ~/git/linux_setup ; pull ; cd -'
alias glvimium_dark_theme='cd ~/git/vimium_dark_theme ; pull ; cd -'
alias glFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; pull ; cd -'
alias glok='cd ~/git/ok ; pull ; cd -'
alias gldataLab='cd ~/git/dataLab ; pull ; cd -'
alias glwindowsSetup='cd ~/git/windowsSetup ;  pull ; cd -'
alias gltermuxSetup='cd ~/git/termuxSetup ;  pull ; cd -'
alias glnote='cd ~/git/note ;  pull ; cd -'

function gla --description "git pull all project"
	cowsay "git pull note" 
	glnote

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

	cowsay "git pull windowsSetup" 
    glwindowsSetup

	cowsay "git pull termuxSetup" 
    gltermuxSetup
end

# browser
alias browser='brave-browser'
# alias browser='firefox'
alias github='browser "https://github.com/thuanpham2311"'

alias browser_youtube_subsriptions='browser "https://www.youtube.com/feed/subscriptions"'
alias browser_fb='browser https://facebook.com'
alias browser_stu='browser "http://stu.edu.vn/"'
alias browser_stu2='browser "http://www.stu.edu.vn/vi/265/khoa-cong-nghe-thong-tin.html"'
alias browser_mail0='browser "https://mail.google.com/mail/u/0/#inbox"'
alias browser_mail1='browser "https://mail.google.com/mail/u/1/#inbox"'
alias browser_mail2='browser "https://mail.google.com/mail/u/2/#inbox"'
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
	browser --new-window "https://translate.google.com/?source=osdd#auto|auto|$argv"
end

function !y
	browser --new-window "https://www.youtube.com/results?search_query=$argv"
end

function !gm
	browser --new-window "https://www.google.com/maps?q=$argv"
end

function !g
	browser --new-window "https://www.google.com/search?q=$argv"
end

function !gi
	browser --new-window "https://www.google.com/search?tbm=isch&q=$argv"
end

function !w
	browser --new-window "https://en.wikipedia.org/wiki/Special:Search?search=$argv"
end

function !gh
	browser --new-window "https://github.com/search?q=$argv"
end

function !fa
	browser --new-window "https://www.facebook.com/search?q=$argv"
end

function !m
	browser --new-window "https://medium.com/search?q=$argv"
end

# mode
alias hi='browser_daily'
alias rem='sudo apt update; sudo apt upgrade -y; sudo npm i -g npm; sudo apt autoremove -y; sudo apt autoclean -y'
alias procpp='cp -r ~/.config/nvim/stuff/cpppro/* . ; v *'

function dataLab --description "setup for data research"
	cd ~/git/dataLab/
	tmux split-window -h -p 50
	jupyter-notebook
end
