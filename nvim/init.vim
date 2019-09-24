call plug#begin()
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
call plug#end()            

set nu

set clipboard=unnamedplus

syntax enable
syntax on

set mouse=a

set autoread
set autowrite

set nobackup
set nowb
set noswapfile

set ts=4 sw=4

let g:user_emmet_leader_key=','

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

:imap jj <Esc>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

