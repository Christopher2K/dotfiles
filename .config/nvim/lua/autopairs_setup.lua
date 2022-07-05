local ok, autopairs = pcall(require, "nvim-autopairs")

if ok then
    autopairs.setup({disable_filetype = {"TelescopePrompt"}, map_cr = true})
end
