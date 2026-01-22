return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			default_file_explorer = not Netrw, -- If Netrw is true, set default_file_explorer to false
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return vim.endswith(name, ".uid")
				end,
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>")
	end,
}
