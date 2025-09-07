return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	init = function()
		vim.keymap.set("n", "<leader>fd", function()
			vim.cmd("TodoTelescope")
		end, { desc = "Find todo" })
	end,
}
