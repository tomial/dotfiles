" vim/nvim shared config
source ~/.vimrc
source $HOME/.config/nvim/keymaps.vim

lua require('init')

set clipboard+=unnamedplus

" neovide config
let g:lightline = {'colorscheme': 'tokyonight'}
let g:neovide_cursor_antialiasing=v:true
let g:neovide_remember_window_size=v:true
let g:neovide_refresh_rate=60
let g:neovide_input_macos_alt_is_meta=v:true
let g:neovide_scroll_animation_length = 0.1
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0
let g:neovide_transparency=0.8

set guifont=JetBrainsMono\ NF:h18
