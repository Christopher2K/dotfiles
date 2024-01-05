return {
  "nvim-neo-tree/neo-tree.nvim",
  tag = "3.14",
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle position=float<cr>", desc = "Toggle Neotree" },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
}
