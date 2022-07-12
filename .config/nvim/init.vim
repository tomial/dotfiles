" vim/nvim shared config
source ~/.vimrc

lua require('init')

set clipboard+=unnamedplus

" neovide config
let g:neovide_cursor_antialiasing=v:true
let g:neovide_remember_window_size=v:true
let g:neovide_refresh_rate=60

set guifont=Iosevka:h20
