require('telescope').setup {
    defaults = {
        cache_picker = {
            num_pickers = 10,
        },
        mappings = {
            i = {
                ["<C-k>"] = "move_selection_previous",
                ["<C-j>"] = "move_selection_next",
            }
        }
    },
}
