" Set leader character
let mapleader = ' '

" Uncomment if 'pathogen' is installed.
" execute pathogen#infect()

" Disable swap files
set noswapfile
set nobackup
" Compatibility stuff
set encoding=UTF-8
set term=screen-256color
" Line settings
set number
set relativenumber
set nowrap
" Indent settings
set expandtab  " Convert tab to spaces
set tabstop=4  " Indent width
set shiftwidth=4
set autoindent
set smartindent
" Syntax highlighting
syntax on
syntax enable
" Searching
set ignorecase
set smartcase
set incsearch
" Misc
set ruler
set background=dark
filetype plugin indent on

" Keybindings
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <leader><C-q> :qa!<CR>
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
nmap <leader>o :e<CR>
nmap <leader><S-o> :e!<CR>
nmap <leader>e :e<SPACE>
nmap <leader>b :b<SPACE>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>q :bp <BAR> bd! #<CR>
nmap gn :tabnew %<CR>
nmap gN :tablast<CR>:tabnew %<CR>
nmap gq :tabclose<CR>
nmap <leader>k :tabnext<CR>
nmap <leader>j :tabNext<CR>
nmap <leader>0 :tabfirst<CR>
nmap <leader>$ :tablast<CR>
nmap <leader>J :tabmove -<CR>
nmap <leader>K :tabmove +<CR>
nmap <C-w>v :vertical belowright split<CR>
nmap <C-w>s :belowright split<CR>
nmap <C-w><C-v> <C-w>v
nmap <C-w><C-s> <C-w>s
nmap <C-w>V <C-w><C-v><Leader>b
nmap <C-w>S <C-w><C-s><Leader>b
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nmap =a <esc>mmgg=G`m
vmap =a ==<esc>
nmap =s <esc>mm:%s/\t/  /ge<CR>`m
vmap =s :s/\t/  /ge<CR>
nmap =c <esc>mm:%s/\s\+$//ge<CR>`m
vmap =c :s/\s\+$//ge<CR>
nmap =' <esc>mm:%s/"/'/ge<CR>`m
vmap =' :s/"/'/ge<CR>
nmap =" <esc>mm:%s/'/"/ge<CR>`m
vmap =" :s/'/"/ge<CR>
