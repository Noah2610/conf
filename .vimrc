"" pathogen - plugin manager
execute pathogen#infect()

""" BASIC SETTINGS
"let mapleader = '<'                                            " set leader key
let mapleader = ' '                                            " set leader key
set showcmd                                                    " show when user keys in bottom right
set shell=/usr/bin/zsh                                         " set shell
set encoding=UTF-8
syntax enable                                                  " enable syntax highlighting
set number                                                     " set line numbers
set relativenumber                                             " set line number to relative mode
set expandtab                                                  " Use spaces over tabs - convert tabs to spaces
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=2                                                " fix backspace
set cursorline                                                 " highlight current line and vertical cursor line
set cursorcolumn                                               " highlight vertil column from cursor
set nowrap                                                     " no line wrapping
set list listchars=tab:\ \ ,trail:-,extends:>,precedes:<       " Display tabs and trailing spaces visually
set history=64                                                 " command mode history (default: 8)
set undolevels=500                                             " how many times you can undo
set colorcolumn=121                                            " vertical line at column position (81 and) 121
set scrolloff=5                                                " scrolling will keep 5 lines of spacing at vertical screen edges
set wildmenu wildchar=<Tab>                                    " enable wildmenu, enhaced command mode auto-completion
set wildmode=list:longest,full wildignorecase
set splitright                                                 " create vertical split to the right
set splitbelow                                                 " create horizontal split to the bottom
set mouse=a                                                    " Full mouse support
set undofile                                                   " Enable persistent undo history
set undodir=~/.cache/vim/undodir                               " Set directory to save undo history files in
silent !mkdir -p ~/.cache/vim/undodir

set noswapfile                                                 " Disable swap files
set nobackup

""" SEARCHING
set ignorecase                                                 " Make search case-insensitive
set smartcase                                                  " Lowercase searches are case-insensitive, uppercase searches are case-sensitive
set incsearch                                                  " Highlight while typing search term
"set hlsearch                                                  " Highlight all occurences of search after search

""" COLOR SETTINGS
set term=screen-256color                                       " for vim colorscheme with tmux
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

""" KEYBINDINGS
" ctrl-s: write to file
nmap <C-s> :w<CR>
" source ~/.vimrc
nmap <leader>s :source ~/.vimrc<CR>
" Quit
nmap <C-q> :q<CR>
" Force quit everything and close vim
nmap <leader><C-q> :qa!<CR>
" unbind default indent keys
map << <NOP>
map >> <NOP>
" tab/shift-tab: indent / unindent line
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
"noremap <C-i> <NOP>
" usage for: select in /
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR>
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR>
" new/next/previous/close buffer
"nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd! #<CR>
" scroll up/down in larger steps
nmap <C-j> 4<C-e>4j
nmap <C-k> 4<C-y>4k
nmap <C-h> 8h
nmap <C-l> 8l
" for visual mode
vmap <C-j> 4<C-e>4j
vmap <C-k> 4<C-y>4k
vmap <C-h> 8h
vmap <C-l> 8l
" map ß to EOL
map ß <End>
" keybind for printing date
map <leader>d :.!date +\%d.\%m.\%Y<CR>
" clear search highlighting
nmap <leader>/ :nohlsearch<CR>
" Execture file
nmap <leader>r :!./%<CR>

"" NERDTree
" Focus NERDTree
nmap <leader>n :NERDTreeFocus<CR>
" Toggle NERDTree
nmap <leader><S-n> :NERDTreeToggle<CR>
" Re-open NERDTree (to refresh files, if new ones were added)
nmap <leader><C-n> :NERDTreeClose<CR>:NERDTree<CR>

"" SPLITS
nmap <C-w>v :vertical belowright split<CR>
nmap <C-w>s :belowright split<CR>
nmap <C-w><C-v> <C-w>v
nmap <C-w><C-s> <C-w>s
nmap <C-w>V <C-w><C-v><leader>b
nmap <C-w>S <C-w><C-s><leader>b

"" TABS
" New tab
nmap gn :tabnew %<CR>
" New tab at the end
nmap gN :tablast<CR>:tabnew %<CR>
" Close tab
nmap gq :tabclose<CR>
" Next tab
nmap <leader>k :tabnext<CR>
" Previous tab
nmap <leader>j :tabNext<CR>
" First tab
nmap <leader>0 :tabfirst<CR>
" Last tab
nmap <leader>$ :tablast<CR>
" Move tab left / right
nmap <leader>J :tabmove -<CR>
nmap <leader>K :tabmove +<CR>
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
" Select buffer and variations
nmap <leader>b :b<SPACE>
nmap <leader>B gN:b<SPACE>
nmap <leader>e :e<SPACE>
nmap <leader>E gN:e<SPACE>
" Re-open file in current buffer
nmap <leader>o :o<CR>
"" Quickfix
" Next error
nmap gcn :cnext<CR>
" Previous error
nmap gcN :cprevious<CR>
nmap gcp :cprevious<CR>
" Open quickfix
nmap gco :copen<CR>
" Close quickfix
nmap gcq :cclose<CR>

"" RAILS
" Gemfile
nmap grg :e ./Gemfile<CR>
" Controller
nmap grc :Econtroller<SPACE>
" View
nmap grv :Eview<SPACE>
" Model
nmap grm :Emodel<SPACE>
" JavaScript
nmap grj :Ejavascript<SPACE>
" CSS
nmap grs :Estylesheet<SPACE>
" Migration
nmap grM :Emigration<SPACE>
" Layout
nmap grl :Elayout<SPACE>
" Helper
nmap grh :Ehelper<SPACE>
" Initializer
nmap gri :Einitializer<SPACE>
" Unit Test
nmap grt :Eunittest<SPACE>
" Integration Test
nmap grT :Eintegrationtest<SPACE>
" Fixtures
nmap grf :Efixtures<SPACE>
" ./config/
nmap grC :e ./config/
" ./config/routes.rb
nmap grr :e ./config/routes.rb<CR>
" ./config/database.yml
nmap grd :e ./config/database.yml<CR>
" ./config/application.rb
nmap gra :e ./config/application.rb<CR>
" ./config/environments/*
nmap gre :call feedkeys(':e<SPACE>./config/environments/<Tab>','t')<CR>
" ./db/seeds.rb
nmap grS :e ./db/seeds.rb<CR>
" ./lib/*
nmap grL :call feedkeys(':e<SPACE>./lib/<Tab>', 't')<CR>
" ./bin/
nmap grb :e ./bin/
" ./.gitignore
nmap grG :e ./.gitignore<CR>


""" BUILT-IN PACKAGES
"" Start matchit package
packadd! matchit


""" autocmd
autocmd BufNewFile,BufRead *.es6 set syntax=javascript
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.es6.erb set syntax=javascript
autocmd BufNewFile,BufRead *.es6.erb set filetype=javascript


""" VARIABLES
"" custom
" set key code recognition delay to 0 and key mapping delay to 1000ms
set timeoutlen=1000 ttimeoutlen=0
" set custom groups to apply at certain column positions
"let w:m1=matchadd('Col80', '\%>80v.\%<122v', -1)  " for some reason second position isn't accurate
"let w:m2=matchadd('Col120', '\%>120v.\+', -1)
" delete matchadd settings:
" :call matchdelete(w:m1)
" clear all settings:
" :set all&

""" PLUGIN / MISC STUFF
"" airline / buffers
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Enable Powerline
let g:airline_powerline_fonts = 1
" Set airline theme (package: vim-airline-themes)
let g:airline_theme='bubblegum'

"bubblegum                ++
"jellybeans               ++ (almost EXACTLY the same as fairyfloss)
"ravenpower               /+
"term                     ++

"dark_minimal             ++ (current)
"fairyfloss               ++ (almost EXACTLY the same as jellybeans)
"qwq                      ++ (similar but better than current)
"wombat                   ++
"badwolf                  ++

"angr                     +-
"atomic                   +-
"ayu_mirage               +-
"cool                     +-
"hybridline               +-
"powerlineish             +-
"raven                    /-
"ubaryd                   +-

"" multiple-cursors
" Don't remove cursors when leaving insert mode
let g:multi_cursor_exit_from_insert_mode = 0
"" TABULAR plugin:
"let g:tabular_loaded = 1
"" CSV.vim:
let b:csv_arrange_align = 'l*'
filetype plugin indent on
"" YouCompleteMe
" set proper python interpreter for ycmd server
let g:ycm_server_python_interpreter = "/usr/bin/python2"
" don't automatically popup completion window, manually trigger it with <C-SPACE>
let g:ycm_auto_trigger = 0
" v This allows buffers to be hidden if you've modified a buffer.
" v This is almost a must if you wish to use buffers in this way.
set hidden
" remember scroll position when switching buffers
if v:version >= 700
	au BufLeave * let b:winview = winsaveview()
	au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
"" VIM PLUG plugin manager:
call plug#begin('/home/noah/.vim/plug')
" vim game code break
Plug 'johngrib/vim-game-code-break'
call plug#end()
