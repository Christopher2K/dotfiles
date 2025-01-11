return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<CMD>Outline<CR>", desc = "Toggle Outline" },
  },
  config = {
    position = "right",
    split_command = "25vsp",
  },
}
