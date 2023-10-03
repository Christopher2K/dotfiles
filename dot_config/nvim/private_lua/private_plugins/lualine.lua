return {
  "nvim-lualine/lualine.nvim",
  commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63",

  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "%f", color = { gui = "bold" } } },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "fileformat", "filetype" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
