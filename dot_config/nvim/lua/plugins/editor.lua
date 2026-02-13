return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
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
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  }
}
