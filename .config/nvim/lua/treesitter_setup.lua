require('nvim-treesitter.configs').setup {
    enable = true,
    ensure_installed = 'all',
    ignore_install = {'phpdoc'},
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    }
}
