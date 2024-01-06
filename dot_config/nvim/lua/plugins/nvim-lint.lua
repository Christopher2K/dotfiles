return {
  "mfussenegger/nvim-lint",
  commit = "d44185d3e57e00c164485a454174294b36ef7067",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescript = { 'eslint' },
      typescriptreact = { 'eslint' },
    }

    vim.api.nvim_create_autocmd({ "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
