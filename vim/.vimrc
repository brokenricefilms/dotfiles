set nu 
set clipboard=unnamedplus
syntax on
syntax enable
set mouse=a

set autoread
set autowrite

call plug#begin('~/.config/nvim/plugged')
Plug 'mattn/emmet-vim'
call plug#end()

"-- EMMET CONIFG --
let g:user_emmet_leader_key=','

:imap jj <Esc>
