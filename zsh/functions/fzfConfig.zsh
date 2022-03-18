#! /usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \ $1 }' | wl-copy"
# alias ej="emoji-fzf preview --prepend | fzfDown | awk '{ print \ $1 }' | xclip -sel clip"

function findFileEditInNvim () {
  if [ ! -n " $1" ]; then
    findFile
  else
    nvim " $1"
  fi
}
alias e='findFileEditInNvim'
alias v='findFileEditInNvim'
alias vi='findFileEditInNvim'
alias vim='findFileEditInNvim'

fzfDown() { fzf --height 50% --min-height 20 --bind ctrl-/:toggle-preview "$@" --reverse }

function findFile() {
  local file
  file=$(fd . -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias f='findFile'

function findFileInHome() {
  local file
  file=$(fd . $HOME -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias F='findFileInHome'

function findHiddenFile() {
  local file
  file=$(fd . -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias fh='findHiddenFile'

function findHiddenFileInHome() {
  local file
  file=$(fd . $HOME -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias Fh='findHiddenFileInHome'

function changeDir () {
  local dir
  dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias c='changeDir'

function changeDirInHome () {
  local dir
  dir=$(fd -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias C='changeDirInHome'

function changeHiddenDir () {
  local dir
  dir=$(fd -t d --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias ch='changeHiddenDir'

function changeHiddenDirInHome () {
  local dir
  dir=$(fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"
  ls
}
alias Ch='changeHiddenDirInHome'

function openFile() {
  local object
  object=$(fd . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z '$object' ]
  then
    xdg-open '$object'
  fi
}
alias o='openFile'

function openFileInHome() {
  local object
  object=$(fd . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z '$object' ]
  then
    xdg-open '$object'
  fi
}
alias O='openFileInHome'

function openHiddenFile() {
  local object
  object=$(fd . --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias oh='openHiddenFile'

function openHiddenFileInHome() {
  local object
  object=$(fd . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzfDown --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias Oh='openHiddenFileInHome'

function fzfMan() {
  if [ -z  $1 ]
  then
    man -k . | fzf -q " $1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ",  $2} {print  $1}' | xargs -r man
  else
    man  $1
  fi
}
alias M='fzfMan'
alias help="fzfMan"

# @todo [zsh] af if not have session create new like fzf session switch tmux plugin
# @body @thuanpham2311
# why `af`? cuz like the tmux command fzf session switch hold ctrl + a + f
function tmuxSessionSwitch() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | fzfDown)
  tmux switch-client -t "$session"
}
alias af='tmuxSessionSwitch'

function switchBranch() {
  isInGitRepo || return
  git branch -a | fzfDown | xargs git switch
}
alias sb='switchBranch'

function gitHubIssueList() { gh issue list | fzf | cut -f1 | wl-copy}
# function gitHubIssueList() { gh issue list | fzf | cut -f1 | xclip -sel clip}
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
