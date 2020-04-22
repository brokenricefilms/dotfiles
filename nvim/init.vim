call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'	
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" fancy
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'prettier/vim-prettier', {	
  \ 'do': 'yarn install',	
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" 2 space when edit html file
" autocmd BufRead,BufNewFile *.htm,*.html,*.css setlocal tabstop=2 shiftwidth=2 softtabstop=2
" set ts=4 sw=4
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

" reMap Esc
:imap jj <Esc>

" lightline
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

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

" nerd tree	
map <C-n> :NERDTreeToggle<CR>	
let NERDTreeShowHidden=1	

" emmet	
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" nerdcommenter
filetype plugin indent on
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

" fzf
noremap t :Files<CR>
noremap b :Buffers<CR>

" fzf.vim
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" prettier
nmap <silent> <space>py <Plug>(Prettier)	
" auto prettier when saved	
let g:prettier#autoformat = 0	
autocmd BufWritePre *.md,*.js,*.html,*.json,*.css,*.scss,*.less,*.graphql Prettier
