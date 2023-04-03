function fzf_man
    if [ ! -n "$argv" ]
        set --local command_name (/usr/bin/man -k . | fzf_down | awk '{print $1}')
        /usr/bin/man $command_name
    else
        /usr/bin/man $argv
    end
end
