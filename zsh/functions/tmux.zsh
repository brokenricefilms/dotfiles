alias ide='tmux split-window -h -p 30 ; tmux split-window -v -p 75 ; tmux last-pane ; nvim'
alias dot='tmux switch-client -t "dotfiles"'
alias in='tmux switch-client -t "inbox"'

function killAllUnnameTmuxSession() {
  echo "\n👉 kill all unname tmux session"
  cd /tmp/
  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
  chmod +x killAllUnnameTmuxSessionOutput.sh
  ./killAllUnnameTmuxSessionOutput.sh
  cd -
  tmux ls
}

function killAllUnnameTmuxSessionNoMessage() {
  cd /tmp/
  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
  chmod +x killAllUnnameTmuxSessionOutput.sh
  ./killAllUnnameTmuxSessionOutput.sh
  cd -
}

alias clear='killAllUnnameTmuxSessionNoMessage ; clear -x'
alias cler='clear'
alias clea='clear'
alias cl='clear'

function tmuxSessionSwitch() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | fzfDown)
  tmux switch-client -t "$session"
}
alias af='tmuxSessionSwitch'
