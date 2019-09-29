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
alias l='ls -CF'

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

###Lazy code### 
alias ..='cd ..' \
		...='cd .. ; cd .. ; cd ..' \
		....='cd .. ; cd .. ; cd .. ; cd ..' \
		c='clear' \
		h='history' \
		ins='sudo apt-get install -y' \
		uins='sudo apt-get remove -y' \
		e='exit' \
		v='nvim' \
		sv='sudo nvim' \
		t='touch' \
		l='ls -latr' \
		p='python3' \
		rem='sudo apt-get update ;sudo apt-get upgrade -y ;sudo apt-get autoremove -y;sudo apt-get autoclean ; sudo apt-get clean' \
		rbn='sudo reboot now' \
		sdn='sudo shutdown now'
###lazy code###

###git###
#commit so hard, so auto write commit cool 
alias clone='git clone' \
		yo='git add -A ; git commit -m "$(curl -s whatthecommit.com/index.txt)"' \
		push="git push" \
		pull="git pull" \
		ghdotfiles='cp ~/.tmux.conf ~/git/dotfiles/tmux ; cat ~/.config/nvim/init.vim > ~/.vimrc ; cp ~/.vimrc ~/git/dotfiles/vim ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.bashrc ~/git/dotfiles/bash ; cp ~/.config/fish/config.fish ~/git/dotfiles/fish/ ; cd ~/git/dotfiles ; yo ; push' \
		ghfirstwebsite='cd ~/git/firstwebsite/ ; yo ; push' \
		ghpomodoro='cd ~/git/pomodoro/ ; yo ; push' \
		ghstudy='cd ~/git/study ; yo ; push' \
		gha='ghdotfiles ; ghstudy ; ghfirstwebsite ; ghpomodoro ; fortune | cowsay; cd' \
		gldotfiles='cd ~/git/dotfiles ; pull' \
		glstudy='cd ~/git/study ; pull' \
		glfirstwebsite='cd ~/git/firstwebsite ; pull' \
		glpomodoro='cd ~/git/pomodoro ; pull' \
		gla='gldotfiles ; glstudy ; glfirstwebsite ; glpomodoro ; cd ; cowthink -s "git pull all done"'
###git###

###firefox tab###
alias f='firefox' \
		ft='firefox -new-tab' \
		tab_youtube_subsriptions='ft "https://www.youtube.com/feed/subscriptions"' \
		tab_pocket='ft "https://app.getpocket.com/"' \
		tab_pomodoro='ft "https://youtu.be/1znjHDiqBk8?t=1"' \
		tab_github='ft https://github.com/nicholaspham2311' 

alias tab_music_happy='ft "https://www.youtube.com/watch?v=ru0K8uYEZWw&list=RDQMDUPdPTv_LL4&start_radio=1"' \
		tab_music_anime='ft "https://www.youtube.com/watch?v=CaksNlNniis&list=PL8lZieNFgOdmrNGTqwjqYJpJ_2nw_O_M2"' \
		tab_music_chill='ft https://youtu.be/hHW1oY26kxQ' \
		tab_music_rapvn='ft "https://www.youtube.com/watch?v=r4Dypit7UCI&list=RDr4Dypit7UCI&start_radio=1"'

alias tab_anime='ft "https://www9.gogoanime.io/"' \
		tab_kdrama='ft "https://www.dramacool9.co/category/drama/?country=korean"' \
		tab_fun='tab_anime ; tab_kdrama'

alias tab_toidicodedao='ft "https://toidicodedao.com/"' \
		tab_thefullsnack='ft "https://thefullsnack.com/"' \
		tab_codeaholicguy='ft "https://codeaholicguy.com/"' \
		tab_thai='ft "https://vnhacker.blogspot.com/"' \
		tab_blogs='tab_toidicodedao ; tab_thefullsnack ; tab_codeaholicguy ; tab_thai'
###fire tab###

###mode###
alias work='cowthink -s "." ; tab_music_chill ; tab_pomodoro ; gla ; gha' \
		hola='cowthink -s "hola hola" ; tab_fun ; tab_youtube_subsriptions ; tab_blogs ; tab_pocket ; tab_music_rapvn ; rem ; gla ; gha'
###mode###
