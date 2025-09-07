return {
	"folke/which-key.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		preset = "helix",
		replace = {
			desc = {
				{ "<Plug>%(?(.*)%)?", "%1" },
				{ "^%+",              "" },
				{ "<[cC]md>",         "" },
				{ "<[cC][rR]>",       "" },
				{ "<[sS]ilent>",      "" },
				{ "^lua%s+",          "" },
				{ "^call%s+",         "" },
				{ "^:%s*",            "" },
				{ "^",                " " }, -- add a space at the start of the description
			},
		},
		icons = {
			rules = {
				{ pattern = "grep", icon = "󰱼 ", color = "green" },
				{ pattern = "swap", icon = " ", color = "yellow" },
				{ pattern = "run", icon = " ", color = "green" },
				{ pattern = "todo", icon = " ", color = "blue" },
				{ pattern = "undo", icon = " ", color = "yellow" },
				{ pattern = "explorer", icon = " ", color = "yellow" },
			},
		},
	},
}
