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

set -gx PATH $(yarn global bin) $DENO_INSTALL/bin $PNPM_HOME $HOME/.npm/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin $HOME/.local/bin $HOME/bin $HOME/dotfiles/personal_bin $HOME/.local/share/gem/ruby/2.7/bin $HOME/gems/bin $PATH

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

alias clear='clear -x'
alias q='exit'
alias e='nvim'
alias d='z'

zoxide init fish | source
starship init fish | source
