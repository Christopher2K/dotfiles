local plugins = {}

---@param tbl (string|vim.pack.Spec)[] Plugin specifications
function plugins.add(tbl)
  local prefix = "https://github.com/"

  local final_table = {}

  for _, plugin in ipairs(tbl) do
    if type(plugin) == "string" then
      table.insert(final_table, prefix .. plugin)
    elseif type(plugin) == "table" then
      plugin["src"] = prefix .. plugin["src"]
      table.insert(final_table, plugin)
    end
  end

  return vim.pack.add(final_table)
end

function plugins.init()
  plugins.add({
    -- Global dependencies
    "muniftanjim/nui.nvim",                                            -- UI library
    "folke/noice.nvim",                                                -- UI library as well
    "rcarriga/nvim-notify",                                            -- Notifications
    "nvim-lua/plenary.nvim",                                           -- Utilities

    "ellisonleao/gruvbox.nvim",                                        -- Theme
    "nvim-tree/nvim-web-devicons",                                     -- Icons
    "nvim-neo-tree/neo-tree.nvim",                                     -- File explorer
    { src = "nvim-mini/mini.pick", version = "stable" },               -- File picker plugin
    "stevearc/conform.nvim",                                           -- Format plugin
    "Bekaboo/dropbar.nvim",                                            -- Breadcrumbs plugin
    "numToStr/FTerm.nvim",                                             -- Terminal plugin
    "lewis6991/gitsigns.nvim",                                         -- Git signs plugin
    "kdheepak/lazygit.nvim",                                           -- LazyGit plugin

    "supermaven-inc/supermaven-nvim",                                  -- AI Completion plugin
    "neovim/nvim-lspconfig",                                           -- LSP base configurations
    "williamboman/mason.nvim",                                         -- LSP / Tools Installer
    "williamboman/mason-lspconfig.nvim",                               -- Helper for mason
    { src = "saghen/blink.cmp",    version = vim.version.range("*") }, -- LSP completion plugin
    "nvim-lualine/lualine.nvim",                                       -- Status line plugin
    { src = "echasnovski/mini.comment",  version = "main" },           -- Comment plugin
    "JoosepAlviste/nvim-ts-context-commentstring",                     -- Contextual commentstring
    { src = "echasnovski/mini.pairs",    version = "main" },           -- Autopairs plugin
    { src = "echasnovski/mini.surround", version = "main" },           -- Symbol surround plugin
    "tpope/vim-sleuth",                                                -- Auto indent detection
    "nvim-pack/nvim-spectre",                                          -- Search and replace
    "arnamak/stay-centered.nvim",                                      -- Centered mode
    { src = "nvim-treesitter/nvim-treesitter", version = "main" },     -- Treesitter
    "windwp/nvim-ts-autotag",                                          -- Treesitter extension for auto-tag
    "wakatime/vim-wakatime",                                           -- WakaTime
    "folke/which-key.nvim",                                            -- Bindings helpers
  })
end

function plugins.configure()
  vim.cmd("colorscheme gruvbox")

  require("which-key").setup()
  require("mini.pairs").setup()
  require("mini.surround").setup()

  local gitsigns = require("gitsigns")
  gitsigns.setup({
    signs = {
      add = {
        text = "",
      },
      change = {
        text = "~",
      },
      delete = {
        text = "",
      },
      topdelete = {
        text = "",
      },
      changedelete = {
        text = "~",
      },
    },
  })

  --#region Neotree
  local neotree = require("neo-tree")
  neotree.setup({
    enable_diagnostics = false,
    enable_git_status = false,
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  })
  --#endregion

  --#region Lualine
  local lualine = require("lualine")
  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "gruvbox",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "lazygit" },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_z = { "fileformat", "filetype" },
    }
  })
  --#endregion

  --#region Treesitter
  local treesitter = require("nvim-treesitter")
  treesitter.install({
    "lua",
    "javascript",
    "typescript",
    "css",
    "html",
    "elixir",
    "php",
    "go",
    "gleam",
    "rust",
    "jsdoc",
    "json",
    "markdown",
    "sql",
    "toml",
    "yaml",
    "tsx",
    "vue",
    "svelte",
    "swift",
    "zig",
  })
  require("nvim-ts-autotag").setup()
  local comments = require("mini.comment")
  local commentstring = require("ts_context_commentstring")
  comments.setup({
    options = {
      custom_commentstring = function()
        return commentstring.calculate_commentstring() or vim.bo.commentstring
      end,
    },
  })
  --#endregion

  --#region UI stuff
  local noice = require("noice")
  local notify = require("notify")
  local stay_centered = require("stay-centered")

  noice.setup({
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
  })
  notify.setup({
    stages = "fade_in_slide_out",
    timeout = 3000,
    render = "compact",
    top_down = false,
  })
  stay_centered.setup({
    enabled = false
  })
  --#endregion

  --#region AI Stuff
  local supermaven = require("supermaven-nvim")
  supermaven.setup({
    keymaps = {
      accept_suggestion = '<C-j>',
      accept_word = '<C-l>'
    },
    ignore_filetypes = {
      TelescopePrompt = true,
      FTerm = true,
      ['neo-tree'] = true,
    },
  })
  --#endregion

  --#region Tools
  local spectre = require("spectre")
  spectre.setup({
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = {
          "-i",
          "",
          "-E",
        },
      },
    },
  })

  local pick = require("mini.pick")
  pick.setup()
  --#endregion

  --#region Editor
  local conform = require("conform")
  local util = require("conform.util")

  -- Custom formatters
  local formatters = {
    eslint_c = {
      command = util.from_node_modules("eslint_d"),
      args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
      cwd = util.root_file({
        "eslist.config.mjs",
        ".eslintrc",
        ".eslintrc.js",
      }),
      condition = function(self, ctx)
        return util.root_file({ ".eslintrc", ".eslintrc.js", "eslint.config.mjs" })(self, ctx) ~= nil
      end
    },

    biome_c = {
      command = util.from_node_modules("biome"),
      stdin = true,
      args = {
        "check",
        "--stdin-file-path",
        "$FILENAME",
        "--fix",
      },
      cwd = util.root_file({
        "biome.json",
        "biome.jsonc",
      }),
      condition = function(self, ctx)
        return util.root_file({ "biome.json", "biome.jsonc" })(self, ctx) ~= nil
      end
    }
  }

  conform.setup({
    formatters = formatters,
    formatters_by_ft = {
      python = { "autopep8" },
      javascript = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      javascriptreact = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      typescript = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      typescriptreact = { "biome_c", "eslint_c", "prettier", stop_after_first = true },
      mdx = { "prettier" },
      markdown = { "prettier" },
      json = { "biome_c", "prettier", stop_after_first = true },
      astro = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      jsonc = { "biome_c", "prettier", stop_after_first = true },
    },
    format_on_save = {
      quiet = true,
      timeout_ms = 500,
      lsp_fallback = "fallback",
    },
  })
  --#endregion
end

return plugins
