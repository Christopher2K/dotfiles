return {
  "catppuccin/nvim",
  tag = "v1.6.0",
  lazy = false,
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "mocha",
      transparent_background = false,
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
