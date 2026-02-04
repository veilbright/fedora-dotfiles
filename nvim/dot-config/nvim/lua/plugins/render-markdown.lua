if not vim.g.vscode then
	return {
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		init = function()
			vim.keymap.set("n", "<leader>mm", function()
				require("render-markdown").toggle()
			end, { desc = "Toggle Markdown" })
			vim.keymap.set("n", "<leader>ma", function()
				require("render-markdown").expand()
			end, { desc = "Expand Markdown Context" })
			vim.keymap.set("n", "<leader>mx", function()
				require("render-markdown").contract()
			end, { desc = "Contract Markdown Context" })
		end,
	}
else
	return {}
end
