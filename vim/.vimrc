" ------------------------------------------------------------
" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'eslint/eslint'
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
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> ':CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-rls coc-emmet' } }
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier'
Plug 'ron-rs/ron.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'segeljakt/vim-silicon'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

call plug#end()

" coc.nvim extensions
" :CocInstall coc-json coc-tsserver coc-html coc-css coc-vetur coc-rls coc-emmet

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
set scrolloff=5                                          " Scrolling will keep 5 lines of spacing at vertical screen edges
set wildmenu wildchar=<TAB>                              " Enable wildmenu, enhaced command mode auto-completion
set wildmode=full wildignorecase
set splitright                                           " Create vertical split to the right
set splitbelow                                           " Create horizontal split to the bottom
set mouse=a                                              " Full mouse support
set clipboard=unnamed                                    " Make default register the system clipboard
set noswapfile                                           " Disable swap files
set nobackup
set nowritebackup
set signcolumn=yes                                       " Keep the signcolumn active always
set updatetime=100                                       " Used by vim-gitgutter

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

" Cursor line
set cursorline      " Highlight current line and vertical cursor line
set cursorcolumn    " Highlight vertil column from cursor
set colorcolumn=121 " Vertical line at column position 121

" Searching
set ignorecase " Make search case-insensitive
set smartcase  " Lowercase searches are case-insensitive, uppercase searches are case-sensitive
set incsearch  " Highlight while typing search term
"set hlsearch  " Highlight all occurences of search after search
set nohlsearch

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
highlight CursorLine term=NONE cterm=NONE ctermbg=19
highlight CursorColumn ctermbg=19
" colorcolumn (vertical line at position 81 and etc)
highlight ColorColumn ctermbg=DarkGray
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
map << <NOP>
map >> <NOP>
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

" ctrlp
nmap <Leader>b :CtrlPBuffer<CR>

" ALE
nmap gan :ALENextWrap<CR>
nmap gaN :ALEPreviousWrap<CR>
nmap gap :ALEPreviousWrap<CR>

" CoC.vim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
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

" Remap for rename current word
nmap <leader>grn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" vista.vim
" Toggle vista window
nmap <leader>v :Vista!!<CR>

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
autocmd BufNewFile,BufRead *.es6 setlocal syntax=javascript filetype=javascript
autocmd BufNewFile,BufRead *.es6.erb setlocal syntax=javascript filetype=javascript
autocmd BufNewFile,BufRead *.eslintrc setlocal syntax=json filetype=json
"autocmd FileType apache setlocal commentstring=#\ %s  " commentstring for specific filetype - tpope/vim-commentary
autocmd BufNewFile,BufRead *.rs nmap <buffer> <C-s> :RustFmt<CR>:w<CR>
autocmd BufNewFile,BufRead *.rs nmap <buffer> =a :RustFmt<CR>
autocmd BufNewFile,BufRead *.ron set shiftwidth=4 softtabstop=4 tabstop=4
" autocmd BufNewFile,BufRead *.tsx setlocal syntax=typescript.jsx
" Show nearest method of function in statusline
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

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
let g:ale_linters = { 'rust': [], 'javascript': [], 'vue': ['tslint', 'vls'] }
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'vue':        ['prettier', 'tslint'],
      \ }
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_fix_on_save = 1

" airline / buffers
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Enable ale support
let g:airline#extensions#ale#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Enable Powerline
let g:airline_powerline_fonts = 1
" Set airline theme (package: vim-airline-themes)
let g:airline_theme='bubblegum'

" multiple-cursors
" Don't remove cursors when leaving insert mode
let g:multi_cursor_exit_from_insert_mode = 0

" csv.vim:
let b:csv_arrange_align = 'l*'

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
nmap ga <Plug>(EasyAlign)"

" vim-rust
let g:rust_recommended_style = 1
let g:rustfmt_fail_silently = 1
let g:rustfmt_command = 'rustup run nightly-2020-02-06 rustfmt'

" markdown-preview
let g:mkdp_browser = 'waterfox'
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
      \ 'font':                  'Hack',
      \ 'background':         '#aaaaff',
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

"------------------------------------------------------------
" MISC
" remember scroll position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Source ./vimrc, if one exists in the current directory
if filereadable('./vimrc')
  source ./vimrc
endif
