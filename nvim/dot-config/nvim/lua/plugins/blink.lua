if not vim.g.vscode then
	return {
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip" },
		version = "v1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = { auto_show = false },
				menu = { max_height = 5 },
			},

			snippets = { preset = "luasnip" },

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	}
else
	return {}
end
