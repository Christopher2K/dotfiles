return {
  'ojroques/nvim-bufdel',
  config = function()
    local bufdel = require('bufdel')
    bufdel.setup()

    vim.keymap.set("n", "<leader>bd", "<cmd>BufDel<cr>", { desc = "Delete buffer", silent = true })
    vim.keymap.set("n", "<leader>bo", "<cmd>BufDelOthers<cr>", { desc = "Delete other buffers", silent = true })
    vim.keymap.set("n", "<leader>ba", "<cmd>BufDelAll<cr>", { desc = "Delete all buffers", silent = true })
  end
}
