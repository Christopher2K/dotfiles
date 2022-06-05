local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Check packer installation
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute('packadd packer.nvim')
end

vim.cmd('packadd packer.nvim')

local packer = require('packer')
local util = require('packer.util')

packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(
    function()
        -- Packer installer
        use {'wbthomason/packer.nvim', opt = true};

        -- Color Scheme
        -- use 'folke/tokyonight.nvim'
        use 'rafamadriz/neon'

        -- Status bar
        use 'nvim-lualine/lualine.nvim'

        -- LSP
        use {'neoclide/coc.nvim', branch = 'release'}

        -- Terminal
        use {'akinsho/toggleterm.nvim', tag = 'v1.*'}

        -- Treesitter
        use 'nvim-treesitter/nvim-treesitter'
	
        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            }
        }
        use 'nvim-telescope/telescope-file-browser.nvim'
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        use 'nvim-telescope/telescope-project.nvim'

        -- Comment
        use 'numToStr/Comment.nvim'

        -- Surround
        use 'ur4ltz/surround.nvim'

        -- Better mappings
        use 'b0o/mapx.nvim'

        -- LazyGit integration
        use 'kdheepak/lazygit.nvim'

        -- Kitty Conf Highlighting
        use 'fladson/vim-kitty'
    end
)

