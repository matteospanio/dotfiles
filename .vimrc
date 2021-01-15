"Set compatibility to Vim only.
set nocompatible

"Helps force plug-ins to load correctly when it is turned back on below.
filetype off

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()


"Turn on syntax highlighting.
syntax enable

"For plug-ins to load correctly.
filetype plugin indent on

" Find files also in subdirectories
set path+=**
set wildmenu
set mouse=a

command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
" Show line numbers
set number relativenumber

" Display 5 lines above/below the cursor when scrolling with a mouse.
" set scrolloff=5
" Fixes common backspace problems
" set backspace=indent,eol,start

" Display options
set showmode
set showmatch
set showcmd
set cursorline
" set cursorcolumn

" set t_Co=256
colorscheme gruvbox
"hi Normal guibg=NONE ctermbg=NONE

" fzf enable
set rtp+=~/.fzf

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


" Status bar
set laststatus=2
" Set status line display
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}%{kite#statusline()}

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline_theme='base16_gruvbox_dark_hard' "badwolf or dark
" let g:airline_theme='onehalfdark'

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

" more natural splits
set splitbelow
set splitright

" Funzioni per evidenziare il gli elementi cercati
set hlsearch
set incsearch
set ignorecase
set smartcase

" kite preferences
" let g:kite_supported_languages = ['*']
" let g:kite_tab_complete=1
" autocmd CompleteDone * if !pumvisible() | pclose | endif

" sync open file with NERDTree
" " Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"set completeopt-=menu
"set completeopt+=menuone   " Show the completions UI even with only 1 item
"set completeopt-=longest   " Don't insert the longest common text
"set completeopt-=preview   " Hide the documentation preview window
"set completeopt+=noinsert  " Don't insert text automatically
"set completeopt-=noselect 

" chiude automaticamente le parentesi
"inoremap {<CR> {<C-o>o}<C-o>O


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
