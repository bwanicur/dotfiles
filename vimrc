" Set standard file encoding
set encoding=utf8

set autoread

" No special per file vim override configs
set nomodeline

" Except... on Markdown. That's good stuff.
autocmd FileType html,markdown setlocal wrap

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

" Folding
set foldenable
"" Setting foldmethod to syntax will cause all sorts of problems.
"" <https://github.com/vim-ruby/vim-ruby/issues/8#issuecomment-327162>
"" And also: <http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text>
set foldmethod=indent
set foldlevel=6    " start with no folding, but ready to go
set foldminlines=0 " Allow folding single lines
set foldnestmax=6  " Set max fold nesting level
"set foldcolumn=4 " Show fold column


" Disable mouse support ? hrmmm, not sure yet
" set mouse=r
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1"

" resize panes with arrow keys
nnoremap <Left> :vertical resize -10<CR>
nnoremap <Right> :vertical resize +10<CR>
nnoremap <Up> :resize -10<CR>
nnoremap <Down> :resize +10<CR>

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

" more natural defaults for splits
set splitbelow
set splitright



"
" PLUGINS
"
call plug#begin('~/.local/share/nvim/plugged')

" COLORSCHEME
Plug 'vim-scripts/mayansmoke'
Plug 'hzchirs/vim-material'
Plug 'rakr/vim-one'
let g:airline_theme='one'
syntax on
"set background=dark
set background=light
autocmd VimEnter * colorscheme one 

"--- NERDTree ---
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
" Auto-change cwd when changing tree root
"let NERDTreeChDirMode=2

nnoremap <silent> <Leader>tt :NERDTreeToggle<CR>

" <Leader>tf will tell NERDTree to highlight the file that's currently open.
" The way this works, we open the NERDTree window first in the CWD, so the find
" command afterward doesn't change the tree root.
nnoremap <silent> <Leader>tf :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" Close vim if the only window left open is a NERDTree
augroup local
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END



"--- Ctrl-P ---
Plug 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 20

" Use the cwd for CtrlP's working path, not the directory of the open file
let g:ctrlp_working_path_mode = 'w'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

noremap <Leader>pt :CtrlPTag<CR>


"--- Ack.vim ---
Plug 'mileszs/ack.vim'
" Actually use Ag for doing the searching instead of Ack
let g:ackprg = 'ag --vimgrep'
" Don't jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>


"--- NERDCommenter ---
Plug 'scrooloose/nerdcommenter'
let g:NERDCustomDelimiters = {
      \ 'ruby': { 'left': '# ' }
      \ }

Plug 'Shougo/unite.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-fugitive'

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2


"--- Deoplete (autocomplete) ---
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


Plug 'christoomey/vim-tmux-navigator'

" HTML / CSS
Plug 'sukima/xmledit'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"
"--- Ruby / RoR Stuff
"
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'thoughtbot/vim-rspec'
let g:rspec_command = "bin/rspec {spec}"
let g:ruby_foldable_groups = 'class method'
call plug#end()
