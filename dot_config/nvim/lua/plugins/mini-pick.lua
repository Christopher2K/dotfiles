return {
  'echasnovski/mini.pick',
  version = '*',
  enabled = false,
  config = function()
    require('mini.pick').setup()

    vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { noremap = true, silent = true })
  end
}
