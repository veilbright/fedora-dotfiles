if not vim.g.vscode then
	return {
		"kevinhwang91/nvim-bqf",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("bqf").setup({
				auto_resize_height = true,
				preview = {
					winblend = 0,
				},
			})
			vim.api.nvim_set_hl(0, "BqfPreviewFloat", { link = "NormalFloat" })
			vim.api.nvim_set_hl(0, "BqfPreviewBorder", { link = "NormalFloat" })
			vim.api.nvim_set_hl(0, "BqfPreviewCursorLine", { bg = "#112436" })
			vim.api.nvim_set_hl(0, "BqfPreviewCursor", { link = "BqfPreviewBufLabel" })
		end,
	}
else
	return {}
end
