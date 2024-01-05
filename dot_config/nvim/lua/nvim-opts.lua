local opts = {}

function opts.init()
  vim.opt.autoread = true -- Read a file when it was changed outside of nvim
  vim.opt.autowrite = true -- Automatically write file when it was changed
  vim.opt.encoding = "UTF-8" -- Default encoding
  vim.opt.number = true -- Number in front of each line
  vim.opt.mouse = "a" -- Enabled in all mode
  vim.opt.list = true -- Show space, line breaks, spaces, tabs...
  vim.opt.listchars:append("eol:↴") -- Set the sign for the EOL
  vim.opt.signcolumn = "yes"
  vim.opt.wrap = false -- Long lines are not wrapped
  vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
  vim.opt.splitbelow = true -- Cursor go on the left window when split
  vim.opt.splitright = true -- Cursor go on the right windows when split
  vim.opt.confirm = true -- Confirm before closing an unsaved buffer
  vim.opt.cursorline = true -- Highlight current line
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.smartindent = true -- Insert indents automatically
  vim.opt.winbar = "" -- Disable winbar
end

return opts
