return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "windwp/nvim-ts-autotag" },
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
      "gleam",
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
