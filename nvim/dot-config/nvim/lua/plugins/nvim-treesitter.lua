if not vim.g.vscode then
	return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true,
			ignore_install = { "latex" },
			highlight = { enable = true },
			indent = { enable = true },
		},
	}
else
	return {}
end
