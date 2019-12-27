call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
call plug#end()            

set ts=4 sw=4
set number relativenumber
set background=dark
set clipboard=unnamedplus
set mouse=a
set autowrite
set autoread
set noswapfile
set nobackup
set nowritebackup

:imap jj <Esc>

" easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" airline
let g:airline_theme='minimalist'

" nerdcommenter
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle
