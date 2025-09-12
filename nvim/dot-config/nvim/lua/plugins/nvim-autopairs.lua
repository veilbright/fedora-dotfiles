if not vim.g.vscode then
	return {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local rule = require("nvim-autopairs.rule")
			local npairs = require("nvim-autopairs")

			npairs.setup({})
			npairs.add_rules({
				rule("$", "$", { "tex", "latex" }),
			})
		end,
	}
else
	return {}
end
