return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle reveal position=float<cr>", desc = "Toggle Neotree" },
  },
  opts = {
    enable_diagnostics = false,
    enable_git_status = false,
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
}
