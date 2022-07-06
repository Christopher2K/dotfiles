-- INIT PLUGINS FIRST
vim.g.mapleader = " "

require("plugins")

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

    -- -- lazygit
    m.nnoremap("<leader>gg", ":LazyGit<CR>", "silent")
end

print("Bruh")

-- OPTIONS
vim.o.encoding = "UTF-8"
vim.o.number = true
vim.o.mouse = "a"
vim.o.autoread = true
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

-- STARTUP COMMANDS
vim.g.catppuccinflavour = "mocha"
vim.cmd("colorscheme catppuccin")

-- CUSTOM COMMAND
if ok_m then
    local TikTokModeEnabled = function()
        vim.g.auto_save = 1
        vim.g.auto_save_silent = 1
        vim.g.auto_save_events = { "TextChangedI" }
    end
    m.cmd("TikTokModeEnabled", TikTokModeEnabled)

    local TikTokModeDisabled = function()
        vim.g.auto_save = 0
    end
    m.cmd("TikTokModeDisabled", TikTokModeDisabled)
end
