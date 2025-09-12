if not vim.g.vscode then
	return {
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					component_separators = "│",
					section_separators = "",
				},
				sections = { lualine_c = { { "filename", path = 1 } } },
			})
		end,
	}
else
	return {}
end
