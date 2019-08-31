set nu 
set clipboard=unnamedplus
syntax on
syntax enable
set mouse=a

set autoread
set autowrite

call plug#begin('~/.config/nvim/plugged')
call plug#end()

:imap jj <Esc>
