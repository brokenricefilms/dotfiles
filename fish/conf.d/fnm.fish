# fnm
set PATH "/home/master/.local/share/fnm" $PATH

status is-interactive && fnm env --use-on-cd | source
