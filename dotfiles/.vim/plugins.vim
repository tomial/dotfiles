if !has('nvim')
  call wilder#setup({'modes': [':', '/', '?']})
endif

" sneak label
let g:sneak#label = 1

" GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:fzf_preview_window = ['hidden,right,40%', 'ctrl-\']
