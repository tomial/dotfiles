vim.keymap.set("n", "<leader>cca", ":CodeCompanionActions<CR>")
vim.keymap.set("n", "<leader>cc", ":CodeCompanion<CR>")
vim.keymap.set("n", "<leader>ccc", ":CodeCompanionChat<CR>")
vim.keymap.set("v", "<leader>ca", ":'<,'>CodeCompanionChat Add<CR>", { desc = "Add selection to chat" })
vim.keymap.set("v", "<leader>cc", ":'<,'>CodeCompanion<CR>")
vim.keymap.set("n", "<leader>pi", ":PasteImage<CR>")

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 200,
        keymap = {
          accept = "<TAB>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<Esc>",
        },
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "HakonHarnes/img-clip.nvim",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" }
      }
    },
    opts = {
      opts = {
        log_level = "TRACE",
        language = "Simplified Chinese 简体中文"
      },
      interactions = {
        chat = {
          adapter = {
            name = "claude_code",
            model = "MiniMax-M2.5",
          },
        },
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = "ccy" }, -- Remember this as DiffAccept
            },
            reject_change = {
              modes = { n = "ccn" }, -- Remember this as DiffReject
            },
            always_accept = {
              modes = { n = "cca" }, -- Remember this as DiffYolo
            },
          },
        }
      },
      adapters = {
        claude_code = "acp",
      },
    }
  }
}
