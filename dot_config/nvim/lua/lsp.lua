local lsp = {}

function lsp.init()
  local servers = {
    "astro",
    "clangd",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    -- "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "svelte",
    "yamlls",
    "vtsls",
  }

  require("mason").setup()
  require("mason-lspconfig").setup({
    automatic_enable = false,
    ensure_installed = servers,
  })
  require("blink.cmp").setup({
    keymap = {
      preset = "enter",
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      }
    },
    sources = {
      default = { 'lsp' }
    }
  })

  vim.diagnostic.config({
    float = {
      source = true,
      border = 'rounded'
    }
  })

  -- Config override
  vim.lsp.config("vtsls", {
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = false
    end
  })

  -- Enable everything
  vim.lsp.enable(servers)
end

return lsp
