" --- General Settings ---
set number              " Show line numbers
set relativenumber      " Optional: Show relative line numbers for easier jumping
set cursorline          " Highlight the current line
set showcmd             " Show incomplete commands
set wildmenu            " Visual autocomplete for command menu
set hidden              " Allow switching buffers without saving

" --- Status Line (Bottom) ---
set laststatus=2        " Always show the status line
set statusline=%F       " Full path to the file
set statusline+=\ %m    " Modified flag [+]
set statusline+=\ %r    " Read-only flag [RO]
set statusline+=\ %#StatusLineFileType#%y%*    " File type [e.g. JSON, Python]
set statusline+=%=      " Right-align everything after this
set statusline+=\ %l/%L " Current line / total lines
set statusline+=\ (%c)  " Current column

" --- Buffer Line (Top) ---
set showtabline=2       " Always show the tab line at the top

function! MyTabLine()
  let s = ''
  for i in range(1, bufnr('$'))
    if buflisted(i)
      if i == bufnr('%')
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif
      let s .= ' ' . i . ':' . fnamemodify(bufname(i), ':t') . ' '
    endif
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction

set tabline=%!MyTabLine()

" --- Cheat Sheet (Top Right Corner) ---
let s:commands = [
\ " CHEAT SHEET ",
\ " :e f - Open ",
\ " Tab  - Next ",
\ " S-Tab- Prev ",
\ " :ls  - List ",
\ " :bd  - Close",
\ " :w   - Save ",
\ " :q   - Quit ",
\ " :q!  - Force",
\ " /w   - Find ",
\ " n    - Next ",
\ " :%s  - Repl ",
\ " u    - Undo ",
\ " ^r   - Redo ",
\ " yy/p - Cp/Ps",
\ " :CheatOff   "
\ ]

function! ShowCheatSheet()
  let winid = popup_create(s:commands, {
        \ 'line': 2,
        \ 'col': &columns - 15,
        \ 'pos': 'topleft',
        \ 'padding': [0,0,0,0],
        \ 'border': [0,1,0,1],
        \ 'highlight': 'CheatSheetHighlight',
        \ 'borderhighlight': ['CheatSheetBorder'],
        \ })
  let t:cheat_winid = winid
endfunction

function! HideCheatSheet()
  if exists('t:cheat_winid')
    call popup_close(t:cheat_winid)
    unlet t:cheat_winid
  endif
endfunction

command! CheatOn call ShowCheatSheet()
command! CheatOff call HideCheatSheet()

" --- Syntax & Colors ---
syntax on               " Enable syntax highlighting
filetype plugin indent on
set t_Co=256            " Enable 256 colors
set background=dark     " Optimization for dark terminals
colorscheme industry

" --- Custom Overrides ---
function! MyHighlights()
    highlight StatusLine   cterm=NONE ctermbg=208 ctermfg=16
    highlight StatusLineNC cterm=NONE ctermbg=208 ctermfg=16
    highlight TabLine      cterm=NONE ctermbg=11  ctermfg=16
    highlight TabLineSel   cterm=bold ctermbg=16  ctermfg=11
    highlight TabLineFill  cterm=NONE ctermbg=11  ctermfg=16
    highlight LineNr       ctermfg=39 ctermbg=236
    highlight CursorLineNr ctermfg=46 ctermbg=236 cterm=bold
    highlight SignColumn   ctermbg=236
    highlight StatusLineFileType cterm=NONE ctermbg=15 ctermfg=16
    " Cheat Sheet Colors
    highlight CheatSheetHighlight ctermbg=250 ctermfg=16
    highlight CheatSheetBorder    ctermfg=16
endfunction

autocmd ColorScheme * call MyHighlights()
call MyHighlights()

" Auto-show on startup
autocmd VimEnter * call ShowCheatSheet()

" Shortcuts for buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
