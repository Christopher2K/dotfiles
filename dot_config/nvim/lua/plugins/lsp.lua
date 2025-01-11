return {
  "williamboman/mason.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig", },
    { "williamboman/mason-lspconfig.nvim", },
    { "hrsh7th/nvim-cmp", },
    { "hrsh7th/cmp-nvim-lsp", },
    { "L3MON4D3/LuaSnip", },
    { "elixir-tools/elixir-tools.nvim", },
    { "mrcjkb/rustaceanvim",                lazy = false },
    { "luckasRanarison/tailwind-tools.nvim" }
  },
  config = function()
    -- Default server
    local managed_servers_list = {
      "astro",
      "cssls",
      "docker_compose_language_service",
      "dockerls",
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "svelte",
      "volar",
      "yamlls",
      "vtsls",
    }

    local manual_servers_list = {
      "ocamllsp",
      "tailwindcss",
      "gleam",
    }

    local servers_list = {}
    table.move(managed_servers_list, 1, #managed_servers_list, 1, servers_list)
    table.move(manual_servers_list, 1, #manual_servers_list, #servers_list + 1, servers_list)

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = managed_servers_list,
    })
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_config = require("lspconfig")
    local utils = require('lspconfig.util')



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
        source = true,
        border = "rounded",
      },
    })

    -- Global key mapping
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "open diagnostic popup" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

    -- Custom handlers to have border around hover window
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
      }),
    }

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
        handlers = handlers,
      })
    end

    -- Language specific extensions
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = {
        enable = false,
        on_attach = on_attach_callback,
        handlers = handlers,
        init_options = {
          mix_env = "dev",
          mix_target = "host",
          experimental = {
            completions = {
              enable = true -- control if completions are enabled. defaults to false
            }
          }
        },

      },
      credo = {},
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        on_attach = on_attach_callback,
        handlers = handlers,
      }
    }


    -- Tailwind setup
    lsp_config.tailwindcss.setup(vim.tbl_extend(
      "force",
      {
        capabilities = capabilities,
        handlers = handlers,
      },
      {
        filetypes = { "html", "elixir", "eelixir", "heex" },
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      }
    ))

    -- Rust setup
    vim.g.rustaceanvim = {
      -- LSP configuration
      server = {
        on_attach = on_attach_callback,
        handlers = handlers,
      },
    }
  end,
}
