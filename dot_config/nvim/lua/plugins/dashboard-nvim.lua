return {
  -- Forked since I need to disable MRU
  "scottmckendry/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      config = {
        project = {
          enable = false,
        },
        mru = { enable = false }
      },
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
}
