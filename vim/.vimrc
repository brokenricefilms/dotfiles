set nu


set clipboard=unnamedplus

syntax enable
set nohlsearch

set mouse=a

set autoread
set autowrite

set nobackup
set nowb
set noswapfile

set ts=4 sw=4

let g:user_emmet_leader_key=','

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

:imap jj <Esc>


set nocompatible              
filetype off                  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            
filetype plugin indent on    
