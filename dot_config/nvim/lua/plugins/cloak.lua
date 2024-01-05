return {
  "laytan/cloak.nvim",
  commit = "ff5e746e787de14675396beb642bf5010b8bc96d",
  opts = {
    enabled = true,
    cloak_character = "*",
    patterns = { { file_pattern = ".env*", cloak_pattern = "=.+" } },
  },
}
