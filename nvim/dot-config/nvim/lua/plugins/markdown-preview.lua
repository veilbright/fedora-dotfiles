if not vim.g.vscode then
	return {
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown", "PlantUML" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		keys = {
			{
				"<leader>mp",
				"<cmd>MarkdownPreview<cr>",
				desc = "Markdown Preview",
			},
			{
				"<leader>mt",
				"<cmd>MarkdownPreviewStop<cr>",
				desc = "Markdown Preview Stop",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
			-- vim.cmd('let g:mkdp_browser="/usr/bin/firefox"')
			vim.cmd("let g:mkdp_filetypes=['markdown', 'PlantUML']")
		end,
	}
else
	return {}
end
