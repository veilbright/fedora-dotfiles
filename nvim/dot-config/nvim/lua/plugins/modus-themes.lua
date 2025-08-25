if not vim.g.vscode then
	return { "miikanissi/modus-themes.nvim", priority = 1000, opts={line_nr_column_background = false} }
else return {}
end
