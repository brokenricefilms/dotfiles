call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" fancy
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

filetype plugin indent on
set encoding=UTF-8
set mouse=a
set clipboard=unnamedplus

set softtabstop=2 " Indent by 2 spaces when hitting tab
set shiftwidth=4 " Indent by 4 spaces when auto-indenting
set tabstop=4

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

" Display different types of white spaces.	
set list	
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.	


" highlight cursorline
set cursorline
highlight CursorLine term=none cterm=bold
highlight CursorLine guibg=253 ctermbg=253

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" papercolor-theme
set background=light
colorscheme PaperColor
set t_Co=256

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
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

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

""" snippets
inoremap <C-Space> <Esc>/<++><Enter>"_c4l
noremap <C-Space> /<++><Enter>"_c4l

autocmd FileType c,cpp imap ,i /**<Enter><Space><Space><Space><Space>Author:<Space>Nicholas<Space>Pham<Enter>Created:<Space><C-R>=strftime("%c")<CR><Enter><Esc>xxi**/<Enter>
autocmd FileType python,sh imap ,i #<Enter>#<Space><Space><Space><Space>Author:<Space>Nicholas<Space>Pham<Enter>#<Space><Space><Space><Space>Created:<Space><C-R>=strftime("%c")<CR><Enter>#<Enter>

" python
autocmd FileType python imap ,! import<Space>pandas<Space>as<Space>pd<Enter>from<Space>matplotlib<Space>import<Space>pyplot<Space>as<Space>plt<Enter><Enter>
autocmd FileType python imap ,c <++><Space>=<Space>pd.read_csv("<++>")<C-Space>

" vim
autocmd FileType vim imap ,f function! ()<Enter>endfunction<Esc>ki
autocmd FileType vim imap ,s autocmd FileType  imap ,<Esc>6hi

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
	normal!o<++>;
	normal!oreturn 0;
	normal!o}
endfunction

function! CheckFishFile()
	normal!i#!/usr/bin/env fish
	normal!o
endfunction
