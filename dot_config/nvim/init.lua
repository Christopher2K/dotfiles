-- Leader key conf (should go before initializing lazy)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- Lazy initialization
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- End leader key conf

if vim.g.vscode then
  print("VSCode, disabling all plugins")
else
  require("lazy").setup("plugins")
end

-- End lazy initialization

local opts = require("nvim-opts")
opts.init()
local usercommand = require("nvim-usercmd")
usercommand.init()

local keys = require("nvim-keys")
keys.init()

local autocmds = require("nvim-autocmds")
autocmds.init()

local filetypes = require("nvim-filetypes")
filetypes.init()
