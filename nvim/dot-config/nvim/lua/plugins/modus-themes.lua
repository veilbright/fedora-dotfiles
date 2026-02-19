if not vim.g.vscode then
	return {
		"miikanissi/modus-themes.nvim",
		lazy = false,
		priority = 1000,
		opts = { line_nr_column_background = false },
		init = function()
			vim.cmd([[colorscheme modus]])
			vim.api.nvim_set_hl(0, "Visual", { bg = "#264f78" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#000000" })
		end,
	}
else
	return {}
end
