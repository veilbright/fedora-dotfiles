if not vim.g.vscode then
	vim.cmd([[
		colorscheme modus
		hi NeoTreeNormal guibg=hl-Normal
		hi NeoTreeNormalNC guibg=hl-NormalNC
		hi Visual guibg=#264f78 guifg=none
	]])
end
