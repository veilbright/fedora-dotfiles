return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
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
