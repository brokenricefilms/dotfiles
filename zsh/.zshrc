# Set up the prompt
autoload -U colors && colors
PROMPT=" %F{blue}%~%f %F{red}❯%f%F{yellow}❯%f%F{green}❯%f "

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# # Change cursor shape for different vi modes.
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
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use modern completion system
autoload -Uz compinit
compinit

mk () {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "\`$1' already exists"
        cd $1
    else
        mkdir $1 && cd $1
    fi
}

BMI () {
    ~/.config/zsh/functions/BMI.py
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

tv () {
    pactl set-card-profile 0 output:hdmi-stereo
    xrandr --output LVDS-1 --off --output VGA-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-2 --off --output HDMI-3 --off --output DP-2 --off --output DP-3 --off
}

24-bit-color () {
bash ~/.config/zsh/functions/24-bit-color.sh
}

print256colours () {
    bash ~/.config/zsh/functions/print256colours.sh
}

showTrueColor () {
    bash ~/.config/zsh/functions/showTrueColor.sh
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

runcpp () {
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

# lazy code
# alias l='ls -lha'
# ls, tree more color
alias l='clear ; exa -al --color=always --group-directories-first'
alias ls='clear ; exa -al --color=always --group-directories-first'
alias sl='clear ; exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias l.='exa -a | egrep "^\."'
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

alias cpf='xclip -sel clip'
alias re='source ~/.config/zsh/.zshrc ; tmux source-file ~/.tmux.conf'
alias tmuxr='tmux source ~/.tmux.conf'
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
alias f='fdfind . -H | grep --colour=always'
alias vifm='vifm .'
alias m='tmux new-window ; mpv --shuffle ~/Music/*'

# ubuntu apt
alias ins='sudo apt install -y'
alias uins='sudo apt remove -y'

# fedora dnf
# alias ins='sudo dnf install -y'
# alias uins='sudo dnf remove -y'

# arch
# alias ins='sudo pacman -S --noconfirm'
# alias uins='sudo pacman -Rs --noconfirm'

# tmux
# alias ide='c ; tmux split-window -v -p 20 ; tmux split-window -h -p 75 ; tmux last-pane ; nvim'
alias ide='c ; tmux split-window -h -p 30 ; tmux split-window -v -p 75 ; tmux last-pane ; nvim'
alias qa='tmux kill-session -a ; cowsay "All session deleted" ; tmux ls'

# cd
alias ..='cd .. ; clear ; l'
alias ...='cd .. ; cd .. ; cd .. ; clear ; l'
alias dow='cd ~/Downloads ; clear ; l'
alias doc='cd ~/Documents ; clear ; l'

# youtube-dl
alias yt='youtube-dl --add-metadata -i'
alias yta='yt -x --audio-format mp3'

# trash-cli
alias t='trash'
alias tdl='trash ~/Downloads/*'

# fzf
alias cf='cd ~/.config/ ; nvim -o $(fzf)'
export FZF_DEFAULT_COMMAND='fdfind -H --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# paper color
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f
# --color=fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f
# --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
# --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'

# gruvbox dark
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

c () {
    local dir
    dir=$(find ~ -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
            clear
            la
        }

# git
alias yo='git add -A ; git commit -m "$(curl -s whatthecommit.com/index.txt)"'
alias sta='git status'
alias push="git push"
alias pull="git pull" 
alias clone='git clone'
alias commit='git commit -m'
alias prettier='prettier --write .'
alias ok='yo ; push'
alias okp='prettier ; yo ; push '

ghdotfiles () {
    cp ~/.config/tmux/.tmux.conf ~/git/dotfiles/tmux/

    cp -r ~/.config/fish/* ~/git/dotfiles/fish/

    cp -r ~/.config/vifm/* ~/git/dotfiles/vifm

    cp ~/.config/zsh/.zshrc ~/git/dotfiles/zsh/
    cp -r ~/.config/zsh/functions ~/git/dotfiles/zsh/
    cp ~/.config/zsh/functions/crontab* ~/git/dotfiles/crontab/
    crontab -l > ~/git/dotfiles/crontab/crontabConfig

    # nvim
    cp ~/.config/nvim/coc-settings.json ~/git/dotfiles/nvim/
    cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim/
    cp -r ~/.config/nvim/coc-settings.json ~/git/dotfiles/nvim/
    cp -r ~/.config/nvim/stuff ~/git/dotfiles/nvim/
    # I don't want you see my undoir, try hack me :D
    cp -r ~/.config/nvim/undodir ~/git/ok/

    cp -r ~/.config/kitty/ ~/git/dotfiles

    cp ~/.gitconfig  ~/git/dotfiles/git/
    cp ~/.selected_editor ~/git/dotfiles
    cp -r ~/.fonts ~/git/dotfiles/
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
alias ghok='cd ~/git/ok ; ok ; cd -'
alias ghtermuxSetup='cd ~/git/termuxSetup ; okp ; cd -'
alias ghtheNewsTimes='cd ~/git/theNewsTimes ; okp ; cd -'
alias ghthuanpham2311='cd ~/git/thuanpham2311 ; okp ; cd -'
alias ghvimium_dark_theme='cd ~/git/vimium_dark_theme ; okp ; cd -'
alias ghwindowsSetup='cd ~/git/windowsSetup ; okp ; cd -'

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
    cowsay "D O N E"
}

# browser
alias browser='brave-browser'
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

browser_daily () {
    cowsay "GET.SHIT.DONE"
    browser_youtube_subsriptions
    browser_mail0
    browser_mail1
    browser_fb
    browser_stu
}

# mode
hi () {
    browser_daily
    # wait for browser loading website
    # cuz maybe can effect system resource
    sleep 30
    rem
}

# ubuntu
rem () {
    nvim -c "PlugUpdate | qa"
    sudo pip3 install --upgrade pynvim
    sudo npm -g install neovim
    sudo gem update neovim

    sudo npm -g install npm
    tldr --update

    # debian base (ubuntu, kali,...)
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean

    # rehat base (fedora)
    # sudo dnf update -y 
    # sudo dnf autoremove -y 
    # flatpak update -y

    # arch base
    # sudo pacman -Syyu --noconfirm

    cd ~ ; clear ; neofetch
}

data () {
    cd ~/git/dataLab/
    tmux split-window -h -p 50
    jupyter lab
}

# fzf
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/fzf/completion.zsh 2>/dev/null
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
