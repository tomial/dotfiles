return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"vue",
	},
	exclude = { "node_modules" },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "in node_modules",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
}
