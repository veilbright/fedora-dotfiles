if not vim.g.vscode then
	return {
		"mbbill/undotree",
		init = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })
		end,
	}
else
	return {}
end
