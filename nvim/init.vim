call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
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

" tab
nmap tt :tabnew<Return>
nmap <Space> :tabprevious<Return>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" airline
let g:airline_theme='minimalist'
