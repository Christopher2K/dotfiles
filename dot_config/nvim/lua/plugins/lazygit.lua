return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<CMD>LazyGit<CR>", desc = "Open LazyGit" },
  },
  config = true
}
