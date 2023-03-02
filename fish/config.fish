if status is-interactive
    and not set -q TMUX
    if tmux has-session -t inbox
        exec tmux attach-session -t inbox
    else
        tmux new-session -s inbox
    end
end

set -U fish_greeting

set -gx DENO_INSTALL $HOME/.deno
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -gx GEM_HOME $HOME/gems
set -gx PNPM_HOME $HOME/.local/share/pnpm

set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx MANPAGER $EDITOR +Man!

set -gx PATH $DENO_INSTALL/bin $PNPM_HOME $HOME/.npm/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin $HOME/.local/bin $HOME/bin $HOME/dotfiles/personal_bin $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/gems/bin $(yarn global bin) $PATH

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# rule for alias:
# 1. Single/double char
# 2. No shift -> double char
# 3. Usually used

alias a='git add -A; git commit'
alias aa='git add -A; git commit -m "auto commit"'
alias c='clear -x'
alias cdr='change_directory_to_git_root'
alias d='fzf_change_directory'
alias dd='cd $HOME; fzf_change_directory'
alias e='fzf_edit_file'
alias ee='cd $HOME; fzf_edit_file'
alias ej='fzf_emoji'
alias f='yay -Ss'
alias h='htop'
alias i='yay -S --noconfirm'
alias l='git pull'
alias ll='git pull -f'
alias o='fzf_open'
alias p='git push'
alias pp='git push -f'
alias q='exit'
alias r='rm -rf'
alias rr='sudo rm -rf'
alias s='git status -sb'
alias ser='browser_sync_start_server'
alias t='trash'
alias u='sudo pacman -R --noconfirm'
alias uu='yay -R --noconfirm'
alias v='fzf_sudo_edit'
alias x='chmod +x'

starship init fish | source
