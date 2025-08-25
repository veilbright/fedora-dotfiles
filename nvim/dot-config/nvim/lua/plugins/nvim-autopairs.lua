if not vim.g.vscode then return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
}
else return {}
end
