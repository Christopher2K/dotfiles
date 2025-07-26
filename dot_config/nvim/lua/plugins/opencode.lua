return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  keys = {
    {
      '<leader>ot',
      function()
        require('snacks.terminal').toggle('opencode', { win = { position = 'right' } })
      end,
      desc = "Toggle opencode",
    },
    { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', mode = { 'n', 'v' }, },
    { '<leader>oA', function() require('opencode').ask('@file ') end, desc = 'Ask opencode about current file', mode = { 'n', 'v' }, },
    { '<leader>od', function() require('opencode').prompt('Add documentation comments for @selection') end, desc = 'Document selection', mode = 'v', },
  },
  config = function()
    local ctx =  require('opencode.context')
    require('opencode').setup({
      model_id = "gpt-4.1",
      provider_id = "claude-sonnet-4-20250514",
      auto_reload = true,
      context = {
        ["@file"] = ctx.file,
        ["@files"] = ctx.files,
        ["@cursor"] = ctx.cursor_position,
        ["@selection"] = ctx.visual_selection,
        ["@diagnostics"] = ctx.diagnostics,
        ["@quickfix"] = ctx.quickfix,
        ["@diff"] = ctx.git_diff,
      },
    })
  end
}
