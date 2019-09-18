set nu

set clipboard=unnamedplus

syntax on

set mouse=a

set autoread

set nobackup
set nowb
set noswapfile

set ts=4 sw=4

call plug#begin('~/.config/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:user_emmet_leader_key=','

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

let python_highlight_all=1

:imap jj <Esc>
