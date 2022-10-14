call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" search stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'

" [NVIM ONLY Lua Plugins ]
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
" [ END ]

Plug 'machakann/vim-sandwich'

" Themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Avaialble options:
" tokyonight
" tokyonight-night
" tokyonight-storm
" tokyonight-day
" tokyonight-moon
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'joshdick/onedark.vim', { 'branch': 'main' }
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'arcticicestudio/nord-vim', { 'branch': 'main' }
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'

Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'raimondi/delimitmate'

Plug 'mattn/emmet-vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" HTML live preview
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()

""" EDITOR_SETTINGS
" basic configs
syntax on
language zh_CN.UTF-8
set encoding=UTF-8
set number
set mouse=a
filetype on
filetype plugin on
filetype indent on

" On pressing tab, insert 2 spaces
set expandtab
set tabstop=2 " tab = 2 space
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width

autocmd Filetype c setlocal ts=4 sw=4 sts=4 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 sts=4 expandtab

" fix tmux color issue
 if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
endif

source $HOME/.vim/themes.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/keymap.vim
source $HOME/.vim/coc.vim
