-- daily shortcut
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bd!<CR>", { silent = true })
vim.keymap.set("n", "<leader>N", ":noh<CR>", { silent = true })

-- fzf
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>fF", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>rg", ":FzfLua live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>bb", ":FzfLua buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", ":FzfLua helptags<CR>", { silent = true })
vim.keymap.set("n", "<leader>sb", ":FzfLua lines<CR>", { silent = true })
vim.keymap.set("n", "<leader>fs", ":FzfLua lsp_live_workspace_symbols<CR>", { silent = true })
vim.keymap.set('n', '<leader>ww', '<C-w>o', { desc = 'Maximize current window' })
vim.keymap.set("n", "<leader>ca", ":FzfLua lsp_code_actions<CR>", { silent = true })
vim.keymap.set("n", "gd", ":FzfLua lsp_definitions<CR>", { silent = true })
vim.keymap.set("n", "gi", ":FzfLua lsp_implementations<CR>", { silent = true })
vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>", { silent = true })
-- 基础跳转：在 Normal、Visual、Operator-pending 模式下使用 s/S
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
vim.keymap.set("n", "<leader>o", function()
  local path
  -- Check if we're in nvim-tree and get the node under cursor
  local ok, api = pcall(require, "nvim-tree.api")
  if ok then
    local node = api.tree.get_node_under_cursor()
    if node and node.absolute_path then
      path = node.absolute_path
    end
  end
  -- Fallback: use current buffer's directory
  if not path then
    path = vim.fn.expand("%:p:h")
  end
  -- If path is a file, open its parent directory; if it's a directory, open it directly
  if vim.fn.isdirectory(path) == 0 then
    path = vim.fn.fnamemodify(path, ":h")
  end
  vim.ui.open(path)
end, { desc = "Open selected file/folder's directory in finder" })

-- create format command
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
