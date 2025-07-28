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
vim.opt.shiftwidth = 0 -- uses tabstop
vim.opt.softtabstop = -1 -- uses shiftwidth
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Visual
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.pumheight = 1 -- completions column height
vim.opt.scrolloff = 10
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "_"}
