return {
  "numToStr/FTerm.nvim",
  keys = {
    { "`", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle terminal" },
    { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Toggle terminal" },
    -- { "<ESC><ESC>", "<C-\\><C-n>", mode = "t", desc = "Terminal normal mode" },
  },
}
