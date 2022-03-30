alias ide='tmux split-window -v -p 20 ; tmux split-window -h -p 50 ; tmux last-pane ; nvim'
# alias ide='tmux split-window -v -p 8 ; tmux last-pane ; nvim'
# alias ide='tmux split-window -h -p 30 ; tmux split-window -v -p 75 ; tmux last-pane ; nvim'

function killAllUnnameTmuxSession() {
  echo "kill all unname tmux session"
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

alias clear='killAllUnnameTmuxSessionNoMessage ; clear'
alias cler='killAllUnnameTmuxSessionNoMessage ; clear'
alias clea='killAllUnnameTmuxSessionNoMessage ; clear'
alias cl='killAllUnnameTmuxSessionNoMessage ; clear'

function tmuxSessionSwitch() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | fzfDown)
  tmux switch-client -t "$session"
}
alias af='tmuxSessionSwitch'
