return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  priority = 1000,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      highlight = { enable = true },
    })
  end,
}

