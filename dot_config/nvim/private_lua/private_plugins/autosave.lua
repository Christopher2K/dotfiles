return {
  "Pocco81/auto-save.nvim",
  commit = '979b6c82f60cfa80f4cf437d77446d0ded0addf0',
  enabled = false,
  config = function()
    local autosave = require("auto-save")
    autosave.setup({
      execution_message = {
        message = function()
        end,
      },
      trigger_events = { "TextChangedI" },
    })
  end,
}
