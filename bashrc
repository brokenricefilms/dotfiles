#!/usr/bin/env bash

echo_cat_rainbow() {
  e='\033'
  RESET="${e}[0m"
  BOLD="${e}[1m"
  CYAN="${e}[0;96m"
  RED="${e}[0;91m"
  YELLOW="${e}[0;93m"
  GREEN="${e}[0;92m"

  echo
  echo -en "$RED"'-_-_-_-_-_-_-_'
  echo -e "$RESET"$BOLD',------,'"$RESET"
  echo -en "$YELLOW"'_-_-_-_-_-_-_-'
  echo -e "$RESET"$BOLD'|   /\_/\\'"$RESET"
  echo -en "$GREEN"'-_-_-_-_-_-_-'
  echo -e "$RESET"$BOLD'~|__( ^ .^)'"$RESET"
  echo -en "$CYAN"'-_-_-_-_-_-_-_-'
  echo -e "$RESET"$BOLD'""  ""'"$RESET"
  echo
}

echo_cat_rainbow

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

# using alias because can add flag like:"fzf_down --preview 'cat {}'"
alias fzf_down='fzf --height 50% --min-height 20 --reverse'

alias reload='source ~/.bashrc ; tmux source-file ~/.tmux.conf'
alias ka='killall'
alias t='trash'
alias q='exit'
alias owa='code .'
alias se='sudoedit'
alias x='chmod +x'
alias dv='git diff'
alias bat='bat --theme=GitHub --color=always --style=numbers'

fzf_dnf_install() {
  local package_name=$1

  dnf_fzf() {
    local cache=$HOME/.cache/dnf_list.txt

    if test -f "$cache"; then
      package_name=$(\cat $cache | fzf_down)
    else
      dnf list | awk '{print $1}' | tail -n +4 >$cache
      package_name=$(\cat $cache | fzf_down)
    fi

    if [[ -n $package_name ]]; then
      sudo dnf install -y $package_name
    fi
  }

  if [[ -n $package_name ]]; then
    sudo dnf install -y $package_name
    ERROR=$?

    if [[ ERROR -eq 1 ]]; then
      dnf_fzf
    fi
  else
    dnf_fzf
  fi
}
alias ins='fzf_dnf_install'

dnf_fzf_remove() {
  local package_name
  package_name=$1

  dnf_fzf() {
    # cron job daily to update cache
    local cache=$HOME/.cache/dnf_list_installed.txt

    if test -f "$cache"; then
      package_name=$(\cat $cache | fzf_down)
    else
      dnf list --installed | awk '{print $1}' | tail -n +4 >$cache
      package_name=$(\cat $cache | fzf_down)
    fi

    if [[ -n $package_name ]]; then
      sudo dnf remove -y $package_name
    fi
  }

  if [[ -n $package_name ]]; then
    sudo dnf remove -y $package_name | rg "no match" &>/dev/null
    ERROR=$?

    if [[ ERROR -eq 0 ]]; then
      dnf_fzf
    else
      echo "removed $package_name"
    fi
  else
    dnf_fzf
  fi
}
alias uins='dnf_fzf_remove'

inss() {
  dnf search $1
  flatpak search $1
}

browser_daily() {
  xdg-open "https://facebook.com"
  xdg-open "https://www.youtube.com/feed/subscriptions"
  xdg-open "https://feeder.co/reader"
}

update_music() {
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

update_dnf_package() {
  dnf list | awk '{print $1}' | tail -n +4 >$HOME/.cache/dnf_list.txt
  dnf list --installed | awk '{print $1}' | tail -n +4 >$HOME/.cache/dnf_list_installed.txt
}

update() {
  network_status &>/dev/null

  if [[ "$NETWORK" == "online" ]]; then
    dnf makecache
    sudo dnf update -y
    sudo dnf upgrade -y

    update_dnf_package

    deno upgrade

    asdf update
    asdf plugin update --all

    tldr --update
    wget https://raw.githubusercontent.com/lincheney/fzf-tab-completion/master/bash/fzf-bash-completion.sh
    cd -
  else
    echo "Check your internet connection for online update and try again"
    echo "Doing offline update cache"
    update_dnf_package
  fi
}

hi() {
  browser_daily
}

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

make_dir() {
  if [ ! -n "$1" ]; then
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

auto_commit() {
  git add --all
  git commit -m "[👌Auto commit]"
}

ok() {
  auto_commit
  git push
}

go_to_git_clone_repo_dir() {
  gitDir="$(basename "$1" .git)"
  gitDirResolved=${2:-$gitDir}
  git clone "$@" && cd "$gitDirResolved"
}
alias gc='go_to_git_clone_repo_dir'

auto_sync() {
  repo=(
    /home/master/repos/thuanowa/ok
    /home/master/repos/thuanowa/obs-studio
    /home/master/repos/thuanowa/co_so_du_lieu
    /home/master/repos/thuanowa/dataLab
    /home/master/repos/thuanowa/ky_thuat_lap_trinh
    /home/master/repos/thuanowa/lap_trinh_huong_doi_tuong
    /home/master/repos/thuanowa/nhap_mon_cau_truc_du_lieu
    /home/master/repos/thuanowa/nhap_mon_web_va_ung_dung
    /home/master/repos/thuanowa/thuc-hanh-ky-thuat-lap-trinh
    /home/master/repos/thuanowa/thuc-hanh-lap-trinh-huong-doi-tuong
    /home/master/repos/thuanowa/thuc-hanh-nhap-mon-cau-truc-du-lieu
    /home/master/repos/thuanowa/thuc-hanh-nhap-mon-web-va-ung-dung
    /home/master/repos/thuanowa/thuc_thanh_nhap_mon_lap_trinh
    /home/master/repos/thuanowa/ublock_adblock_list
    /home/master/repos/thuanowa/cong_nghe_phan_mem
    /home/master/repos/thuanowa/thuan_ublacklist
    /home/master/repos/thuanowa/lap_trinh_ung_dung_co_so_du_lieu
    /home/master/repos/thuanowa/quan_tri_co_so_du_lieu
    /home/master/repos/thuanowa/ma_hoa_ung_dung
    /home/master/repos/thuanowa/img
    /home/master/repos/thuanowa/lap_trinh_cho_thiet_bi_di_dong/
    /home/master/repos/thuanowa/lap_trinh_web/
    /home/master/repos/thuanowa/phat_trien_phan_mem_nguon_mo/
    /home/master/repos/thuanowa/javascript-cli/
  )

  for i in ${repo[*]}; do
    cd "$i"
    pwd
    auto_commit
    git push
  done
}

update_all_repo() {
  for dir in ~/repos/thuanowa/*; do
    cd "$dir"
    pwd
    git pull
    git push
    cd - >/dev/null
  done

  for dir in ~/repos/OngDev/*; do
    cd "$dir"
    pwd
    git pull
    git push
    cd - >/dev/null
  done

  for dir in ~/repos/isekaiSystem/*; do
    cd "$dir"
    pwd
    git pull
    git push
    cd - >/dev/null
  done

  repoNotInDefaultDir=(
    ~/dotfiles/
    ~/repos/OngDev/.github/
  )

  for i in ${repoNotInDefaultDir[*]}; do
    cd "$i"
    pwd
    git pull
    git push
    cd - >/dev/null
  done
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

h() {
  local command
  command=$(\cat ~/.bash_history | fzf_down)
  $command
}

find_file_edit_in_nvim() {
  if [ ! -n "$1" ]; then
    local file
    file=$(fd . -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')

    if [ ! -z "$file" ]; then
      nvim "$file"
    fi
  else
    nvim "$1"
  fi
}
alias f='find_file_edit_in_nvim'
alias e='find_file_edit_in_nvim'
alias v='find_file_edit_in_nvim'
alias vi='find_file_edit_in_nvim'
alias vim='find_file_edit_in_nvim'

open_file() {
  local object
  object=$(fd . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --theme=GitHub --color=always --style=numbers --line-range=:500 {}')
  if [ ! -z "$object" ]; then
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

alias dot='tmux switch-client -t "dotfiles"'
alias in='tmux switch-client -t "inbox"'

kill_all_unname_tmux_session() {
  echo "\n👉 kill all unname tmux session"
  cd /tmp/
  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
  chmod +x killAllUnnameTmuxSessionOutput.sh
  ./killAllUnnameTmuxSessionOutput.sh
  cd -
  tmux ls
}

kill_all_unname_tmux_session_no_message() {
  cd /tmp/
  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
  chmod +x killAllUnnameTmuxSessionOutput.sh
  ./killAllUnnameTmuxSessionOutput.sh
  cd -
}

alias clear='kill_all_unname_tmux_session_no_message ; clear -x'
alias cler='clear'
alias clea='clear'

alias yt="yt-dlp -f bestvideo+bestaudio"

yta() {
  yt-dlp -f "bestaudio" --continue --no-overwrites --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"
}

alias play_music='mpv --shuffle --loop-playlist *'
alias m='play_music'
