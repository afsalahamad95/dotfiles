vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- Python (pyright)
vim.lsp.config("pyright", {})

vim.lsp.enable("gopls")
vim.lsp.enable("pyright")
