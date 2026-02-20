if not vim.g.vscode then
	return {
		"Bekaboo/deadcolumn.nvim",
		opts = {
			warning = {
				offset = 160,
			}
		}
	}
else
	return {}
end
