return {
  "ellisonleao/carbon-now.nvim",
  lazy = true,
  cmd = "CarbonNow",
  keys = {
    { "<leader>cn", "<cmd>CarbonNow<cr>", desc = "Screenshot selection", mode = "v" },
  },
  config = function()
    local carbon = require('carbon-now')
    carbon.setup({
      open_cmd = "open",
      options = {
        theme = "solarized",
        font_family = "Droid Sans Mono",
      }
    })
  end
}
