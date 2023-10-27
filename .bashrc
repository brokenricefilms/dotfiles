function parseGitdirty {
  status=$(git status --porcelain -b 2>/dev/null)
  aheadRegex="ahead ([0-9]+)"
  behindRegex="behind ([0-9]+)"

  [[ $status =~ $aheadRegex ]] && ahead="${BASH_REMATCH[1]}" || ahead="0"
  [[ $status =~ $behindRegex ]] && behind="${BASH_REMATCH[1]}" || behind="0"

  [[ $(git status 2>/dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo -n " 🍀"
  [[ $ahead != "0" ]] && echo -n " ↑${ahead}"
  [[ $behind != "0" ]] && echo -n " ↓${behind}"
}

function parseGitstash {
  [[ $(git stash list 2>/dev/null | tail -n1) != "" ]] && echo " \/ stash"
}

function parsegitBranch {
  git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parseGitdirty)$(parseGitstash)/"
}

function nodeVersion {
  git show HEAD~1:"package.json" >/dev/null 2>&1
  if [[ $? == 0 ]]; then
    echo -n "🌱"
    node --version
  fi
}

PS1='\[\e[0;2m\]\u\[\e[0;2m\]@\[\e[0;2m\]\H\[\e[0;2m\]: \[\e[0;1m\]\w \[\e[0;3m\]$(parsegitBranch) $(nodeVersion)\n\[\e[0;2m\]❯ \[\e[0m\]'

HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=
shopt -s histappend
shopt -s checkwinsize

bind "set completion-ignore-case on"

set -o vi

stty time 0

EDITOR=vim

function gitCommitCurrentChange() {
  git add -A
  git commit
}
alias a="gitCommitCurrentChange"

function gitAutoCommit() {
  echo "
  $ git add -A
  $ git commit -m 'auto commit'
  "

  git add -A
  git commit -m 'auto commit'
}
alias aa="gitAutoCommit"

function changeDirectoryTogitRoot() {
  cd $(git rev-parse --show-toplevel)
}
alias cdr="changeDirectoryTogitRoot"

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
