return {
  {
    "wadackel/vim-dogrun",
  },
  {
    "savq/melange-nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = true,
      auto_integrations = true,
    },
    config = function(_, opts)
      -- require("catppuccin").setup(opts)
      -- vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "oskarnurm/koda.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("koda").setup({ transparent = true })
      vim.cmd("colorscheme koda-moss")
    end,
  },
  {
    "rktjmp/lush.nvim",
    lazy = false,
    priority = 999,
    config = function()
      -- require('lush')(require('plugins.colors.cement'))
    end,
  }
}
