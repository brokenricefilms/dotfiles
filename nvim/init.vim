call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set hidden
set shortmess+=c
set signcolumn=yes
set updatetime=100
let g:coc_global_extensions = [
            \ "coc-snippets",
            \ "coc-css",
            \ "coc-diagnostic",
            \ "coc-prettier",
            \ "coc-dot-complete",
            \ "coc-dash-complete",
            \ "coc-deno",
            \ "coc-sh",
            \ "coc-go",
            \ "coc-eslint",
            \ "coc-omnisharp",
            \ "coc-html",
            \ "coc-htmlhint",
            \ "coc-html-css-support",
            \ "coc-emmet",
            \ "coc-sql",
            \ "coc-clangd",
            \ "coc-tsserver",]

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> ]d :call CocAction('diagnosticNext')<cr>
nmap <silent> [d :call CocAction('diagnosticPrevious')<cr>

noremap <silent> <Leader>; :CocCommand<enter>

Plug 'djoshea/vim-autoread'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

inoremap <expr> <c-f><c-w> fzf#vim#complete#word()
noremap <leader>f :Files<enter>
noremap <leader>F :Files ~<enter>
noremap <leader>k :Buffers<enter>
noremap <leader>j :Rg<enter>
noremap <leader>h :History<enter>
noremap ; :Commands<enter>
noremap // :BLines<enter>
noremap gc :cd %:h <enter>:BCommits<enter>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
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

Plug 'ferrine/md-img-paste.vim'
let g:mdip_imgdir = '.'
autocmd FileType markdown noremap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<enter>

Plug 'phaazon/hop.nvim'
map f :HopChar1<enter>
noremap f :HopChar1<enter>

Plug 'wellle/tmux-complete.vim'

Plug 'jdhao/better-escape.vim'
let g:better_escape_interval = 200
let g:better_escape_shortcut = ['jk', 'jj', 'kj', 'kk']

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType xhtml,html,css,markdown EmmetInstall

Plug 'AndrewRadev/tagalong.vim'
let g:tagalong_filetypes = ['eco', 'eelixir', 'ejs', 'eruby', 'html', 'xhtml', 'htmldjango', 'javascriptreact', 'jsx', 'php', 'typescriptreact', 'xml']

Plug 'leafOfTree/vim-matchtag'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

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

set statusline=%F\ %{fugitive#statusline()}%m%r%h%w%=(%{&ff}/%Y)

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set tabstop=4 softtabstop=4 noet
set shiftwidth=4
autocmd BufRead,BufNewFile *.cs,*.h,*.cpp,*.scss,*.css,*.html,*.md setlocal tabstop=2 shiftwidth=2 softtabstop=2
set expandtab

set number relativenumber

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
set nowritebackup

set inccommand=split
set scrolloff=5

nnoremap + <C-a>
nnoremap - <C-x>

vmap < <gv
vmap > >gv

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

command! Reload execute "source ~/.config/nvim/init.vim"

noremap ss :split<Return><C-w>w
noremap sv :vsplit<Return><C-w>w

map <silent> <Right> <C-w><
map <silent> <Down> <C-W>-
map <silent> <Up> <C-W>+
map <silent> <Left> <C-w>>

noremap cd. :cd %:h<enter>
noremap cd :cd<enter>

noremap Y y$

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

command! OpenFileInDefaultApp execute "!xdg-open '%'"
command! OpenFileInBraveBrowser execute "!brave-browser '%'"
