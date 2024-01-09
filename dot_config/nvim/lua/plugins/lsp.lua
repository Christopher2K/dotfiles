return {
  "williamboman/mason.nvim",
  tag = "v1.8.3",
  dependencies = {
    { "neovim/nvim-lspconfig",             tag = "v0.1.7" },
    { "williamboman/mason-lspconfig.nvim", tag = "v1.26.0" },
    { "hrsh7th/nvim-cmp",                  commit = "538e37ba87284942c1d76ed38dd497e54e65b891" },
    { "hrsh7th/cmp-nvim-lsp",              commit = "5af77f54de1b16c34b23cba810150689a3a90312" },
    { "L3MON4D3/LuaSnip",                  tag = "v2.2.0" },
  },
  config = function()
    -- Default server
    local servers_list = {
      "cssls",
      "docker_compose_language_service",
      "dockerls",
      "elixirls",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "svelte",
      "tailwindcss",
      "tsserver",
      "volar",
      "yamlls",
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers_list,
    })
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_config = require("lspconfig")

    -- Completion engine setup
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })
    -- End completion engine setup

    -- Diagnostic customization
    vim.diagnostic.config({
      float = {
        source = true
      },
    })

    -- Global key mapping
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "open diagnostic popup" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

    -- Callback executed when a server is attached to a buffer
    local on_attach_callback = function(client, buffer)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = buffer })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = buffer })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = buffer })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = buffer })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = buffer })
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "List workspace folders", buffer = buffer })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = buffer })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = buffer })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Check references", buffer = buffer })
    end

    for _, value in pairs(servers_list) do
      local server = lsp_config[value]
      server.setup({
        capabilities = capabilities,
        on_attach = on_attach_callback,
      })
    end
  end,
}
