return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '󰠠',
          [vim.diagnostic.severity.INFO] = '',
        }
      },
      severity_sort = true,
      virtual_text = { prefix = '●' },
    })
    vim.lsp.config.clangd = require("lsp.clangd")
    vim.lsp.enable("clangd")
  end
}

