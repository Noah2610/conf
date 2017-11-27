" start pathogen - vim plugin manager
execute pathogen#infect()

""" BASIC SETTINGS
" set leader key
let mapleader = "<"
" show when user keys in bottom right
set showcmd
" set shell
set shell=/bin/bash
" enable syntax highlighting
syntax enable
" set line numbers
set number
set relativenumber
" indenting
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
" fix backspace
set backspace=2
" highlight current line and vertical cursor line
set cursorline
set cursorcolumn
" no line wrapping
set nowrap
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:-,extends:>,precedes:<
" command mode history (default: 8)
set history=64
" turn off swap files
set noswapfile
set nobackup
" vertical line at column position (81 and) 121
set colorcolumn=121
" enable wildmenu, enhaced command mode auto-completion
set wildmenu
" scrolling will keep 5 lines of spacing at vertical screen edges
set scrolloff=5

""" SEARCHING
" set case-insensitive searches
set ignorecase
" lowercase searches are case-insensitive, uppercase searches are case-sensitive
set smartcase
" highlight while typing search term
set incsearch
" highlight all occurences of search after search
"set hlsearch

""" COLOR SETTINGS
" for vim colorscheme with tmux
set term=screen-256color
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
" ctrl-q: quit
nmap <C-q> :q<CR>
" unbind default indent keys
noremap << <NOP>
noremap >> <NOP>
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
nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd! #<CR>
" scroll up/down in larger steps
nnoremap <C-j> 4<C-e>4j
nnoremap <C-k> 4<C-y>4k
nnoremap <C-h> 8h
nnoremap <C-l> 8l
" for visual mode
vnoremap <C-j> 4<C-e>4j
vnoremap <C-k> 4<C-y>4k
vnoremap <C-h> 8h
vnoremap <C-l> 8l
" map ß to EOL
noremap ß <End>
" keybind for printing date
noremap <leader>d :.!date +\%d.\%m.\%Y<CR>
" clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>
" Focus NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
" Toggle NERDTree
nnoremap <leader><S-n> :NERDTreeToggle<CR>
" Re-open NERDTree (to refresh files, if new ones were added)
nnoremap <leader><C-n> :NERDTreeClose<CR>:NERDTree<CR>
"" TABS
" New tab
noremap <C-t>n :tabnew<CR>
" Close tab
noremap <C-t>q :tabclose<CR>
" Next tab
noremap <C-t>l :tabnext<CR>
" Previous tab
noremap <C-t>h :tabprevious<CR>

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
" don't automatically popup completion window, manually trigger it with <C-Space>
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
