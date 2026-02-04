if not vim.g.vscode then
	return {
		"yorickpeterse/nvim-pqf",
		opts = {
			signs = {
				error = { text = " " },
				warning = { text = " " },
				info = { text = " " },
				hint = { text = " " },
			},
		},
	}
end
