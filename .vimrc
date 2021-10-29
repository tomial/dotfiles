call plug#begin('~/.vim/plugins')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-endwise'

Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'rakr/vim-one'

Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'
Plug 'kyoz/purify', { 'rtp': 'vim' }

" Plug 'jiangmiao/auto-pairs'
Plug 'raimondi/delimitmate'

Plug 'mattn/emmet-vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'arcticicestudio/nord-vim'

" HTML live preview
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

Plug 'wakatime/vim-wakatime'


call plug#end()

" EDITOR_SETTINGS "

" On pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

syntax on
set termguicolors 
set background=dark
let ayucolor="mirage"
let g:aquarium_style="light"
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:aqua_bold = 1
colorscheme purify
" let g:airline_theme = "ayu"
" " aquarium options:
"   base16_aquarium_light
"   base16_aquarium_dark
let g:airline_theme = "purify"


set number
" set ttymouse=xterm2
set mouse=a
" EDITOR_SETTINGS "
filetype on
filetype plugin on
filetype indent on

set encoding=UTF-8

" coc.nvim
source ~/.vim/coc.vim 
source ~/.vim/vim-go.vim

" fix tmux color issue
 if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

inoremap <silent> <CR> <C-r>=<SID>coc_confirm()<CR>
function! s:coc_confirm() abort
  if pumvisible()
    return coc#_select_confirm()
  else
    return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  endif
endfunction

" let &t_ut=''
