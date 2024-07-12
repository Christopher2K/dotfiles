return {
  "echasnovski/mini.indentscope",
  version = "*",
  config = function()
    local indentscope = require("mini.indentscope")
    indentscope.setup({
      draw = {
        animation = indentscope.gen_animation.none(),
      }
    })
  end,
}
