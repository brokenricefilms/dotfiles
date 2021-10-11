function! Import_sh()
    normal!i#! /usr/bin/env sh
    normal!o
endfunction

function! Import_py()
    normal!i#! /usr/bin/env python3
    normal!o
endfunction

function! Import_fish()
    normal!i#! /usr/bin/env fish
    normal!o
endfunction

function! Import_wolframscript()
    normal!i#! /usr/bin/env wolframscript
    normal!o
endfunction

autocmd BufNewFile *.wls  :call Import_wolframscript()

autocmd BufNewFile *.fish  :call Import_fish()

autocmd BufNewFile *.py :call Import_py()

autocmd BufNewFile *.sh  :call Import_sh()

autocmd BufNewFile *.cpp :read ~/.config/nvim/stuff/cpp_template.cpp | normal!kdd3j

autocmd BufNewFile *.html  :read ~/.config/nvim/stuff/html_template.html | normal!kdd6j
