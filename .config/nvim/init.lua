-- INIT PLUGINS FIRST
require("plugins")

-- KEYMAPS
-- -- fn to easily set add keymaps
local m = require("mapx").setup({ global = true })

vim.g.mapleader = " "
m.noremap("<up>", "<nop>", "silent")
m.noremap("<down>", "<nop>", "silent")
m.noremap("<left>", "<nop>", "silent")
m.noremap("<right>", "<nop>", "silent")

m.noremap("<leader>w", ":w<CR>", "silent")

-- -- tab navigation
m.noremap("<S-H>", ":tabprev<CR>", "silent")
m.noremap("<S-L>", ":tabnext<CR>", "silent")

-- -- window navigation
m.noremap("<F2>", "<C-w>w", "silent")

-- -- lazygit
m.nnoremap("<leader>gg", ":LazyGit<CR>", "silent")

-- PACKER
require("lsp_setup")
require("cmp_setup")
require("telescope_setup")
require("toggleterm_setup")
require("treesitter_setup")
require("lualine_setup")
require("comment_setup")
require("surround_setup")
require("nullls_setup")
require("indentblankline_setup")
require("autopairs_setup")
require("gitsigns_setup")
require("trouble_setup")

-- OPTIONS
vim.o.encoding = "UTF-8"
vim.o.number = true
vim.o.mouse = "a"
vim.o.autoread = true
vim.o.linespace = 5

-- STARTUP COMMANDS
vim.g.catppuccinflavour = "mocha"
vim.cmd("colorscheme catppuccin")

-- AUTOSAVE FOR TIKTOK
vim.g.auto_save = 0
vim.g.auto_save_silent = 1
vim.g.auto_save_events = {'TextChangedI'}
