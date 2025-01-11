return {
  "stevearc/aerial.nvim",
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Toggle Aerial" },
  },
  config = {
    layout = {
      width = 0.25,
      max_width = 0.25,
      min_width = 0.25,

      placement = "edge",
    },
    attach_mode = "global",
  },
}
