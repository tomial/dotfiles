return {
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- Conform will run the first available formatter
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "gofmt" },
        vue = { "prettier", "prettierd" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        json = { "biome" },
        css = { "biome" }
      },
      format_on_save = function(bufnr)
        -- 跳过以下文件类型的自动格式化
        local disable_filetypes = { "c" }
        if vim.tbl_contains(disable_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return {
          -- 建议设置 500ms 或 2000ms，避免保存时卡顿
          timeout_ms = 500,
          -- 关键设置：如果当前文件类型没有配置 formatter，是否尝试使用 LSP (如 tsserver/lua_ls)
          lsp_fallback = true,
        }
      end,
    }
  }
}
