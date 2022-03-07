set hidden
set shortmess+=c
set updatetime=10

set hlsearch
set ignorecase
set incsearch
set smartcase
set magic
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zz
nnoremap # #zz

syntax enable
set termguicolors
colorscheme zellner

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})

set cursorline

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set number relativenumber
command! NumberLine execute "set number relativenumber"
command! NumberLineOff execute "set number! relativenumber!"

set statusline=[\ %F\ %m]\ %r%h%w%=

set wrap linebreak
let &showbreak = '⤷'
set cpo+=n

set tabstop=4 softtabstop=4 noet
set shiftwidth=4
autocmd BufRead,BufNewFile *.cs,*.h,*.cpp,*.scss,*.css,*.html,*.md,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set nocompatible
filetype plugin indent on
set encoding=UTF-8
set fileformat=unix
set mouse=a
set clipboard=unnamedplus
set autoindent
set smartindent
set autoread
set autowrite
set nobackup
set noswapfile
set lazyredraw
set ttyfast
set nowritebackup
set inccommand=split
set scrolloff=5

nnoremap + <C-a>
nnoremap - <C-x>

xnoremap < <gv
xnoremap > >gv

map <space> <leader>

noremap <silent> <C-t> :tabnew<Return>
noremap <silent> <S-e> gT
noremap <silent> <S-r> gt

noremap <silent> <leader>1 1gt
noremap <silent> <leader>2 2gt
noremap <silent> <leader>3 3gt
noremap <silent> <leader>4 4gt
noremap <silent> <leader>5 5gt
noremap <silent> <leader>6 6gt
noremap <silent> <leader>7 7gt
noremap <silent> <leader>8 8gt
noremap <silent> <leader>9 9gt

noremap <silent> <space>s :setlocal spell! spell?<enter>

nnoremap z= :call FzfSpell()<CR>

noremap ss :split<Return><C-w>w
noremap sv :vsplit<Return><C-w>w

map <silent> <Right> <C-w><
map <silent> <Down> <C-W>-
map <silent> <Up> <C-W>+
map <silent> <Left> <C-w>>

noremap <silent> cd. :cd %:h<enter>
noremap <silent> cd :cd<enter>

vnoremap <silent> <C-j> :m '>+1<enter>gv=gv
vnoremap <silent> <C-k> :m '<-2<enter>gv=gv

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k

noremap <silent> gx :silent execute "!xdg-open " . "<cfile>"<enter>

nnoremap <leader>w :w<enter>
nnoremap <leader>ư :w<enter>
nnoremap <leader>q :q<enter>
nnoremap <leader>o :wq<enter>
nnoremap Q :qa!<enter>

noremap H :cprevious<enter>
noremap L :cnext<enter>
noremap J :bnext<enter>
noremap K :bprevious<enter>

nmap <silent> <leader>x :!xdg-open '%'<enter><enter>

nmap gf :cd %:h<enter>:edit <cfile><enter>

imap <S-down> <esc>o
imap <S-up> <esc>O
nnoremap <silent> <S-down> o<esc>
nnoremap <silent> <S-up> O<esc>

xnoremap <silent> p p:let @+=@0<enter>:let @"=@0<enter>
nnoremap <leader><space> <c-^>
