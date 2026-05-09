return {
  "folke/trouble.nvim",
  opts = {
    focus = true,
    modes = {
      cascade = {
        mode = "diagnostics",
        filter = function(items)
          local severity = vim.diagnostic.severity.HINT
          for _, item in ipairs(items) do
            severity = math.min(severity, item.severity)
          end
          return vim.tbl_filter(function(item)
            return item.severity == severity
          end, items)
        end,
      },
      project = {
        mode = "diagnostics", -- inherit from diagnostics mode
        filter = {
          any = {
            buf = 0,                             -- current buffer
            {
              severity = vim.diagnostic.severity.ERROR, -- errors only
              -- limit to files in the current project
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("trouble").setup(opts)
    vim.api.nvim_set_hl(0, "TroubleNormal", { link = "NormalFloat" })
  end,

  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble cascade toggle<cr>",
      desc = "Toggle diagnostics",
    },
    {
      "<leader>xc",
      "<cmd>Trouble project toggle<cr>",
      desc = "Toggle project diagnostics",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
