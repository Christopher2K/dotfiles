return {
  "supermaven-inc/supermaven-nvim",
  enabled = true,
  main = "supermaven-nvim",
  opts = {
    keymaps = {
      accept_suggestion = '<C-j>',
      accept_word = '<C-l>'
    },
    ignore_filetypes = {
      TelescopePrompt = true,
      FTerm = true,
      ['neo-tree'] = true,
    },
  }
}
