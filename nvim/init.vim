call plug#begin()
Plug 'easymotion/vim-easymotion'
nmap ;; <Plug>(easymotion-overwin-f)

Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'stsewd/fzf-checkout.vim'
noremap <leader>g :GFiles<CR>
noremap <leader>f :Files<CR>
noremap <leader>t :FZF ~<CR>
noremap <leader>r :Rg<CR>
noremap <leader>b :Buffers<CR>
noremap <c-p> :Commands<CR>
noremap // :BLines<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" move search on top
let $FZF_DEFAULT_OPTS='--reverse'
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
                        \ "coc-explorer",
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

" coc explorer
nmap <space>e :CocCommand explorer<CR>

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

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" tldr command :MarkdownPreview
" auto open windown when edit file .md | 1 is able mode
let g:mkdp_auto_start = 0
let g:mkdp_markdown_css = '~/.config/nvim/stuff/github-markdown.css'

" fancy
" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'Yggdroot/indentLine'

Plug 'NLKNguyen/papercolor-theme'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" theme
set termguicolors
set background=dark
colorscheme PaperColor

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
set scrolloff=8

" fix indenting visual block
vmap < <gv
vmap > >gv

" remap Esc
:imap jj <Esc>
" Map leader to space
map <space> <leader>

" Display different types of white spaces
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" set colorcolumn=80
" highlight cursorline
set cursorline
highlight CursorLine term=bold cterm=bold
" highlight CursorLine guibg=bold gui=bold

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

nmap <C-t> :tabnew<Return>
nmap <S-k> gt
nmap <S-j> gT

command! Config execute "cd ~/.config | FZF ~/.config/"
command! Reload execute "source ~/.config/nvim/init.vim"

augroup General
    au!
    autocmd FileType markdown,text setlocal spell spelllang=en
    " auto insert when open file
    autocmd BufNewFile *.sh  :call CheckShFile()
    autocmd BufNewFile *.fish  :call CheckFishFile()
    autocmd BufNewFile *.py :call CheckPyFile()
    autocmd BufNewFile *.cpp :read ~/.config/nvim/stuff/cppTemplate.cpp | normal!kdd3j
augroup END


function! CheckShFile()
    normal!i#! /usr/bin/env sh
    normal!o
endfunction

function! CheckPyFile()
    normal!i#! /usr/bin/env python3
    normal!o
endfunction

function! CheckFishFile()
    normal!i#! /usr/bin/env fish
    normal!o
endfunction
