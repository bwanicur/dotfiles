" Set standard file encoding
set encoding=utf8

" No special per file vim override configs
set nomodeline

" Stop word wrapping
set nowrap

" Except... on Markdown. That's good stuff.
autocmd FileType markdown setlocal wrap

" Adjust system undo levels
set undolevels=100

" Use system clipboard
set clipboard=unnamed

" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells

" Number gutter
set number

" Use search highlighting
set hlsearch

" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

" Remap leader to space
let mapleader="\<SPACE>"

" Disable mouse support ? hrmmm, not sure yet
" set mouse=r
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1"

" resize panes with arrow keys
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" <space> <space> to open last file buffer
nmap <Leader><Leader> <c-^>

" next / previous tabs
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>


" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/unite.vim'
Plug 'dracula/vim'

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

Plug 'mhinz/vim-grepper'
" Space f p to type a search to find matches in entire project
" Space f b to type a search to find matches in current buffers
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
" Space backtick to toggle File Tree
" Space ~ to open File Tree from current buffer’s directory
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'w0rp/ale'

Plug 'justinmk/vim-sneak'
let g:sneak#s_next = 1
" f <key> to jump to next <key>
" F <key> to jump to previous <key>
" f to following match
" s <key><key> to jump to next <key><key>
" S <key><key> to jump to previous <key><key>
" s to following match
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

call plug#end()
