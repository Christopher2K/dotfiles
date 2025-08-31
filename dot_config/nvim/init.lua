vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

if vim.g.vscode then
  print("VSCode, disabling all plugins")

  local opts = require("opts")
  opts.init()

  local usercommand = require("usercmds")
  usercommand.init()

  local keys = require("keys")
  keys.init()

  local autocmds = require("autocmds")
  autocmds.init()
else
  local plugins = require("plugins")
  plugins.init()
  plugins.configure()

  local opts = require("opts")
  opts.init()

  local usercommand = require("usercmds")
  usercommand.init()

  local keys = require("keymaps")
  keys.init()

  local autocmds = require("autocmds")
  autocmds.init()

  local filetypes = require("filetypes")
  filetypes.init()

  local lsp = require("lsp")
  lsp.init()
end
