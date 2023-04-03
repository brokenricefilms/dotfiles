function fzf_tldr
    if [ ! -n "$argv" ]
        set --local command_to_lookup (tldr --list | sed "s/'//g" | sed "s/,//g" | sed "s/ /\n/g" | sed "s/]//g" | sed "s/\[//g" | fzf_down --preview "tldr {1}")
        tldr $command_to_lookup
    else
        tldr $argv
    end
end
