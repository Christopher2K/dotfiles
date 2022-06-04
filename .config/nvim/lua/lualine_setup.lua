require('lualine').setup {
    options = {
        theme = 'neon'
    },
    sections = {
        lualine_a = {
            {
                'diagnostics',
                sources = {'coc'}
            }
        } 
    }
}
