-- INIT PLUGINS FIRST
vim.g.mapleader = " "

require("plugins")

local m = require("mapx").setup({ global = true })

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

-- OPTIONS
vim.o.encoding = "UTF-8"
vim.o.number = true
vim.o.mouse = "a"
vim.o.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

-- STARTUP COMMANDS
vim.g.catppuccinflavour = "mocha"
vim.cmd("colorscheme catppuccin")

-- AUTOSAVE FOR TIKTOK
vim.g.auto_save = 0
vim.g.auto_save_silent = 1
vim.g.auto_save_events = { "TextChangedI" }
