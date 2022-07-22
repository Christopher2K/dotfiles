-- INIT PLUGINS FIRST
vim.g.mapleader = " "

-- OPTIONS
vim.opt.encoding = "UTF-8"
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.signcolumn = "yes"
vim.opt.winbar = "%f %m"

require("plugins")

-- THEMES
vim.g.catppuccinflavour = "mocha"
vim.cmd("colorscheme catppuccin")

local ok_m, m = pcall(require, "mapx")

if ok_m then
    m.noremap("<up>", "<nop>", "silent")
    m.noremap("<down>", "<nop>", "silent")
    m.noremap("<left>", "<nop>", "silent")
    m.noremap("<right>", "<nop>", "silent")

    m.noremap("<leader>w", ":w<CR>", "silent")

    -- -- tab navigation
    m.noremap("<S-H>", ":tabprev<CR>", "silent")
    m.noremap("<S-L>", ":tabnext<CR>", "silent")


    -- -- window navigation
    m.noremap("<F2>", "<C-w>w", "silent")
    m.noremap("<C-=>", ":vertical resize +2<CR>", "silent")
    m.noremap("<C-->", ":vertical resize -2<CR>", "silent")
    m.noremap("<C-]>", ":resize +2<CR>", "silent")
    m.noremap("<C-[>", ":resize -2<CR>", "silent")

    -- -- lazygit
    m.nnoremap("<leader>gg", ":LazyGit<CR>", "silent")
end

-- CUSTOM COMMAND
if ok_m then
    local TikTokModeEnabled = function()
        vim.g.auto_save = 1
        vim.g.auto_save_silent = 1
        vim.g.auto_save_events = {"TextChangedI"}
    end
    m.cmd("TikTokModeEnabled", TikTokModeEnabled)

    local TikTokModeDisabled = function() vim.g.auto_save = 0 end
    m.cmd("TikTokModeDisabled", TikTokModeDisabled)
end
