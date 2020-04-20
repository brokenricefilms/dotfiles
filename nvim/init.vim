call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set ts=2 sw=2
set number relativenumber
set encoding=UTF-8
syntax enable
set clipboard=unnamedplus
set mouse=a
set autowrite
set autoread
set noswapfile
set nobackup
set nowritebackup
set autoindent
set smartindent

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

:imap jj <Esc>

" papercolor-theme
set background=light
colorscheme PaperColor
set t_Co=256

" highligt cursorline
set cursorline
highlight CursorLine term=none cterm=bold
highlight CursorLine guibg=253 ctermbg=253

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" nerdcommenter
filetype plugin indent on
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle
