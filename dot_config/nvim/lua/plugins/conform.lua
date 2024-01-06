return {
  "stevearc/conform.nvim", -- Format plugin
  lazy = false,
  keys = {
    { "<leader>F", '<CMD>lua require("conform").format({ lsp_fallback = true })<CR>', desc = "Format code" },
  },
  opts = {
    formatters_by_ft = {
      javascript = { { "eslint_c", "prettier" } },
      javascriptreact = { { "eslint_c", "prettier" } },
      typescript = { { "eslint_c", "prettier" } },
      typescriptreact = { { "eslint_c", "prettier" } },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 4000000,
      lsp_fallback = true,
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
          ".eslintrc",
          ".eslintrc.js",
        }),
        condition = function(self, ctx)
          return util.root_file({ ".eslintrc", ".eslintrc.js" })(self, ctx) ~= nil
        end
      }
    }

    opts["formatters"] = formatters
    conform.setup(opts)
  end
}
