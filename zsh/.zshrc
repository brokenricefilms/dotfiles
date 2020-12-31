# tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

setopt nobeep

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
WORDCHARS=${WORDCHARS//\/[&.;]}

autoload -U colors && colors
eval "$(starship init zsh)"
# PROMPT=" %F{blue}%~%f %F{red}❯%f%F{yellow}❯%f%F{green}❯%f "

setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
            echo -ne '\e[1 q'
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
                    echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select
zle-line-init() {
zle -K viins
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

autoload -Uz compinit
compinit

light () {
    echo "source ~/git/dotfiles/zsh/functions/lightFzf.zsh" > ~/git/dotfiles/zsh/themeFzf.zsh
    echo "
set background=light
colorscheme PaperColor" > ~/git/dotfiles/nvim/darkOrLight.vim
    echo "include ./paper.conf" > ~/git/dotfiles/kitty/theme.conf
    echo "--theme=\"GitHub\"" > ~/git/dotfiles/bat/config
}

dark () {
    echo "source ~/git/dotfiles/zsh/functions/darkFzf.zsh" >  ~/git/dotfiles/zsh/themeFzf.zsh
    echo "
set background=dark
colorscheme gruvbox-material" > ~/git/dotfiles/nvim/darkOrLight.vim
    echo "include ./gruvbox-dark.conf" > ~/git/dotfiles/kitty/theme.conf
    echo "--theme=\"gruvbox\"" > ~/git/dotfiles/bat/config
}

mk () {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "\`$1' already exists"
        cd $1
    else
        mkdir -p $1 && cd $1
    fi
}

bmi () {
    bash ~/git/dotfiles/zsh/functions/bmi.py
}

u () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1                          ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

24-bit-color () {
    bash ~/git/dotfiles/zsh/functions/24-bit-color.sh
}

print256colours () {
    bash ~/git/dotfiles/zsh/functions/print256colours.sh
}

showTrueColor () {
    bash ~/git/dotfiles/zsh/functions/showTrueColor.sh
}

dl () {
    cd ~/Downloads
    aria2c $argv
    ls -lah ~/Downloads
    cd -
}

run () {
    if ls $argv | grep ".cpp"
    then
        g++ $argv
        ./a.out
        rm a.out
    elif ls $argv | grep ".c"
    then
        gcc $argv
        ./a.out
        rm a.out
    fi
}

cpppro () {
    mkdir $argv
    cd $argv
    cp -r ~/.config/nvim/stuff/cpppro/* .
    nvim -O *
}

runcpp() {
    g++ *.cpp
    ./a.out
    rm a.out
}

r () {
    while true
    do
        $argv
        sleep 1
    done
}

SERVER_IP () {
    hostname -I
}

se () {
    browser-sync start --server --files . --no-notify --host SERVER_IP --port 9000
}

########################################################################

set -U EDITOR nvim
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$HOME/.npm/bin:$PATH"

# alias l='ls -lha'
alias l='clear ; exa -al --color=always --group-directories-first'
alias ls='clear ; exa -al --color=always --group-directories-first'
alias sl='clear ; exa -al --color=always --group-directories-first'
alias la='clear ; exa -a --color=always --group-directories-first'
alias l.='clear ; exa -a | egrep "^\."'
alias ll='clear ; exa -l --color=always --group-directories-first'
alias lt='clear ; exa -aT --color=always --group-directories-first'

alias cpf='xclip -sel clip'
alias re='source ~/git/dotfiles/zsh/.zshrc ; tmux source-file ~/.tmux.conf'
alias h='htop'
alias e='exit'
alias :q='exit'
alias q='exit'
alias p='ipython3'
alias rbn='sudo reboot now'
alias sdn='sudo shutdown now'
alias ka='killall'
alias v='nvim'
alias o='xdg-open'
alias 777='chmod -R 777'
alias x='chmod +x'
alias f='fd . -H | grep --colour=always'
alias n='nnn -de'
alias colorPicker='zenity --color-selection'
alias cat='bat'

# music stuff
alias m='tmux new-window ; mpv --shuffle ~/Music/*'

# ubuntu apt
# alias ins='sudo apt install -y'
# alias uins='sudo apt remove -y'

# fedora dnf
# alias ins='sudo dnf install -y'
# alias uins='sudo dnf remove -y'

# arch
alias ins='sudo pacman -S --noconfirm'
alias ins2='yay -S --noconfirm'
alias uins='sudo pacman -Rs --noconfirm'

alias ide='tmux split-window -v -p 20 ; tmux split-window -h -p 75 ; tmux last-pane ; nvim'
# alias ide='tmux split-window -h -p 30 ; tmux split-window -v -p 75 ; tmux last-pane ; nvim'
alias qa='tmux kill-session -a ; cowsay "All session deleted" ; tmux ls'

alias ..='cd .. ; clear ; l'
alias ...='cd .. ; cd .. ; cd .. ; clear ; l'
alias dow='cd ~/Downloads ; clear ; l'
alias doc='cd ~/Documents ; clear ; l'

alias yt='youtube-dl --add-metadata -i'
alias yta='yt -x --audio-format mp3'

alias t='trash'
alias tdl='trash ~/Downloads/*'

alias vi='cd ~/ ; nvim -o $(fzf)'
export FZF_DEFAULT_COMMAND='fd -H --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


c () {
    local dir
    dir=$(find ~ -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
            clear
            la
}

    alias yo='git add -A ; git commit -m "$(curl -s whatthecommit.com/index.txt)"'
    alias sta='git status'
    alias add='git add'
    alias push="git push"
    alias pull="git pull"
    alias clone='git clone'
    alias commit='git commit -m'
    alias prettier='prettier --write .'
    alias ok='yo ; push'
    alias okp='prettier ; yo ; push '

ghdotfiles () {
    crontab -l > ~/git/dotfiles/crontab/crontabConfig
    dconf dump /org/gnome/desktop/wm/keybindings/ > ~/git/dotfiles/keybindings.dconf
    dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/git/dotfiles/gnome-terminal-profiles.dconf
    cd ~/git/dotfiles/
    okp ; cd -
}

alias ghcalculatorOnIOS='cd ~/git/calculatorOnIOS ; okp ; cd -'
alias ghdataLab='cd ~/git/dataLab ; okp ; cd -'
alias ghfour-card-feature-section='cd ~/git/four-card-feature-section ; okp ; cd -'
alias ghFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; okp ; cd -'
alias ghimg='cd ~/git/img ; okp ; cd -'
alias ghlazyscript='cd ~/git/lazyscript ; okp ; cd -'
alias ghlinux_setup='cd ~/git/linux_setup ; okp ; cd -'
alias ghok='cd ~/git/ok ; okp ; cd -'
alias ghtermuxSetup='cd ~/git/termuxSetup ; okp ; cd -'
alias ghtheNewsTimes='cd ~/git/theNewsTimes ; okp ; cd -'
alias ghthuanpham2311='cd ~/git/thuanpham2311 ; okp ; cd -'
alias ghvimium_dark_theme='cd ~/git/vimium_dark_theme ; okp ; cd -'
alias ghwindowsSetup='cd ~/git/windowsSetup ; okp ; cd -'
alias ghstuDarkTheme='cd ~/git/stuDarkTheme ; okp ; cd -'
alias ghcssbattle='cd ~/git/cssbattle ; okp ; cd -'

gha () {
    cowsay "git push lazyscript" ; ghlazyscript
    cowsay "git push dotfiles" ; ghdotfiles
    cowsay "git push linux_setup" ; ghlinux_setup
    cowsay "git push vimium-dark-theme" ; ghvimium_dark_theme
    cowsay "git push FreeCodeCampProject" ; ghFreeCodeCampProject
    cowsay "git push ok" ; ghok
    cowsay "git push dataLab" ; ghdataLab
    cowsay "git push windowsSetup" ; ghwindowsSetup
    cowsay "git push termuxSetup" ; ghtermuxSetup
    cowsay "git push img" ; ghimg
    cowsay "git push thuanpham2311" ; ghthuanpham2311
    cowsay "git push theNewsTimes" ; ghtheNewsTimes
    cowsay "git push four-card-feature-section" ; ghfour-card-feature-section
    cowsay "git push calculatorOnIOS" ; ghcalculatorOnIOS
    cowsay "git push stuDarkTheme" ; ghstuDarkTheme
    cowsay "git push cssbattle" ; ghcssbattle
    cowsay "D O N E"
}

alias glcalculatorOnIOS='cd ~/git/calculatorOnIOS ; pull ; cd -'
alias gldataLab='cd ~/git/dataLab ; pull ; cd -'
alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias glfour-card-feature-section='cd ~/git/four-card-feature-section ; pull ; cd -'
alias glFreeCodeCampProject='cd ~/git/FreeCodeCampProject ; pull ; cd -'
alias glimg='cd ~/git/img ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gllinux_setup='cd ~/git/linux_setup ; pull ; cd -'
alias glok='cd ~/git/ok ; pull ; cd -'
alias gltermuxSetup='cd ~/git/termuxSetup ;  pull ; cd -'
alias gltheNewsTimes='cd ~/git/theNewsTimes ; pull ; cd -'
alias glthuanpham2311='cd ~/git/thuanpham2311 ; pull ; cd -'
alias glvimium_dark_theme='cd ~/git/vimium_dark_theme ; pull ; cd -'
alias glwindowsSetup='cd ~/git/windowsSetup ;  pull ; cd -'
alias glstuDarkTheme='cd ~/git/stuDarkTheme ;  pull ; cd -'
alias glcssbattle='cd ~/git/cssbattle ; pull ; cd -'

gla () {
    cowsay "git pull lazyscript" ; gllazyscript
    cowsay "git pull dotfiles" ; gldotfiles
    cowsay "git pull linux_setup" ; gllinux_setup
    cowsay "git pull vimium-dark-theme" ; glvimium_dark_theme
    cowsay "git pull FreeCodeCampProject" ; glFreeCodeCampProject
    cowsay "git pull ok" ; glok
    cowsay "git pull dataLab" ; gldataLab
    cowsay "git pull windowsSetup" ; glwindowsSetup
    cowsay "git pull termuxSetup" ; gltermuxSetup
    cowsay "git pull img" ; glimg
    cowsay "git pull thuanpham2311" ; glthuanpham2311
    cowsay "git pull theNewsTimes" ; gltheNewsTimes
    cowsay "git pull four-card-feature-section" ; glfour-card-feature-section
    cowsay "git pull calculatorOnIOS" ; glcalculatorOnIOS
    cowsay "git pull stuDarkTheme" ; glstuDarkTheme
    cowsay "git pull cssbattle" ; glcssbattle
    cowsay "D O N E"
}

alias browser='brave-beta'
# alias browser='google-chrome'
# alias browser='firefox'
alias github='browser --new-window "https://github.com/thuanpham2311"'

alias browser_fb='browser https://facebook.com'
alias browser_mes='browser "https://www.facebook.com/messages/t"'
alias browser_mail0='browser "https://mail.google.com/mail/u/0/#inbox"'
alias browser_mail1='browser "https://mail.google.com/mail/u/1/#inbox"'
alias browser_mail2='browser "https://mail.google.com/mail/u/2/#inbox"'
alias browser_stu='browser "http://stu.edu.vn/"'
alias browser_stu2='browser "http://stu.edu.vn/vi/cat/95/nghien-cuu-khoa-hoc.html"'
alias browser_youtube_subsriptions='browser "https://www.youtube.com/feed/subscriptions"'
alias browser_anime='browser "https://animedao.to/"'
alias browser_kdrama='browser "http://www.phimhanz.net/"'
alias browser_feedly='browser "https://feedly.com/i/collection/content/user/0d89157e-ce7d-4b2c-a2d6-98826f1e5089/category/global.all"'

## search
function :t() {
browser --new-window "https://translate.google.com/?source=osdd#auto|auto|$argv"
}

function :y() {
browser --new-window "https://www.youtube.com/results?search_query=$argv"
}

function :d() {
browser --new-window "https://duckduckgo.com/?q=$argv"
}

function :gm() {
browser --new-window "https://www.google.com/maps?q=$argv"
}

function :g() {
browser --new-window "https://www.google.com/search?q=$argv"
}

function :gh() {
browser --new-window "https://github.com/search?q=$argv"
}

function :f() {
browser --new-window "https://www.facebook.com/search?q=$argv"
}

browser_daily () {
    cowsay "GET.SHIT.DONE"
    browser_feedly
    browser_mail0
    browser_mail1
    browser_fb
    browser_stu
}

hi () {
    browser_daily
    # wait for browser loading website
    # cuz maybe can effect system resource
    sleep 20
    rem
}

rem () {
    nvim -c "PlugUpdate | qa"
    npm update -g
    sudo gem update neovim
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
    tldr --update

    # arch base
    sudo pacman -Syu --noconfirm
    yay -Sua --noconfirm

    # debian base (ubuntu, kali,...)
    # sudo apt update
    # sudo apt upgrade -y
    # sudo apt autoremove -y
    # sudo apt autoclean

    # rehat base (fedora)
    # sudo dnf update -y
    # sudo dnf autoremove -y

    cd ~ ; clear ; neofetch
}

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/git/dotfiles/zsh/themeFzf.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
