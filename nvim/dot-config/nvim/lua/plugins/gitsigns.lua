return {
	"lewis6991/gitsigns.nvim",
	cond = not vim.g.vscode,
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "╮" },
				topdelete = { text = "╯" },
				changedelete = { text = "⋅" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "╮" },
				topdelete = { text = "╯" },
				changedelete = { text = "⋅" },
				untracked = { text = "┆" },
			},
		})
		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticOk" }).fg })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" }).fg })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg })
	end,
}
