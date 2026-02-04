vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions = "jcrql"
	end,
})
