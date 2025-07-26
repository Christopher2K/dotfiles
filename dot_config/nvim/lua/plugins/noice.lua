return {
  "folke/noice.nvim",
  enabled = true,
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  config = function()
    local noice = require("noice")
    noice.setup({
      routes = {
        { filter = { event = "msg_show", find = "written" } },
        -- { filter = { event = "msg_show", find = "yanked" } },
        -- { filter = { event = "msg_show", find = "%d+L, %d+B" } },
        -- { filter = { event = "msg_show", find = "; after #%d+" } },
        -- { filter = { event = "msg_show", find = "; before #%d+" } },
        -- { filter = { event = "msg_show", find = "%d fewer lines" } },
        -- { filter = { event = "msg_show", find = "%d more lines" } },
        -- { filter = { event = "msg_show", find = "<ed" } },
        -- { filter = { event = "msg_show", find = ">ed" } },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        hover = {
          enabled = false,
        },
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
    })

    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "NoiceCmdlinePopup" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "NoiceCmdlinePopup" })
  end
}
