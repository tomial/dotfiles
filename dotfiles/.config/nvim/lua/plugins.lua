require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "l", action = "edit" },
        { key = "h", action = "close_node" }
      }, 
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require("nvim-autopairs").setup {}

require("toggleterm").setup {
  direction = 'float',
  float_opts = {
    border = 'curved'
  }
}

local wilder = require('wilder')
wilder.setup({ modes = {':', '/', '?'} })
wilder.set_option('renderer', wilder.wildmenu_renderer(
  -- use wilder.wildmenu_lightline_theme() if using Lightline
  wilder.wildmenu_lightline_theme({
    -- highlights can be overriden, see :h wilder#wildmenu_renderer()
    highlights = {default = 'StatusLine'},
    highlighter = wilder.basic_highlighter(),
    separator = ' · ',
  })
))
