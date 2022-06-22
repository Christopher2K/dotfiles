local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
    "rust_analyzer",
    "svelte",
    "tsserver",
    "yamlls",
    "pyright",
    "jsonls",
    "html",
    "cssmodules_ls",
    "sumneko_lua",
}

require("nvim-lsp-installer").setup({
    ensure_installed = servers,
})

local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dl", ":Telescope diagnostics<CR>", { buffer = 0 })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<leader>F", ":lua vim.lsp.buf.format { async = true }<CR>", { buffer = 0, })
end

for _, server in pairs(servers) do
    lsp[server].setup({
        capabilities = capabilities,
        on_attach = function (client)
            on_attach()
            if (server == 'tsserver') then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
        end
    })
end

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
