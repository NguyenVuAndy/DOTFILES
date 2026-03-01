:set number
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set expandtab
:set autoindent
:set smartindent
:set ruler
:set autowrite
:set pumheight=20
:set hlsearch
" TextEdit might fail if hidden is not set.
:set hidden

" Some servers have issues with backup files, see #649.
:set nobackup
:set nowritebackup

" Give more space for displaying messages.
:set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
:set updatetime=300

" Don't pass messages to |ins-completion-menu|.
:set shortmess+=c
syntax on

" default file decoding
:set encoding=UTF-8

" auto + smart indent for code
:set autoindent
:set smartindent
:set clipboard+=unnamedplus

 " no delays!
:set updatetime=300

:set t_Co=256
:set colorcolumn=80
:set shell=zsh

" faster updates!
:set updatetime=100

" no hidden buffers
:set hidden&

" automatically read on change
:set autoread

" Insert new line above without going into insert mode
" (uses mark o to return to the previous cursor column)
nnoremap <A-Enter> moO<Esc>`o
" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>
tnoremap <esc> <C-\><C-N>

" Go to tab by number
noremap <silent> <leader>1 1gt
noremap <silent> <leader>2 2gt
noremap <silent> <leader>3 3gt
noremap <silent> <leader>4 4gt
noremap <silent> <leader>5 5gt
noremap <silent> <leader>6 6gt
noremap <silent> <leader>7 7gt
noremap <silent> <leader>8 8gt
noremap <silent> <leader>9 9gt
noremap <silent> <leader>0 :tablast<cr>

" Copy whole file
nnoremap <silent> <A-w> :%y+<CR>

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" cursorline
augroup cursorline
    autocmd!
    autocmd WinEnter * exe winnr('$')>1 ? "set cursorline" : "set nocursorline"
augroup END

" enable history for fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Function to trim extra whitespace in whole file
function! Trim()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

command! -nargs=0 Trim call Trim()

" Function to set tab width to n spaces
function! SetTab(n)
  let &tabstop=a:n
  let &shiftwidth=a:n
  let &softtabstop=a:n
  set expandtab
  set autoindent
  set smartindent
endfunction

" ;t is trim
nnoremap <silent> ;t :Trim<CR>

" ;w is save
noremap <silent> ;w :update<CR>

";f formats in normal mode
noremap <silent> ;f gg=G``:w<CR>

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" colorcolumn 80, tab width 4 for shaders
autocmd BufRead,BufNewFile *.sc setlocal colorcolumn=80 | SetTab 4

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
