" start pathogen - vim plugin manager
execute pathogen#infect()

"		set leader key
"let mapleader="<"
let mapleader="<"
"		show when user presses leader key
set showcmd

set shell=/bin/bash

"		PLUGIN stuff
"		AIRLINE / BUFFERS
let g:airline#extensions#tabline#enabled = 1			" Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'	" Show just the filename
" v This allows buffers to be hidden if you've modified a buffer.
" v This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew <cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
"nmap <leader>bq :bp <BAR> bd #<CR>
" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>
" remember scroll position when switching buffers
if v:version >= 700
	au BufLeave * let b:winview = winsaveview()
	au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
"		MULTIPLE-CURSORS
" Map start key separately from next key
"let g:multi_cursor_start_key='<F6>'
"set selection=inclusive
"		PRETTIFY
"autocmd FileType javascript set formatprg=prettier\ --stdin
"		VIM-JSX
"let g:jsx_ext_required = 0					" jsx highlighting for .js files
"		JSBEAUTIFY
"noremap <C-x> :call JsBeautify()<CR>
"autocmd FileType javascript noremap <C-x> :call JsBeautify()<cr>
"autocmd FileType javascript noremap <buffer> <C-x> :call JsBeautify()<cr>
"autocmd FileType json noremap <buffer> <C-x> :call JsonBeautify()<cr>
"autocmd FileType jsx noremap <buffer> <C-x> :call JsxBeautify()<cr>
"autocmd FileType html noremap <buffer> <C-x> :call HtmlBeautify()<cr>
"autocmd FileType css noremap <buffer> <C-x> :call CSSBeautify()<cr>
" visually selected adjustments:
"autocmd FileType javascript vnoremap <buffer> <C-x> :call RangeJsBeautify()<cr>
"autocmd FileType json vnoremap <buffer> <C-x> :call RangeJsonBeautify()<cr>
"autocmd FileType jsx vnoremap <buffer> <C-x> :call RangeJsxBeautify()<cr>
"autocmd FileType html vnoremap <buffer> <C-x> :call RangeHtmlBeautify()<cr>
"autocmd FileType css vnoremap <buffer> <C-x> :call RangeCSSBeautify()<cr>
" .editorconfig workaround:
"let g:config_Beautifier = {}
"let g:config_Beautifier['js'] = {}
"let g:config_Beautifier['js'].indent_style = 'tab'
"let g:config_Beautifier['js'].indent_size = '2'
"let g:config_Beautifier['js'].indent_char = '	'
"		VIM PLUG plugin manager:
call plug#begin('/home/noah/.vim/plug')
" vim game code break
Plug 'johngrib/vim-game-code-break'
call plug#end()
"		TABULAR plugin:
"let g:tabular_loaded = 1


"		MISC
" NOAH misc
nmap <C-s> :w<CR>
nmap <leader>s :source ~/.vimrc<CR>
"nmap <C-q> :wq!<CR>								" map C-q to save and force quit
nmap <C-q> :q<CR>
"set history=<NUM>									" command history, by default saves last 8 commands
" OTHER
" usage for: select in /
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR>
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR>
" INDENT keys
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
" unbind default indent keys
noremap << <NOP>
noremap >> <NOP>


"		set theme
colorscheme monokai
set term=screen-256color						" for vim colorscheme with tmux

"		turn off swap files
set noswapfile
set nobackup

"		text editing
"syntax on
syntax enable												" enable syntax highlighting
set number													" prints line numbers
set relativenumber									" relative mode
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
" fix backspace
set backspace=2

set nowrap
set list listchars=tab:\ \ ,trail:-,extends:>,precedes:<		" Display tabs and trailing spaces visually

"		searching
set ignorecase											" case-insensitive searches
set smartcase												" only lowercase searches search case-insensitive, uppercase searches search case-sensitive

"		movement
" unbind defaults

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

