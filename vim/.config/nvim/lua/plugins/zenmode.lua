require('zen-mode').setup {
    window = {
        backdrop = 1.0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 0.8,
        height = 0.8,
        options = {
            signcolumn = "no",      -- disable signcolumn
            number = false,         -- disable number column
            relativenumber = false, -- disable relative numbers
            -- cursorline = false,  -- disable cursorline
            cursorcolumn = false,   -- disable cursor column
            -- foldcolumn = "0",    -- disable fold column
            -- list = false,        -- disable whitespace characters
        },
    },
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
        },
        gitsigns = { enabled = false }, -- disables git signs
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)
        vim.api.nvim_exec(
            [[
                set wrap
                set colorcolumn=
                set termguicolors
                colorscheme enfocado
                let g:enfocado_style = "nature"
                let g:airline_theme = "enfocado"
                autocmd VimEnter * ++nested colorscheme enfocado
            ]],
            false
        )
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
        vim.api.nvim_exec(
            [[
                set nowrap
                set colorcolumn=81
                set notermguicolors
                colorscheme monokai
                let g:airline_theme = "bubblegum"
            ]],
            false
        )
    end,
}
