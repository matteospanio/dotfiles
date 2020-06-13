"Set compatibility to Vim only.
set nocompatible

"Helps force plug-ins to load correctly when it is turned back on below.
filetype off

"Turn on syntax highlighting.
syntax enable

"For plug-ins to load correctly.
filetype plugin indent on

" Find files also in subdirectories
set path+=**
set wildmenu
set mouse=a

" Automatically wrap text that extends beyond the screen length.
set nowrap

" Uncomment below to set the max textwidth. Use a value corresponding to the
" width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set smartindent

" Display 5 lines above/below the cursor when scrolling with a mouse.
" set scrolloff=5
" Fixes common backspace problems
" set backspace=indent,eol,start

" " Status bar
set laststatus=2

" Display options
set showmode
set showcmd
set cursorline
" set cursorcolumn

" tema e colore sfondo
colorscheme monokain
hi Normal guibg=NONE ctermbg=NONE

" fzf enable
set rtp+=~/.fzf

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number relativenumber
"
" Set status line display
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline_theme='dark' "badwolf

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" Encoding
set encoding=utf-8

" Highlight matching pairs of brackets. Use the '%' character to jump
" between them.
set matchpairs+=<:>
" Funzioni per evidenziare il gli elementi cercati
set hlsearch
set incsearch
set ignorecase
set smartcase

" chiude automaticamente le parentesi
inoremap {<CR> {<C-o>o}<C-o>O

call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'liuchengxu/space-vim-theme'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'

call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

" Latex-live-prewiev settings
let g:livepreview_previewer = 'zathura'

" NerdTree settings
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('nvim')
    let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
else
    let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc-exclude-standard']
let g:netrw_browse_split = 2
let g:netrw_banner = 0

" tutti i keybindings personalizzati vanno qua "spazio"+...
let mapleader = " "

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>t :NERDTreeToggleVCS<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>w :bd<CR>
" nnoremap <leader>a :wincmd v <bar> :Ex <bar> :vertical resize 30<CR>
