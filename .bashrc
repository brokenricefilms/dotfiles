PS1='\[\e[0;2m\]\u\[\e[0;2m\]@\[\e[0;2m\]\H\[\e[0;2m\]: \[\e[0;1m\]\w \[\e[0;3m\]\n\[\e[0;2m\]❯ \[\e[0m\]'

bind "set completion-ignore-case on"

set -o vi

EDITOR=vim

alias a="git add -A git commit"
alias aa="git add -A git commit -m 'auto commit'"
alias cdr="cd $(git rev-parse --show-toplevel)"
alias p="git push"
alias pp="git push -f"
alias s="git status -sb"
alias ...="cd .. ; cd .. ; ls"
alias ..="cd .. ; ls"
alias ll="ls -al"
alias l="ll"
alias la="ls -a"
alias q="exit"
alias e="vi"
alias v="vi"
alias c="code"
