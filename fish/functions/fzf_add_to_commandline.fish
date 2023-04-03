function fzf_add_to_commandline -d 'add stdin to the command line, for fzf functions'
    read -l -z result
    commandline -t ""
    # Do we need to escape this? This was here before, but doesn't work well with
    # multiline strings.
    # commandline -it -- (string escape $result)
    commandline -it -- (echo $result | paste -s -d" " -)
    commandline -f repaint
end
