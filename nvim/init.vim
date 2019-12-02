call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()            

set ts=4 sw=4
set number
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
nmap <silent> f <Plug>(easymotion-overwin-f)
nmap <silent> F <Plug>(easymotion-overwin-line)

" emmet
let g:user_emmet_leader_key=','

" airline
let g:airline_theme='minimalist'
"let g:airline_theme='solarized'
