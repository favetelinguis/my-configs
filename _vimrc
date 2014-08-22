set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add plugins -----------------------------------
Plugin 'git://github.com/scrooloose/syntastic.git'
Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'git://github.com/flazz/vim-colorschemes.git'
"------------------------------------------------
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

"Set up styling for syntax
filetype on
if has('gui_running')
	set guifont=Liberation_Mono:h10:cANSI
endif
colo jelleybeans
syntax on

"Set tab width, tab and space are not the same
set expandtab
set shiftwidth=2
set softtabstop=2

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif

"Disable arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"sets pwd to the same as working file
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"set relative numbers mode
set rnu

"Setting ctrlp
"set keybinding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"set ctrlp to serach for first git hg svn bzr file
let g:ctrlp_working_path_mode = 'ra'
"ignores files in ctrlp search
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
