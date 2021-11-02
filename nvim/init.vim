call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set hidden
set shortmess+=c
set signcolumn=yes
set updatetime=10
let g:coc_global_extensions = [
            \ "coc-snippets",
            \ "coc-prettier",
            \ "coc-json",
            \ "coc-html",
            \ "coc-htmlhint",
            \ "coc-eslint",
            \ "coc-emmet",
            \ "coc-dot-complete",
            \ "coc-diagnostic",
            \ "coc-dash-complete",
            \ "coc-tsserver",
            \ "coc-sql",
            \ "coc-sh",
            \ "coc-omnisharp",
            \ "coc-go",
            \ "coc-deno",
            \ "coc-css",
            \ "coc-clangd"]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [d :call CocAction('diagnosticNext')<cr>
nmap <silent> ]d :call CocAction('diagnosticPrevious')<cr>

noremap <silent> <Leader>; :CocCommand<enter>

imap <C-l> <Plug>(coc-snippets-expand)

vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_prev = '<c-k>'

xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <C-j> <Plug>(coc-snippets-expand-jump)

imap <C-j> <Plug>(coc-snippets-expand-jump)

command! -nargs=0 EditSnippets :call CocAction('runCommand', 'snippets.editSnippets')
command! -nargs=0 FormatFile :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 RenameCurrentWord :call CocAction('runCommand', 'document.renameCurrentWord')

Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
nmap ga :lua require("harpoon.mark").add_file()<enter>
nmap gm :lua require("harpoon.ui").toggle_quick_menu()<enter>
nmap g1 :lua require("harpoon.ui").nav_file(1)<enter>
nmap g2 :lua require("harpoon.ui").nav_file(2)<enter>
nmap g5 :lua require("harpoon.ui").nav_file(5)<enter>
nmap g6 :lua require("harpoon.ui").nav_file(6)<enter>
nmap g7 :lua require("harpoon.ui").nav_file(7)<enter>
nmap g8 :lua require("harpoon.ui").nav_file(8)<enter>
nmap g9 :lua require("harpoon.ui").nav_file(9)<enter>

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

inoremap <expr> fw fzf#vim#complete#word()
imap fp <plug>(fzf-complete-path)
noremap <leader>f :Files<enter>
noremap <leader>F :Files ~<enter>
noremap <leader>k :Buffers<enter>
noremap <leader>j :Rg<enter>
noremap <leader>h :History<enter>
noremap ; :Commands<enter>
noremap // :BLines<enter>
noremap gc :cd %:h <enter>:BCommits<enter>

let g:fzf_layout = { 'window': {
            \ 'width': 0.9,
            \ 'height': 0.9,
            \ 'highlight': 'Comment',
            \ 'rounded': v:true } }
let $FZF_DEFAULT_OPTS='--reverse'
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

Plug 'tpope/vim-fugitive'
noremap gs :G<enter>
noremap gl :Gclog<enter>
noremap gp :G push<enter>

Plug 'tpope/vim-eunuch'

Plug 'kevinhwang91/vim-ibus-sw'

Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]

Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

autocmd FileType markdown noremap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<enter>

Plug 'phaazon/hop.nvim'
map f :HopChar1<enter>
noremap f :HopChar1<enter>

Plug 'wellle/tmux-complete.vim'

Plug 'max397574/better-escape.nvim'

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType xhtml,html,css,markdown EmmetInstall

Plug 'AndrewRadev/tagalong.vim'
let g:tagalong_filetypes = ['eco', 'eelixir', 'ejs', 'eruby', 'html', 'xhtml', 'htmldjango', 'javascriptreact', 'jsx', 'php', 'typescriptreact', 'xml']

Plug 'leafOfTree/vim-matchtag'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'

Plug 'windwp/nvim-autopairs'

Plug 'windwp/nvim-ts-autotag'

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

Plug 'mbbill/undotree'
set undodir=~/sync/ok/undodir
set undofile
nnoremap <leader>u :UndotreeToggle<enter>
let g:undotree_WindowLayout = 3

Plug 'romainl/vim-cool'

set hlsearch
set ignorecase
set incsearch
set smartcase
set magic
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zz
nnoremap # #zz
noremap J mzJ`z

Plug 'norcalli/nvim-colorizer.lua'
autocmd BufRead,BufNewFile * :ColorizerAttachToBuffer

Plug 'lukas-reineke/indent-blankline.nvim'
if &diff
    let g:indent_blankline_enabled = v:false
endif
let g:indent_blankline_char = '▏'
let g:indent_blankline_filetype_exclude = [
            \ 'help', 'yaml'
            \]

Plug 'nvim-lua/plenary.nvim'

Plug 'lewis6991/gitsigns.nvim'

Plug 'rktjmp/lush.nvim'

Plug 'mcchrish/zenbones.nvim'

Plug 'sainnhe/gruvbox-material'
call plug#end()

syntax enable
set termguicolors

runtime ./themeControl.vim

set cursorline

highlight Cursor guifg=white guibg=#cbd9e3
highlight iCursor guifg=white guibg=#3b8992
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set statusline=[\ %F\ ]\ %{fugitive#statusline()}%m%r%h%w%=[\ %{&ff}/%Y\ ]

set list
let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'

set tabstop=4 softtabstop=4 noet
set shiftwidth=4
autocmd BufRead,BufNewFile *.cs,*.h,*.cpp,*.scss,*.css,*.html,*.md setlocal tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set nocompatible
filetype plugin indent on
set encoding=UTF-8
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

noremap <C-t> :tabnew<Return>
noremap <S-e> gT
noremap <S-r> gt

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

noremap <space>s :setlocal spell! spell?<enter>

set spelllang=en_us,vi

command! Reload execute "source ~/.config/nvim/init.vim | !tmux source-file ~/.tmux.conf"

noremap ss :split<Return><C-w>w
noremap sv :vsplit<Return><C-w>w

map <silent> <Right> <C-w><
map <silent> <Down> <C-W>-
map <silent> <Up> <C-W>+
map <silent> <Left> <C-w>>

noremap cd. :cd %:h<enter>
noremap cd :cd<enter>

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u

vnoremap J :m '>+1<enter>gv=gv
vnoremap K :m '<-2<enter>gv=gv

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap gj j
nnoremap gk k

noremap gx :silent execute "!xdg-open " . "<cfile>"<enter>

nnoremap <leader>w :w<enter>
nnoremap <leader>q :q<enter>
nnoremap <leader>o :wq<enter>
nnoremap Q :qa!<enter>

noremap H :cp<enter>
noremap L :cn<enter>

function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

command! OpenFileInBraveBrowser execute "!brave-browser '%'"
command! NumberLine execute "set number relativenumber"
command! NumberLineOff execute "set number! relativenumber!"

nmap <leader>x :!xdg-open '%'<cr><cr>

nmap gf :edit <cfile><cr>

imap ;; <esc>A;<enter>
imap ;, <esc>A,<enter>

imap <S-CR> <esc>o
nnoremap <CR> o<esc>
nnoremap <S-CR> O<esc>
