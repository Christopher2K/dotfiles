return {
  "echasnovski/mini.pick",
  version = "*",
  dependencies = {
    { "echasnovski/mini.extra", version = "*" },
  },
  keys = {
    { "<leader>ff", "<cmd>Pick files<cr>",      desc = "Find file" },
    { "<leader>fg", "<cmd>Pick grep_live<cr>",  desc = "Search grep" },
    { "<leader>fd", "<cmd>Pick diagnostic<cr>", desc = "Find diagnostics" },
  },
  config = function()
    local pick = require("mini.pick")
    pick.setup()
    local extra = require("mini.extra")
    extra.setup()
  end,
}
