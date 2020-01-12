#!/usr/bin/fish

alias clone='git clone'
alias yo='git add -A ; git commit -m (curl -s whatthecommit.com/index.txt)'
alias push="git push"
alias pull="git pull" 
alias cm='git commit -m'
alias ok='yo ; push'

alias ghdotfiles='cp ~/.selected_editor ~/git/dotfiles ; cp ~/.gitconfig  ~/git/dotfiles/git/ ; cp ~/.tmux.conf ~/git/dotfiles/tmux ; cp ~/.config/nvim/init.vim ~/git/dotfiles/nvim ; cp ~/.config/fish/* ~/git/dotfiles/fish/ ; cp ~/.ssh/config ~/git/dotfiles/ssh/ ; cp ~/.config/ranger/* ~/git/dotfiles/ranger ; cd ~/git/dotfiles ; yo ; push ; cd -'
alias ghdotfiles-termux='cd ~/git/dotfiles-termux ; yo ; push ; cd -'
alias ghlazyscript='cd ~/git/lazyscript ; yo ; push ; cd -'
alias ghstudy='cd ~/git/study ; yo ; push ; cd -'
alias ghmywebsite='cd ~/git/mywebsite ; yo ; push ; cd -'
alias ghpomodoro='cd ~/git/pomodoro ; yo ; push ; cd -'
alias gha='ghdotfiles-termux ; ghstudy ; ghmywebsite ; ghpomodoro ; ghlazyscript ; ghdotfiles'

alias glsherlock='cd ~/tools/hacking/sherlock/ ; pull ; cd -'
alias gldotfiles='cd ~/git/dotfiles ; pull ; cd -'
alias gllazyscript='cd ~/git/lazyscript ; pull ; cd -'
alias gldotfiles-termux='cd ~/git/dotfiles-termux ; pull ; cd -'
alias glstudy='cd ~/git/study ; pull ; cd -'
alias glmywebsite='cd ~/git/mywebsite ; pull ; cd -'
alias glpomodoro='cd ~/git/pomodoro ; pull ; cd -'
alias gla='gldotfiles-termux ; glstudy ; glmywebsite ; glpomodoro; glsherlock ; gldotfiles ; gllazyscript'
