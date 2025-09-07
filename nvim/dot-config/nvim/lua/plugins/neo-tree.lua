if not vim.g.vscode then
	return {
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		branch = "v3.x",
		lazy = false,

		config = function()
			local filtered_items = {}

			if Godot then
				filtered_items = { hide_by_pattern = { "*.[^gd]*", "*.godot" } }
			end

			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "",
				open_files_using_relative_paths = true,
				default_component_configs = { indent = { indent_size = 1, padding = 0 } },
				window = { position = "right", width = 30 },
				filesystem = { follow_current_file = { enabled = true }, filtered_items = filtered_items },
			})

			vim.keymap.set({ "n", "v" }, "<leader>e", "<CMD>Neotree toggle<CR>", { desc = "Toggle file explorer" })
		end,
	}
else
	return {}
end
