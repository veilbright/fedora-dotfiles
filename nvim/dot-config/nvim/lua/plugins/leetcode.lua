return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		-- include a picker of your choice, see picker section for more details
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		lang = "cpp",
		injector = {
			["python3"] = {
				imports = function(default_imports)
					vim.list_extend(default_imports, { "from .leetcode import *" })
					return default_imports
				end,
				after = { "def test():", "    print('test')" },
			},
			["cpp"] = {
				imports = function()
					-- return a different list to omit default imports
					return { "#include <bits/stdc++.h>", "using namespace std;" }
				end,
				after = "int main() {}",
			},
		},
	},
}
