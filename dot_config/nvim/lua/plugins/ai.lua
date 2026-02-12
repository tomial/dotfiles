vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat<CR>")
vim.keymap.set("v", "<leader>cc", ":'<,'>CodeCompanionChat Add<CR>", { desc = "Add selection to chat" })
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
    },
    opts = {
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "TRACE", -- or "TRACE"
        language = "中文"
      },
      interactions = {
        chat = {
          adapter = {
            name = "claude_code",
            model = "MiniMax-M2.1",
          }
        },
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = "gda" }, -- Remember this as DiffAccept
            },
            reject_change = {
              modes = { n = "gdr" }, -- Remember this as DiffReject
            },
            always_accept = {
              modes = { n = "gdy" }, -- Remember this as DiffYolo
            },
          },
        }
      },
      adapters = {
        claude_code = "acp", -- Claude Code (ACP 协议)
      },
      display = {
        diff = {
          enabled = true,
          provider = "float"
        }
      }
    }
  }
}
