#!/usr/bin/env bash

if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
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

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

eval "$(gh completion -s bash)"

source $HOME/.local/share/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
source $HOME/.local/share/completion.bash
source $HOME/.local/share/key-bindings.bash

eval "$(starship init bash)"

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

alias fzf_down='fzf --height 50% --min-height 20 --reverse'

alias reload='source ~/.bashrc ; tmux source-file ~/.tmux.conf'
alias t='trash'
alias q='exit'
alias owa='code .'
alias x='chmod +x'
alias st='git status -sb'
alias cat='bat --theme=GitHub'
alias vi='nvim'
alias vim='nvim'

alias ..='cd .. ; l'
alias ...='cd .. ; cd .. ; l'
alias dow='cd ~/Downloads ; l'
alias doc='cd ~/Documents ; l'
alias tmp='cd /tmp'
alias changeDirToUsbFolder='cd /run/media/master/ ; ls'

alias ls='exa --long --all --icons'
alias l='ls'
alias sl='ls'
alias ll='ls'
alias la='exa --all --icons'
alias al='la'

alias ins='sudo dnf install -y'
alias uins='sudo dnf remove -y'

browser_daily() {
  xdg-open "https://feeder.co/reader"
  xdg-open "https://mail.google.com/mail/u/0/#inbox"
  xdg-open "https://mail.google.com/mail/u/1/#inbox"
  xdg-open "https://www.youtube.com/feed/subscriptions"
}

# TODO: update_music checking playlist to update change
sync_music() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    local music_dir
    music_dir=$HOME/Music/music_i_like/

    rm -rf $music_dir
    mkdir -p $music_dir
    cd $music_dir

    yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "https://www.youtube.com/playlist?list=PLcazFfFZIFPld2xu_nAgmbgj5QldQOpUB"

    cd -
  else
    echo "Check your internet connection and try again"
  fi
}

update() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    CURRENT_DIR=$(pwd)

    dnf makecache
    deno upgrade
    asdf update
    asdf plugin update --all
    tldr --update
    ~/.tmux/plugins/tpm/bin/update_plugins all

    cd ~/.local/share/
    wget https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh
    wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash
    wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash

    cd $CURRENT_DIR
  else
    echo "Check your internet connection for online update and try again"
  fi
}

hi() {
  browser_daily
}

make_dir() {
  if [ -z "$1" ]; then
    echo -n "👉 Enter a directory name"
    read dirName
    mkdir -p $dirName
    cd $dirName
  elif [ -d $1 ]; then
    echo -e "👉 $1 already exists"
    cd $1
  else
    mkdir -p $1
    cd $1
  fi
}
alias mk="make_dir"

SERVER_IP() {
  hostname -I
}

ser() {
  browser-sync start --server --files . --no-notify --host SERVER_IP --port 9000
}

change_dir_to_git_root() {
  cd $(git rev-parse --show-toplevel)
  ls
}
alias cdr='change_dir_to_git_root'

yo() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
    if [[ $(git status --porcelain) ]]; then
      git diff
      git status -sb
      echo -e '\n\e[1m\e[36mCommmit message\e[0m'
      echo -en '\e[1m\e[32m❯\e[0m '
      read -r commit_message
      git add --all
      git commit -m "$commit_message"
    else
      echo "😏 No change"
    fi
  fi
}

auto_commit() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
    if [[ $(git status --porcelain) ]]; then
      git add --all
      git commit -m "[👌Auto commit]"
      git push
    else
      echo "😏 No change"
    fi
  fi
}
alias ok='auto_commit'

clone_change_dir_to_repo() {
  gitDir="$(basename "$1" .git)"
  gitDirResolved=${2:-$gitDir}
  git clone "$@" && cd "$gitDirResolved"
}
alias gc='clone_change_dir_to_repo'

sync_repo() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    CURRENT_DIR=$(pwd)

    repo=(
      ~/repos/thuanowa/ok
      ~/repos/thuanowa/obs-studio
      ~/repos/thuanowa/note
    )

    for i in ${repo[*]}; do
      cd "$i"
      echo -e "\e[1m\e[36m$(pwd)\e[0m"
      ok
    done

    cd $CURRENT_DIR
  else
    echo "Check your internet connection and try again"
  fi
}

update_repo() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    CURRENT_DIR=$(pwd)

    repo_main=(
      ~/repos/thuanowa/*
      ~/repos/OngDev/*
      ~/repos/isekaiSystem/*
      ~/repos/from-design-to-website/*
      ~/repos/when-will-i-die/*
    )

    repo_extra=(
      ~/repos/rose-pine/surfingkeys/
      ~/repos/OngDev/.github/
      ~/repos/isekaiSystem/.github/
      ~/dotfiles/
    )

    repos=("${repo_main[@]}" "${repo_extra[@]}")

    for i in ${repos[*]}; do
      cd "$i"
      echo -e "\e[1m\e[36m$(pwd)\e[0m"
      git pull
      git push
    done

    cd $CURRENT_DIR
  else
    echo "Check your internet connection and try again"
  fi
}

clone_all_users_repo() {
  CURRENT_DIR=$(pwd)

  REPOS_PATH=~/repos/
  mkdir $REPOS_PATH 2>/dev/null
  cd $REPOS_PATH

  github_username=(
    thuanowa
    OngDev
    isekaiSystem
    from-design-to-website
    when-will-i-die
  )

  for i in ${github_username[*]}; do
    mkdir "$i" 2>/dev/null
    cd "$i"
    echo -e "\e[1m\e[36m$i\e[0m"

    gh repo list "$i" --limit 10000 | awk '{print $1}' | while read -r repo; do
      gh repo clone "$repo"
    done

    cd $REPOS_PATH
  done

  cd $CURRENT_DIR
}

emoji() {
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
alias ej="emoji"

find_file_edit_in_nvim() {
  if [ -z "$1" ]; then
    local file
    file=$(fd . -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')

    if [ -n "$file" ]; then
      nvim "$file"
    fi
  else
    nvim "$1"
  fi
}
alias f='find_file_edit_in_nvim'
alias e='find_file_edit_in_nvim'
alias v='find_file_edit_in_nvim'

open_file() {
  local object
  object=$(fd . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')
  if [ -n "$object" ]; then
    xdg-open "$object"
  fi
}
alias o='open_file'

change_dir() {
  local dir
  dir=$1

  fzf_dir() {
    dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r tree -C -L 2')
    cd "$dir"
  }

  if [[ -n $dir ]]; then
    cd $dir &>/dev/null
    ERROR=$?

    if [[ ERROR -eq 1 ]]; then
      echo "\"$1\" directory does not exist"
      fzf_dir
    fi
  else
    fzf_dir
  fi

  ls
}
alias c='change_dir'

kill_all_unname_tmux_session() {
  cd /tmp/
  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
  chmod +x killAllUnnameTmuxSessionOutput.sh
  ./killAllUnnameTmuxSessionOutput.sh
  cd -
}

alias clear='kill_all_unname_tmux_session ; clear -x'
alias cler='clear'
alias clea='clear'

yt() {
  yt-dlp -f bestvideo+bestaudio -o "%(title)s.%(ext)s" "$1"
}

yta() {
  yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $1
}

alias play_music='mpv --shuffle --loop-playlist *'
alias m='play_music'
