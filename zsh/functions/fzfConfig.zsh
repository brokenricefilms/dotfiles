#! /usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \$1 }' | wl-copy"
alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \$1 }' | xclip -sel clip"

fzfDown() { fzf --height 50% --min-height 20 --bind ctrl-/:toggle-preview "$@" --reverse }

function f() {
    local file
    file=$(fd . -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$file" ]
    then
        nvim "$file"
    fi
}

function F() {
    local file
    file=$(fd . $HOME -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$file" ]
    then
        nvim "$file"
    fi
}

function fh() {
    local file
    file=$(fd . -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$file" ]
    then
        nvim "$file"
    fi
}

function Fh() {
    local file
    file=$(fd . $HOME -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$file" ]
    then
        nvim "$file"
    fi
}

function c () {
    local dir
    dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
    cd "$dir"
    ls
}

function C () {
    local dir
    dir=$(fd -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
    cd "$dir"
    ls
}

function ch () {
    local dir
    dir=$(fd -t d --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
    cd "$dir"
    ls
}

function Ch () {
    local dir
    dir=$(fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
    cd "$dir"
    ls
}

function o() {
    local object
    object=$(fd . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$object" ]
    then
        xdg-open "$object"
    fi
}

function O() {
    local object
    object=$(fd . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$object" ]
    then
        xdg-open "$object"
    fi
}

function oh() {
    local object
    object=$(fd . --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$object" ]
    then
        xdg-open "$object"
    fi
}

function Oh() {
    local object
    object=$(fd . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if [ ! -z "$object" ]
    then
        xdg-open "$object"
    fi
}

function fzfMan() {
    if [ -z $1 ]
    then
        man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
    else
        man $1
    fi
}
alias M='fzfMan'
alias help="fzfMan"

# @todo [zsh] af if not have session create new like fzf session switch tmux plugin
# @body @thuanpham2311
# why `af`? cuz like the tmux command fzf session switch hold ctrl + a + f
function af() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | fzfDown)
    tmux switch-client -t "$session"
}

function sb() {
    isInGitRepo || return
    git branch -a | fzfDown | xargs git switch
}

# function gitHubIssueList() { gh issue list | fzf | cut -f1 | wl-copy}
function gitHubIssueList() { gh issue list | fzf | cut -f1 | xclip -sel clip}
alias gil='gitHubIssueList'

function gitHubIssueClose() {
    id="$(gh issue list | fzf | cut -f1)"
    [ -n "$id" ]
    gh issue close "$id"
}
alias gic='gitHubIssueClose'

function gitHubIssueViewWeb() {
    id="$(gh issue list | fzf | cut -f1)"
    [ -n "$id" ]
    gh issue view "$id" --web &> /dev/null
}
alias iv='gitHubIssueViewWeb'

function gitHubIssueComment() {
    id="$(gh issue list | fzf | cut -f1)"
    [ -n "$id" ]
    gh issue comment "$id"
}
alias gim='gitHubIssueComment'

function getAlias() {
    CMD=$(
        (
            (alias)
            (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}

function getEnvironment() {
  local out
  out=$(env | fzf)
  echo $(echo $out | cut -d= -f2)
}

source ~/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh
source ~/dotfiles/zsh/functions/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh
