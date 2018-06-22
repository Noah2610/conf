" Set leader character
let mapleader = ' '

" Disable swap files
set noswapfile
set nobackup
" Compatibility stuff
set encoding=UTF-8
set term=screen-256color
" Line numbers
set number
set relativenumber
" Indent settings
set expandtab  " Convert tab to spaces
set tabstop=2  " Indent width
set shiftwidth=2
set autoindent
set smartindent
" Syntax highlighting
syntax enable
" Searching
set ignorecase
set smartcase
set incsearch
" Misc
set ruler
set background=dark

" Keybindings
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
nmap <leader>o :o<CR>
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
