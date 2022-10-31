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
noremap <leader>j :Rg<enter>
noremap ; :Commands<enter>

Plug 'https://github.com/tpope/vim-eunuch'

Plug 'https://github.com/christoomey/vim-tmux-navigator'

Plug 'https://github.com/tpope/vim-surround'

Plug 'https://github.com/projekt0n/github-nvim-theme'
call plug#end()

syntax enable
set termguicolors

colorscheme github_light

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})

set cursorline
set cursorlineopt=number

set number relativenumber

set statusline=[\ %F\ %m]\ %y\ %r%h%w%=[\ %<%{getcwd()}\ ]

set list
let &listchars = 'tab:▸ ,trail:·,nbsp:±,extends:❯,precedes:❮'

set wrap linebreak
let &showbreak = '⤷'
set cpo+=n

set tabstop=4 softtabstop=4 noet
set shiftwidth=4
autocmd BufRead,BufNewFile *.cs,*.h,*.cpp,*.scss,*.css,*.html,*.md,*.js,*.zsh,*.sh,zshrc,*.vim setlocal tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

filetype plugin indent on
set nocompatible
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

map <silent> <Right> <C-w><
map <silent> <Down> <C-W>-
map <silent> <Up> <C-W>+
map <silent> <Left> <C-w>>

noremap <silent> cd. :cd %:h<enter>
noremap <silent> cd :cd<enter>
noremap <silent> cdr :cd %:h<enter>:cd `git rev-parse --show-toplevel`<enter>

nnoremap <leader><space> <c-^>
