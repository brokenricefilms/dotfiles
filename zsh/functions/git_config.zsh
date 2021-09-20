# !/usr/bin/env zsh

alias st='git status -sb'
alias add='git add'
alias push="git push"
alias pull="git pull"
alias cm='git commit'
alias dv='git difftool'

is_in_git_repo() { git rev-parse HEAD > /dev/null 2>&1 }

function co () {
    is_in_git_repo || return
    git branch -a | fzf-down | xargs git checkout
}

function auto_commit () {
    is_in_git_repo || return
    git add -A
    git commit -m "[👌Auto commit] $(curl -s whatthecommit.com/index.txt)"
}

function ok () {
    is_in_git_repo || return
    st
    auto_commit
    push
}

function gc () {
    git_dir="$(basename "$1" .git)"
    git_dir_resolved=${2:-$git_dir}
    git clone "$@" && cd "$git_dir_resolved";
}

alias glok='cd ~/syns/ok ; pull ; cd -'
alias ghok='cd ~/syns/ok ; okp ; cd -'

alias glnote='cd ~/syns/note ;  pull ; cd -'
alias ghnote='cd ~/syns/note ; ok ; cd -'

alias gldrive='cd ~/syns/drive ;  pull ; cd -'
alias ghdrive='cd ~/syns/drive ; ok ; cd -'

alias glzet='cd ~/.local/share/zet/ ; ok ; cd -'

function ghzet () {
    cp -r ~/syns/note/zet_publish ~/.local/share/zet/
    cp ~/syns/note/README.md ~/.local/share/zet/
    cd ~/.local/share/zet/
    ok
    cd -
}

function yo () {
    git diff
    git add .
    cowsay "What is commmit message?"
    read commit_message
    git commit -m $commit_message
    git push
}
