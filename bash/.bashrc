# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
############################
set -o vi

###lazy code 
alias c='clear'
alias h='history'
alias ins='sudo apt-get install -y'
alias uins='sudo apt-get remove -y'
alias e='exit'
alias v='nvim'
alias l='ls -lah'
alias p='python3'
alias rem='sudo snap refresh ; sudo apt-get update ; sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean'
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
alias yo='git add -A ; git commit -m "$(curl -s whatthecommit.com/index.txt)"'
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

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull'
alias gldotfiles='cd ~/git/dotfiles ; pull'
alias gldotfiles-termux='cd ~/git/dotfiles-termux ; pull'
alias glstudy='cd ~/git/study ; pull'
alias glmywebsite='cd ~/git/mywebsite ; pull'
alias glpomodoro='cd ~/git/pomodoro ; pull'
alias gllazyscript='cd ~/git/lazyscript ; pull'
alias gla='glsherlock ; gldotfiles ; gldotfiles-termux ; glstudy ; glmywebsite ; glpomodoro ; gllazyscript ; cd ; cowthink -s "git pull all done"'
###

###chrome
alias ch='google-chrome'
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
alias ch_music_chill='ch https://youtu.be/hHW1oY26kxQ'
alias ch_music_chill_japan='ch "https://www.youtube.com/watch?v=9NaCaPuyyYY&list=PLvG4xTFF2NwlILSITQ5PcpZoKiMkcZdJ1"'
alias ch_music_rapvn='ch "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias ch_anime='ch "https://www9.gogoanime.io"' 
alias ch_kdrama='ch "https://www.dramacool9.co"'
alias ch_fun='ch_anime ; ch_kdrama'

alias ch_layout1='ch_cal ; ch_keep'

alias ch_toidicodedao='ch "https://toidicodedao.com/"'
alias ch_thefullsnack='ch "https://thefullsnack.com/"'
alias ch_codeaholicguy='ch "https://codeaholicguy.com/"'
alias ch_thai='ch "https://vnhacker.blogspot.com/"'
alias ch_ml='ch "https://l4w.io/"'
alias ch_ali='ch "https://aliabdaal.com/"'
alias ch_blog='ch_ali ; ch_toidicodedao ; ch_thefullsnack ; ch_codeaholicguy ; ch_thai ; ch_ml'
###

###firefox
alias fi='firefox -new-firefox'
alias fi_youtube_subsriptions='firefox "https://www.youtube.com/feed/subscriptions"'
alias fi_pocket='firefox "https://app.getpocket.com/"'
alias fi_pomodoro='firefox "https://youtu.be/1znjHDiqBk8?t=1"'
alias fi_github='firefox https://github.com/nicholaspham2311' 
alias fi_fb='firefox https://facebook.com' 
alias fi_cal='firefox "https://calendar.google.com/calendar/r"'
alias fi_trello='firefox "https://trello.com/b/nGRAb2ii/nicholas"'

alias fi_music_happy='firefox "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"'
alias fi_music_anime='firefox "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"'
alias fi_music_chill='firefox "https://youtu.be/hHW1oY26kxQ"'
alias fi_music_rapvn='firefox "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias fi_anime='firefox "https://www9.gogoanime.io"' 
alias fi_kdrama='firefox "https://www.dramacool9.co"'
alias fi_fun='fi_anime ; fi_kdrama'

alias fi_layout1='ch_cal ; ch_keep'

alias fi_toidicodedao='firefox "https://toidicodedao.com/"'
alias fi_thefullsnack='firefox "https://thefullsnack.com/"'
alias fi_codeaholicguy='firefox "https://codeaholicguy.com/"'
alias fi_thai='firefox "https://vnhacker.blogspot.com/"'
alias fi_ml='firefox "https://l4w.io/"'
alias fi_ali='firefox "https://aliabdaal.com/"'
alias fi_blog='fi_ali ; fi_toidicodedao ; fi_thefullsnack ; fi_codeaholicguy ; fi_thai ; fi_ml'
###

###mode
alias work='fortune | cowsay ; ch_music_chill ; ch_pomodoro ; gla ; gha'
alias hola='fortune | cowsay ; ch_youtube_subsriptions ; ch_fb ; rem ; gla ; gha'
###

###hacking###
alias sherlock='python3 ~/tools/hacking/sherlock/sherlock.py' 
alias autosherlock='echo "who?" ; cd ~/Documents/data/sherlock ; sherlock (read $name) ; cat *.txt > openlink.txt ; xargs -a openlink.txt google-chrome ; trash ~/Documents/data/sherlock/*.txt ; cd -'
###

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
