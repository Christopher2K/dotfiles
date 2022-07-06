local ok, configs = pcall(require, "nvim-treesitter.configs")

if ok then
    configs.setup({
        enable = true,
        ensure_installed = 'all',
        ignore_install = {'phpdoc'},
        highlight = {enable = true},
        indent = {enable = false},
        autotag = {enable = true}
    })
end
