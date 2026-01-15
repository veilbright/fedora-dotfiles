if not vim.g.vscode then
	return {
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "bottom_pane",
				},
			})

			local builtin = require("telescope.builtin")

			require("telescope").load_extension("fzy_native")

			-- Set pickers
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help" })

			-- Godot specific overwrites
			if not Godot then
				vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
				vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
			else
				vim.keymap.set("n", "<leader>fF", builtin.find_files, { desc = "Find files" })
				vim.keymap.set("n", "<leader>ff", function()
					builtin.find_files({
						find_command = {
							"rg",
							"--files",
							"--glob=*.gd",
						},
					})
				end, { desc = "Find GDScript files" })

				vim.keymap.set("n", "<leader>fG", builtin.find_files, { desc = "Grep files" })
				vim.keymap.set("n", "<leader>fg", function()
					builtin.live_grep({ glob_pattern = "*.gd" })
				end, { desc = "Grep GDScript files" })
			end
		end,
	}
else
	return {}
end
