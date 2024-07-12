return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-telescope/telescope-file-browser.nvim"
  },
  config = function()
    local telescope = require("telescope")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fd", ":Telescope file_browser<CR>", { noremap = true, silent = true })

    local theme = 'ivy'

    telescope.setup({
      pickers = {
        find_files = {
          theme = theme,
        },
        live_grep = {
          theme = theme,
        },
        buffers = {
          theme = theme,
        },
      },
      extensions = {
        file_browser = {
          theme = theme,
          hijack_netrw = true,
        }
      }
    })

    telescope.load_extension("media_files")
    telescope.load_extension("file_browser")
  end
}
