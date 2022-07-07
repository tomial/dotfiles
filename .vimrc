call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-endwise'

Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'joshdick/onedark.vim', { 'branch': 'main' }
Plug 'bluz71/vim-moonfly-colors'

Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'

Plug 'raimondi/delimitmate'

Plug 'mattn/emmet-vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'arcticicestudio/nord-vim', { 'branch': 'main' }

Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" HTML live preview
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()

" EDITOR_SETTINGS "

" On pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

autocmd Filetype c setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 sts=4 expandtab

" when indenting with '>', use 2 spaces width
set shiftwidth=2

syntax on
set termguicolors 
set background=dark
set t_Co=256
let ayucolor="mirage"
let g:aquarium_style="dark"

let g:tokyonight_style='night' " available: night, storm
let g:tokyonight_enable_italic=1

let g:aqua_bold=1
let g:aqua_transparency=1

let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

colorscheme purify
" let g:airline_theme = "ayu"
" " aquarium options:
"   base16_aquarium_light
"   base16_aquarium_dark
let g:airline_theme='purify'

set number
" set ttymouse=xterm2
set mouse=a
" EDITOR_SETTINGS "
filetype on
filetype plugin on
filetype indent on

set encoding=UTF-8

" fix tmux color issue
 if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

" source $HOME/.vim/keymap.vim
source $HOME/.vim/coc.vim

" neovide config
let g:neovide_cursor_antialiasing=v:true
let g:neovide_remember_window_size=v:true
let g:neovide_refresh_rate=60

set guifont=Iosevka:h20
