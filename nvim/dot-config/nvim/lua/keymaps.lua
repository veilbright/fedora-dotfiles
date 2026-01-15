vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Hide search highlight" })
vim.keymap.set("n", "<leader><leader>", "@q", { desc = "Run q macro" })
vim.keymap.set("n", "<leader>G", "<cmd>%normal @q<CR>", { desc = "Run q macro until end of file" })
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })
vim.keymap.set("n", "<leader>o", "o<Esc>")

-- Buffer navigation
vim.keymap.set("n", "<C-a>", "<cmd>bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-s>", "<cmd>bn<CR>", { desc = "Next buffer" })

-- Window focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

-- LSP
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "grf", "<cmd> lua vim.lsp.buf.format({ async = false })<CR>", { desc = "Code Format" })

-- Find and replace
vim.keymap.set({ "n", "v" }, "<leader>s", function()
	vim.api.nvim_feedkeys("*", "v", true)
	vim.api.nvim_feedkeys(":%s//", "n", true)
end, { desc = "Find and replace" })

-- Clipboard management
vim.keymap.set({ "n", "v" }, "d", '"1d', {})
vim.keymap.set({ "n", "v" }, "x", '"1x', {})
vim.keymap.set({ "n", "v" }, "c", '"1c', {})
vim.keymap.set({ "n", "v" }, "s", '"1s', {})
vim.keymap.set({ "n", "v" }, "<leader>p", function()
	local reg1 = vim.fn.getreginfo("1")
	local reg_plus = vim.fn.getreginfo("+")
	vim.fn.setreg("1", reg_plus)
	vim.fn.setreg("+", reg1)
end, { desc = "Swap system and neovim registers" })

-- Toggle quickfix
vim.keymap.set({ "n", "v" }, "<leader>q", function()
	if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.loclist")) == 0 then
		vim.cmd("lclose")
		-- needs to be 2nd, the loclist is a quickfix
	elseif vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 0 then
		vim.cmd("cclose")
	else
		vim.diagnostic.setloclist()
	end
end, { desc = "Toggle quickfix" })

-- Quickfix navigation
vim.keymap.set({ "n", "v" }, "<leader>cn", function()
	if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.loclist")) == 0 then
		vim.cmd("lnext")
		-- needs to be 2nd, the loclist is a quickfix
	elseif vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 0 then
		vim.cmd("cnext")
	end
end, { desc = "Next loc" })
vim.keymap.set({ "n", "v" }, "<leader>cp", function()
	if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.loclist")) == 0 then
		vim.cmd("lprevious")
		-- needs to be 2nd, the loclist is a quickfix
	elseif vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 0 then
		vim.cmd("cprevious")
	end
end, { desc = "Previous loc" })
