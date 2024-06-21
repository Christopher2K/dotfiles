return {
  "echasnovski/mini.comment",
  version = "*",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  config = function()
    local comment = require("mini.comment")
    local commentstring = require("ts_context_commentstring")

    comment.setup({
      options = {
        custom_commentstring = function()
          return commentstring.calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })
  end,
}
