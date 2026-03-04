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

let mapleader = ","

" Insert new line above without going into insert mode
" (uses mark o to return to the previous cursor column)
nnoremap <A-Enter> moO<Esc>`o
" Remap C-c to <esc>
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>
tnoremap <esc> <C-\><C-N>

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

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" ;w is save
noremap <silent> ;w :update<CR>

" Change buffer
nnoremap <Leader>b :ls<CR>:b<Space>

" C/C++ indent options: fix extra indentation on function continuation
set cino=(0,W4

" colorcolumn 80, tab width 4 for shaders
autocmd BufRead,BufNewFile *.sc setlocal colorcolumn=80 | SetTab 4

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
