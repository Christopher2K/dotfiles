local ok, null_ls = pcall(require, "null-ls")

if ok then
    local formatting = null_ls.builtins.formatting
    null_ls.setup({sources = {formatting.lua_format, formatting.prettier}})
end
