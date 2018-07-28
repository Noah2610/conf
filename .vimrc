"" pathogen - plugin manager
execute pathogen#infect()

""" BASIC SETTINGS
let mapleader = ' '                                            " Set leader key
set showcmd                                                    " Show when user keys in bottom right
set shell=/usr/bin/zsh                                         " Set shell
set encoding=UTF-8
filetype plugin on
syntax enable                                                  " Enable syntax highlighting
syntax on
set number                                                     " Set line numbers
set relativenumber                                             " Set line number to relative mode
set expandtab                                                  " Use spaces over tabs - convert tabs to spaces
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=2                                                " Fix backspace
set cursorline                                                 " Highlight current line and vertical cursor line
set cursorcolumn                                               " Highlight vertil column from cursor
set nowrap                                                     " No line wrapping
set list listchars=tab:\ \ ,trail:-,extends:>,precedes:<       " Display tabs and trailing spaces visually
set history=10000                                              " Command mode history
set undolevels=1000                                            " How many times you can undo
set colorcolumn=121                                            " Vertical line at column position (81 and) 121
set scrolloff=5                                                " Scrolling will keep 5 lines of spacing at vertical screen edges
set wildmenu wildchar=<TAB>                                    " Enable wildmenu, enhaced command mode auto-completion
set wildmode=full wildignorecase
set splitright                                                 " Create vertical split to the right
set splitbelow                                                 " Create horizontal split to the bottom
set mouse=a                                                    " Full mouse support
set clipboard=unnamed                                          " Make default register the system clipboard
set undofile                                                   " Enable persistent undo history
set undodir=~/.cache/vim/undodir                               " Set directory to save undo history files in
silent !mkdir -p ~/.cache/vim/undodir
set noswapfile                                                 " Disable swap files
set nobackup
set signcolumn=yes                                             " Keep the signcolumn active always
set updatetime=100                                             " Used by vim-gitgutter

""" SEARCHING
set ignorecase                                                 " Make search case-insensitive
set smartcase                                                  " Lowercase searches are case-insensitive, uppercase searches are case-sensitive
set incsearch                                                  " Highlight while typing search term
"set hlsearch                                                  " Highlight all occurences of search after search

""" COLOR SETTINGS
set term=screen-256color                                       " For vim colorscheme with tmux
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

""" KEYMAPS
nmap <C-s> :w<CR>
nmap <Leader>s :source ~/.vimrc<CR>
nmap <C-q> :q<CR>
nmap <Leader><C-q> :qa!<CR>
nmap <Leader>o :o<CR>
nmap <Leader><C-o> :o!<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>e :e<SPACE>
"" Indenting
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
"" Buffers
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>
nmap <Leader>q :bp <BAR> bd! #<CR>
"" Tabs
nmap gn :tabnew %<CR>
nmap gq :tabclose<CR>
nmap <Leader>k :tabnext<CR>
nmap <Leader>j :tabNext<CR>
nmap <Leader>0 :tabfirst<CR>
nmap <Leader>$ :tablast<CR>
nmap <Leader><S-j> :tabmove -<CR>
nmap <Leader><S-k> :tabmove +<CR>
"" Splits
nmap <C-w>v :vertical belowright split<CR>
nmap <C-w>s :belowright split<CR>
nmap <C-w><C-v> <C-w>v
nmap <C-w><C-s> <C-w>s
nmap <C-w>V <C-w><C-v><Leader>b
nmap <C-w>S <C-w><C-s><Leader>b
"" Macro-likes
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
"" Quickfix
nmap gcn :cnext<CR>
nmap gcN :cprevious<CR>
nmap gcp :cprevious<CR>
nmap gc0 :cfirst<CR>
nmap gc$ :clast<CR>
nmap gco :copen<CR>
nmap gcq :cclose<CR>
"" Open files
nmap grg :e ./.gitignore<CR>
nmap grG :e ./Gemfile<CR>
nmap grb :e ./bin/
"" Rails
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
"" NERDTree
nmap <Leader>n :NERDTreeFocus<CR>
nmap <Leader><S-n> :NERDTreeToggle<CR>
"" Misc
" Map ß to EOL
map ß <End>
" Print date to line
map <Leader>d :.!date +\%d.\%m.\%Y<CR>
" Clear search highlighting
nmap <Leader>/ :nohlsearch<CR>
" Execute file
nmap <Leader>r :!./%<CR>


""" BUILT-IN PACKAGES
"" Start matchit package
packadd! matchit


""" autocmd
autocmd BufNewFile,BufRead *.es6 set syntax=javascript
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.es6.erb set syntax=javascript
autocmd BufNewFile,BufRead *.es6.erb set filetype=javascript
"autocmd FileType apache setlocal commentstring=#\ %s  " commentstring for specific filetype - tpope/vim-commentary


""" Source vimrc, if one exists in current directory
if filereadable('./vimrc')
  source ./vimrc
endif

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
" Enable ale support
let g:airline#extensions#ale#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Enable Powerline
let g:airline_powerline_fonts = 1
" Set airline theme (package: vim-airline-themes)
let g:airline_theme='bubblegum'
"" multiple-cursors
" Don't remove cursors when leaving insert mode
let g:multi_cursor_exit_from_insert_mode = 0
"" tabular
"let g:tabular_loaded = 1
"" csv.vim:
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
"" vim-ruby
" Indent after private/public statements
let g:ruby_indent_access_modifier_style='indent'
"" vim-gitgutter
" Don't map any keys
let g:gitgutter_map_keys = 0
"" vimwiki
set nocompatible
let g:vimwiki_list_ignore_newline = 0
"function! VimwikiLinkHandler(link)
"  !~/vimwiki/scripts/link_handler.rb a:link
"endfunction

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
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
