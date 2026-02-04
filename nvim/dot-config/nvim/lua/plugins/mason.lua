if not vim.g.vscode then
	return {
		"mason-org/mason.nvim",
		opts = {},
		-- "mason-org/mason-lspconfig.nvim",
		-- dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
		-- opts = {
		-- 	ensure_installed = { "clangd", "lua_ls", "stylua", "typos_lsp" },
		-- },
	}
else
	return {}
end
