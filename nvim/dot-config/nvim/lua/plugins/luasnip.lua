if not vim.g.vscode then
	return {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp",
		opts = {},
		init = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	}
else
	return {}
end
