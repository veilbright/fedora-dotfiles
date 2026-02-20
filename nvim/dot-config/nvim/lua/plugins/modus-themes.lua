return {
	"miikanissi/modus-themes.nvim",
	lazy = false,
	cond = not vim.g.vscode,
	priority = 1000,
	opts = { line_nr_column_background = false },
	init = function()
		vim.cmd([[colorscheme modus]])
		vim.api.nvim_set_hl(0, "Visual", { bg = "#264f78" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#000000" })
		vim.api.nvim_set_hl(0, "FoldClosed", { fg = "#d0bc00" })
		vim.api.nvim_set_hl(0, "Folded", {link = "Normal"})
		vim.api.nvim_set_hl(0, "QuickFixLine", { link = "Visual"})
		vim.api.nvim_set_hl(0, "FoldColumn", {
			fg = vim.api.nvim_get_hl(0, { name = "LineNrAbove" }).fg,
			bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
		})
	end,
}
