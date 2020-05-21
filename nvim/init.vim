call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
" fancy
Plug 'NLKNguyen/papercolor-theme'
Plug 'ap/vim-css-color'
call plug#end()

filetype plugin indent on
set encoding=UTF-8
set mouse=a
set clipboard=unnamedplus

set tabstop=4 softtabstop=4
set shiftwidth=4
" 4 space in html, css look non-fancy, 2 space is better
autocmd BufRead,BufNewFile *.css,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
" convert tab to space, some isue when I see file at github,...
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

" Display different types of white spaces
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" highlight cursorline
set cursorline
highlight CursorLine term=none cterm=bold
highlight CursorLine guibg=253 ctermbg=253

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" theme
" papercolor-theme
set background=light
colorscheme PaperColor

" easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" nerdcommenter
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

" fzf
noremap t :Files<CR>
noremap b :Buffers<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)

" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

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

" nerd tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" coc vim
let g:coc_global_extensions = [
                        \ "coc-css",
                        \ "coc-html",
                        \ "coc-snippets",
                        \ "coc-json",
                        \ "coc-python",
                        \ "coc-tsserver",]

" if hidden is not set, TextEdit might fail.
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" auto insert when open file
autocmd BufNewFile *.sh  :call CheckShFile()
autocmd BufNewFile *.fish  :call CheckFishFile()
autocmd BufNewFile *.py :call CheckPyFile()
autocmd BufNewFile *.cpp :call CheckCppFile()

function! CheckShFile()
    normal!i#!/usr/bin/env bash
    normal!o
endfunction

function! CheckPyFile()
    normal!i#!/usr/bin/env python3
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
    normal!i#!/usr/bin/env fish
    normal!o
endfunction
