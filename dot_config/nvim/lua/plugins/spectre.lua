return {
  -- Utils for workspace wide search and replace, use with :Spectre
  "nvim-pack/nvim-spectre",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  main = "spectre",
  opts = {
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = {
          "-i",
          "",
          "-E",
        },
      },
    },
  }
}
