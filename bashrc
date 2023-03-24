#!/usr/bin/env bash

if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session && exit
fi

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/gems/bin:$PATH"

export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin

export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

export PATH="$HOME/.npm/bin:$PATH"
export PNPM_HOME="/home/master/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export GEM_HOME="$HOME/gems"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="/home/master/.local/share/fnm:$PATH"

export VISUAL="nvim"
export EDITOR=$VISUAL
export MANPAGER="nvim +Man!"
export EDITOR="nvim"

export FZF_DEFAULT_COMMAND="fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=
shopt -s histappend
shopt -s checkwinsize

bind 'set completion-ignore-case on'

set -o vi

stty time 0

alias bat='bat --theme=GitHub'
alias ser='browser_sync_start_server'
alias tree='exa --tree --icons'
alias x='chmod +x'
alias q='exit'
alias c='cd $(git rev-parse --show-toplevel) ; code .'
alias fzf_down='fzf --reverse --preview-window=top'
alias m='fzf_music'
alias o='fzf_open'
alias g='fzf_rg'

alias 4l=' tmux split-window -d \; split-window -d \; split-window -d \; select-layout even-horizontal'
alias 4-=' tmux split-window -d \; split-window -d \; split-window -d \; select-layout even-vertical'
alias 3l=' tmux split-window -d \; split-window -d \; select-layout even-horizontal'
alias 3-=' tmux split-window -d \; split-window -d \; select-layout even-vertical'

alias 4i=' tmux split-window -d \; split-window -d \; split-window -d \; select-layout main-vertical'
alias 3i=' tmux split-window -d \; split-window -d \; select-layout main-vertical'

alias r='rm -rf'
alias rr='sudo rm -rf'
alias t='trash'

alias d='fzf_change_directory'
alias dd='cd $HOME; fzf_change_directory'

alias e='fzf_edit_file'
alias ee='cd $HOME; fzf_edit_file'
alias ej='fzf_emoji'
alias E='fzf_sudo_edit'

alias f='dnf search'
alias i='sudo dnf install -y'
alias u='sudo dnf remove -y'

alias a='git add -A; git commit'
alias aa='git add -A; git commit -m "auto commit"'
alias am='git add -A; git commit --amend --no-edit'
alias cdr='change_directory_to_git_root'
alias gc='clone_change_dir_to_repo'
alias l='git pull'
alias ll='git pull -f'
alias p='git push'
alias pp='git push -f'
alias s='git status -sb'
alias w='fzf_git_worktree_change_dir'
alias ww='fzf_git_worktree_remove'

alias ...='cd .. ; cd .. ; ls'
alias ..='cd .. ; ls'
alias doc='cd ~/Documents ; ls'
alias dow='cd ~/Downloads ; ls'
alias la='exa --all --icons'
alias ls='exa --long --all --icons'
alias tmp='cd /tmp'

function browser_daily() {
  xdg-open "https://www.inoreader.com/all_articles"
  xdg-open "https://www.youtube.com/feed/subscriptions"
  xdg-open "https://github.com"
}

function download_audio() {
  yt-dlp -f bestaudio --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$1"
}

# TODO: checking playlist list to sync change
function sync_music() {
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
  mkdir b_ray
  cd b_ray
  download_audio "https://l.thuanowa.com/music-b-ray"

  cd $MUSIC_DIR
  mkdir den_vau
  cd den_vau
  download_audio "https://l.thuanowa.com/music-den-vau"

  cd $MUSIC_DIR
  mkdir two_feet
  cd two_feet
  download_audio "https://l.thuanowa.com/music-two-feet"

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
}

function update() {
  CURRENT_DIR=$(pwd)

  sudo dnf update -y
  pnpm add -g pnpm
  tldr --update
  ~/.tmux/plugins/tpm/bin/update_plugins all

  cd ~/.local/share/
  wget https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh
  wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
  wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash

  cd $CURRENT_DIR
}

function browser_sync_start_server() {
  SERVER_IP=$(hostname -I)
  browser-sync start --server --files . --no-notify --host "$SERVER_IP" --port 9000
}

function change_directory_to_git_root() {
  cd $(git rev-parse --show-toplevel)
  ls
}

function clone_change_dir_to_repo() {
  GIT_DIR="$(basename "$1" .git)"
  GIT_DIR_RESOLVED=${2:-$GIT_DIR}
  git clone "$@" && cd "$GIT_DIR_RESOLVED"
}

function fzf_emoji() {
  default() {
    emoji-fzf preview --prepend | fzf | awk '{ print $1 }' | tr -d "\n" | wl-copy
  }

  if hash emoji-fzf 2>/dev/null; then
    default
  else
    pip install emoji-fzf
    default
  fi
}

function fzf_edit_file() {
  if [ -z "$1" ]; then
    FILE=$(fd --hidden --type file . --exclude .git --exclude node_modules | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:501 {}')

    if [ -n "$FILE" ]; then
      nvim "$FILE"
    fi
  else
    nvim "$1"
  fi
}

function fzf_sudo_edit() {
  if [ -z "$1" ]; then
    FILE=$(fd --hidden --type file . --exclude .git --exclude node_modules | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:501 {}')

    if [ -n "$FILE" ]; then
      sudoedit "$FILE"
    fi
  else
    sudoedit "$1"
  fi
}

function fzf_git_worktree_change_dir() {
  if [ -z "$1" ]; then
    WORKTREE=$(git worktree list | fzf_down | awk '{print $1}')

    if [ -n "$WORKTREE" ]; then
      cd $WORKTREE
    fi
  else
    DEFAULT_GIT_FOLDER=$(git worktree list | head --lines 1 | awk '{print $1}')

    mkdir $DEFAULT_GIT_FOLDER/.worktrees

    git worktree add $DEFAULT_GIT_FOLDER/.worktrees/$1

    cd $DEFAULT_GIT_FOLDER/.worktrees/$1

    git branch $1
    git checkout $1
  fi
}

function fzf_git_worktree_remove() {
  WORKTREE=$(git worktree list | fzf_down | awk '{print $1}')
  DEFAULT_GIT_FOLDER=$(git worktree list | head --lines 1 | awk '{print $1}')

  git worktree remove $WORKTREE --force &>/dev/null
  cd $DEFAULT_GIT_FOLDER
}

function fzf_open() {
  if [ -z "$1" ]; then
    FILE=$(fd --hidden --type file . --exclude .git --exclude node_modules | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')

    if [ -n "$FILE" ]; then
      xdg-open "$FILE"
    fi
  else
    xdg-open "$1"
  fi
}

function fzf_change_directory() {
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

function fzf_rg() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf_down --ansi --color "hl:-1:underline,hl+:-1:underline:reverse" --delimiter : --preview 'bat --theme=GitHub --color=always {1} --highlight-line {2}' --bind 'enter:become($EDITOR {1} +{2})'
}

function fzf_tldr() {
  tldr --list | sed "s/'//g" | sed "s/,//g" | sed "s/ /\n/g" | sed "s/]//g" | sed "s/\[//g" | fzf_down --preview "tldr {1}"
}

function tl() {
  if [ -z "$1" ]; then
    COMMAND=$(fzf_tldr)
    tldr $COMMAND
  else
    tldr "$1"
  fi
}

function fzf_music() {
  CURRENT_DIR=$(pwd)

  cd ~/Music/

  PLAYLIST=$(fd --type directory . --exclude node_modules --exclude go | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa --tree --icons')

  if [ -n "$PLAYLIST" ]; then
    cd $PLAYLIST
    mpv --loop-playlist --shuffle *
    cd $CURRENT_DIR
  else
    cd $CURRENT_DIR

  fi
}

function reload() {
  source ~/.bashrc

  tmux source ~/.tmux.conf
}

function reload_touchcursor() {
  cp ~/dotfiles/touchcursor.conf ~/.config/touchcursor/
  systemctl --user restart touchcursor.service
}

source $HOME/.local/share/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
source $HOME/.local/share/completion.bash
source $HOME/.local/share/key-bindings.bash

eval "$(fnm env --use-on-cd)"
eval "$(starship init bash)"
