return {
  "lukas-reineke/indent-blankline.nvim", -- Indentation and blankline indicator
  tag = "v3.2.4",
  config = function()
    local ibl = require("ibl")
    ibl.setup()
  end,
}
