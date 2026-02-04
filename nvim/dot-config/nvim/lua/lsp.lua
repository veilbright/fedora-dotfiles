vim.lsp.config["lua_ls"] = {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
	filetypes = { "lua" },
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
}

vim.lsp.config["clangd"] = {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" },
	filetypes = { "cpp" },
}

vim.lsp.enable("gdscript")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
