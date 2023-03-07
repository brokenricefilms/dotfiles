#!/usr/bin/env bash

if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session && exit
fi

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/gems/bin:$PATH"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/dotfiles/personal_bin/
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.npm/bin:$PATH"
export PATH="$(yarn global bin):$PATH"
export GEM_HOME="$HOME/gems"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export VISUAL="nvim"
export EDITOR=$VISUAL
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"
export PNPM_HOME="/home/master/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=
shopt -s histappend
shopt -s checkwinsize

bind 'set completion-ignore-case on'

set -o vi

stty time 0

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
  . /usr/share/bash-completion/bash_completion

source $HOME/.local/share/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
source $HOME/.local/share/completion.bash
source $HOME/.local/share/key-bindings.bash

network_status() {
  ping -c 1 google.com
  local NETWORK_STATUS=$?
  local NETWORK_ERROR_CODE=2

  if [[ "$NETWORK_STATUS" == "$NETWORK_ERROR_CODE" ]]; then
    NETWORK="offline"
  else
    NETWORK="online"
  fi
}

alias ...='cd .. ; cd .. ; ls'
alias ..='cd .. ; ls'
alias a='git add -A; git commit'
alias aa='git add -A; git commit -m "auto commit"'
alias c='clear -x'
alias cdr='change_directory_to_git_root'
alias changeDirToUsbFolder='cd /run/media/master/ ; ls'
alias d='fzf_change_directory'
alias dd='cd $HOME; fzf_change_directory'
alias doc='cd ~/Documents ; ls'
alias dow='cd ~/Downloads ; ls'
alias e='fzf_edit_file'
alias ee='cd $HOME; fzf_edit_file'
alias ej='fzf_emoji'
alias f='yay -Ss'
alias fzf_down='fzf --height 50% --min-height 20 --reverse'
alias gc='clone_change_dir_to_repo'
alias h='htop'
alias i='yay -S --noconfirm'
alias l='git pull'
alias ll='git pull -f'
alias ls='exa --long --all --icons'
alias la='exa --all --icons'
alias o='fzf_open'
alias p='git push'
alias pp='git push -f'
alias q='exit'
alias r='rm -rf'
alias rr='sudo rm -rf'
alias s='git status -sb'
alias ser='browser_sync_start_server'
alias sl='ls'
alias t='trash'
alias tmp='cd /tmp'
alias u='sudo pacman -R --noconfirm'
alias uu='yay -R --noconfirm'
alias v='fzf_sudo_edit'
alias x='chmod +x'
alias cat='bat --theme=GitHub'
alias tree='exa --tree --icons'

browser_daily() {
  xdg-open "https://www.inoreader.com/all_articles"
  xdg-open "https://www.youtube.com/feed/subscriptions"
  xdg-open "https://github.com"
}

download_audio() {
  yt-dlp -f bestaudio --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$1"
}

# TODO: update_music checking playlist to update change
sync_music() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    CURRENT_DIR=$(pwd)
    MUSIC_DIR=$HOME/Music/

    cd $MUSIC_DIR
    trash *

    mkdir joji
    cd joji
    download_audio "https://l.thuanowa.com/music-joji"

    cd $MUSIC_DIR
    mkdir billie_eilish
    cd billie_eilish
    download_audio "https://l.thuanowa.com/music-billie-eilish"

    cd $MUSIC_DIR
    mkdir lil_wuyn
    cd lil_wuyn
    download_audio "https://l.thuanowa.com/music-lil-wuyn"

    cd $MUSIC_DIR
    mkdir b_ray
    cd b_ray
    download_audio "https://l.thuanowa.com/music-b-ray"

    cd $MUSIC_DIR
    mkdir den_vau
    cd den_vau
    download_audio "https://l.thuanowa.com/music-den-vau"

    cd $MUSIC_DIR
    mkdir English
    cd English
    download_audio "https://l.thuanowa.com/music-en"

    cd $MUSIC_DIR
    mkdir Vietnamese
    cd Vietnamese
    download_audio "https://l.thuanowa.com/music-vi"

    cd $MUSIC_DIR
    mkdir Korean
    cd Korean
    download_audio "https://l.thuanowa.com/music-ko"

    cd $MUSIC_DIR
    mkdir Japanese
    cd Japanese
    download_audio "https://l.thuanowa.com/music-ja"

    cd $MUSIC_DIR
    mkdir chill_hop
    cd chill_hop
    download_audio "https://l.thuanowa.com/music-chill-hop"

    cd $CURRENT_DIR
  else
    echo "Check your internet connection and try again"
  fi
}

update() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    CURRENT_DIR=$(pwd)

    sudo pacman -Syu --noconfirm
    yay -Sua --noconfirm
    pnpm add -g pnpm
    tldr --update
    ~/.tmux/plugins/tpm/bin/update_plugins all

    cd ~/.local/share/
    wget https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh
    wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
    wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash

    cd ~/dotfiles/
    nvim --headless "+Lazy! sync" +qa
    git add nvim/lazy-lock.json
    git commit -m "chore: lazy.nvim"
    git push

    cd $CURRENT_DIR
  else
    echo "Check your internet connection for online update and try again"
  fi
}

hi() {
  browser_daily
  update
}

browser_sync_start_server() {
  SERVER_IP=$(hostname -I)
  browser-sync start --server --files . --no-notify --host "$SERVER_IP" --port 9000
}

change_directory_to_git_root() {
  cd $(git rev-parse --show-toplevel)
  ls
}

clone_change_dir_to_repo() {
  GIT_DIR="$(basename "$1" .git)"
  GIT_DIR_RESOLVED=${2:-$GIT_DIR}
  git clone "$@" && cd "$GIT_DIR_RESOLVED"
}

fzf_emoji() {
  if hash emoji-fzf 2>/dev/null; then
    emoji-fzf preview --prepend |
      fzf_down |
      awk '{ print $1 }' | tr -d "\n" | wl-copy
  else
    pip install emoji-fzf
    emoji-fzf preview --prepend |
      fzf_down |
      awk '{ print $1 }' |
      tr -d "\n" |
      wl-copy
  fi
}

fzf_edit_file() {
  if [ -z "$1" ]; then
    FILE=$(fd --hidden --type file . --exclude .git --exclude node_modules | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:501 {}')

    if [ -n "$FILE" ]; then
      nvim "$FILE"
    fi
  else
    nvim "$1"
  fi
}

fzf_open() {
  if [ -z "$1" ]; then
    FILE=$(fd --hidden --type file . --exclude .git --exclude node_modules | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')

    if [ -n "$FILE" ]; then
      xdg-open "$FILE"
    fi
  else
    xdg-open "$1"
  fi
}

fzf_change_directory() {
  if [ -z "$1" ]; then
    DIR=$1

    fzf_dir() {
      DIR=$(fd --hidden --type directory . --exclude node_modules --exclude go | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa --tree --level=2')

      cd "$DIR"
      la
    }

    if [[ -n $DIR ]]; then
      cd $DIR &>/dev/null
      ERROR=$?

      if [[ ERROR -eq 1 ]]; then
        echo "\"$1\" directory does not exist"
        fzf_dir
      fi
    else
      fzf_dir
    fi
  else
    mkdir -p "$1"
    cd "$1"
  fi
}

reload() {
  source ~/.bashrc

  tmux source ~/.tmux.conf
}

reload_touchcursor() {
  cp ~/dotfiles/touchcursor.conf ~/.config/touchcursor/
  systemctl --user restart touchcursor.service
}

eval "$(fnm env --use-on-cd)"
eval "$(starship init bash)"
