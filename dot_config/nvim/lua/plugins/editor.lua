return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
      signs = {
        add = { text = "▎", hl = "GitSignsAdd" },
        change = { text = "▎", hl = "GitSignsChange" },
        delete = { text = "", hl = "GitSignsDelete" },
        topdelete = { text = "", hl = "GitSignsDelete" },
        changedelete = { text = "▎", hl = "GitSignsChange" },
        untracked = { text = "▎", hl = "GitSignsAdd" },
      },
      signs_staged = {
        add = { text = "▎", hl = "GitSignsStagedAdd" },
        change = { text = "▎", hl = "GitSignsStagedChange" },
        delete = { text = "", hl = "GitSignsStagedDelete" },
        topdelete = { text = "", hl = "GitSignsStagedDelete" },
        changedelete = { text = "▎", hl = "GitSignsStagedChange" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      current_line_blame = false,
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
      end,
    },
  },
  {
    "ggandor/leap.nvim",
    url = "https://codeberg.org/andyg/leap.nvim",
    event = "VeryLazy",
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      sign = {
        enabled = true,
      },
      float = {
        enabled = false,
      },
      autocmd = { enabled = true },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    opts = {
      color_square_width = 2,
    },
  },
  {
    "tpope/vim-fugitive",
  }
}
