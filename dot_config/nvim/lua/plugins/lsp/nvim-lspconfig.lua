return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- 注册 c3 文件类型
			vim.filetype.add({
				extension = {
					c3 = "c3",
					c3i = "c3",
					c3t = "c3",
				},
			})
			
			vim.lsp.config("*", {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			})
			
			-- c3-lsp 不在 mason-lspconfig 支持列表中，需要手动自动启动
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c3", "c3i", "c3t" },
				callback = function()
					vim.lsp.enable("c3_lsp")
				end,
				desc = "Auto-start c3 LSP server",
			})
		end,
	},
}
