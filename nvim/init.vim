call plug#begin()
" Plug 'preservim/nerdtree'
" map <C-n> :NERDTreeToggle<CR>

Plug 'easymotion/vim-easymotion'
nmap <leader>f <Plug>(easymotion-overwin-f)
" nmap <silent> ;l <Plug>(easymotion-overwin-line)

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
noremap <leader>t :Files<CR>
noremap <leader>r :Rg<CR>
noremap <leader>b :Buffers<CR>
noremap <c-p> :GFiles<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
let g:coc_global_extensions = [
                        \ "coc-css",
                        \ "coc-html",
                        \ "coc-snippets",
                        \ "coc-highlight",
                        \ "coc-json",
                        \ "coc-python",
                        \ "coc-clangd",
                        \ "coc-sh",
                        \ "coc-sql",
                        \ "coc-tsserver",]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

Plug 'mbbill/undotree'
set undodir=~/.config/nvim/undodir
set undofile
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" tldr command :MarkdownPreview
" auto open windown when edit file .md | 1 is able mode
let g:mkdp_auto_start = 0
let g:mkdp_markdown_css = '~/.config/nvim/stuff/github-markdown.css'

" fancy
" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'lifepillar/vim-gruvbox8'
" Plug 'NLKNguyen/papercolor-theme'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" theme
set termguicolors
set background=dark
" colorscheme PaperColor
colorscheme gruvbox8

filetype plugin indent on
set encoding=UTF-8
set mouse=a
set clipboard=unnamedplus
set nohlsearch

set tabstop=4 softtabstop=4
set shiftwidth=4
" 4 space in html, css look non-fancy, 2 space is better
autocmd BufRead,BufNewFile *.scss,*.css,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
" convert tab to space, some issue when I see file at github,...
set expandtab

set number relativenumber
syntax enable

" set statusline=%F%m%r%h%w
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)

set autowrite
set autoread
set noswapfile
set nobackup
set nowritebackup
set autoindent
set smartindent

" remap Esc
:imap jj <Esc>
" Map leader to space
map <space> <leader>

" Display different types of white spaces
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" highlight cursorline
set cursorline
highlight CursorLine term=bold cterm=bold
" highlight CursorLine guibg=bold gui=bold

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

augroup General
    au!
    autocmd FileType markdown,text setlocal spell spelllang=en
    " auto insert when open file
    autocmd BufNewFile *.sh  :call CheckShFile()
    autocmd BufNewFile *.fish  :call CheckFishFile()
    autocmd BufNewFile *.py :call CheckPyFile()
    autocmd BufNewFile *.cpp :call CheckCppFile()
augroup END


function! CheckShFile()
    normal!i#! /usr/bin/env sh
    normal!o
endfunction

function! CheckPyFile()
    normal!i#! /usr/bin/env python3
    normal!o
endfunction

function! CheckCppFile()
    normal!i#include <iostream>
    normal!ousing namespace std;
    normal!o
    normal!oint main() {
    normal!oreturn 0;
    normal!o}
endfunction

function! CheckFishFile()
    normal!i#! /usr/bin/env fish
    normal!o
endfunction
