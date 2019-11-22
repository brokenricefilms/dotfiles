call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()            

set ts=4 sw=4
set number relativenumber
set background=dark
set nohlsearch

set clipboard=unnamedplus
set mouse=a
set autowrite
set autoread
set noswapfile
set nobackup
set nowritebackup

let g:user_emmet_leader_key=','
let g:airline_theme='minimalist'
"let g:airline_theme='solarized'

:imap jj <Esc>
nmap <silent> f <Plug>(easymotion-overwin-f)
nmap <silent> F <Plug>(easymotion-overwin-line)
nnoremap <C-o> :CocList outline<CR>
map <C-n> :NERDTreeToggle<CR>
