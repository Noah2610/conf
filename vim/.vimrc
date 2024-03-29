" ------------------------------------------------------------
" PLUGINS
call plug#begin('~/.vim/plugged')

" only for nvim-nightly
if (has('nvim-0.6.0'))
    Plug 'github/copilot.vim'
endif

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dkarter/bullets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'evanleck/vim-svelte'
Plug 'folke/zen-mode.nvim'
Plug 'habamax/vim-godot'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ianks/vim-tsx'
Plug 'itchyny/calendar.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-rls coc-emmet coc-prettier coc-eslint coc-tslint-plugin coc-svelte coc-java' }
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'ron-rs/ron.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'segeljakt/vim-silicon'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'szw/vim-maximizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tridactyl/vim-tridactyl'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wuelnerdotexe/vim-enfocado'

" Plug 'preservim/vim-markdown'
" Plug 'vimwiki/vimwiki'

call plug#end()

" coc.nvim extensions
" :CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-rls coc-emmet coc-prettier coc-eslint coc-tslint-plugin coc-svelte coc-java

" ------------------------------------------------------------
" GENERAL
let mapleader = ' '
let localleader = ' '

" Misc
filetype plugin on
filetype plugin indent on
syntax enable
syntax on
set nocompatible                                         " NOTE: This disables `set showcmd` for some reason
set showcmd                                              " Show input keys in bottom right
set shell=/usr/bin/zsh
set encoding=utf-8
set fileencoding=utf-8
set nowrap
set number
set relativenumber
set list listchars=tab:\ \ ,trail:-,extends:>,precedes:< " Display tabs and trailing spaces visually
set history=10000                                        " Command mode history
set undolevels=1000                                      " How many times you can undo
set scrolloff=0                                          " Scrolling will keep 5 lines of spacing at vertical screen edges
set wildmenu wildchar=<TAB>                              " Enable wildmenu, enhaced command mode auto-completion
set wildmode=full wildignorecase
set splitright                                           " Create vertical split to the right
set splitbelow                                           " Create horizontal split to the bottom
set mouse=a                                              " Full mouse support
set clipboard=unnamedplus                                " Make default register the system clipboard
set guioptions+=a                                        " When selecting text in visual mode, put it into the primary system clipboard, TODO: not working
set noswapfile                                           " Disable swap files
set nobackup
set nowritebackup
set signcolumn=yes                                       " Keep the signcolumn active always
set updatetime=100                                       " Used by vim-gitgutter
set foldmethod=marker
set pyxversion=3

" Undo
set undofile                          " Enable persistent undo history
set undodir=~/.cache/vim/undodir      " Set directory to save undo history files in
silent !mkdir -p ~/.cache/vim/undodir " Create undodir directory, in case it doesn't exist

" Indenting
set expandtab " Use spaces over tabs - convert tabs to spaces
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=2
set shiftround " Round indent to multiple of shiftwidth

" Cursor line
set cursorline      " Highlight current line and vertical cursor line
set cursorcolumn    " Highlight vertical column from cursor
set colorcolumn=81  " Vertical line at column position 81

" Searching
set ignorecase " Make search case-insensitive
set smartcase  " Lowercase searches are case-insensitive, uppercase searches are case-sensitive
set incsearch  " Highlight while typing search term
"set hlsearch  " Highlight all occurences of search after search
set nohlsearch

" Markdown
set conceallevel=2

" Colors
colorscheme monokai
set background=dark
highlight Normal ctermbg=NONE ctermfg=LightGray
" inactive line numbers
highlight LineNr ctermbg=Black ctermfg=White
" highlighting while typing search term
highlight incsearch ctermbg=Brown ctermfg=Black
" highlighting after search (hlsearch)
highlight search cterm=Bold ctermbg=DarkGray
" mode indicator at bottom
highlight ModeMsg cterm=Bold ctermbg=29 ctermfg=LightGray
" ruby-vim special keywords (todo,note,fixme,etc... (uppercase))
" TODO find proper term for highlight command for other keywords
"highlight Todo cterm=Bold ctermbg=Brown ctermfg=White
" cursor highlighting
"highlight Cursor ctermbg=Black ctermfg=Black
" highlight CursorLine term=NONE cterm=NONE ctermbg=19
" highlight CursorColumn ctermbg=19
" colorcolumn (vertical line at position 81 and etc)
" highlight ColorColumn ctermbg=DarkGray
" visual mode
highlight Visual cterm=Bold ctermbg=232
" custom highlight groups
highlight Col80 ctermbg=Black
highlight Col120 cterm=Bold ctermfg=White ctermbg=Red

" ------------------------------------------------------------
" KEYMAPS
nmap <C-s> :w<CR>
nmap <Leader>s :source ~/.vimrc<CR>
nmap <C-q> :q<CR>
nmap <Leader><C-q> :qa!<CR>
nmap <Leader>o :e<CR>
nmap <Leader><S-o> :e!<CR>
nmap <Leader>e :e<SPACE>

" Indenting
" map << <NOP>
" map >> <NOP>
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR>
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR>

" Buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>
nmap <Leader>q :bp <BAR> bd! #<CR>
" Tabs
nmap gn :tabnew %<CR>
nmap gq :tabclose<CR>
nmap <Leader>k :tabnext<CR>
nmap <Leader>j :tabNext<CR>
nmap <Leader>0 :tabfirst<CR>
nmap <Leader>$ :tablast<CR>
nmap <Leader><S-j> :tabmove -<CR>
nmap <Leader><S-k> :tabmove +<CR>

" Splits
nmap <C-w>v :vertical belowright split<CR>
nmap <C-w>s :belowright split<CR>
nmap <C-w><C-v> <C-w>v
nmap <C-w><C-s> <C-w>s
nmap <C-w>V <C-w><C-v><Leader>b
nmap <C-w>S <C-w><C-s><Leader>b
" Split navigation
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Macro-likes
" Indent formatting (=), format all
nmap =a <esc>mmgg=G`m
vmap =a ==<esc>
" Convert all tabs to two spaces
nmap =s <esc>mm:%s/\t/  /ge<CR>`m
vmap =s :s/\t/  /ge<CR>
" Clean up trailing whitespaces at end of lines
nmap =c <esc>mm:%s/\s\+$//ge<CR>`m
vmap =c :s/\s\+$//ge<CR>
" Replace all double quotes with single quotes in current buffer
nmap =' <esc>mm:%s/"/'/ge<CR>`m
vmap =' :s/"/'/ge<CR>
" Replace all single quotes with double quotes in current buffer
nmap =" <esc>mm:%s/'/"/ge<CR>`m
vmap =" :s/'/"/ge<CR>
" Search for the word under the cursor with :vimgrep
nmap <leader>gf yiw:vimgrep '<C-r>"' ./**/*<C-r>=expand('%:e')<CR><CR>

" Quickfix window
nmap gcn :cnext<CR>
nmap gcN :cprevious<CR>
nmap gcp :cprevious<CR>
nmap gc0 :cfirst<CR>
nmap gc$ :clast<CR>
nmap gco :copen<CR>
nmap gcq :cclose<CR>

" Open files
nmap grg :e ./.gitignore<CR>

" Ruby / Rails
nmap grG :e ./Gemfile<CR>
nmap grb :e ./bin/
nmap grC :e ./config/
nmap grr :e ./config/routes.rb<CR>
nmap grd :e ./config/database.yml<CR>
nmap gra :e ./config/application.rb<CR>
nmap gre :e ./config/environments/
nmap grS :e ./db/seeds.rb<CR>
nmap grL :e ./lib/
nmap grc :Econtroller<SPACE>
nmap grv :Eview<SPACE>
nmap grm :Emodel<SPACE>
nmap grj :Ejavascript<SPACE>
nmap grs :Estylesheet<SPACE>
nmap grM :Emigration<SPACE>
nmap grl :Elayout<SPACE>
nmap grh :Ehelper<SPACE>
nmap gri :Einitializer<SPACE>
nmap grt :Etask<SPACE>
nmap grT :Eunittest<SPACE>
nmap grf :Efixtures<SPACE>

" NERDTree
nmap <Leader>n :NERDTreeFocus<CR>
nmap <Leader><S-n> :NERDTreeToggle<CR>
nmap <Leader>m :NERDTreeFind<CR>

" ctrlp
nmap <Leader>b :CtrlPBuffer<CR>

" ALE
nmap gan :ALENextWrap<CR>
nmap gaN :ALEPreviousWrap<CR>
nmap gap :ALEPreviousWrap<CR>

" CoC.vim
" Confirm completion with tab, cancel with C-c
" inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"
" inoremap <silent><expr> <C-c> coc#pum#visible() ? coc#pum#cancel() : "\<C-c>"
" Navigate completion pop-up-menu
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<ESC><<a"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#pum#visible() ? coc#pum#confirm() : coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Map keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Map for rename current word
nmap <leader>gn <Plug>(coc-rename)

" Map for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Map CocAction and CocCommand commands
" nmap <leader>ga :call CocAction('codeAction')<CR>
nmap <leader>ga <Plug>(coc-codeaction-line)
nmap <leader>gc :CocCommand<CR>
vmap <leader>ga :call CocAction('codeAction')<CR>
vmap <leader>gc :CocCommand<CR>

" vista.vim
" Toggle vista window
nmap <leader>v :Vista!!<CR>

" vim-silicon
nmap <leader>c :Silicon --to-clipboard=true<CR>
vmap <leader>c :'<'>Silicon --to-clipboard=true<CR>
nmap <leader>C :Silicon --language=txt --to-clipboard=true<CR>
vmap <leader>C :'<'>Silicon --language=txt --to-clipboard=true<CR>

" zen-mode.nvim
nmap <leader>z :ZenMode<CR>

" vim-maximizer
nmap <leader>f :MaximizerToggle<CR>

" Misc
" Clear search highlighting
nmap <Leader>/ :nohlsearch<CR>
" Execute file
nmap <Leader>r :!./%<CR>

" ------------------------------------------------------------
" BUILT-IN PACKAGES
" Start matchit package
" TODO: Verify that this is not needed for neovim
"packadd! matchit

" ------------------------------------------------------------
" AUTOCMD
augroup vimrc
    au!
    au BufNewFile,BufRead *.js setlocal syntax=javascript filetype=javascript
    au BufNewFile,BufRead *.es6 setlocal syntax=javascript filetype=javascript
    au BufNewFile,BufRead *.es6.erb setlocal syntax=javascript filetype=javascript
    au BufNewFile,BufRead *.eslintrc setlocal syntax=json filetype=json
    "au FileType apache setlocal commentstring=#\ %s  " commentstring for specific filetype - tpope/vim-commentary
    " au BufNewFile,BufRead *.rs nmap <buffer> <C-s> :RustFmt<CR>:w<CR>
    " au BufNewFile,BufRead *.rs nmap <buffer> =a :RustFmt<CR>
    au BufNewFile,BufRead *.ron setlocal shiftwidth=4 softtabstop=4 tabstop=4
    au BufNewFile,BufRead *.tsx setlocal syntax=typescript.jsx

    " Markdown
    au BufNewFile,BufRead *.md setlocal syntax=markdown filetype=markdown

    " JSON
    au FileType json syntax match Comment +\/\/.\+$+

    " Copilot
    " TODO: Disable copilot on startup
    au BufNewFile,BufRead ~/Projects/CodeCool/** Copilot disable

" ------------------------------------------------------------
" ABBREVIATIONS
    au BufNewFile,BufRead *.js,*.ts iab for# for (let i = 0; i <.length; i++) <esc>F.i
augroup END

" ------------------------------------------------------------
" VARIABLES
" set key code recognition delay to 0 and key mapping delay to 1000ms
set timeoutlen=1000 ttimeoutlen=0
" set custom groups to apply at certain column positions
"let w:m1=matchadd('Col80', '\%>80v.\%<122v', -1)  " for some reason second position isn't accurate
"let w:m2=matchadd('Col120', '\%>120v.\+', -1)
" delete matchadd settings:
" :call matchdelete(w:m1)
" clear all settings:
" :set all&

" Plugin settings
" vim-ale
" Disable linter highlights. Only use the sign-column.
let g:ale_set_highlights = 0
let g:ale_set_sign       = 1
let g:ale_linters = {
            \ 'rust':            [],
            \ 'html':            [],
            \ 'javascript':      [],
            \ 'javascriptreact': [],
            \ 'javascript.jsx':  [],
            \ 'typescript':      [],
            \ 'typescriptreact': [],
            \ 'typescript.jsx':  [],
            \ 'svelte':          [],
            \ 'json':            [],
            \ 'java':            [],
            \ }
let g:ale_fixers = {
            \ 'javascript':      [],
            \ 'html':            [],
            \ 'javascriptreact': [],
            \ 'javascript.jsx':  [],
            \ 'typescript':      [],
            \ 'typescriptreact': [],
            \ 'typescript.jsx':  [],
            \ 'svelte':          [],
            \ 'ruby':            [],
            \ 'json':            [],
            \ 'java':            [],
            \ }
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_fix_on_save = 1

" airline / buffers
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Enable ale support
let g:airline#extensions#ale#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Enable Powerline
let g:airline_powerline_fonts = 1
" Set airline theme (package: vim-airline-themes)
let g:airline_theme = 'bubblegum'

" multiple-cursors
" Don't remove cursors when leaving insert mode
let g:multi_cursor_exit_from_insert_mode = 0

" csv.vim:
let g:csv_arrange_align = 'l*'

" YouCompleteMe
" set proper python interpreter for ycmd server
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
" don't automatically popup completion window, manually trigger it with <C-SPACE>
" let g:ycm_auto_trigger = 0
" v This allows buffers to be hidden if you've modified a buffer.
" v This is almost a must if you wish to use buffers in this way.
"set hidden

" vim-ruby
" Indent after private/public statements
let g:ruby_indent_access_modifier_style = 'indent'

" CtrlP
let g:ctrlp_cmd = 'FZF'

" vim-gitgutter
" Don't map any keys
let g:gitgutter_map_keys = 0

" vimwiki
let g:vimwiki_list_ignore_newline = 0

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip) (DOESN'T WORK?)
nmap ga <Plug>(EasyAlign)

" rust.vim
let g:rustfmt_autosave = 1
let g:rust_recommended_style = 1
let g:rustfmt_fail_silently = 1
" let g:rustfmt_command = 'rustup run nightly-2020-02-06 rustfmt'

" markdown-preview
let g:mkdp_browser = 'firefox'
let g:mkdp_port = '6419'

" vista.vim
let g:vista_disable_statusline = 0
let g:vista_sidebar_width = 60

" calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" vim-silicon
let g:silicon = {
      \ 'theme':     'Monokai Extended',
      \ 'font':         'JetBrainsMono',
      \ 'background':         '#AAAAFF',
      \ 'shadow-color':       '#555555',
      \ 'line-pad':                   2,
      \ 'pad-horiz':                  0,
      \ 'pad-vert':                   0,
      \ 'shadow-blur-radius':         0,
      \ 'shadow-offset-x':            0,
      \ 'shadow-offset-y':            0,
      \ 'line-number':           v:true,
      \ 'round-corner':         v:false,
      \ 'window-controls':      v:false,
      \ }

let g:silicon['output'] = '~/Pictures/Screenshots/Silicon/{time:%Y-%m-%d}/{time:%H%M%S}.png'

" zen-mode.nvim {{{
lua << EOF
require("zen-mode").setup {
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
EOF
" }}}

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" copilot.vim
let g:copilot_filetypes = {
    \ 'markdown': 1,
    \ }

" ------------------------------------------------------------
" If no argument is given, then the user is prompted to enter a shell command.
" The output of the command is then inserted to the current cursor position.
" Optionally provide the command string as the first argument,
" to run that command and not prompt the user for a command.
function InsertCmd(...)
    let linepos = line('.')
    let colpos = col('.')
    let line_value = getline('.')

    call inputsave()
    let cmd = a:0 > 0 ? a:1 : input('$ ')
    call inputrestore()
    let output = substitute(system(cmd), '\n$', '', '')

    let new_line_value = line_value[:colpos - 1] . output . line_value[colpos:]
    let newline_count = count(output, '\n')
    let new_linepos = linepos + newline_count
    let new_colpos = colpos + len(output) " TODO: This doesn't work if output has newlines.

    call setline('.', new_line_value)
    call cursor(new_linepos, new_colpos)
endfunction

imap <C-e> <Esc>:call InsertCmd()<CR>a

" ------------------------------------------------------------
" Source ./vimrc, if one exists in the current directory
if filereadable('./vimrc')
  source ./vimrc
endif
