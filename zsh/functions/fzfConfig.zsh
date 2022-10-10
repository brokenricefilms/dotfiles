#! /usr/bin/env zsh

export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"

function emoji() {
  if hash emoji-fzf 2>/dev/null; then
    emoji-fzf preview --prepend | fzf_down | awk '{ print $1 }' | tr -d "\n" | copy
  else
    pip install emoji-fzf
    emoji-fzf preview --prepend | fzf_down | awk '{ print $1 }' | tr -d "\n" | copy
  fi
}
alias ej="emoji"

fzf_down() { fzf --height 50% --min-height 20 --bind ctrl-/:toggle-preview "$@" --reverse }

function find_file() {
  local file
  file=$(fd . -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias f='find_file'

function find_file_in_home() {
  local file
  file=$(fd . $HOME -t f --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias F='find_file_in_home'

function find_hidden_file() {
  local file
  file=$(fd . -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias fh='find_hidden_file'

function find_hidden_file_home() {
  local file
  file=$(fd . $HOME -t f --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$file" ]
  then
    nvim "$file"
  fi
}
alias Fh='find_hidden_file_home'

function open_file() {
  local object
  object=$(fd . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias o='open_file'

function open_file_in_home() {
  local object
  object=$(fd . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z '$object' ]
  then
    xdg-open '$object'
  fi
}
alias O='open_file_in_home'

function open_hidden_file() {
  local object
  object=$(fd . --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias oh='open_hidden_file'

function open_hidden_file_in_home() {
  local object
  object=$(fd . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ ! -z "$object" ]
  then
    xdg-open "$object"
  fi
}
alias Oh='open_hidden_file_in_home'

function man_fzf() {
  if [ -z  $1 ]
  then
    man -k . | fzf -q " $1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r man | col -bx | bat -l man -p --color always' | tr -d '()' | awk '{printf "%s ",  $2} {print  $1}' | xargs -r man
  else
    man  $1
  fi
}
alias M='man_fzf'
alias help="man_fzf"

function which_fzf() {
  COMMANDS=`echo -n $PATH | xargs -d : -I {} find {} -maxdepth 1 \
      -executable -type f -printf '%P\n'  2>/dev/null`
  ALIASES=`alias | cut -d '=' -f 1`
  FUNCTIONS=`print -l ${(ok)functions}`
  RESULT=`echo "$COMMANDS"$'\n'"$ALIASES"$'\n'"$FUNCTIONS" | sort -u | fzf_down`

  eval which $RESULT
}
alias W='which_fzf'

function get_alias() {
  CMD=$(
  (
  (alias)
  (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
  ) | fzf | cut -d '=' -f1
  );

  eval $CMD
}

function get_environment() {
  local ENV_FZF
  ENV_FZF=$(env | fzf_down)
  echo $(echo $ENV_FZF | cut -d= -f2)
  copy $(echo $ENV_FZF | cut -d= -f2)
}
alias listEnvironment='get_environment'

function list_all_commands() {
    COMMANDS=`echo -n $PATH | xargs -d : -I {} find {} -maxdepth 1 \
        -executable -type f -printf '%P\n'  2>/dev/null`
    ALIASES=`alias | cut -d '=' -f 1`
    FUNCTIONS=`print -l ${(ok)functions}`
    RESULT=`echo "$COMMANDS"$'\n'"$ALIASES"$'\n'"$FUNCTIONS" | sort -u | fzf_down`
    SPACE=" "
    copy $RESULT$SPACE

    eval $RESULT
}
alias a='list_all_commands'

function change_dir() {
  local dir
  dir=$(fd -t d . --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"

  ls
}
alias c='change_dir'

function change_dir_in_home() {
  local dir
  dir=$(fd -t d . $HOME --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"

  ls
}
alias C='change_dir_in_home'

function change_hidden_dir() {
  local dir
  dir=$(fd -t d --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"

  ls
}
alias ch='change_hidden_dir'

function change_hidden_dir_in_home() {
  local dir
  dir=$(fd -t d . $HOME --hidden --exclude .git --exclude undodir --exclude gems --exclude node_modules --exclude go --exclude app --exclude gems | fzf_down --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa -aT --color=always --group-directories-first --icons -L 1')
  cd "$dir"

  ls
}
alias Ch='change_hidden_dir_in_home'

source ~/dotfiles/zsh/functions/fzf-tab/fzf-tab.plugin.zsh
source ~/dotfiles/zsh/functions/fzf-zsh-completions/fzf-zsh-completions.plugin.zsh
