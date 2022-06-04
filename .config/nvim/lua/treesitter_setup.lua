require('nvim-treesitter.configs').setup {
    enable = true,
    ensure_installed = 'all',
    ignore_install = {'phpdoc'},
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
    highlight = {
        enable = true
    }
}
