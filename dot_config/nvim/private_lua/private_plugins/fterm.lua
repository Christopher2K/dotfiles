return {
  "numToStr/FTerm.nvim",
  commit = "d1320892cc2ebab472935242d9d992a2c9570180",
  keys = {
    { "`", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle terminal" },
    { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t", desc = "Toggle terminal" },
    -- { "<ESC><ESC>", "<C-\\><C-n>", mode = "t", desc = "Terminal normal mode" },
  },
}
