#! /usr/bin/env zsh

# debian
# export FZF_DEFAULT_COMMAND='fdfind --type f --follow --exclude .git --exclude undodir --exclude gems'

# arch | termux | fedora
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude undodir --exclude gems'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:-1,bg:-1,hl:#dcd2ce
--color=fg+:-1,bg+:#dcd2ce,hl+:-1
--color=info:-1,prompt:-1,pointer:-1
--color=marker:-1,spinner:-1,header:-1'

alias ej="emoji-fzf preview --prepend | fzf-down | awk '{ print \$1 }' | xclip -selection c"

fzf-down() { fzf --height 50% --min-height 20 --bind ctrl-/:toggle-preview "$@" --reverse }

function f() {
    cd ~/
    nvim -o "$(fzf-down --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    cd -
}

function c () {
    local dir
    dir=$(fd -t d . $HOME --exclude gems | fzf-down) &&
    cd "$dir"
    ls
}

function o() {
    cd ~/
    xdg-open "$(fzf-down --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    cd -
}

function O() {
    xdg-open "$(fzf-down --preview 'bat --style=numbers --color=always --line-range :500 {}')"
}
