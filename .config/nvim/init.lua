-- INIT PLUGINS FIRST
require("plugins")

-- KEYMAPS
-- -- fn to easily set add keymaps
require("mapx").setup({ global = true })

vim.g.mapleader = " "
noremap("<up>", "<nop>", "silent")
noremap("<down>", "<nop>", "silent")
noremap("<left>", "<nop>", "silent")
noremap("<right>", "<nop>", "silent")

noremap("<leader>w", ":w<CR>", "silent")

-- -- tab navigation
noremap("<S-H>", ":tabprev<CR>", "silent")
noremap("<S-L>", ":tabnext<CR>", "silent")

-- -- window navigation
noremap("<F2>", "<C-w>w", "silent")

-- -- lazygit
nnoremap("<leader>gg", ":LazyGit<CR>", "silent")

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
require("indentomatic_setup")
require("indentblankline_setup")
require("autopairs_setup")
require("gitsigns_setup")

-- OPTIONS
vim.o.encoding = "UTF-8"
vim.o.number = true
vim.o.mouse = "a"
vim.o.autoread = true
vim.o.linespace = 5

-- -- Tab Settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- STARTUP COMMANDS
vim.cmd("colorscheme dracula")
