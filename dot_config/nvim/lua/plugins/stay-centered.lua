return {
  "arnamak/stay-centered.nvim",
  lazy = false,
  main = 'stay-centered',
  opts = {
    enabled = false
  },
  keys = {
    { "<leader>st", '<CMD>lua require("stay-centered").toggle()<CR>', desc = "Enable / Disabled centered mode" },
  },
}
