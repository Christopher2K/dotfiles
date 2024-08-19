local autocmds = {}

function autocmds.execute_on_all_tabs(command)
  local current_tab = vim.fn.tabpagenr()
  vim.cmd('tabdo ' .. command)
  vim.cmd('tabnext ' .. current_tab)
end

local function augroup(name)
  return vim.api.nvim_create_augroup("custom_au_" .. name, { clear = true })
end

function autocmds.init()
  vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
      autocmds.execute_on_all_tabs("wincmd =")
    end,
  })
end

return autocmds
