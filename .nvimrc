" Vundle Plugins {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"}}}
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim' "Required by gist-vim
Plugin 'mattn/gist-vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc' " Required by vim-notes
Plugin 'xolox/vim-notes' 
Plugin 'spwhitt/vim-nix'
" Vundle End {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}
"General settings {{{
let g:python3_host_prog='/run/current-system/sw/bin/python3'
" Automatically close tabs when opening files
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Tab specific option
filetype indent on		"File type identification and auto indenting
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

" Cursor always on
set ruler

" Highlight the current line
set cursorline

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=gray
set colorcolumn=80

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree
" plugin
let g:netrw_liststyle=3

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=[%n]     "buffernr
set statusline+=[%l\/%L]
set statusline+=%{fugitive#statusline()}
set statusline+=%=%F%m%r%h%w

" UTF encoding
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" Turn on reliativeline numbers
set relativenumber
set number
"}}}
"Plugins settings {{{
" Tagbar START
nmap <F8> :TagbarToggle<CR>
" Tagbar END
" Undotree START
" Togle undotree
nnoremap <F5> :UndotreeToggle<cr>

" Save all undotree files in one place
if has("persistent_undo")
        set undodir='~/.undodir/'
            set undofile
        endif
" Undotree END
" Syntastic START
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic END

" " Solarized START
syntax enable
set background=dark
colorscheme solarized
" Solarized END

" NerdTree START
" Map a new key for opening nerdtree
map <leader>' :NERDTreeToggle<cr>
" NerdTree END

" Rainbow parenthesis START
" Rainbow parenthesis always on!
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" Parentheses colours using Solarized
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
    \ [ '5',  '#d33682'],
      \ [ '1',  '#dc322f'],
        \ [ '9',  '#cb4b16'],
          \ [ '3',  '#b58900'],
            \ [ '2',  '#859900'],
              \ [ '6',  '#2aa198'],
                \ [ '4',  '#268bd2'],
                  \ ]
" Rainbow parenthesis END

" CTRLP START
" CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'

" CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" CtrlP
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
" " CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1
" CTRLP END
" }}}