return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  enabled = true,
  lazy = false,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({})

    vim.o.background = "light"
    vim.cmd("colorscheme gruvbox")
  end
}
