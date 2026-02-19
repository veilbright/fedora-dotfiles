if not vim.g.vscode then
	return {
		"kevinhwang91/nvim-bqf",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { auto_resize_height = true, preview = { win_height = 999 } },
	}
else
	return {}
end
