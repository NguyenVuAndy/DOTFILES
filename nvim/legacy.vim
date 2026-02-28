:set relativenumber
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
" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <S-f> :Files<CR>
" C-g: FZF ('g'rep)/find in files
nnoremap <silent> <Leader>G :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" <leader>p: find and replace with nvim-spectre
nnoremap <silent> <leader>l :lua require('spectre').open()<CR>

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

" <leader>fr: find and replace in current file
nnoremap <silent> <leader>g viw:lua require('spectre').open_file_search()<CR>

" Copy whole file
nnoremap <silent> <A-w> :%y+<CR>

nnoremap <silent> <C-s> :call fzf#run({
\   'tmux_height': '40%',
\   'sink':        'botright split' })<CR>

" Colorscheme
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
:colorscheme gruvbox
hi LspCxxHlGroupMemberVariable guifg=#83a598

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
 set signcolumn=number
else
  set signcolumn=yes
endif

" switch between split windows
for n in range(1, 9)
    exe "nnoremap <silent> <M-".n."> :".n."wincmd w<CR>"
endfor

" cursorline
augroup cursorline
    autocmd!
    autocmd WinEnter * exe winnr('$')>1 ? "set cursorline" : "set nocursorline"
augroup END

" enable history for fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

" easy-motion
" disable default mappings, turn on case-insensitivity
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1


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
