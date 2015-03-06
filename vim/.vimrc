set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep bundle commands between here and filetype plugin indent on.
Plugin 'bling/vim-airline'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/tpope/vim-fireplace.git'
Plugin 'https://github.com/guns/vim-clojure-static.git'
Plugin 'https://github.com/guns/vim-clojure-highlight.git'
Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
Plugin 'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'
Plugin 'https://github.com/guns/vim-sexp.git'
Plugin 'https://github.com/tpope/vim-repeat.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'https://github.com/jnurmine/Zenburn.git'
Plugin 'https://github.com/sjl/vitality.vim.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"Turn line numbers on
set relativenumber 
set number

"Turn horizontal line highlighting on
set cursorline
"Jump to search result
set incsearch
set ignorecase
set smartcase
"Arline settings
"Turns on airline always
"set laststatus=2

"Ctrl-P settings
"Change the default mapping and the default command to invoke CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

"When invoked, unless a starting directory is specified, CtrlP will set its
"local working directory according to this variable
"let g:ctrlp_working_path_mode = 'ra'

"Excluded files
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"Color scheme options
"syntax enable
"set background=dark
"let g:solarized_termtrans = 1
"colorscheme solarized

"Deactivate arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"Color setup
set t_Co=256

"airline setting
"let g:airline_powerline_fonts = 1

"misc tab shit
"set autoindent
"set expandtab
"set softtabstop=4
"set shiftwidth=4

"Clojure static
syntax on
filetype plugin indent on
"autocomplete setup
filetype plugin on
set omnifunc=syntaxcomplete#Complete
colorscheme zenburn
