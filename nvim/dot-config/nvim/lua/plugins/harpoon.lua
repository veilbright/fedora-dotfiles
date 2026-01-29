if not vim.g.vscode then
	return {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local harpoon = require("harpoon")
			local conf = require("telescope.config").values

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Add Buffer to Harpoon List" })
			vim.keymap.set("n", "<leader>hh", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open Harpoon Menu" })

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Switch to Harpoon Buffer 1" })
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Switch to Harpoon Buffer 2" })
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Switch to Harpoon Buffer 3" })
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Switch to Harpoon Buffer 4" })
			vim.keymap.set("n", "<leader>5", function()
				harpoon:list():select(5)
			end, { desc = "Switch to Harpoon Buffer 5" })
			vim.keymap.set("n", "<leader>6", function()
				harpoon:list():select(6)
			end, { desc = "Switch to Harpoon Buffer 6" })
			vim.keymap.set("n", "<leader>7", function()
				harpoon:list():select(7)
			end, { desc = "Switch to Harpoon Buffer 7" })
			vim.keymap.set("n", "<leader>8", function()
				harpoon:list():select(8)
			end, { desc = "Switch to Harpoon Buffer 8" })
			vim.keymap.set("n", "<leader>9", function()
				harpoon:list():select(9)
			end, { desc = "Switch to Harpoon Buffer 9" })

			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>hf", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open Harpoon Menu in Telescope" })
		end,
	}
else
	return {}
end
