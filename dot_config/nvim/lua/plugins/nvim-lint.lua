return {
  "mfussenegger/nvim-lint",
  enabled = false,
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
    }

    vim.api.nvim_create_autocmd({ "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
