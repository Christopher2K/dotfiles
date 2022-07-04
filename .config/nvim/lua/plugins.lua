local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Check packer installation
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")

packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
})

packer.startup(function()
    -- Packer installer
    packer.use({"wbthomason/packer.nvim", opt = true})

    -- Color Scheme
    packer.use({"catppuccin/nvim", as = "catppucin"})
    packer.use("kyazdani42/nvim-web-devicons")

    -- Better mappings
    packer.use("b0o/mapx.nvim")

    -- Status bar
    packer.use({"nvim-lualine/lualine.nvim", config = require("lualine_setup")})

    -- Native LSP
    packer.use("williamboman/nvim-lsp-installer") -- Auto installer
    packer.use({"neovim/nvim-lspconfig", config = require("lsp_setup")}) -- Preconfig for LSPs
    packer.use({
        "jose-elias-alvarez/null-ls.nvim",
        config = require("nullls_setup")
    }) -- Null LS (Formatter / Linters)

    -- Snippets
    packer.use("L3MON4D3/LuaSnip")

    -- Completion
    packer.use("hrsh7th/nvim-cmp") -- Engine
    packer.use("hrsh7th/cmp-nvim-lsp") -- LSP completion
    packer.use("hrsh7th/cmp-buffer") -- buffer completion
    packer.use("hrsh7th/cmp-path") -- path completion
    packer.use("saadparwaiz1/cmp_luasnip") -- complex completion
    require("cmp_setup")

    -- Terminal
    packer.use({
        "akinsho/toggleterm.nvim",
        tag = "v1.*",
        config = require("toggleterm_setup")
    })

    -- Treesitter
    packer.use({
        "nvim-treesitter/nvim-treesitter",
        config = require("treesitter_setup")
    })
    packer.use("windwp/nvim-ts-autotag") -- Auto tag extension

    -- Telescope
    packer.use({
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"}
    })
    packer.use("nvim-telescope/telescope-file-browser.nvim")
    packer.use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    packer.use("nvim-telescope/telescope-project.nvim")
    require("telescope_setup")

    -- Comment
    packer.use({"numToStr/Comment.nvim", config = require("comment_setup")})

    -- Surround
    packer.use({"ur4ltz/surround.nvim", config = require("surround_setup")})

    -- Kitty Conf Highlighting
    packer.use("fladson/vim-kitty")

    -- Auto indent detection
    packer.use("tpope/vim-sleuth")

    -- LazyGit integration
    packer.use("kdheepak/lazygit.nvim")

    -- Kitty Conf Highlighting
    packer.use("fladson/vim-kitty")

    -- Indentation and blank lines indicators
    packer.use({
        "lukas-reineke/indent-blankline.nvim",
        config = require("indentblankline_setup")
    })

    -- Git signals
    packer.use({"lewis6991/gitsigns.nvim", config = require("gitsigns_setup")})

    -- Git Blame
    packer.use("f-person/git-blame.nvim")

    -- Errors and Diagnostics
    packer.use({"folke/trouble.nvim", config = require("trouble_setup")})

    -- Auto Save
    packer.use("907th/vim-auto-save")
end)
