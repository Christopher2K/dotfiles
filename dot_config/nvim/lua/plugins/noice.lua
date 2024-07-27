return {
  "folke/noice.nvim",
  tag = "v4.5.0",
  dependencies = {
    { "MunifTanjim/nui.nvim", commit = "61574ce6e60c815b0a0c4b5655b8486ba58089a1" },
  },
  main = 'noice',
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
  },
  config = function(opts)
    local noice = require("noice")
    noice.setup(opts)

    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "NoiceCmdlinePopup" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "NoiceCmdlinePopup" })
  end
}
