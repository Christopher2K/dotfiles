local opts = require("nvim-opts")
opts.init()

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

require("lazy").setup("plugins")
-- End lazy initialization

local keys = require("nvim-keys")
keys.init()

local autocmds = require("nvim-autocmds")
autocmds.init()
