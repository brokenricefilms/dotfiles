call plug#begin()
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'https://github.com/junegunn/fzf.vim'

let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.9,
      \ 'highlight': 'Comment',
      \ 'rounded': v:true } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_preview_window = ['down:80%', 'ctrl-/']
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

noremap <leader>F :Files ~<enter>
noremap <leader>f :Files<enter>
noremap <expr> <leader>gf fugitive#head() != '' ? ':GFiles?<enter>' : ':Files<enter>'
noremap <leader>j :Rg<enter>
noremap <leader>k :Buffers<enter>
noremap <leader>h :History<enter>
noremap ; :Commands<enter>
noremap / :BLines<enter>
noremap // /

Plug 'https://github.com/tpope/vim-fugitive'

noremap <silent> gs :G<enter>4j
noremap <silent> gc :cd `git rev-parse --show-toplevel`<enter>:BCommits<enter>
noremap <silent> gb :G blame<enter>

Plug 'https://github.com/tpope/vim-eunuch'

Plug 'https://github.com/christoomey/vim-tmux-navigator'

Plug 'https://github.com/tpope/vim-surround'

Plug 'https://github.com/preservim/nerdcommenter'

let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

Plug 'https://github.com/mbbill/undotree'
set undodir=~/sync/ok/undodir
set undofile
nnoremap <leader>u :UndotreeToggle<enter>
let g:undotree_WindowLayout = 3

Plug 'https://github.com/romainl/vim-cool'

call plug#end()

syntax enable
set termguicolors

set background=light

set cursorline
set cursorlineopt=number

set number relativenumber

set statusline=[\ %F\ %m]\ %y\ %r%h%w

set list
let &listchars = 'tab:▸ ,trail:·,nbsp:±,extends:❯,precedes:❮'

set wrap linebreak
let &showbreak = '⤷'
set cpo+=n

set tabstop=4 softtabstop=4 noet
set shiftwidth=4
autocmd BufRead,BufNewFile *.cs,*.h,*.cpp,*.scss,*.css,*.html,*.md,*.js,*.zsh,*.sh,zshrc,*.vim setlocal tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType *.md setlocal formatoptions+=tcqj

filetype plugin indent on
set nocompatible
set encoding=UTF-8
set fileformat=unix
set mouse=a
set clipboard=unnamedplus

let g:clipboard = {
      \'name': 'wsl-clip',
      \'copy': {
        \'+': 'clip.exe',
        \'*': 'clip.exe',
        \},
        \'paste': {
          \'+': "pwsh.exe Get-Clipboard",
          \'*': "pwsh.exe Get-Clipboard",
          \},
          \'cache_enabled': 0,
          \}

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
set shortmess+=I
set laststatus=3
set hlsearch
set ignorecase
set incsearch
set smartcase
set magic

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zz
nnoremap # #zz

nnoremap + <C-a>
nnoremap - <C-x>

xnoremap < <gv
xnoremap > >gv

map <space> <leader>

noremap ss :split<Return><C-w>w
noremap sv :vsplit<Return><C-w>w

map <silent> <Right> <C-w><
map <silent> <Down> <C-W>-
map <silent> <Up> <C-W>+
map <silent> <Left> <C-w>>

noremap <silent> cd. :cd %:h<enter>
noremap <silent> cd :cd<enter>
noremap <silent> cdr :cd %:h<enter>:cd `git rev-parse --show-toplevel`<enter>

vnoremap <silent> <C-j> :m '>+1<enter>gv=gv
vnoremap <silent> <C-k> :m '<-2<enter>gv=gv

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap <leader>w :w<enter>
nnoremap <leader>W :SudoWrite<enter>
nnoremap <leader>q :q<enter>
nnoremap <leader>o :wq<enter>
nnoremap Q :qa!<enter>

nmap gf :cd %:h<enter>:edit <cfile><enter>

xnoremap <silent> p p:let @+=@0<enter>:let @"=@0<enter>
nnoremap <leader><space> <c-^>

nmap <leader>i :%s/\<<C-r><C-w>\>/

command! RemoveSymbolMAkaWindowsEndline execute "%s/\r//g"

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
