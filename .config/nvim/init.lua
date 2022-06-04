-- KEYMAPS
-- -- fn to easily set add keymaps
require('mapx').setup{ global = true }

vim.g.mapleader = ' '

noremap('<up>', '<nop>', 'silent')
noremap('<down>', '<nop>', 'silent')
noremap('<left>', '<nop>', 'silent')
noremap('<right>', '<nop>', 'silent')

noremap('<leader>w', ':w<CR>', 'silent')

-- -- tab navigation
noremap('<leader>0', ':tablast<CR>', 'silent')
noremap('<leader>1', '1gt', 'silent')
noremap('<leader>2', '2gt', 'silent')
noremap('<leader>3', '3gt', 'silent')
noremap('<leader>4', '4gt', 'silent')
noremap('<leader>5', '5gt', 'silent')
noremap('<leader>6', '6gt', 'silent')
noremap('<leader>7', '7gt', 'silent')
noremap('<leader>8', '8gt', 'silent')
noremap('<leader>9', '9gt', 'silent')
noremap('<S-H>', ':tabprev<CR>', 'silent')
noremap('<S-L>', ':tabnext<CR>', 'silent')

-- -- window navigation 
noremap('<F2>', '<C-w>w', 'silent')

-- -- telescope
noremap('<leader>fb', ':Telescope file_browser<CR>', 'silent')
noremap('<leader>ff', ':Telescope find_files<CR>', 'silent')
noremap('<leader>fg', ':Telescope live_grep<CR>', 'silent')
noremap('<leader>pp', ':Telescope project<CR>', 'silent')

-- -- cocnvim
inoremap('<CR>', [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], 'silent', 'expr')
inoremap('<C-space>', [[coc#refresh()]], 'silent', 'expr')
nmap('[g', [[<Plug>(coc-diagnostic-prev)]], 'silent')
nmap(']g', [[<Plug>(coc-diagnostic-next)]], 'silent')

nmap('gd', [[<Plug>(coc-definition)]], 'silent')
nmap('gy', [[<Plug>(coc-type-definition)]], 'silent')
nmap('gi', [[<Plug>(coc-implementation)]], 'silent')
nmap('gr', [[<Plug>(coc-references)]], 'silent')

-- -- lazygit
nnoremap('<leader>gg', ':LazyGit<CR>', 'silent')

-- PACKER
require("plugins")
require("telescope_setup")
require("toggleterm_setup")
require("treesitter_setup")
require("lualine_setup")
require("comment_setup")
require("surround_setup")

-- OPTIONS
vim.o.number = true
vim.o.mouse = 'a'
vim.o.autoread = true
vim.o.linespace = 5

-- -- Tab Settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- STARTUP COMMANDS
vim.cmd('colorscheme neon')

-- COC
vim.g.coc_global_extensions = {
    'coc-json',
    'coc-prettier',
    'coc-pairs',
    'coc-rust-analyzer'
}

-- USER COMMANDS
vim.api.nvim_create_user_command('Prettier', ':CocCommand prettier.forceFormatDocument', { nargs = 0 })
