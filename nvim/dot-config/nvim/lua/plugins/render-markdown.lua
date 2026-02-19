if not vim.g.vscode then
	return {
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },

		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			overrides = {
				buftype = {
					nofile = {
						render_modes = true,
						sign = { enabled = false },
						anti_conceal = { enabled = false },
					},
				},
			},
		},

		init = function()
			vim.keymap.set("n", "<leader>mm", function()
				require("render-markdown").toggle()
			end, { desc = "Toggle Markdown" })

			-- TODO: Create anti_conceal toggle
			-- vim.keymap.set("n", "<leader>mc", function()
			-- 	require("render-markdown").setup({ anti_conceal = { enabled = true } })
			-- end)

			vim.keymap.set("n", "<leader>ma", function()
				for _ = 0, vim.v.count do
					require("render-markdown").expand()
				end
			end, { desc = "Expand Markdown Context" })

			vim.keymap.set("n", "<leader>mx", function()
				for _ = 0, vim.v.count do
					require("render-markdown").contract()
				end
			end, { desc = "Contract Markdown Context" })
		end,
	}
else
	return {}
end
