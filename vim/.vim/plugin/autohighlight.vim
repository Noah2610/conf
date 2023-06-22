" Source: https://vim.fandom.com/wiki/Auto_highlight_current_word_when_idle

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.

nnoremap z/ :call AutoHighlightToggle()<CR>

function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    " setl updatetime=4000
    echo 'Highlight current word: off'
    set nohlsearch
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    " setl updatetime=500
    echo 'Highlight current word: ON'
    set hlsearch
    return 1
  endif
endfunction
