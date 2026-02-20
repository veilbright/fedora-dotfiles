vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 500 -- swap
vim.opt.timeoutlen = 300 -- keymaps

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0   -- uses tabstop
vim.opt.softtabstop = -1 -- uses shiftwidth
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Visual
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.list = true
-- vim.opt.cmdheight = vim.g.vscode and 1 or 0
vim.opt.colorcolumn = { 80 }
vim.opt.pumheight = 1 -- completions column height
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "_" }
vim.opt.numberwidth = 1

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "1"
vim.opt.fillchars = {
	foldopen = "⋅",
	foldclose = "-",
	foldsep = " ",
	fold = " ",
}
function _G.foldtext()
	local num_lines = vim.v.foldend - vim.v.foldstart + 1
	return vim.fn.getline(vim.v.foldstart)
			.. " ── "
			.. num_lines
			.. " Lines ("
			.. vim.v.foldstart
			.. " - "
			.. vim.v.foldend
			.. ")"
end

-- vim.opt.foldtext = "v:lua.foldtext()"
vim.opt.foldtext = ""

-- Signs
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
})

-- Mouse
vim.opt.mousescroll = "ver:10,hor:4"
