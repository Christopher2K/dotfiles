return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({})

    vim.o.background = "light"
    vim.cmd("colorscheme gruvbox")
  end
}
