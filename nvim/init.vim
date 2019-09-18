set nu

set clipboard=unnamedplus

syntax on
syntax enable
set background=dark
colorscheme solarized

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

execute pathogen#infect()
filetype plugin indent on

let g:user_emmet_leader_key=','

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

:imap jj <Esc>
