local usercmd = {}

function usercmd.init()
  -- Set the current relative filepath in the clipboard
  local function copy_relative_filepath()
    local filepath = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
    vim.fn.setreg('+', filepath)
    print('Copied relative filepath: ' .. filepath)
  end

  --- Delete all installed packs
  local function delete_all_pack()
    local pack_specs = vim.pack.get()
    local pack_name_tbl = {}
    for _, pack in ipairs(pack_specs) do
      table.insert(pack_name_tbl, pack.spec.name)
    end
    vim.pack.del(pack_name_tbl)
  end


  vim.api.nvim_create_user_command('CopyRelativeFilepath', copy_relative_filepath, {})
  vim.api.nvim_create_user_command('DelAllPack', delete_all_pack, {})
  vim.api.nvim_create_user_command('ToggleCentered', require("stay-centered").toggle, {})
end

return usercmd
