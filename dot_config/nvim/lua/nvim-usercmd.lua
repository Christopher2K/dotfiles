local usercmd = {}

function usercmd.init()
  local function copy_relative_filepath()
    local filepath = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
    vim.fn.setreg('+', filepath)
    print('Copied relative filepath: ' .. filepath)
  end

  -- Create a command to call the function
  vim.api.nvim_create_user_command('CopyRelativeFilepath', copy_relative_filepath, {})
end

return usercmd
