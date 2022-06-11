-- TELESCOPE PLUGIN CONFIG
require('telescope').setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
        },
    }
}

require('telescope').load_extension 'file_browser'
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'project'

noremap('<leader>fb', ':Telescope file_browser<CR>', 'silent')
noremap('<leader>ff', ':Telescope find_files<CR>', 'silent')
noremap('<leader>fg', ':Telescope live_grep<CR>', 'silent')
noremap('<leader>pp', ':Telescope project<CR>', 'silent')

