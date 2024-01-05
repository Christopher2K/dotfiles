return {
  "numToStr/FTerm.nvim",
  enabled = true,
  commit = "d1320892cc2ebab472935242d9d992a2c9570180",
  main = "FTerm",
  keys = {
    { "`", '<CMD>lua require("FTerm").toggle()<CR>',            desc = "Open terminal" },
    { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t",            desc = "Close terminal" },
  },
}
