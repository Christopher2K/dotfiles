return {
  "stevearc/conform.nvim", -- Format plugin
  lazy = false,
  keys = {
    { "<leader>F", '<CMD>lua require("conform").format({ lsp_fallback = false, async = true })<CR>', desc = "Format code" },
  },
  opts = {
    formatters_by_ft = {
      python = { "autopep8" },
      javascript = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      javascriptreact = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      typescript = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      typescriptreact = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      mdx = { "prettier" },
      markdown = { "prettier" },
      json = { "biome_c", "prettier", stop_after_first = true },
      astro = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      jsonc = { "biome_c", "prettier", stop_after_first = true },
    },
    format_on_save = {
      quiet = true,
      timeout_ms = 500,
      lsp_fallback = "never",
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    local util = require("conform.util")

    -- Custom formatters
    local formatters = {
      eslint_c = {
        command = util.from_node_modules("eslint_d"),
        args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
        cwd = util.root_file({
          "eslist.config.mjs",
          ".eslintrc",
          ".eslintrc.js",
        }),
        condition = function(self, ctx)
          return util.root_file({ ".eslintrc", ".eslintrc.js", "eslint.config.mjs" })(self, ctx) ~= nil
        end
      },

      biome_c = {
        command = util.from_node_modules("biome"),
        stdin = true,
        args = {
          "check",
          "--stdin-file-path",
          "$FILENAME",
          "--fix",
        },
        cwd = util.root_file({
          "biome.json",
          "biome.jsonc",
        }),
        condition = function(self, ctx)
          return util.root_file({ "biome.json", "biome.jsonc" })(self, ctx) ~= nil
        end
      }
    }

    opts["formatters"] = formatters
    conform.setup(opts)
  end
}
