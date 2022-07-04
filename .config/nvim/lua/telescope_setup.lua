-- TELESCOPE PLUGIN CONFIG
local m = require("mapx").setup({ global = true })

require("telescope").setup({
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "-H", "-E", "node_modules", "-E", ".git", "-I" },
        },
    },
    extensions = {
        file_browser = {
            hidden = true,
            respect_gitignore = false,
            hijack_netrw = true,
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
        },
    },
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")

m.noremap("<leader>fd", ":Telescope file_browser<CR>")
m.noremap("<leader>fb", ":Telescope file_browser path=%:p:h<CR>", "silent")
m.noremap("<leader>ff", ":Telescope find_files<CR>", "silent")
m.noremap("<leader>fg", ":Telescope live_grep<CR>", "silent")
m.noremap("<leader>pp", ":Telescope project<CR>", "silent")
