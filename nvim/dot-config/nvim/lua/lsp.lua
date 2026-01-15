vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = _VERSION,
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
})

vim.lsp.enable("gdscript")
vim.lsp.enable("clangd")
