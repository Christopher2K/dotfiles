return {
  "nvim-treesitter/nvim-treesitter",
  commit = "0da349ed303bea955942f409d29059cdb89dbe2c",
  dependencies = {
    { "windwp/nvim-ts-autotag", commit = "8515e48a277a2f4947d91004d9aa92c29fdc5e18" },
  },
  main = "nvim-treesitter.configs",
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "css",
      "html",
      "elixir",
      "php",
      "go",
      "rust",
      "jsdoc",
      "json",
      "markdown",
      "sql",
      "toml",
      "yaml",
      "tsx",
      "vue",
      "svelte",
      "zig",
    },
    highlight = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
