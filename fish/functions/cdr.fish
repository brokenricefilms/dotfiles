function cdr --description 'change dir to git root dir'
    cd (git rev-parse --show-toplevel)
end
