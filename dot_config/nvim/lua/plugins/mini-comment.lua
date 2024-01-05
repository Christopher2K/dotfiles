return {
  "echasnovski/mini.comment",
  version = "*",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      commit = "1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee",
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
