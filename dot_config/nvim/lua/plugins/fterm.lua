return {
  "numToStr/FTerm.nvim",
  enabled = true,
  main = "FTerm",
  keys = {
    { "`", '<CMD>lua require("FTerm").toggle()<CR>',            desc = "Open terminal" },
    { "`", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = "t",            desc = "Close terminal" },
  },
}
