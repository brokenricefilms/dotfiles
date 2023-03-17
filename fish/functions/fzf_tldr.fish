function fzf_tldr
    tldr --list | sed "s/'//g" | sed "s/,//g" | sed "s/ /\n/g" | sed "s/]//g" | sed "s/\[//g" | fzf_down --preview "tldr {1}"
end
