#! /usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fdfind --type f --follow --exclude .git --exclude undodir --exclude gems --exclude Visual_Paradigm_CE_16.3 --exclude node_modules'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind -t d"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:-1,bg:-1,hl:#dcd2ce
--color=fg+:-1,bg+:#dcd2ce,hl+:-1
--color=info:-1,prompt:-1,pointer:-1
--color=marker:-1,spinner:-1,header:-1'

alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \$1 }' | wl-copy"

fzfDown() { fzf --height 50% --min-height 20 --bind ctrl-/:toggle-preview "$@" --reverse }

function F() {
    cd ~/
    nvim -o "$(fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    cd -
}

function f() {
    nvim -o "$(fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')"
}

function c () {
    local dir
    dir=$(fdfind -t d . --exclude .git --exclude undodir --exclude gems --exclude Visual_Paradigm_CE_16.3 --exclude node_modules | fzfDown) &&
    cd "$dir"
    ls
}

function C () {
    local dir
    dir=$(fdfind -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude Visual_Paradigm_CE_16.3 --exclude node_modules | fzfDown) &&
    cd "$dir"
    ls
}

function O() {
    cd ~/
    xdg-open "$(fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    cd -
}

function o() {
    xdg-open "$(fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')"
}

fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

source ~/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh
source ~/dotfiles/zsh/functions/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh
