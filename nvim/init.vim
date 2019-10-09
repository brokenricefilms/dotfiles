call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            

set number
set clipboard=unnamedplus
syntax off 
set nohlsearch 
set ts=4 sw=4

set mouse=a

set autowrite
set autoread
set nobackup
set nowb
set noswapfile


let g:user_emmet_leader_key=','
let g:airline_theme='minimalist'

:imap jj <Esc>
nmap <silent> f <Plug>(easymotion-overwin-f)
nmap <silent> F <Plug>(easymotion-overwin-line)
nnoremap <C-o> :CocList outline<CR>
